mget-fetch-script-remove
**********************************
| 清除远端档案
| 奔腾预设脚本，清除远端档案。

.. code-block:: yaml

    id: mget-fetch-script-remove
    schemaVersion: '0.2'
    version: 0.7.0
    title: 清除远端档案
    description: 奔腾预设脚本，清除远端档案。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      remote_path:
        title: 远端档案完整路径
        description: 远端档案完整路径
        type: string
    required:
    - remote_path
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
    