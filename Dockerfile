
FROM  ubuntu:latest
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
ADD  sources.list /etc/apt/
RUN apt update -y
RUN apt install  zsh -y  && apt install  git -y && apt install gpg bc -y && apt install curl -y
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git /root/.oh-my-zsh && cp /root/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc   
ADD passion.zsh-theme /root/.oh-my-zsh/themes/
ADD  passion.zsh-theme  /root/.oh-my-zsh/themes
ADD zshrc /root/.zshrc
RUN  gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s stable

RUN \curl -sSL https://get.rvm.io | bash -s stable --rails
ADD bashrc  /root/.bashrc

 RUN \curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
ENV  NVM_DIR="/root/.nvm"
 RUN   \
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  \
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

RUN nvm install --lts