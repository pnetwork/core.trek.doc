host-somaxconn-max
**********************************
| 设定 net.core.somaxconn 至最大值
| 奔腾预设脚本，针对 CentOS 7 设定 net.core.somaxconn 至最大值。

.. code-block:: yaml

    id: host-somaxconn-max
    schemaVersion: '0.2'
    version: '0.2'
    name: 设定 net.core.somaxconn 至最大值
    title: 设定 net.core.somaxconn 至最大值
    description: 奔腾预设脚本，针对 CentOS 7 设定 net.core.somaxconn 至最大值。
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
    