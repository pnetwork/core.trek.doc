blcksgetassets
**********************************
| 取得 Marvin 資產內容
| 取得 Marvin 資產內容

.. code-block:: yaml

    id: blcksgetassets
    schemaVersion: '0.2'
    version: 0.1.0
    name: 取得 Marvin 資產內容
    title: 取得 Marvin 資產內容
    description: 取得 Marvin 資產內容
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resource_ids:
        name: id 列表
        title: id 列表
        description: id 列表
        type: array
        items:
          type: string
      asset_type:
        name: 资产类别
        title: 资产类别
        description: 指定资产的类别
        type: string
        enum:
        - SERVER
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
    