FROM ubuntu:latest

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1000
ARG GID=985
ARG PASSWORD=test
ARG HOME_DIR=/home/$USERNAME/

RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd  && \
    mkdir /workdir

VOLUME [ "/workdir" ]

RUN apt update && \
    apt -y upgrade && \
    apt install -y vim curl git python3 python3-venv \
    python3-setuptools build-essential cmake python3-dev \
    golang nodejs openjdk-17-jdk openjdk-17-jre \
    npm zsh fonts-powerline

USER $USERNAME
WORKDIR $HOME_DIR 

RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=$UID:$GID .vimrc run.sh ./

RUN vim -c ':PlugInstall' \
    -c 'qa!' # Quit vim

RUN python3 ${HOME_DIR}.vim/plugged/YouCompleteMe/install.py
RUN python3 ${HOME_DIR}.vim/plugged/vimspector/install_gadget.py --enable-python

ENTRYPOINT ["/bin/bash", "run.sh"]
