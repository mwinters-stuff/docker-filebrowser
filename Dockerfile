FROM alpine:latest as alpine
RUN apk --update add ca-certificates
RUN apk --update add mailcap

FROM alpine:latest
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=alpine /etc/mime.types /etc/mime.types

VOLUME /srv
EXPOSE 8082

COPY filebrowser /filebrowser

CMD [ "/filebrowser","-d","/config/filebrowser-users.db","-c","/config/.filebrowser.json" ]