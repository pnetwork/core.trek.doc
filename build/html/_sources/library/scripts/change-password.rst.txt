change-password
**********************************
| 重置服务器密码
| 奔腾预设脚本，对服务器修改SSH连线密码。

.. code-block:: yaml

    id: change-password
    schemaVersion: '0.2'
    version: 0.6.0
    title: 重置服务器密码
    description: 奔腾预设脚本，对服务器修改SSH连线密码。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      account:
        title: 帐号
        description: 帐号
        type: string
      password:
        $ref: pn_sp_change_password
    required:
    - resourceIds
    - password
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
    