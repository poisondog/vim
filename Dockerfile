FROM debian:stable
MAINTAINER Adam

RUN apt-get update && apt-get -y install locales vim vim-gtk3 ctags openjdk-11-jre openjdk-11-jdk git gradle maven tmux curl net-tools
RUN git clone https://github.com/poisondog/vim.git /root/.vim
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN cd /root/
RUN ln -s /root/.vim/.vimrc /root/.vimrc
RUN ln -s /root/.vim/.tmux.conf /root/.tmux.conf
RUN vim +PluginInstall +qall
RUN cp /root/.vim/Reflection.class /root/

#RUN update-locale LANG=zh_TW.UTF-8
#ENV LANG=en_US.UTF-8
RUN sed -i '/zh_TW.UTF-8/s/^# //g' /etc/locale.gen &&  locale-gen
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW:en
ENV LC_ALL zh_TW.UTF-8

CMD ["/bin/bash", "run"]
