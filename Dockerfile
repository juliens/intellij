FROM ubuntu

RUN apt-get install -y x11-apps

ENV USER=intellij UID=1000 GID=1000

RUN addgroup --gid ${GID} ${USER}
RUN adduser --home /home/${USER} --shell /bin/bash --uid ${UID} --gid ${GID} --disabled-password ${USER}
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER}
RUN chmod 0440 /etc/sudoers.d/${USER}

RUN echo "deb http://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list
RUN apt-get update
RUN apt-get install --force-yes -y openjdk-7-jdk git sbt

USER intellij

RUN git clone https://github.com/typesafehub/scala-logging.git ~/scala-logging

RUN sudo apt-get install -y wget
RUN wget "http://download.jetbrains.com/idea/ideaIC-14.0.3.tar.gz" -O ~/idea.tgz
RUN cd ~ && tar -xzvf ~/idea.tgz
