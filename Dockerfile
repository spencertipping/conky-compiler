FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y conky-all ttf-ubuntu-font-family
ADD conkyc conkyrc /root/
RUN /root/conkyc /root/conkyrc > /root/.conkyrc
CMD conky
