#!/usr/bin/env zsh

export GOBIN=~/dev/inch/bin/
go install ./cmd/inch/

# V1
# ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu2"  \
#     -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu2.parquet"

#  curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
#  "q=SELECT count(\"id\") FROM gpu"
 # curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
 # "q=SELECT count(DISTINCT \"id\") FROM gpu"
 # curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
 # "q=SELECT * FROM gpu limit 20"

# V2
# ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -v2 -token my-super-secret-auth-token \
#     -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu2.parquet"
