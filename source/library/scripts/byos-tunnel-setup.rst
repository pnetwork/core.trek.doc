byos-tunnel-setup
**********************************
| 设定链路脚本
| 奔腾预设脚本，对服务器设定链路脚本，支持 Ansible2.9。

.. code-block:: yaml

    id: byos-tunnel-setup
    schemaVersion: '0.2'
    version: 0.13.0
    title: 设定链路脚本
    description: 奔腾预设脚本，对服务器设定链路脚本，支持 Ansible2.9。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resourceIds:
        $ref: pn_ids_host
      act:
        title: 设定链路方式
        type: string
        description: 设定链路方式 ( run/delete )
      tunnelId:
        title: 链路ID
        type: string
        description: 链路ID
      tunnel_account:
        title: 链路连线帐号
        type: string
        description: 链路连线帐号
      tunnel_password:
        title: 链路连线密码
        type: string
        description: 链路连线密码
      server_vars:
        title: 链路 server 需求参数
        type: object
        description: 链路 server 需求参数
      client_vars:
        title: 链路 client 需求参数
        type: object
        description: 链路 client 需求参数
    required:
    - resourceIds
    outputs:
      register:
        description: Ansible Playbook 脚本执行注册变数
        type: object
        examples:
        - "{\n  \"uri_module_result\": [\n    {\n      \"cmd\": [\n        \"echo\",\n\
          \        \"$HOSTNAME\"\n      ],\n      \"rc\": 0,\n      \"changed\": true,\n\
          \      \"failed\": false,\n      \"host_id\": \"S-bkanp6vpe\"\n    },\n    {\n\
          \      \"cmd\": [\n        \"echo\",\n        \"$HOSTNAME\"\n      ],\n    \
          \  \"rc\": 0,\n      \"changed\": true,\n      \"failed\": false,\n      \"\
          host_id\": \"S-gkbajqgfk\"\n    }\n  ],\n}\n"
    