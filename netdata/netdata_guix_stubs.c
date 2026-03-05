#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include "collectors/systemd-journal.plugin/provider/rust_provider.h"

// --- Private Implementation ---

struct RsdJournal {
    int fd;
    off_t file_size;
    off_t current_offset;
    uint64_t current_ts;
    uint32_t current_len;
    char *current_data;
    char *iter_ptr; // For enumeration
};

// [8 bytes TS][4 bytes LEN][DATA...]

// --- Rust FFI Stubs ---

int32_t rsd_id128_from_string(const char *s, RsdId128 *ret) { (void)s; memset(ret->bytes, 0, 16); return 0; }
int32_t rsd_id128_equal(RsdId128 a, RsdId128 b) { return memcmp(a.bytes, b.bytes, 16) == 0; }

int rsd_journal_open_files(RsdJournal **ret, const char *const *paths, int flags) { 
    (void)flags;
    if (!paths || !paths[0]) return -1;

    int fd = open(paths[0], O_RDONLY);
    if (fd < 0) return -1;

    struct stat st;
    fstat(fd, &st);

    RsdJournal *j = calloc(1, sizeof(RsdJournal));
    j->fd = fd;
    j->file_size = st.st_size;
    j->current_offset = 0;
    
    *ret = j;
    return 0; 
}

void rsd_journal_close(RsdJournal *j) { 
    if (j) {
        if (j->current_data) free(j->current_data);
        close(j->fd);
        free(j);
    }
}

static int read_header(RsdJournal *j) {
    if (j->current_offset + 12 > j->file_size) return 0;
    
    lseek(j->fd, j->current_offset, SEEK_SET);
    if (read(j->fd, &j->current_ts, 8) != 8) return 0;
    if (read(j->fd, &j->current_len, 4) != 4) return 0;
    
    return 1;
}

int rsd_journal_next(RsdJournal *j) { 
    if (!j) return 0;
    
    if (j->current_len > 0) {
        j->current_offset += (12 + j->current_len);
    }

    if (!read_header(j)) return 0;

    if (j->current_data) free(j->current_data);
    j->current_data = malloc(j->current_len + 1);
    if (read(j->fd, j->current_data, j->current_len) != j->current_len) return 0;
    j->current_data[j->current_len] = 0;

    return 1;
}

int rsd_journal_previous(RsdJournal *j) { return 0; }

int rsd_journal_seek_head(RsdJournal *j) { 
    if (!j) return -1;
    j->current_offset = 0;
    j->current_len = 0;
    if (j->current_data) { free(j->current_data); j->current_data = NULL; }
    return 0; 
}

int rsd_journal_seek_tail(RsdJournal *j) { return rsd_journal_seek_head(j); }

int rsd_journal_seek_realtime_usec(RsdJournal *j, uint64_t usec) { 
    rsd_journal_seek_head(j);
    while (rsd_journal_next(j)) {
        if (j->current_ts >= usec) return 0;
    }
    return 0; 
}

int rsd_journal_get_realtime_usec(RsdJournal *j, uint64_t *ret) { 
    if (!j) return -1;
    *ret = j->current_ts;
    return 0; 
}

void rsd_journal_restart_data(RsdJournal *j) { 
    if (j) j->iter_ptr = j->current_data;
}

int rsd_journal_enumerate_available_data(RsdJournal *j, const void **data, size_t *l) { 
    if (!j || !j->current_data || !j->iter_ptr) return 0;

    if (j->iter_ptr >= j->current_data + j->current_len) return 0;

    char *eol = strchr(j->iter_ptr, '\n');
    if (!eol) eol = j->current_data + j->current_len;

    *data = j->iter_ptr;
    *l = eol - j->iter_ptr;
    
    j->iter_ptr = (eol < j->current_data + j->current_len) ? eol + 1 : eol;
    
    return 1;
}

// Unused stubs
int rsd_journal_get_seqnum(RsdJournal *j, uint64_t *ret_seqnum, RsdId128 *ret_seqnum_id) { (void)j; *ret_seqnum = 0; memset(ret_seqnum_id->bytes, 0, 16); return 0; }
void rsd_journal_restart_fields(RsdJournal *j) { (void)j; }
int rsd_journal_enumerate_fields(RsdJournal *j, const char **field) { (void)j; *field = NULL; return 0; }
int rsd_journal_query_unique(RsdJournal *j, const char *field) { (void)j; (void)field; return 0; }
void rsd_journal_restart_unique(RsdJournal *j) { (void)j; }
int rsd_journal_enumerate_available_unique(RsdJournal *j, const void **data, size_t *l) { (void)j; *data = NULL; *l = 0; return 0; }
int rsd_journal_add_match(RsdJournal *j, const void *data, size_t size) { (void)j; (void)data; (void)size; return 0; }
int rsd_journal_add_conjunction(RsdJournal *j) { (void)j; return 0; }
int rsd_journal_add_disjunction(RsdJournal *j) { (void)j; return 0; }
void rsd_journal_flush_matches(RsdJournal *j) { (void)j; }
