# bkvm
## usage
### dry run
```bash
docker run -it ttbb/bkvm:nake bash
```
### start with metadata service uri
```
docker run -p 4500:4500 -e BKVM_metadataServiceUri='zk+null://<my-zookeeper>:2181/ledgers' --rm ttbb/bkvm:nake
```
