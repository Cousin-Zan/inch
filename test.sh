#!/usr/bin/env zsh

export GOBIN=~/dev/inch/bin/
go install ./cmd/inch/

./bin/inch -v -c 256 -b 1000 -t 2,5000,1 -p 300 -randomize-fields true
#-v2 -token my-super-secret-auth-token
