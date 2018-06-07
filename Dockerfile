FROM node:7-alpine

ARG COMPOSERIZE_VERSION=d841f289429579d30feee731dc08fb25b082432a

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
