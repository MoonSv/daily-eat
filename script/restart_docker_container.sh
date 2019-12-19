#!/bin/bash
echo "---Unzip dist.zip---"
rm -rf dist/
unzip dist.zip
echo "---Restart docker container---"
docker stop elated_bassi
docker start elated_bassi