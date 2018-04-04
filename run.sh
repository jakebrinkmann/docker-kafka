#!/bin/bash

docker build -t micro-kafka .
docker run -it --rm --name=micro-kafka micro-kafka
