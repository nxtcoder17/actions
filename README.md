## collection of my common github actions

### generate-image-tag

generates container image tag, based on github branch/tag name

```yaml
# it will set 2 env variables
# IMAGE_TAG - image tag
# OVERRIDE_PUSHED_IMAGE - if true, it will not use pushed image tag
- uses: nxtcoder17/actions/generate-image-tag@v1
```

### setup-cache-go

caching for golang modules and build cache

```yaml
- uses: nxtcoder17/actions/setup-cache-go@v1
  with:
    cache_key: "cache-key"
    working_directory: .
```

### setup-docker

setup docker buildx and login to a container registry

```yaml
- uses: nxtcoder17/actions/setup-docker@v1
  with:
    docker_registry: "ghcr.io"                       # defaults to github container registry
    docker_username: ${{ github.actor }}             # defaults to github event actor
    docker_password: ${{ secrets.GITHUB_TOKEN }}     # defaults to github access token
```

### setup-nix-cachix

setup nix, with [cachix](https://cachix.org/) as bianry cache

```yaml
- uses: nxtcoder17/actions/setup-nix-cachix@v1
  with:
    flake_lock: "./flake.lock"                           # - path to flake.lock
    nix_develop_arguments: ".#default"                   # - nix develop arguments
    cachix_cache_name: "my-cache"                        # - change to your cachix cache
    cachix_auth_token:  ${{ secrets.CACHIX_AUTH_TOKEN }} # - replace with your Cachix Auth Token
```

### setup-nix-github

setup nix, with github actions as binary cache

```yaml
- uses: nxtcoder17/actions/setup-nix-github@v1
  with:
    flake_lock: "./flake.lock"            # path to flake.lock 
    nix_develop_arguments: ".#default"    # - nix develop extra arguments
```

### create a github pull request

```yaml
- uses: nxtcoder17/actions/pull-request-create
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    title: "PR title"
    body: "this PR once merged, audits, and tracks the terraform IAC changes"

```

### execute terraform plan

```yaml
# outputs:
#  - TF_PLAN_STDOUT (stdout of command terraform plan)
- uses: nxtcoder17/actions/terraform-plan
  id: plan
  with:
    # working_directory: ""
    # terraform_version: 1.10.4
    plan_file: "tfplan"
```

### execute terraform apply

```yaml
# outputs:
#   - TF_APPLY_STDOUT (stdout of command terraform apply)
- uses: nxtcoder17/actions/terraform-apply
  id: apply
  with:
    # working_directory: ""
    # terraform_version: 1.10.4
    plan_file: "tfplan"

```

### comment on an issue/pull-request

```yaml
- uses: nxtcoder17/actions/issue-comment
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    issue_number: ${{ steps.pr.outputs.PR_NUMBER }}
    body: |
      This is your comment body
```

### download artifacts from another workflow

```yaml
- uses: nxtcoder17/actions/download-workflow-artifact
  with:
    github_token: ${{ secrets.GITHUB_TOKEN }}
    workflow_name: ""
    artifact_name: ""
    destination: ""
```

### get branch name for a pull request

```yaml
- name: Get PR Branch
  uses: nxtcoder17/actions/pull-request-branch
  with:
    github_token: ${{ env.GITHUB_TOKEN }}
    pull_request_number: 12 # replace with your PR number
```
