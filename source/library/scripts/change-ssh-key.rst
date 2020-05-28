change-ssh-key
**********************************
| 修改SSH金钥脚本
| 奔腾预设脚本，对服务器修改SSH金钥。

.. code-block:: yaml

    id: change-ssh-key
    schemaVersion: '0.2'
    version: 0.3.0
    name: 修改SSH金钥脚本
    title: 修改SSH金钥脚本
    description: 奔腾预设脚本，对服务器修改SSH金钥。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      new_keyId:
        name: 新密钥ID
        title: 新密钥ID
        description: 新密钥ID
        $ref: pn_id_keypair
      old_keyId:
        name: 旧密钥ID
        title: 旧密钥ID
        description: 旧密钥ID
        $ref: pn_id_keypair
      updateMode:
        name: 新密钥部署方式
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
    - updateMode
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
    