host-bootstrap-install
**********************************
| 部署奔腾 bootstrap 脚本
| 奔腾预设脚本，对服务器部署SSH纪录监控服务、服务器资讯监控服务、档案下载服务脚本。想了解安装详情，请参考用户手册。

.. code-block:: yaml

    id: host-bootstrap-install
    schemaVersion: '0.2'
    version: 0.18.1
    title: 部署奔腾 bootstrap 脚本
    description: 奔腾预设脚本，对服务器部署SSH纪录监控服务、服务器资讯监控服务、档案下载服务脚本。想了解安装详情，请参考用户手册。
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
    