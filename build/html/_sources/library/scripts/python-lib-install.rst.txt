python-lib-install
**********************************
| 安装脚本所需程式库
| 奔腾预设脚本，对服务器安装脚本所需程式库。

.. code-block:: yaml

    id: python-lib-install
    schemaVersion: '0.2'
    version: 0.5.0
    title: 安装脚本所需程式库
    description: 奔腾预设脚本，对服务器安装脚本所需程式库。
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
    