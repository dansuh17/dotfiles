FROM alpine:latest

RUN apk add -U --no-cache \
      vim git zsh tmux bash curl python3 make

COPY * /workspace/
COPY .vim /workspace/.vim

RUN workspace/install.sh /
