FROM ubuntu:22.04
#FROM developeranaz/qbittorrent2rclone:beta1
#FROM developeranaz/qbittorrent-rclone-heroku
#RUN apt update 
#RUN apt install unzip 
#RUN apt install qbittorrent-nox -y
#curl -y
RUN apt install rclone -y
RUN apt-get -y update && apt update -qq -y && apt-get install software-properties-common -y && yes "" | add-apt-repository -y ppa:poplite/qbittorrent-enhanced && apt-get install qbittorrent-enhanced-nox -qq -y
RUN apt-get install -y curl unzip
#RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && unzip rclone-current-linux-amd64.zip
RUN apt install supervisor -y
COPY scriptplusconf /scriptplusconf
#COPY qBconf.tar.gz /qBconf.tar.gz
#RUN tar xvf /qBconf.tar.gz
RUN chmod +x /scriptplusconf/entrypoint2.sh
RUN chmod +x /scriptplusconf/entrypoint1.sh
CMD /scriptplusconf/entrypoint2.sh
