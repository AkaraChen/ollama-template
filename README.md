# Ollama Docker Template

## Usage

```bash
gh api -H 'Accept: application/vnd.github.v3.raw' 'repos/akarachen/ollama-template/contents/Dockerfile' > Dockerfile.ollama
gh api -H 'Accept: application/vnd.github.v3.raw' 'repos/akarachen/ollama-template/contents/ollama-setup.sh' > ollama-setup.sh
```

Then add some models to the `MODELS` build argument in the `compose.yaml` file.

```yaml
services:
  ollama:
    build:
      context: .
      dockerfile: Dockerfile.ollama
      args:
        MODELS: deepseek-r1:1.5b,bge-m3
    ports:
      - 11434:11434
    volumes:
      - ollama:/root/.ollama
volumes:
  ollama:
````

Then run:

```bash
docker compose build
```
