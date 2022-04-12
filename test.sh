#!/usr/bin/env zsh

export GOBIN=~/dev/inch/bin/
go install ./cmd/inch/

./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000
# -randomize-fields true
#-v2 -token my-super-secret-auth-token
