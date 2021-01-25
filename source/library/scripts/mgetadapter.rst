mgetadapter
**********************************
| 解析下载档案资讯
| 解析来源服务器资讯和档案位置

.. code-block:: yaml

    id: mgetadapter
    schemaVersion: '0.2'
    version: 0.4.0
    title: 解析下载档案资讯
    description: 解析来源服务器资讯和档案位置
    namespace: network.pentium
    assets:
    - SCRIPT
    - HOST
    inputs:
      marvin_hash_id:
        type: string
        description: Marvin 平台的演算 ID
        title: Marvin 平台的演算 ID
      md5:
        type: string
        description: 档案的 MD5
        title: 档案的 MD5
      filepath:
        type: string
        description: 档案路径
        title: 档案路径
      filename:
        type: string
        description: 档案名称
        title: 档案名称
      size:
        type: string
        description: 档案大小
        title: 档案大小
      pack_files:
        type: array
        items:
          type: string
        description: 压缩的档案清单，前 3 笔
        title: 压缩的档案清单
      count:
        type: integer
        description: 打包的档案数量
        title: 打包的档案数量
    outputs:
      resource_id:
        type: string
        description: 服务器 ID
        title: 服务器 ID
      resource_name:
        type: string
        description: 服务器名称
        title: 服务器名称
      remote_path:
        type: string
        description: 档案路径
        title: 档案路径
      remote_file_name:
        type: string
        description: 档案名称
        title: 档案名称
      md5:
        type: string
        description: 档案的 MD5
        title: 档案的 MD5
      user_id:
        type: string
        description: 用户 ID
        title: 用户 ID
      user_name:
        type: string
        description: 用户名称
        title: 用户名称
      is_md5_exist:
        type: boolean
        description: 档案是否存在数据库
        title: 档案是否存在数据库
      task_id:
        type: string
        description: 执行下载当下的任务 ID
        title: 执行下载当下的任务 ID
      single_file_name:
        title: 单一档案档名
        description: 单一档案档名
        type: string
      is_single_file:
        title: 是否为单一档案
        description: 是否为单一档案
        type: string
        default: false
        enum:
        - true
        - false
        enumNames:
        - 是
        - 否
    