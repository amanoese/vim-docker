FROM alpine

RUN apk add --update --virtual .for-vimproc gcc g++ make
RUN apk add --update --no-cache openssh
RUN apk add --update --no-cache wget curl git vim vimdiff

ENV HOME /root
RUN git clone https://github.com/amanoese/dotfiles.git /root/.dotfiles && \
    chmod +x /root/.dotfiles/init.sh && \
    /root/.dotfiles/init.sh

RUN yes d | vim -c ':call dein#install() | :q!'
RUN apk del --purge .for-vimproc

CMD /bin/bash
