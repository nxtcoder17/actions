## collection of my common github actions

### generate-image-tag

generates container image tag, based on github branch/tag name

#### how to use

```yaml
# it will set 2 env variables
# IMAGE_TAG - image tag
# OVERRIDE_PUSHED_IMAGE - if true, it will not use pushed image tag
- uses: nxtcoder17/actions/generate-image-tag@v1
```

### setup-cache-go

caching for golang modules and build cache

#### how to use

```yaml
# it will setup cache/restore with github cache actions
- uses: nxtcoder17/actions/setup-cache-go@v1
  with:
    cache_key: "cache-key"
    working_directory: .
```

### setup-docker

setup docker buildx and login to a container registry

#### how to use

```yaml
# it will setup docker buildx and login to docker registry
# args:
#   docker_registry (default: "ghcr.io") -
#   docker_username (required)
#   docker_password (required)
- uses: nxtcoder17/actions/setup-docker@v1
  with:
    docker_registry: "ghcr.io"
    docker_username: ${{ secrets.DOCKER_USERNAME }}
    docker_password: ${{ secrets.DOCKER_PASSWORD }}
```

### setup-nix-cachix

setup nix, with [cachix](https://cachix.org/) cache

#### how to use

```yaml
# args:
#   flake_lock (default: "./flake.lock") - path to flake.lock
#   nix_develop_arguments (default: ".#default") - nix develop extra arguments
#   cachix_cache_name (required) - cachix cache name
#   cachix_auth_token (required) - cachix auth token
- uses: nxtcoder17/actions/setup-nix-cachix@v1
  with:
    flake_lock: "./flake.lock"
    nix_develop_arguments: ".#default"
    cachix_cache_name: "my-cache"
    cachix_auth_token:  ${{ secrets.CACHIX_AUTH_TOKEN }}
```

### setup-nix-github

setup nix, with github actions cache

#### how to use

```yaml
# args:
#   flake_lock (default: "./flake.lock") - path to flake.lock
#   nix_develop_arguments (default: ".#default") - nix develop extra arguments
- uses: nxtcoder17/actions/setup-nix-github@v1
  with:
    flake_lock: "./flake.lock"
    nix_develop_arguments: ".#default"
```
