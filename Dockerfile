FROM debian:stable
MAINTAINER Adam

RUN apt-get update && apt-get -y install vim openjdk-11-jre openjdk-11-jdk git gradle tmux maven
RUN git clone https://github.com/poisondog/vim.git ~/.vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN cd ~
RUN ln -s .vim/.vimrc
#RUN vim +PluginInstall +qall

CMD ["/bin/bash", "run"]
