FROM alpine:latest
# התקנת הכלי שמאפשר לדבר עם רדיס
RUN apk add --no-cache redis
WORKDIR /app
COPY milena.sh .
RUN chmod +x milena.sh
CMD ["./milena.sh"]
