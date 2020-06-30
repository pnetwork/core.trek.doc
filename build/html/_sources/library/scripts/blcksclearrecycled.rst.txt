blcksclearrecycled
**********************************
| 删除回收站资产
| 设定回收资产的清除时间，清除已到期资产

.. code-block:: yaml

    id: blcksclearrecycled
    schemaVersion: '0.2'
    version: 0.1.1
    name: 删除回收站资产
    title: 删除回收站资产
    description: 设定回收资产的清除时间，清除已到期资产
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      tag:
        name: 标签
        title: 标签
        type: string
        description: 删除标记此标签之资产
        examples:
        - system:recycled
      days:
        name: 进回收站天数
        title: 进回收站天数
        type: integer
        description: 回收资产的清除时间
        examples:
        - 5
    required:
    - tag
    - days
    outputs:
      result:
        name: 清除结果
        title: 清除结果
        description: 清除结果
        type: object
    