FROM ubuntu:cosmic
RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g now
RUN mkdir -p /home/app/
ADD now /home/app/
ADD app.py /home/app/
ADD manage.py /home/app/
ADD now.json /home/app/
ADD requirements.txt /home/app/
WORKDIR /home/app
RUN apt-get install -y python3-pip
RUN alias pip=pip3
EXPOSE 3000
CMD now dev
