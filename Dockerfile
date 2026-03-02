FROM alpine:latest
WORKDIR /app
COPY milena.sh .
RUN chmod +x milena.sh
CMD ["./milena.sh"]
