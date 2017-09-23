FROM crystallang/crystal:latest

RUN mkdir /app
WORKDIR /app

# Install crystal deps
ADD shard.yml /app/
ADD shard.lock /app/
RUN crystal deps

# Add app and build it
ADD . /app/