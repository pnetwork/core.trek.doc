byos-tunnel-test
**********************************
| 链路连线测试脚本
| 奔腾预设脚本，对链路连线测试脚本。

.. code-block:: yaml

    id: byos-tunnel-test
    schemaVersion: '0.2'
    version: 0.5.2
    name: 链路连线测试脚本
    title: 链路连线测试脚本
    description: 奔腾预设脚本，对链路连线测试脚本。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resourceIds:
        $ref: pn_ids_host
      tunnelId:
        name: tunnelId
        title: tunnelId
        type: string
        description: tunnelId
      testing_vars:
        name: 连线测试参数
        title: 连线测试参数
        type: array
        description: 连线测试参数
        items:
          type: object
          properties:
            hostId:
              name: hostId
              title: hostId
              type: string
              description: hostId
            remoteIP:
              name: 测试连线IP
              title: 测试连线IP
              type: string
              description: 测试连线IP
            remotePort:
              name: 测试连线 Port
              title: 测试连线 Port
              type: integer
              description: 测试连线 Port
    required:
    - resourceIds
    - tunnelId
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
    