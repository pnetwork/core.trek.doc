byos-tunnel-test
**********************************
| 链路连线测试脚本
| 奔腾预设脚本，对链路连线测试脚本。

.. code-block:: yaml

    id: byos-tunnel-test
    schemaVersion: '0.2'
    version: 0.8.0
    title: 链路连线测试脚本
    description: 奔腾预设脚本，对链路连线测试脚本。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resourceIds:
        $ref: pn_ids_host
      tunnelId:
        title: tunnelId
        type: string
        description: tunnelId
      testing_vars:
        title: 连线测试参数
        type: array
        description: 连线测试参数
        items:
          type: object
          properties:
            hostId:
              title: hostId
              type: string
              description: hostId
            remoteIP:
              title: 测试连线IP
              type: string
              description: 测试连线IP
            remotePort:
              title: 测试连线 Port
              type: integer
              description: 测试连线 Port
    required:
    - resourceIds
    - tunnelId
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
    