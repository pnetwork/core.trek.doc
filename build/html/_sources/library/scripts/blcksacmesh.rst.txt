blcksacmesh
**********************************
| 產生 let's encrypt 憑證
| 產生 let's encrypt 憑證

.. code-block:: yaml

    id: blcksacmesh
    schemaVersion: '0.2'
    version: 0.1.3
    name: 產生 let's encrypt 憑證
    title: 產生 let's encrypt 憑證
    description: 產生 let's encrypt 憑證
    namespace: network.pentium
    assets:
    - CERTIFICATE
    inputs:
      domain_id:
        type: string
        name: 需產生憑證的域名ID
        title: 需產生憑證的域名ID
        description: 需產生憑證的域名ID
      email:
        name: 產生憑證時的註冊電子郵件
        title: 產生憑證時的註冊電子郵件
        description: 產生憑證時的註冊電子郵件
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
        name: 此任務執行失敗與否
        type: boolean
        default: false
      msg:
        name: 任務執行訊息
        type: string
      project_names:
        type: array
        items:
          type: string
    