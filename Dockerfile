FROM debian

ENV DEBIAN_FRONTEND=noninteractive

# Use baseimage-docker's init system.
CMD ["/bin/bash"]

# ...put your own build instructions here...
RUN apt-get update
RUN apt-get dist-upgrade -yqq
RUN apt-get install -yqq apt-utils
RUN apt-get install -yqq sudo lsb-base lsb-release apt-transport-https ca-certificates software-properties-common wget curl netcat aria2 whois figlet p7zip p7zip-full zip unzip handbrake-cli speedtest-cli
#RUN add-apt-repository ppa:oibaf/graphics-drivers -y
RUN apt-get dist-upgrade -yqq
RUN apt-get install -yqq wget aria2 ffmpeg telnet tree
RUN cd /usr/local/bin && wget -O - "https://www.dropbox.com/s/dl/r4txvo4oqi8xij6/ffmpeg.tar.gz" | tar xzf - && chmod +x ffmpeg && /usr/local/bin/ffmpeg -version

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*