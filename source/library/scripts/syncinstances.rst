syncinstances
**********************************
| 全站云主机同步
| 批量同步平台所有云金钥的主机资讯

.. code-block:: yaml

    id: syncinstances
    schemaVersion: '0.2'
    version: '0.2'
    name: 全站云主机同步
    title: 全站云主机同步
    description: 批量同步平台所有云金钥的主机资讯
    namespace: network.pentium
    assets:
    - HOST
    outputs:
      done:
        name: blcks 工作完成
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
    