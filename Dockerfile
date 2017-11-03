FROM golang:alpine

WORKDIR /app
ENV GOLDFISH_VERSION=v0.7.4

COPY config.hcl config.hcl
RUN apk --no-cache add curl \
                       unzip \
                       jq    \
                       ca-certificates \
RUN curl -L -o goldfish https://github.com/Caiyeon/goldfish/releases/download/$GOLDFISH_VERSION/goldfish-linux-amd64 && \
    chmod a+x goldfish

EXPOSE 8000
ENTRYPOINT ["./goldfish", "-config", "config.hcl"]
