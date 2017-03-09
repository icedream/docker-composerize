# Composerize Docker image

## What is Composerize?

[Composerize](https://github.com/magicmark/composerize) is a utility that converts any given `docker run` command to its equivalent Docker Compose v2 configuration.

## Usage

To run a container and expose the website at port 8080, run this command:

```sh
docker run -p "8080:8080" --rm icedream/composerize
```

Or use this Docker Compose YAML configuration (`docker-compose.yml`) file:

```yaml
version: '2'
services:
    composerize:
        image: icedream/composerize
        ports:
            - '8080:8080'
```
