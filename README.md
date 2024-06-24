# setup-oceanbase-ce

This [GitHub Action](https://github.com/features/actions) sets up a Docker container of OceanBase CE.

## Usage

```yaml
steps:
  - uses: oceanbase/setup-oceanbase-ce@v1
    with:
      # The name of OceanBase CE Docker image.
      # Default: oceanbase/oceanbase-ce
      image_name: ''
      # The tag of OceanBase CE Docker image.
      # Default: latest
      image_tag: ''
      # The name of started Docker container.
      # Default: oceanbase-ce
      container_name: ''
      # The network used by OceanBase container https://docs.docker.com/network.
      # Default: null
      network: ''
      # The SQL port of OceanBase container.
      # Default: 2881
      sql_port: ''
      # The RPC port of OceanBase container.
      # Default: 2882
      rpc_port: ''
      # The deployment mode of OceanBase container. Should be 'mini', 'slim' or 'normal'.
      # Default: slim
      mode: ''
      # The password of sys tenant root user.
      # Default: null
      sys_root_password: ''
      # The cluster name of OceanBase instance.
      # Default: github-action
      cluster_name: ''
      # The name of non-system tenant to be created.
      # Default: test
      tenant_name: ''
      # The password of root user in created non-system tenant.
      # Default: null
      tenant_root_password: ''
      # Cluster configuration 'memory_limit'.
      # Default: 6G
      memory_limit: ''
      # Cluster configuration 'system_memory'.
      # Default: 1G
      system_memory: ''
      # Cluster configuration 'datafile_size'.
      # Default: 5G
      datafile_size: ''
      # Cluster configuration 'log_disk_size'.
      # Default: 5G
      log_disk_size: ''
      # SQL text used to initialize the test tenant.
      # Default: null
      init_sql: ''
```

See [Docker Hub](https://hub.docker.com/r/oceanbase/oceanbase-ce) for more details about OceanBase Docker image.

## License

See [LICENSE](LICENSE).
