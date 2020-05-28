fileupload
**********************************
| 文件上传
| 将档案上传至指定服务器

.. code-block:: yaml

    id: fileupload
    schemaVersion: '0.2'
    version: 0.3.1
    name: 文件上传
    title: 文件上传
    description: 将档案上传至指定服务器
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      filename:
        name: 档案路径
        title: 档案路径
        description: 档案路径
        type: string
      remotepath:
        name: 远端档案路径
        title: 远端档案路径
        description: 远端档案路径
        type: string
      checksum:
        name: 检查码
        title: 检查码
        description: 检查码
        type: string
    outputs:
      done:
        name: blcks 工作完成
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
    