# Use the official Ruby image as the base image
FROM ruby:3.3.1-alpine

# Set the working directory in the container
WORKDIR /exercism

# install packages
RUN set -xe; \
  apk update; \
  apk upgrade; \
  apk add --update --no-cache build-base bash

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile .ruby.version .tool.version ./

# Install dependencies
RUN bundle install

# Copy the application code to the container
COPY . .

# Set the default command to run when the container starts
CMD while true; do echo "Container is alive"; sleep 300; done
