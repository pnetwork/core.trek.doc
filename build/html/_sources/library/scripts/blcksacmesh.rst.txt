blcksacmesh
**********************************
| 產生 let's encrypt 憑證
| 產生 let's encrypt 憑證

.. code-block:: yaml

    id: blcksacmesh
    schemaVersion: '0.2'
    version: 0.3.3
    title: 產生 let's encrypt 憑證
    description: 產生 let's encrypt 憑證
    namespace: network.pentium
    assets:
    - CERTIFICATE
    inputs:
      domain_id:
        type: string
        title: 需產生憑證的域名ID
        description: 需產生憑證的域名ID
      email:
        title: 產生憑證時的註冊電子郵件
        description: 產生憑證時的註冊電子郵件
        type: string
      domain_name:
        title: 產生憑證時綁定的域名或子域名
        description: 產生憑證時綁定的域名或子域名，不填則使用域名ID綁定的域名
        type: string
    required:
    - domain_id
    - email
    outputs:
      domain_id:
        type: string
      domain_name:
        type: string
      email:
        type: string
      failed:
        title: 此任務執行失敗與否
        type: boolean
        default: false
      msg:
        title: 任務執行訊息
        type: string
      project_names:
        type: array
        items:
          type: string
    