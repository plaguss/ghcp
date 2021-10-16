# ghcp
Copy a github repository to a different github repository.

**This script is intended for personal use. Feel free to use it, but don't expect much from it.**

### How it works

Reminders:
- *Uses [github cli](https://github.com/cli/cli) to create the repo programatically, must be installed to work.*
- Assumes ssh keys are registered in your account.
- Only tested on linux.
- If you mispell some of the arguments, you may end up with unexpected
git folders. If an error occurs, check the argument paths for any trace.

In the following case the script is located at home folder:

    bash ~/ghcp.sh <repo_location> <new_repo_local> <target>

Examples:
- repo_location: `"git@github.com:plaguss/ghcp.git"`.

    Path of the repo to copy.

- new_repo_local: `"~/github_repos/org/new_gchp"`.

    Full path of the new repo locally. Tested on a repo inside another folder (which represents an organization in github).

- target: `"org/new_ghcp"`

    This argument is redirected to github cli to create, is the name of the
    new repo. It may be either the name or the name inside an organization,
    for more info: [gh repo create](https://cli.github.com/manual/gh_repo_create).

