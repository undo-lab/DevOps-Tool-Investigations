# Setting up Consul Access Control Lists
1. Enable acl in config of all nodes
    ```JSON
    "acl": {
        "enabled": true
    },
    ```
2. Create bootstrap token __ON LEADER NODE__
    ```Bash
    consul acl bootstrap
    ```
3. Create Policy via policy config file(on leader node)
    ```Bash
    consul acl policy create -name "token-name" -description "Agent Token Policy" -rules @path_to_policy_file.hcl
    ```
    Sample Policy file:
    ```hcl
    node_prefix "" {
        policy = "write"
    }

    service_prefix "" {
        policy = "read"
    }
    ```
4. Add token to config file of other nodes
    ```JSON
    "acl": {
        "enabled": true,
        "tokens": {
                "agent": "5e40063a-t35t-h3r3-t35t-c69f8971968e"
        }
    },
    ```
