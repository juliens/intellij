FROM debian

ENV USER=intellij UID=1000 GID=1000

RUN apt-get update \
&&  apt-get install -y x11-apps openjdk-7-jdk wget tar 

RUN addgroup --gid ${GID} ${USER} \
&&  adduser --home /home/${USER} --shell /bin/bash --uid ${UID} --gid ${GID} --disabled-password ${USER} 

USER intellij

RUN  wget "http://download.jetbrains.com/idea/ideaIC-14.0.3.tar.gz" -O ~/idea.tgz \
&&  cd ~ && tar -xzvf ~/idea.tgz \
&& rm ~/idea.tgz


#&&  echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} \
#&&  chmod 0440 /etc/sudoers.d/${USER}


