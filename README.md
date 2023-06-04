# VIM-DEVELOPMENT

A docker container for Python development without a traditional IDE.
Mount the direcory to work on into the container and start developing.

```docker build -t vim-development .```

```docker run --rm -it -v ~/.ssh:/home/user/.ssh vim-development```