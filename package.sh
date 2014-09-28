#!/bin/bash

set -e -x

if [[ "x$1" == "x" || "x$2" == "x" ]]; then
    echo "Usage: $0 <identifier> <version>"
    exit 1
fi

xcodebuild
mkdir -p build/bash-pkg/bin
cp build/Release/{bash,sh} build/bash-pkg/bin/
sudo chown -R root:wheel build/bash-pkg
sudo chmod 755 build/bash-pkg/{,bin/}
sudo chmod 555 build/bash-pkg/bin/{bash,sh}
pkgbuild --root build/bash-pkg \
    --identifier $1 \
    --version $2 \
    --ownership recommended \
    macosx-bash-92-shellshock-patched.pkg
sudo rm -r build/bash-pkg


