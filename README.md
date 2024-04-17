# setup-oceanbase-ce

This [GitHub Action](https://github.com/features/actions) sets up a Docker container of OceanBase CE.

## Usage

```yaml
steps:
  - uses: oceanbase/setup-oceanbase-ce@v1.0
    with:
      image_tag: 'latest'
```

| Option            | Required | Default Value | Description                                                    |
|-------------------|----------|---------------|----------------------------------------------------------------|
| image_tag         | false    | latest        | The Docker image tag of OceanBase CE.                          |
| container_name    | false    | oceanbase-ce  | The name of OceanBase container.                               |
| network           | false    |               | The network used by OceanBase container.                       |
| sql_port          | false    | 2881          | The SQL port of OceanBase container.                           |
| rpc_port          | false    | 2882          | The RPC port of OceanBase container.                           |
| mode              | false    | slim          | The deployment mode of OceanBase container.                    |
| fastboot          | false    | true          | Whether to use fastboot mode to start the OceanBase container. |
| sys_root_password | false    |               | The password of sys tenant root user.                          |
| cluster_name      | false    | obcluster     | The cluster name of OceanBase container.                       |
| tenant_name       | false    | test          | The name of non-system tenant to be created.                   |
| memory_limit      | false    | 6G            | Cluster configuration memory_limit.                            |
| system_memory     | false    | 1G            | Cluster configuration system_memory.                           |
| datafile_size     | false    | 5G            | Cluster configuration datafile_size.                           |
| log_disk_size     | false    | 5G            | Cluster configuration log_disk_size.                           |

See [Docker Hub](https://hub.docker.com/r/oceanbase/oceanbase-ce) for available image tags.

## License

See [LICENSE](LICENSE).
