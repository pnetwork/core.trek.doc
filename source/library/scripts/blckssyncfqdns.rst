blckssyncfqdns
**********************************
| 同步子域名
| 同步子域名

.. code-block:: yaml

    id: blckssyncfqdns
    schemaVersion: '0.2'
    version: 0.2.1
    name: 同步子域名
    title: 同步子域名
    description: 同步子域名
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_domain
      domains:
        name: 域名资讯列表
        title: 域名资讯列表
        type: array
        description: 域名资讯列表
        items:
          type: object
    outputs:
      result:
        done:
          description: blcks 工作完成
          type: boolean
          title: blcks 工作完成
    