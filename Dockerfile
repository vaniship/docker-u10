# Use Alpine Linux
FROM alpine:latest

# Maintainer
MAINTAINER vaniship <vaniship@gmail.com>

RUN	apk update && \
	apk upgrade && \
	apk add nodejs && \
	apk add git && \
	npm install -g u10/xchat && \
	# Cleaning up
	rm -rf /var/cache/apk/*

# Set Workdir
WORKDIR /

# Expose ports
EXPOSE 8888

CMD ["xchat"]
