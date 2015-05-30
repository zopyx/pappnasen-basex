FROM java:8
RUN useradd -u 5555 -ms /bin/bash exist

ENV HOME /home/exist
USER 5555 
WORKDIR /home/exist


RUN wget -O basex.zip http://files.basex.org/releases/8.2/BaseX82.zip
RUN unzip basex.zip
EXPOSE 1984 8984
CMD basex/bin/basexhttp
