mget-fetch-script
**********************************
| 下载远端档案脚本
| 奔腾预设脚本，下载远端档案脚本。

.. code-block:: yaml

    id: mget-fetch-script
    schemaVersion: '0.2'
    version: '0.4'
    name: 下载远端档案脚本
    title: 下载远端档案脚本
    description: 奔腾预设脚本，下载远端档案脚本。
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      remote_path:
        title: 远端档案完整路径
        description: 远端档案完整路径
        type: string
      remote_file_name:
        title: 远端档案名称
        description: 远端档案名称
        type: string
      md5:
        title: 档案的 MD5
        description: 档案的 MD5
        type: string
      bucket:
        title: 欲放置的 bucket 名称
        description: 欲放置的 bucket 名称
        type: string
        default: mget
      expiration:
        title: 存取网址的到期时间
        description: 存取网址的到期时间
        type: integer
        default: 21600
    required:
    - resourceIds
    - remote_path
    - remote_file_name
    - md5
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
    