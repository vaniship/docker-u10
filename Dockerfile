# Use Alpine Linux
FROM alpine:latest

# Maintainer
MAINTAINER vaniship <vaniship@gmail.com>

RUN	apk update && \
	apk upgrade && \
	apk add supervisor nginx git nodejs
RUN	rm -rf /var/cache/apk/*

RUN	npm install -g u10/xchat

ADD /etc/supervisord.conf /etc/supervisord.conf
ADD /etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD /etc/nginx/conf.d/* /etc/nginx/conf.d/

ADD start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /run/nginx

# Set Workdir
WORKDIR /

# Expose ports
EXPOSE 8888

CMD ["/start.sh"]
