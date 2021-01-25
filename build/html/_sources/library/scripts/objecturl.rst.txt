objecturl
**********************************
| 产生下载档案存取路径
| 从脚本执行日志输出解析档案存取路径，并且发送出 Marvin 事件，通知用户。

.. code-block:: yaml

    id: objecturl
    schemaVersion: '0.2'
    version: 0.5.0
    title: 产生下载档案存取路径
    description: 从脚本执行日志输出解析档案存取路径，并且发送出 Marvin 事件，通知用户。
    namespace: network.pentium
    assets:
    - SCRIPT
    - HOST
    inputs:
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
      host_id:
        type: string
        description: 服务器 ID
        title: 服务器 ID
      host_name:
        type: string
        description: 服务器名称
        title: 服务器名称
      filename:
        type: string
        description: 档案名称
        title: 档案名称
      pack_files:
        type: array
        items:
          type: string
        description: 压缩的档案清单，前 10 笔
        title: 压缩的档案清单
      count:
        type: integer
        description: 打包的档案数量
        title: 打包的档案数量
      size:
        type: integer
        description: 档案大小
        title: 档案大小
      task_id:
        type: string
        description: 执行下载当下的任务 ID
        title: 执行下载当下的任务 ID
      single_file_name:
        title: 单一档案档名
        description: 单一档案档名
        type: string
    outputs:
      url:
        title: 档案存取网址
        description: 完整的存取网址，须经过 Token 验证才能使用。
        type: string
      message:
        title: 脚本执行讯息
        description: 脚本执行讯息
        type: string
      userId:
        title: 用户 ID
        description: 用户 ID
        type: string
      hostId:
        title: 服务器 ID
        description: 服务器 ID
        type: string
      hostName:
        title: 服务器名称
        description: 服务器名称
        type: string
      filename:
        title: 档案名称
        description: 档案名称
        type: string
      createdAt:
        title: 档案的建立时间
        description: 档案的建立时间，unix time 10 码
        type: integer
    