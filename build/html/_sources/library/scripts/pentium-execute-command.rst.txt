pentium-execute-command
**********************************
| Pentium Execute Commnad
| 奔腾预设脚本，Execute Commnad.

.. code-block:: yaml

    id: pentium-execute-command
    schemaVersion: '0.2'
    version: 0.6.0
    title: Pentium Execute Commnad
    description: 奔腾预设脚本，Execute Commnad.
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      cmd:
        title: 执行 cmd
        description: 执行 cmd
        type: string
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
    