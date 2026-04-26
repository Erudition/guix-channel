# Guix channel
When modifying my local guix channel, use local paths to test builds. However, when complete, be sure to commit the changes so the public channel repo is updated. I should not have to add additional `-L` search paths to my system or home `reconfigure` commands.

## Creating Guix recipes
- When creating a recipe for a new guix package, first check for existing packages:
    - Check in other public Guix channels, even if they are not installed.
        - Good resource for community Guix packages: `curl -s 'https://toys.whereis.social/api/packages?search=hello&page=1&limit=20' | toon`
    - Check in the issues and PRs for `https://codeberg.org/guix/guix/` to see if it's been started already (or e.g. `https://gitlab.com/nonguix/nonguix` for nonfree software).
    - Check `https://repology.org/` to see if it has a different name than you'd expect in guix, and to see if there's a Nix recipe to learn from. You can also scan `https://github.com/NixOS/nixpkgs/`.
    - If that fails, check to see if the recipe can be bootstrapped with `guix import` (see --help for all importers).
    - If you know the location of the source code, use e.g. `guix download --git --branch=main https://example.com/repo.git` to bring it into the store, and get the hash to use at the same time.
    - You can inspect the structure of the checkout in the store directory, but if you must read text files within, copy it to your gemini tmp directory, so you'll have within-workspace permissions to read it. Use your file reading tools, not shell commands, as some raw text output can corrupt the conversation permanently.
    - When browsing the repo, look for a `*.metainfo.xml` file that would be installed to `/share/metainfo` -- if present it contains a wealth of canonical info for setting up the recipe.
    
## Building Packages in Guix

*   **Pattern: First Build Attempt**
    Use this pattern to build packages. It prevents build output from appearing in the chat (unusual symbols can permanently corrupt the chat). If the build fails, it automatically retrieves and displays the last 200 lines of the log.
    **MANDATE:** Never comment out or suppress the log output lines on failure.
    ```bash
    guix build --keep-failed --quiet -L ./path/to/channel package_name || \
    (LOG=$(guix build --log-file -L ./path/to/channel package_name || echo "") && \
    [ -n "$LOG" ] && [ -f "$LOG" ] && zcat "$LOG" | tail -n 200)
    ```

*   **Key Flags:**
    *   `--keep-failed`: Crucial for post-mortem inspection of the build directory.
    *   `--keep-going`: Useful when updating multiple packages to catch all errors in one pass.
    *   `--quiet`: Prevents context flooding; rely on the log retrieval pattern above instead.

*   **Pattern: Subsequent Build Attempts (Iterative Debugging)**
    **MANDATE:** Use this pattern whenever you have a previous build log (failed or successful) to check the effect of your changes.
    When stuck in a build loop (fail -> fix -> fail), reading the same 200 lines of error context repeatedly is wasteful. Use diffs to see *only* what changed.
    *   **Strategy:** Save the previous log path, build, get the new log path, and diff them.
    *   **Filtering:** You MUST filter out timestamps (e.g., `cut -c 20-`) to avoid 100% diff noise.
    *   **Command:** `diff -u <(zcat "$OLD_LOG" | cut -c 20-) <(zcat "$NEW_LOG" | cut -c 20-) | tail -n 50`

*   **Reference Logs (Gold Standard)**
    If you are debugging a failure but don't have a known-good local build, fetch an official build log from a substitute server to compare against.
    *   **Command:** `guix build --log-file gdb -s aarch64-linux` (Replace `gdb` and system as needed).
    *   **Usage:** Useful for seeing what a "healthy" build looks like, even if it's for a different architecture or slightly different version.

    *   **Caveat:** `guix build --log-file` will **fail** (exit code 1) if no log exists locally or remotely. Always handle this case in scripts (e.g., `LOG=$(... || echo "")`).




## Modifying recipes

*   **Bumping the version of a working recipe:**
    *   Rather than modifying a recipe to use different/newer source, testing a build, then reverting the changes upon failure, you can use Package Transformation Options to have guix try to build the package with modifications while leaving the working recipe in place. Read `info guix "Package Transformation Options" --output -` to learn how to do this. 
    *   Try using git release tags, for example. If the recipe doesn't work with the latest source, inspect the commit history between the two versions for hints into what changes may have broken the recipe.
    *   For Github packages, use the Github API to find release filenames, and to read the notes associated with a release.
    *   The correct command to pre-calculate a git hash without cloning manually is `guix download --git`

## Changing core Guix Configuration files
`guix system build --dry-run <config-file>`: Validates the system configuration file (syntax, modules, logic) without performing the actual build.
 `guile -c '(load "<file.scm>")'`: Checks a Guile Scheme file for basic syntax errors by attempting to load it. This will catch unmatched parentheses and other parsing issues, before you move on to `guix build -f <file.scm>` for non-syntax errors.
Don't directly modify the system config or home config. Instead, copy them to a new file with `.add-helper-service.scm` extension, where "add helper service" is an example description of the task being performed. Then, build the system with `guix system build` or the home with `guix home build` to validate the changes and find package conflicts. Only when a separate one has been built successfully, and the config file has been compared to the original to make sure there are no changes besides the ones asked for, may you run `reconfigure`.


    

