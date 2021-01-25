remove-files-in-folders
**********************************
| 移除资料夹档案脚本
| 奔腾预设脚本，移除服务器指定资料夹内的所有档案与资料夹。

.. code-block:: yaml

    id: remove-files-in-folders
    schemaVersion: '0.2'
    version: 0.4.0
    title: 移除资料夹档案脚本
    description: 奔腾预设脚本，移除服务器指定资料夹内的所有档案与资料夹。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      designateFolders:
        type: array
        title: 选定的资料夹，将移除资料夹内的所有档案与资料夹
        items:
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
    