FROM ubuntu:20.04

RUN yes | unminimize
RUN apt-get update && apt install -y git vim sudo man

ADD ./go1.17 /usr/local/
RUN ln -s /usr/local/go1.17 /usr/local/go
ADD .bashrc /home/zhangwei/.bashrc
ADD .vimrc /home/zhangwei
ADD .vim  /home/zhangwei/.vim

# install vim plugins.
RUN vim +PluginInstall +qall

# use normal user
RUN useradd -U -m -p $(openssl passwd -1 123456) zhangwei \
	&& chown -R zhangwei:zhangwei /home/zhangwei \
	&& usermod -aG sudo zhangwei
USER zhangwei
WORKDIR /home/zhangwei
