mgetadapter
**********************************
| 解析下载档案资讯
| 解析来源服务器资讯和档案位置

.. code-block:: yaml

    id: mgetadapter
    schemaVersion: '0.2'
    version: '0.2'
    name: 解析下载档案资讯
    title: 解析下载档案资讯
    description: 解析来源服务器资讯和档案位置
    namespace: network.pentium
    assets:
    - SCRIPT
    - HOST
    inputs:
      marvin_hash_id:
        name: Marvin 平台的演算 ID
        type: string
        description: Marvin 平台的演算 ID
        title: Marvin 平台的演算 ID
      md5:
        name: 档案的 MD5
        type: string
        description: 档案的 MD5
        title: 档案的 MD5
      filepath:
        name: 档案路径
        type: string
        description: 档案路径
        title: 档案路径
      filename:
        name: 档案名称
        type: string
        description: 档案名称
        title: 档案名称
      size:
        name: 档案大小
        type: string
        description: 档案大小
        title: 档案大小
      pack_files:
        name: 压缩的档案清单
        type: array
        items:
          type: string
        description: 压缩的档案清单，前 3 笔
        title: 压缩的档案清单
      count:
        name: 打包的档案数量
        type: integer
        description: 打包的档案数量
        title: 打包的档案数量
    outputs:
      resource_id:
        name: 服务器 ID
        type: string
        description: 服务器 ID
        title: 服务器 ID
      resource_name:
        name: 服务器名称
        type: string
        description: 服务器名称
        title: 服务器名称
      remote_path:
        name: 档案路径
        type: string
        description: 档案路径
        title: 档案路径
      remote_file_name:
        name: 档案名称
        type: string
        description: 档案名称
        title: 档案名称
      md5:
        name: 档案的 MD5
        type: string
        description: 档案的 MD5
        title: 档案的 MD5
      user_id:
        name: 用户 ID
        type: string
        description: 用户 ID
        title: 用户 ID
      user_name:
        name: 用户名称
        type: string
        description: 用户名称
        title: 用户名称
      is_md5_exist:
        name: 档案是否存在数据库
        type: boolean
        description: 档案是否存在数据库
        title: 档案是否存在数据库
    