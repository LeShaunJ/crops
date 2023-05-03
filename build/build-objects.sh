#!/bin/sh

platforms="arm64-apple-darwin x86_64-apple-darwin x86_64-pc-linux-gnu armv6k-unknown-linux-gnueabihf"

for platform in $platforms; do
  case $platform in
  arm64-apple-darwin)
    bindir=darwin_arm64
    ;;
  x86_64-apple-darwin)
    bindir=darwin_amd64
    ;;
  x86_64-pc-linux-gnu)
    bindir=linux_amd64
    ;;
  armv6k-unknown-linux-gnueabihf)
    bindir=linux_armv6k
    ;;
  esac

  bindir="build/$bindir"
  mkdir -p "$bindir"

  ops build --cross-compile --target $platform -o "$bindir/ops" | sed "s:$bindir/::g" > "$bindir/link.sh"
  chmod +x "$bindir/link.sh"
done
