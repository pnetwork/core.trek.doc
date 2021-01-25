mget-fetch-script
**********************************
| 下载远端档案脚本
| 奔腾预设脚本，下载远端档案脚本。

.. code-block:: yaml

    id: mget-fetch-script
    schemaVersion: '0.2'
    version: 0.8.0
    title: 下载远端档案脚本
    description: 奔腾预设脚本，下载远端档案脚本。
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      remote_path:
        title: 远端档案完整路径
        description: 远端档案完整路径
        type: string
      remote_file_name:
        title: 远端档案名称
        description: 远端档案名称
        type: string
      md5:
        title: 档案的 MD5
        description: 档案的 MD5
        type: string
      bucket:
        title: 欲放置的 bucket 名称
        description: 欲放置的 bucket 名称
        type: string
        default: mget
      expiration:
        title: 存取网址的到期时间
        description: 存取网址的到期时间
        type: integer
        default: 21600
      single_file_name:
        title: 单一档案档名
        description: 单一档案档名
        type: string
      is_single_file:
        title: 是否为单一档案
        description: 是否为单一档案
        type: string
        default: false
        enum:
        - true
        - false
        enumNames:
        - 是
        - 否
    required:
    - resourceIds
    - remote_path
    - remote_file_name
    - md5
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
    