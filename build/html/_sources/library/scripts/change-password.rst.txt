change-password
**********************************
| 修改SSH密码脚本
| 奔腾预设脚本，对服务器修改SSH连线密码。

.. code-block:: yaml

    id: change-password
    schemaVersion: '0.2'
    version: 0.2.2
    name: 修改SSH密码脚本
    title: 修改SSH密码脚本
    description: 奔腾预设脚本，对服务器修改SSH连线密码。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      account:
        name: 帐号
        title: 帐号
        description: 帐号
        type: string
      password:
        $ref: pn_sp_change_password
    required:
    - resourceIds
    - password
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
    