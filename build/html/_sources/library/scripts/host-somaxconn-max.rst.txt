host-somaxconn-max
**********************************
| 设定 net.core.somaxconn 至最大值
| 奔腾预设脚本，针对 CentOS 7 设定 net.core.somaxconn 至最大值。

.. code-block:: yaml

    id: host-somaxconn-max
    schemaVersion: '0.2'
    version: 0.6.0
    title: 设定 net.core.somaxconn 至最大值
    description: 奔腾预设脚本，针对 CentOS 7 设定 net.core.somaxconn 至最大值。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
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
    