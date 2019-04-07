FROM alpine:latest

RUN apk add openjdk8-jre openssl

WORKDIR /work/

COPY ./scripts/ /work

CMD ["/work/run.sh"]