blckssyncfqdns
**********************************
| 同步子域名
| 同步子域名

.. code-block:: yaml

    id: blckssyncfqdns
    schemaVersion: '0.2'
    version: 0.5.1
    title: 同步子域名
    description: 同步子域名
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_domain
      domains:
        title: 域名资讯列表
        type: array
        description: 域名资讯列表
        items:
          type: object
    outputs:
      result:
        type: object
        properties:
          done:
            description: blcks 工作完成
            type: boolean
            title: blcks 工作完成
    