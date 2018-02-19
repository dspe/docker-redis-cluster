#!/bin/bash

echo "Launching the cluster ..."
echo ------------------------------------------------
docker-compose build && docker-compose up -d

echo ------------------------------------------------
echo "Scaling Redis cluster ..."
echo " - Deploying sentinel containers ..."
docker-compose scale sentinel=3
echo " - Deploying redis slave ..."
docker-compose scale slave=2
echo ------------------------------------------------

echo "Cluster build. You could access HaProxy stats via http://localhost:9000"
