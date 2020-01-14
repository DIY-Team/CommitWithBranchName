#!/bin/sh

swift build -c release
cd .build/release
cp -f CommitWithBranchName /usr/local/bin/vcommit
