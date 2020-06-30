byos-tunnel-setup
**********************************
| 设定链路脚本
| 奔腾预设脚本，对服务器设定链路脚本，支持 Ansible2.9。

.. code-block:: yaml

    id: byos-tunnel-setup
    schemaVersion: '0.2'
    version: 0.9.0
    name: 设定链路脚本
    title: 设定链路脚本
    description: 奔腾预设脚本，对服务器设定链路脚本，支持 Ansible2.9。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resourceIds:
        $ref: pn_ids_host
      act:
        name: 设定链路方式
        title: 设定链路方式
        type: string
        description: 设定链路方式 ( run/delete )
      tunnelId:
        name: 链路ID
        title: 链路ID
        type: string
        description: 链路ID
      tunnel_account:
        name: 链路连线帐号
        title: 链路连线帐号
        type: string
        description: 链路连线帐号
      tunnel_password:
        name: 链路连线密码
        title: 链路连线密码
        type: string
        description: 链路连线密码
      server_vars:
        name: 链路 server 需求参数
        title: 链路 server 需求参数
        type: object
        description: 链路 server 需求参数
      client_vars:
        name: 链路 client 需求参数
        title: 链路 client 需求参数
        type: object
        description: 链路 client 需求参数
    required:
    - resourceIds
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples: '---
    
          PLAY [部署金钥]
    
          TASK [部署金钥]
    
          ok: [x0BKW7]
    
          PLAY RECAP
    
          x0BKW7 : ok=2 changed=0 unreachable=0 failed=0
    
          '
      stderr:
        description: 脚本执行标准错误输出内容
        type: string
        examples: '---
    
          PLAY [部署金钥]
    
          TASK [部署金钥]
    
          ok: [x0BKW7]
    
          PLAY RECAP
    
          x0BKW7 : ok=0 changed=0 unreachable=1 failed=0
    
          '
      vars:
        description: 脚本执行参数，格式为 json string。
        type: string
        examples:
          ansible_user: root
          ansible_verbosity: 0
    