checkwhitelist
**********************************
| SSH登录白名单检测
| 检测非白名单SSH登录目标机時发出告警

.. code-block:: yaml

    id: checkwhitelist
    schemaVersion: '0.2'
    version: 0.6.1
    name: SSH登录白名单检测
    title: SSH登录白名单检测
    description: 检测非白名单SSH登录目标机時发出告警
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      marvin_hash_id:
        type: string
        description: The hashID generated from marvin.
      client_ip:
        type: string
        description: 登录来源位置
        examples:
        - 10.0.0.1
      login_user:
        type: string
        description: 登入帐号
        examples:
        - root
        - test.group
      ssh_type:
        type: string
        description: SSH 日志类型
        examples:
        - sshrec
    required:
    - marvin_hash_id
    - client_ip
    outputs:
      has_any_valid_project:
        name: 是否通过任一白名单项目
        title: 是否通过任一白名单项目
        description: 是否通过任一白名单项目
        type: boolean
        examples:
        - true
      invalid_project:
        name: 非白名单项目
        title: 非白名单项目
        description: 非白名单项目
        type: array
        items:
          type: string
        examples:
        - projectA
      invalid_project_count:
        name: 非白名单项目数量
        title: 非白名单项目数量
        description: 非白名单项目数量
        type: integer
        examples:
        - 1
      client_ip:
        type: string
        description: 登录来源位置
        examples:
        - 10.0.0.1
      login_user:
        type: string
        description: 登入帐号
        examples:
        - root
        - test.group
      host_id:
        type: string
        description: 登录服务器ID
        examples:
        - 10.0.0.1
      host_name:
        type: string
        description: 登录服务器名称
        examples:
        - 10.0.0.1
      host_ip:
        type: string
        description: 登录服务器IP
        examples:
        - 10.0.0.1
      host_port:
        type: string
        description: 登录服务器Port
        examples:
        - '22'
    