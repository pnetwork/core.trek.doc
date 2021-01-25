updateyearning
**********************************
| 同步数据库资讯至 Yearning
| 同步新增、修改、删除的数据库资讯至 Yearning

.. code-block:: yaml

    id: updateyearning
    schemaVersion: '0.2'
    version: '0.3'
    name: 同步数据库资讯至 Yearning
    title: 同步数据库资讯至 Yearning
    description: 同步新增、修改、删除的数据库资讯至 Yearning
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      update_type:
        name: 更新类型
        title: 更新类型
        type: string
        description: 更新类型
        examples:
        - createDatabase
        - deleteDatabase
        - updateDatabase
      resource_id:
        name: 数据库编号
        title: 数据库编号
        type: string
        description: 数据库编号
      host:
        name: host 资讯
        title: host 资讯
        type: string
        description: host 资讯
      port:
        name: port 资讯
        title: port 资讯
        type: integer
        description: port 资讯
      username:
        name: 数据库使用者名称
        title: 数据库使用者名称
        type: string
        description: 数据库使用者名称
      password:
        name: 数据库密码
        title: 数据库密码
        type: string
        description: 数据库密码
      db_name:
        name: 数据库名称
        title: 数据库名称
        type: string
        description: 数据库名称
    required:
    - update_type
    - resource_id
    outputs:
      done:
        name: 工作完成
        title: 工作完成
        type: string
        description: blcks 工作完成
      command:
        name: 执行命令
        title: 执行命令
        type: string
        description: 执行命令
    