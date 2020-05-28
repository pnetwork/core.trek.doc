host.filewatch.install
**********************************
| 安装 CDN 自动刷新/预热脚本
| 奔腾预设脚本，监控服务器上 web 服务的静态档案资料夹，如果有档案更新则自动驱动 CDN 预热刷新。

.. code-block:: yaml

    id: host.filewatch.install
    schemaVersion: '0.2'
    version: 0.6.4
    name: 安装 CDN 自动刷新/预热脚本
    title: 安装 CDN 自动刷新/预热脚本
    description: 奔腾预设脚本，监控服务器上 web 服务的静态档案资料夹，如果有档案更新则自动驱动 CDN 预热刷新。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      folder:
        name: 资料夹路径
        title: 资料夹路径
        description: 要监控变动档案的目的资料夹，需要绝对路径
        type: string
        examples:
        - /path/to/dir
        - null
      urls:
        name: CDN网址路由
        title: CDN网址路由
        description: 对应的CDN网址路由，一行一笔，需带入完整的HTTP方法
        type: array
        items:
          type: string
          examples:
          - https://cdn.yourdomain.com/img
          - http://cdn2.yourdomain2.net/static
    required:
    - resourceIds
    - folder
    - urls
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
    