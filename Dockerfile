FROM node:7-alpine

ARG COMPOSERIZE_VERSION=881064ded420c2fced2442457c6dca62b56a7500

RUN \
	apk add --no-cache --virtual .temp \
		make \
		g++ \
		python \
		git \
		&&\
	rm -rf /app &&\
	git clone --recursive https://github.com/magicmark/composerize.git /app &&\
	cd /app &&\
	git checkout "${COMPOSERIZE_VERSION}" &&\
	npm install &&\
	npm run postinstall &&\
	rm -rf .git /tmp/* /var/tmp/* &&\
	apk del --no-cache .temp

EXPOSE 8080
WORKDIR /app
CMD ["npm", "start"]
