# Dev Hadoop Cluster

This `Vagrantfile` is used to set up a pseudo single-node yarn cluster
and a machine that has apache spark on it that can communicate with
each other.

The machines are assigned private ip addresses (configured in the vagrantfile)
- `hadoop`: 192.168.33.10
- `spark`: 192.168.33.11

To build these machines and run the launch the yarn cluster, simply
`cd` into this directory and run `vagrant up`.

To check that all is well, visit the hadoop dashboard at
<http://192.168.33.10:8080>. If this did not work, you will need to
ssh into the machine and restart daemons:

```bash
vagrant ssh hadoop

# should log in - when logged in run these commands:
./hadoop-2.7.3/sbin/stop-dfs.sh && ./hadoop-2.7.3/sbin/stop-yarn.sh
./hadoop-2.7.3/sbin/start-dfs.sh && ./hadoop-2.7.3/sbin/start-yarn.sh

exit
```

To check that the spark instance can communicate with the the yarn
cluster:

```bash
vagrant ssh spark
./spark-2.0.2-bin-hadoop2.7/bin/spark-submit --master yarn
```

This should launch an interactive spark shell. The idea will be to
deploy a web application that uses
`org.apache.spark.launcher.SparkLauncher` by itself so testing in the
future will involve uploading a war/jar file and then checking the web
interface at <192.168.33.11:8080> (or similar).

