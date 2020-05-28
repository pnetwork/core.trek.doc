host.filewatch.remove
**********************************
| 移除 CDN 自动刷新/预热脚本
| 奔腾预设脚本，对服务器部署移除静态资料夹监控脚本。

.. code-block:: yaml

    id: host.filewatch.remove
    schemaVersion: '0.2'
    version: 0.6.2
    name: 移除 CDN 自动刷新/预热脚本
    title: 移除 CDN 自动刷新/预热脚本
    description: 奔腾预设脚本，对服务器部署移除静态资料夹监控脚本。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      folder:
        name: 资料夹路径
        title: 资料夹路径
        description: 欲移除监控变动档案的目的资料夹，需要绝对路径
        type: string
        examples:
        - /path/to/dir
    required:
    - resourceIds
    - folder
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
    