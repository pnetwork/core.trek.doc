byos-tunnel-install
**********************************
| 安装链路元件脚本
| 奔腾预设脚本，对服务器安装链路元件脚本。

.. code-block:: yaml

    id: byos-tunnel-install
    schemaVersion: '0.2'
    version: 0.7.2
    name: 安装链路元件脚本
    title: 安装链路元件脚本
    description: 奔腾预设脚本，对服务器安装链路元件脚本。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
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
    