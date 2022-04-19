#!/usr/bin/env zsh

export GOBIN=~/dev/inch/bin/
go install ./cmd/inch/


for ((i = 0 ; i < 1; i++)); do
#   /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu1" \
#       -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu1.parquet" &
#   /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu3" \
#       -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu3.parquet" &
#   /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu4" \
  #     -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu4.parquet" &
  # /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu5" \
  #     -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu5.parquet" &
  # /usr/bin/time -v ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu6" \
  #     -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu6.parquet" &
#   ./bin/inch -v -c 256 -b 10000 -t 2,5000,1 -p 3000 -db "gpu2"  \
#       -parquet-file "/home/ubuntu/dev/influxdb-python-demo/data/mrcnn_p4d_1node_gpu_kernels_gpu2.parquet"
#   sleep 0.3
  echo-info "Dumped batch $i"
done
