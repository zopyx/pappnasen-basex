FROM java:8
RUN useradd -u 5555 -ms /bin/bash exist

ENV HOME /home/exist
USER 5555 
WORKDIR /home/exist

RUN wget -O basex.zip http://files.basex.org/releases/8.5.4/BaseX854.zip
RUN unzip basex.zip
EXPOSE 1984 8080 
CMD basex/bin/basexhttp -h 8080
