host.filewatch.install
**********************************
| 安装 CDN 自动刷新/预热脚本
| 奔腾预设脚本，监控服务器上 web 服务的静态档案资料夹，如果有档案更新则自动驱动 CDN 预热刷新。

.. code-block:: yaml

    id: host.filewatch.install
    schemaVersion: '0.2'
    version: 0.14.0
    title: 安装 CDN 自动刷新/预热脚本
    description: 奔腾预设脚本，监控服务器上 web 服务的静态档案资料夹，如果有档案更新则自动驱动 CDN 预热刷新。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      folder:
        title: 资料夹路径
        description: 要监控变动档案的目的资料夹，需要绝对路径
        type: string
        examples:
        - /path/to/dir
      urls:
        title: CDN网址路由
        description: 对应的CDN网址路由，一行一笔，需带入完整的HTTP方法
        type: array
        items:
          type: string
          examples:
          - https://cdn.yourdomain.com/img
          - http://cdn2.yourdomain2.net/static
    required:
    - resourceIds
    - folder
    - urls
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
    