FROM java:8
RUN useradd -ms /bin/bash exist

ENV HOME /home/exist
USER exist
WORKDIR /home/exist


RUN wget -O basex.zip http://files.basex.org/releases/8.2/BaseX82.zip
RUN unzip basex.zip
EXPOSE 1984 8984
CMD basex/bin/basexhttp
