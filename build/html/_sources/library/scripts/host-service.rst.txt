host-service
**********************************
| 執行 service 指令
| 對指定機器執行 service 指令，操作對象服務。

.. code-block:: yaml

    id: host-service
    schemaVersion: '0.2'
    version: 0.4.0
    title: 執行 service 指令
    description: 對指定機器執行 service 指令，操作對象服務。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      service_arguments:
        type: string
        title: 輸入參數
        description: 指定指令輸入參數
      service_is_enabled:
        type: string
        title: 服務是否開機自動執行
        description: 服務是否開機自動執行
        enum:
        - 'yes'
        - 'no'
      service_names:
        type: array
        title: 執行對象服務
        description: 執行對象服務
        items:
          type: string
        examples:
        - nginx
        - crond
      service_state:
        type: string
        title: 欲執行的命令
        description: 欲執行的命令
        enum:
        - reloaded
        - restarted
        - started
        - stopped
      service_ignore_errors:
        type: string
        title: 是否忽略錯誤
        description: 是否忽略錯誤，繼續執行下一個 Task
        enum:
        - 'yes'
        - 'no'
        default: 'no'
    required:
    - resourceIds
    - service_names
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
    