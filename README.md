# ghi-docker - GitHub Issues via Docker Container
I needed ghi, but don't have the ability in some environments to install ruby and every dependency for ghi. Creating a very small container based on the Alpine image makes it very small and easy to maintain.

## Set up
Pull down the docker/alpine image so it's local:
```bash
docker pull alpine:3.4
```

Modify the Dockerfile if necessary

Build your image:
```bash
make build
```

Add an alias to your .profile or .bashrc file and source it:
```bash
alias ghi='docker run -it --rm -v $(pwd):/share gpratt/ghi'
. ~/.profile
```

## Run
Note: You don't attach to the container, it runs from whatever directory you're in.

When you run ghi, here's what's happening:
- The alias causes docker to create a temporary container
- The container runs ghi
- The container is removed after execution

Execute ghi:
```bash
gpratt@docker:~/ruby$ ghi
usage: ghi [--version] [-p|--paginate|--no-pager] [--help] <command> [<args>]
           [ -- [<user>/]<repo>]

The most commonly used ghi commands are:
   list        List your issues (or a repository's)
   show        Show an issue's details
   open        Open (or reopen) an issue
   close       Close an issue
   edit        Modify an existing issue
   comment     Leave a comment on an issue
   label       Create, list, modify, or delete labels
   assign      Assign an issue to yourself (or someone else)
   milestone   Manage project milestones
   status      Determine whether or not issues are enabled for this repo
   enable      Enable issues for the current repo
   disable     Disable issues for the current repo

See 'ghi help <command>' for more information on a specific command.
```
