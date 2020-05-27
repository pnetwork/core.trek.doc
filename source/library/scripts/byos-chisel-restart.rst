byos-chisel-restart
**********************************
| 链路服务升级与重启脚本
| 奔腾预设脚本，对服务器升级与重启链路服务。

.. code-block:: yaml

    id: byos-chisel-restart
    schemaVersion: '0.2'
    version: 0.1.1
    name: 链路服务升级与重启脚本
    title: 链路服务升级与重启脚本
    description: 奔腾预设脚本，对服务器升级与重启链路服务。
    namespace: network.pentium
    assets:
    - HOST
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
    