Sets up nix with cachix


```yaml
- name: setup nix (with cachix)
  if: ${{ inputs.cachix_enabled == 'true' }}
  uses: .github/actions/setup-nix-cachix/
  with:
    flake_lock: ./flake.lock
    nix_develop_arguments: ".#default"

    cachix_cache_name: ${{ inputs.cachix_cache_name }}
    cachix_auth_token: ${{ inputs.cachix_auth_token }}
```
