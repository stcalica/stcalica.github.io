FROM nginx:latest
MAINTAINER Kyle Calica "Kyle Calica"


#for nodejs
RUN apt-get update
RUN apt-get install -y build-essential git curl

#install npm and bower
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm
RUN npm install -g bower



RUN rm /etc/nginx/nginx.conf
COPY nginx/nginx.conf /etc/nginx/
RUN mkdir /etc/nginx/sites-enabled
RUN mkdir -p /var/www/codeisdead/html
RUN chmod 755 /var/www/
COPY ./ /var/www/codeisdead
COPY nginx/codeisdead /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/codeisdead /etc/nginx/sites-enabled/

WORKDIR /var/www/codeisdead
RUN bower install --allow-root

EXPOSE 80

