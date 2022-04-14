#!/usr/bin/env zsh

export GOBIN=~/dev/inch/bin/
go install ./cmd/inch/

# /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 \
#     -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu1.parquet"

for ((i = 0 ; i < 1; i++)); do
  /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 \
      -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu1.parquet" &>/dev/null &

  /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 \
      -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu2.parquet" &>/dev/null &

  /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 \
      -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu3.parquet" &>/dev/null &

  /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 \
      -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu4.parquet" &>/dev/null
  sleep 0.3
  echo-info "Dumped batch $i"
done


# -randomize-fields true
#-v2 -token my-super-secret-auth-token
#
#  curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
#  "q=SELECT count(\"id\") FROM gpu"

 # curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
 # "q=SELECT count(DISTINCT \"id\") FROM gpu"

 # curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "db=stress" --data-urlencode \
 # "q=SELECT * FROM gpu limit 20"
