pentium-execute-command
**********************************
| Pentium Execute Commnad
| 奔腾预设脚本，Execute Commnad.

.. code-block:: yaml

    id: pentium-execute-command
    schemaVersion: '0.2'
    version: '0.3'
    name: Pentium Execute Commnad
    title: Pentium Execute Commnad
    description: 奔腾预设脚本，Execute Commnad.
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      cmd:
        name: 执行 cmd
        title: 执行 cmd
        description: 执行 cmd
        type: string
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
    