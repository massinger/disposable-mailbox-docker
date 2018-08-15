# disposable-mailbox + Docker

[![Docker Stars](https://img.shields.io/docker/stars/kolex/disposable-mailbox.svg?style=flat-square)](https://hub.docker.com/r/kolex/disposable-mailbox/)
[![Docker Pulls](https://img.shields.io/docker/pulls/kolex/disposable-mailbox.svg?style=flat-square)](https://hub.docker.com/r/kolex/disposable-mailbox/)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/kolex/disposable-mailbox.svg?style=flat-square)](https://hub.docker.com/r/kolex/disposable-mailbox)


![disposable-mailbox](https://i.imgur.com/MTy9k05.jpg)

## What is disposable-mailbox?

A **self-hosted** disposable mailbox  service (aka trash mail) using php  :cloud: :envelope:



Feel free to check out our image on the [Docker Hub](https://hub.docker.com/r/kolex/disposable-mailbox) as well!

## Features

- Based on the php7.2-alpine Docker image
- Uses the latest release from [synox/disposable-mailbox](https://github.com/synox/disposable-mailbox)
- For additional security, the checksum of the downloaded binary will be verified during the build process.
- Does not run as root 
- Provided with a complete docker-compose.yml file, so you can start right away!

## Description

This image contains a working disposable-mailbox installation which uses the php:7.2.x-alpine image. The base image provides alpine with php and the required extensions installed, we've only added the project files. We've tried to do everything as small, secure and clean as possible, but if you find some spots which need to be improved, feel free to tell us.

## Usage

Please note that our image requires a webserver (configured for php-fpm) in front of it, as it only exposes the php files itself. That means you can not run the container by itself. It is higly recommended to use our provided docker-compose file which you can find [right here](https://github.com/konstantingoretzki/disposable-mailbox-docker/blob/master/docker-compose.yml).

To get everything up and running, just follow these steps:

```
git clone https://github.com/konstantingoretzki/disposable-mailbox-docker
cd disposable-mailbox-docker
//Edit the config file in /src, see next chapter for instructions
//You can also modify the compose stack as needed
docker-compose up -d
```

You should then be able to access the installation at http://yourip:80

## Config

For basic usage, disposable-mailbox needs a catch-all mailbox. You need to enter the mailbox credentials in the config.php file in /src, where you also have to define the array of domains, which are able to receive emails for that mailbox. Generally, that should be it; If there are any questions regarding the configuration, you should be able to find some more information on the [project's repo](https://github.com/synox/disposable-mailbox).
