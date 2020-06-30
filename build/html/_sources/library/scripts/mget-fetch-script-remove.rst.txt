mget-fetch-script-remove
**********************************
| 清除远端档案
| 奔腾预设脚本，清除远端档案。

.. code-block:: yaml

    id: mget-fetch-script-remove
    schemaVersion: '0.2'
    version: '0.4'
    title: 清除远端档案
    name: 清除远端档案
    description: 奔腾预设脚本，清除远端档案。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      remote_path:
        title: 远端档案完整路径
        description: 远端档案完整路径
        type: string
    required:
    - remote_path
    - resourceIds
    outputs:
      stdout:
        title: 脚本执行标准输出内容
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
        title: 脚本执行标准错误输出内容
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
        title: 脚本执行参数
        description: 脚本执行参数，格式为 json string。
        type: string
        examples: '{"ansible_user":"root","ansible_verbosity":0}'
    