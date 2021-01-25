host.filewatch.remove
**********************************
| 移除 CDN 自动刷新/预热脚本
| 奔腾预设脚本，对服务器部署移除静态资料夹监控脚本。

.. code-block:: yaml

    id: host.filewatch.remove
    schemaVersion: '0.2'
    version: 0.10.0
    title: 移除 CDN 自动刷新/预热脚本
    description: 奔腾预设脚本，对服务器部署移除静态资料夹监控脚本。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      folder:
        title: 资料夹路径
        description: 欲移除监控变动档案的目的资料夹，需要绝对路径
        type: string
        examples:
        - /path/to/dir
    required:
    - resourceIds
    - folder
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
    