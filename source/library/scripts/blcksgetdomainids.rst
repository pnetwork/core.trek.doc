blcksgetdomainids
**********************************
| 查找域名 ID
| 查找域名 ID

.. code-block:: yaml

    id: blcksgetdomainids
    schemaVersion: '0.2'
    version: 0.2.3
    title: 查找域名 ID
    description: 查找域名 ID
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      fqdns:
        title: fqdn 列表
        description: fqdn 列表
        type: array
        items:
          type: string
    required:
    - fqdns
    outputs:
      domain_ids:
        title: 域名 id 列表
        description: 域名 id 列表
        type: array
        items:
          type: string
      fqdn_mapping:
        title: fqdn 與域名 id 列表
        description: fqdn 與域名 id 列表
        type: array
        items:
          type: object
          properties:
            fqdn:
              type: string
            domain_id:
              type: string
      error_fqdns:
        type: array
        title: 查找 fqdn 錯誤列表
        description: 查找 fqdn 錯誤列表
        items:
          type: object
          properties:
            fqdn:
              type: string
            error:
              type: string
    