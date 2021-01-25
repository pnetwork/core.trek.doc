expiredfile
**********************************
| 移除过期24小时的下载档案
| 移除过期24小时的下载档案

.. code-block:: yaml

    id: expiredfile
    schemaVersion: '0.2'
    version: 0.4.0
    title: 移除过期24小时的下载档案
    description: 移除过期24小时的下载档案
    namespace: network.pentium
    assets:
    - HOST
    - SCRIPT
    inputs:
      keys:
        title: 手动输入欲删除的物件清单
        description: 删除的数据库的 Key 清单
        type: array
        items:
          type: string
      bucket:
        type: string
        description: 数据库的 Bucket 名称
        title: 数据库的 Bucket 名称
        default: mget
    outputs:
      keys:
        title: 被删除的物件清单
        description: 被删除的数据库的 Key 清单
        type: array
        items:
          type: string
    