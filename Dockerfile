# Pull base image.
FROM jlesage/baseimage-gui:debian-11

# Install xterm.
RUN apt-get -y update && apt-get -y install wget gnupg
RUN wget 'https://archive.kali.org/archive-key.asc' && apt-key add archive-key.asc
RUN sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list"
RUN apt-get -y update && apt-get -y install joplin xterm

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
RUN export APP_NAME=joplin
