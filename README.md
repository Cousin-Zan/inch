inch
====

Inch is an InfluxDB benchmarking tool for testing with different tag
cardinalities.


## Installing

To install, simply `go get` from the command line:

```sh
$ go get github.com/influxdata/inch/cmd/inch
```


## Running

The `inch` program accepts several flags to adjust the number of points and
tag values.

```
Usage of inch:
  -b int
    	Batch size (default 5000)
  -c int
    	Concurrency (default 1)
  -consistency string
    	Write consistency (default any) (default "any")
  -db string
    	Database to write to (default "stress")
  -delay duration
    	Delay between writes
  -dry
    	Dry run (maximum writer perf of inch on box)
  -f int
    	Fields per point (default 1)
  -host string
    	Host (default "http://localhost:8086")
  -m int
    	Measurements (default 1)
  -max-errors int
    	Terminate process if this many errors encountered
  -p int
    	Points per series (default 100)
  -report-host string
    	Host to send metrics
  -report-tags string
    	Comma separated k=v tags to report alongside metrics
  -shard-duration string
    	Set shard duration (default 7d)
  -t string
    	Tag cardinality (default "10,10,10")
  -target-latency duration
    	If set inch will attempt to adapt write delay to meet target
  -time duration
    	Time span to spread writes over
  -v	Verbose
```

The `-t` flag specifies the number of tags and the cardinality by using a
comma-separated list of integers. For example, the value `"100,20,4"` means 
that 3 tag keys should be used. The first one has 100 values, the second one
has 20 values, and the last one has 4 values. `inch` will insert a series for
each combination of these values so the total number of series can be computed
by multiplying the values (`100 * 20 * 4`).

By setting the `verbose` flag you can see progress each second.

The `-target-latency` flag will allow `inch` to automatically backoff (add 
delays after writing batches) according to the weighted moving average of 
response times from the InfluxDB server. If the WMA of responses is greater than 
the target latency then delays will be increased in an attempt to allow the 
InfluxDB server time to recover and process in-flight writes. If a delay is in 
place on `inch` clients yet the WMA of response times is lower than the target
latency, then `inch` will reduce the delays in an attempt to increase throughput.

The `-report-host` flag can be used to specify the location of an InfluxDB 
instance, to be used for reporting the results of inch. A local instance to inch
would be specified as `-report-host http://localhost:8086`. Inch will provide 
appropriate tags where possible, but arbitrary tags can be set using the 
`-report-tags` flag. The format for `-report-tags` is a comma separated list of 
key value pairs. For example `-report-tags instance=m4.2xlarge,index=tsi1`.

When `-report-host` is set to a non-empty value, inch will report throughput, 
points and values written, as well as write latency statistics.


## Use Example
``` shell
./inch --host "http://172.16.100.32:8086" --token u-2Ep9hS-sjaEFxhsdC63hqrz4K8bhlLPpBpkKgYinA6kZ2sLTrydsRSxR9oofNHGk19aMD7C0DcnrfJpfm9WA== -v -c 256 -b 1000 -t 2,500,1 -p 300 --v2
```

```shell
(base) pengzan@YMatrix-2 bin % ./inch --host "http://172.16.100.32:8086" --token u-2Ep9hS-sjaEFxhsdC63hqrz4K8bhlLPpBpkKgYinA6kZ2sLTrydsRSxR9oofNHGk19aMD7C0DcnrfJpfm9WA== -v -c 256 -b 1000 -t 2,500,1 -p 300 --v2
Host: http://172.16.100.32:8086
Concurrency: 256
Virtual Hosts: 0
Measurements: 1
Tag cardinalities: [2 500 1]
Points per series: 300
Total series: 1000
Total points: 300000
Total fields per point: 1
Randomized field values: false
Multiple writes per point: false
Batch Size: 1000
Database: stress (Shard duration: 7d)
Write Consistency: any
Writing into InfluxDB 2.0: true
InfluxDB 2.0 Authorization Token: u-2Ep9hS-sjaEFxhsdC63hqrz4K8bhlLPpBpkKgYinA6kZ2sLTrydsRSxR9oofNHGk19aMD7C0DcnrfJpfm9WA==
Content-Type:[application/x-www-form-urlencoded]
Authorization:[Token u-2Ep9hS-sjaEFxhsdC63hqrz4K8bhlLPpBpkKgYinA6kZ2sLTrydsRSxR9oofNHGk19aMD7C0DcnrfJpfm9WA==]
Start time: 2023-10-13 17:35:39.907755 +0000 UTC
Time span: off
T=00000001 38000 points written (12%). Total throughput: 37940.0 pt/sec | 37940.0 val/sec. Current throughput: 38000 val/sec. Errors: 0
T=00000002 60000 points written (20%). Total throughput: 29976.8 pt/sec | 29976.8 val/sec. Current throughput: 22000 val/sec. Errors: 0
T=00000003 125000 points written (41%). Total throughput: 41652.0 pt/sec | 41652.0 val/sec. Current throughput: 65000 val/sec. Errors: 0 | μ: 1.789901s, 90%: 2.914406s, 95%: 2.918859s, 99%: 2.920139s
T=00000004 277000 points written (92%). Total throughput: 69223.4 pt/sec | 69223.4 val/sec. Current throughput: 152000 val/sec. Errors: 0 | μ: 2.506336592s, 90%: 3.46027s, 95%: 3.49595s, 99%: 3.604662s
T=00000005 277000 points written (92%). Total throughput: 55342.4 pt/sec | 55342.4 val/sec. Current throughput: 0 val/sec. Errors: 0 | μ: 2.506336592s, 90%: 3.46027s, 95%: 3.49595s, 99%: 3.604662s
T=00000006 293000 points written (97%). Total throughput: 48820.9 pt/sec | 48820.9 val/sec. Current throughput: 16000 val/sec. Errors: 0 | μ: 2.676528972s, 90%: 3.49595s, 95%: 5.572433s, 99%: 5.641631s
T=00000007 296000 points written (98%). Total throughput: 42276.6 pt/sec | 42276.6 val/sec. Current throughput: 3000 val/sec. Errors: 0 | μ: 2.713419989s, 90%: 3.502818s, 95%: 5.612333s, 99%: 5.646336s
T=00000008 297000 points written (99%). Total throughput: 37117.8 pt/sec | 37117.8 val/sec. Current throughput: 1000 val/sec. Errors: 0 | μ: 2.729823175s, 90%: 3.503855s, 95%: 5.616279s, 99%: 6.025215s
T=00000009 297000 points written (99%). Total throughput: 32994.5 pt/sec | 32994.5 val/sec. Current throughput: 0 val/sec. Errors: 0 | μ: 2.729823175s, 90%: 3.503855s, 95%: 5.616279s, 99%: 6.025215s
T=00000009 300000 points written (100%). Total throughput: 32497.9 pt/sec | 32497.9 val/sec. Current throughput: 3000 val/sec. Errors: 0 | μ: 2.793683806s, 90%: 3.599518s, 95%: 5.630596s, 99%: 7.585166s

Total time: 9.2 seconds

```