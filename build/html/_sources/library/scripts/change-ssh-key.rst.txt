change-ssh-key
**********************************
| 重置服务器密钥
| 奔腾预设脚本，对服务器修改SSH金钥。

.. code-block:: yaml

    id: change-ssh-key
    schemaVersion: '0.2'
    version: 0.8.0
    title: 重置服务器密钥
    description: 奔腾预设脚本，对服务器修改SSH金钥。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      new_keyId:
        title: 新密钥ID
        description: 新密钥ID
        $ref: pn_id_keypair
      old_keyId:
        title: 旧密钥ID
        description: 旧密钥ID
        $ref: pn_id_keypair
      updateMode:
        title: 新密钥部署方式
        type: string
        description: 密钥部署方式
        examples:
        - append
        - cover
        - replace
        default: cover
    required:
    - resourceIds
    - new_keyId
    - old_keyId
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
    