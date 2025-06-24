test_extract_metadata() {
  branch="$1"
  semver=""
  is_nightly=false

  if [[ "$branch" =~ ^refs/heads/* ]]; then
    is_nightly=true
    semver="${branch#refs/heads/}"

    if [[ $semver != *-nightly ]]; then
      semver="${semver}-nightly"
    fi

    semver="0.0.0-${semver}"
  fi

  if [[ "$branch" =~ ^refs/tags/* ]]; then
    is_nightly=false
    semver="${branch#refs/tags/}"
  fi

  if [[ $semver == release-* ]]; then
    semver=${semver#release-}
  fi

  if [[ $semver == v* ]]; then
    semver="${semver#v}"
  fi

  version="v${semver}"

  echo "$semver $version $is_nightly"
}

test_extract_metadata "refs/heads/master"
test_extract_metadata "refs/heads/rev_asdfas_"
test_extract_metadata "refs/tags/v1.0.3"
test_extract_metadata "refs/tags/1.0.3"
test_extract_metadata "refs/tags/testing"
