#!/bin/bash

HOST="0.0.0.0"
PORT="11434"

ollama serve &

echo "Waiting for Ollama to start..."

while ! nc -z $HOST $PORT; do
    sleep 1
done

echo "Ollama started"

for MODEL in $MODELS; do
    ollama pull $MODEL
done
