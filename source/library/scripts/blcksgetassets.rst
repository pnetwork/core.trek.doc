blcksgetassets
**********************************
| 取得 Marvin 資產內容
| 取得 Marvin 資產內容

.. code-block:: yaml

    id: blcksgetassets
    schemaVersion: '0.2'
    version: 0.2.0
    title: 取得 Marvin 資產內容
    description: 取得 Marvin 資產內容
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resource_ids:
        title: id 列表
        description: id 列表
        type: array
        items:
          type: string
      asset_type:
        title: 资产类别
        description: 指定资产的类别
        type: string
        enum:
        - HOST
        - DOMAIN
        - CDN
        - CERTIFICATE
        enumNames:
        - 服务器
        - 域名
        - CDN
        - 凭证
    required:
    - resource_ids
    - asset_type
    outputs:
      data:
        type: array
        items:
          type: object
          properties:
            id:
              type: string
            name:
              type: string
    