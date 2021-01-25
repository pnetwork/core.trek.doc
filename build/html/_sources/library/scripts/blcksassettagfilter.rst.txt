blcksassettagfilter
**********************************
| 過濾資產標籤
| 過濾資產標籤

.. code-block:: yaml

    id: blcksassettagfilter
    schemaVersion: '0.2'
    version: 0.2.0
    title: 過濾資產標籤
    description: 過濾資產標籤
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      resource_id:
        title: id 列表
        description: id 列表
        type: array
        items:
          type: string
      resource_type:
        title: 资产类别
        description: 指定资产的类别
        type: string
        enum:
        - HOST
        - DOMAIN
        - CDN
        - CERTIFICATE
        enumNames:
        - 服務器
        - 域名
        - CDN
        - 憑證
      tag_filer:
        title: 過濾的標籤條件
        description: 過濾的標籤條件，需全部符合才為 True
        type: array
        items:
          type: object
          properties:
            tag_name:
              type: string
            tagged_on_asset:
              type: boolean
              enum:
              - true
              - false
              enumNames:
              - 具有
              - 不具有
    required:
    - resource_id
    - resource_type
    - tag_filer
    outputs:
      matched_resource_ids:
        type: array
        items:
          type: string
      unmatched_resource_ids:
        type: array
        items:
          type: string
    