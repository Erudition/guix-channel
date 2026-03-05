#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>

// Simple Guix Journal Format: [8 bytes TS][4 bytes LEN][DATA...]

uint64_t now_usec() {
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    return (uint64_t)ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        return 1;
    }

    int fd = open(argv[1], O_WRONLY | O_CREAT | O_APPEND, 0640);
    if (fd < 0) { return 1; }

    unsigned char buf[8192];
    ssize_t n;
    while ((n = read(0, buf, sizeof(buf))) > 0) {
        uint64_t ts = now_usec();
        uint32_t len = (uint32_t)n;
        
        write(fd, &ts, sizeof(ts));
        write(fd, &len, sizeof(len));
        write(fd, buf, n);
        fdatasync(fd);
    }

    close(fd);
    return 0;
}
