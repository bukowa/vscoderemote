TAG=vsremote
CERTBOT=${TAG}-certbot

certbot:
	docker build -f certbot.Dockerfile --tag=${CERTBOT} . &&\
	docker run --rm -it \
	--dns 8.8.8.8 \
	--volume=${CURDIR}/certs:/app \
	--volume=${CURDIR}/certs/keys/:/etc/letsencrypt \
	${CERTBOT}