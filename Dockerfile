FROM alpine

RUN apk add --update --virtual .for-vimproc gcc g++ make
RUN apk add --update --no-cache wget curl git vim

RUN git clone https://github.com/amanoese/dotfiles.git /root/.dotfiles && \
    ln -s ~/.dotfiles/.vimrc ~/.vimrc && \
    ln -s ~/.dotfiles/.gvimrc ~/.gvimrc && \
    mkdir -p ~/.vim/vimSwap ~/.vim/vimBackUp ~/.vim/undo

RUN yes d | vim +':silent! call dein#install()' +q!

RUN apk del --purge .for-vimproc

CMD /bin/bash
