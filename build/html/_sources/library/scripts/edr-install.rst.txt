edr-install
**********************************
| 部署 EDR 腳本
| 奔腾预设脚本，对服务器部署 EDR 脚本。

.. code-block:: yaml

    id: edr-install
    schemaVersion: '0.2'
    version: 0.7.0
    title: 部署 EDR 腳本
    description: 奔腾预设脚本，对服务器部署 EDR 脚本。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      EDR_Host:
        type: string
        title: EDR 服务网址
        description: EDR 服务网址
      EDR_Port:
        type: string
        title: EDR 连接埠
        description: EDR 连接埠
      ftp_user:
        type: string
        title: FTP 帐号
        description: FTP 帐号
      ftp_password:
        type: string
        title: FTP 密码
        description: FTP 密码
      ftp_host:
        type: string
        title: FTP 位置
        description: FTP 位置
    required:
    - resourceIds
    - EDR_Host
    - EDR_Port
    - ftp_user
    - ftp_password
    - ftp_host
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
    