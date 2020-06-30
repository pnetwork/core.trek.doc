blcksgetrelatedcdn
**********************************
| 查詢所有憑證相關的CDN
| 查詢所有憑證相關的CDN

.. code-block:: yaml

    id: blcksgetrelatedcdn
    schemaVersion: '0.2'
    version: 0.1.1
    name: 查詢所有憑證相關的CDN
    title: 查詢所有憑證相關的CDN
    description: 查詢所有憑證相關的CDN
    namespace: network.pentium
    assets:
    - CERTIFICATE
    - CDN
    inputs:
      certificates:
        name: 所有新增的憑證內容
        title: 所有新增的憑證內容
        description: 所有新增的憑證內容
        type: array
        items:
          type: object
      tags_expired:
        name: 具有以下標籤需更換憑證
        title: 具有以下標籤需更換憑證
        description: 具有以下標籤需更換憑證
        type: array
        items:
          type: string
    required:
    - certificates
    outputs:
      all_related_cdn:
        type: array
        items:
          type: object
          properties:
            cert_id:
              type: string
            related_cdns:
              type: array
              items:
                type: object
                properties:
                  composedId:
                    type: string
                  key_id:
                    type: string
                  provider_id:
                    type: string
                  project_ids:
                    type: array
                    items:
                      type: string
    