test-domain-url
**********************************
| 测试指定网址
| 奔腾预设脚本，测试指定网址是否可以打开。

.. code-block:: yaml

    id: test-domain-url
    schemaVersion: '0.2'
    version: 0.4.0
    title: 测试指定网址
    description: 奔腾预设脚本，测试指定网址是否可以打开。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      domain:
        type: string
        title: 测试网址
        description: 测试网址
    required:
    - resourceIds
    - domain
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
    