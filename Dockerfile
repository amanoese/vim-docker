FROM alpine

RUN apk --update add gcc g++ make wget curl git vim

RUN git clone https://github.com/amanoese/dotfiles.git /root/.dotfiles && \
    ln -s ~/.dotfiles/.vimrc ~/.vimrc && \
    ln -s ~/.dotfiles/.gvimrc ~/.gvimrc && \
    mkdir -p ~/.vim/vimSwap ~/.vim/vimBackUp ~/.vim/undo

RUN yes d | vim +':silent! call dein#install()' +q!

CMD /bin/bash
