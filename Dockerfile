FROM ubuntu:22.04
#FROM developeranaz/qbittorrent2rclone:beta1
#FROM developeranaz/qbittorrent-rclone-heroku
#RUN apt update 
#RUN apt install unzip 
#RUN apt install qbittorrent-nox -y
#curl -y
#RUN apt install rclone -y
RUN apt-get -y update && apt update -qq -y && yes "" | add-apt-repository -y ppa:poplite/qbittorrent-enhanced && apt-get install qbittorrent-enhanced-nox -qq -y
RUN apt-get install -y curl
RUN curl -s https://rclone.org/install.sh | sudo bash
RUN apt install supervisor -y
COPY scriptplusconf /scriptplusconf
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
RUN chmod +x /scriptplusconf/entrypoint2.sh
RUN chmod +x /scriptplusconf/entrypoint1.sh
CMD /scriptplusconf/entrypoint2.sh
