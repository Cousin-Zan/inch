#!/usr/bin/env zsh

export GOBIN=~/dev/inch/bin/
go install ./cmd/inch/

/usr/bin/time -v ./bin/inch -v -c 2 -b 10000 -t 2,5000,1 -p 3000
# -randomize-fields true
#-v2 -token my-super-secret-auth-token
#
#  curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
#  "q=SELECT count(\"id\") FROM gpu"

 curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
 "q=SELECT count(DISTINCT \"id\") FROM gpu"

 # curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
 # "q=SELECT * FROM gpu limit 20"
