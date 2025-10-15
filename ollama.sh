#!/bin/bash

curl -fsSL https://ollama.com/install.sh | sh

sleep 5

if ! command -v ollama &>/dev/null; then
  echo "Ollama no se instaló correctamente."
  exit 1
fi

ollama pull llama3.1:8b

echo "Ollama y el modelo llama3:8b están listos."
