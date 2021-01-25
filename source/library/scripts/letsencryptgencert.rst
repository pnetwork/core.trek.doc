letsencryptgencert
**********************************
| 使用 let's encrypt 產生憑證
| | 使用 let's encrypt 產生憑證  
       | 

.. code-block:: yaml

    id: letsencryptgencert
    schemaVersion: '0.2'
    version: 0.1.0
    title: 使用 let's encrypt 產生憑證
    description: "使用 let's encrypt 產生憑證  \n"
    namespace: network.pentium
    assets:
    - HOST
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_host
      fqdns:
        title: 欲使用 let's encrypt 產生憑證的 fqdns
        description: 欲使用 let's encrypt 產生憑證的 fqdns
        type: array
        items:
          type: object
          properties:
            projectIds:
              type: array
              items: string
            fqdn:
              type: string
      email:
        title: 產生憑證時的註冊電子郵件
        description: 產生憑證時的註冊電子郵件
        type: string
    required:
    - resourceIds
    - fqdns
    - email
    outputs:
      rc:
        title: 執行結果回傳值，return code
        type: integer
      failed:
        title: 此任務執行失敗與否
        type: boolean
        default: false
      msg:
        title: 任務執行訊息
        type: string
      results:
        title: 執行結果
        description: 執行結果回傳值
        type: object
        properties:
          failed_generate_cert_list:
            type: array
            items:
              properties:
                fqdn:
                  type: string
                projectIds:
                  type: array
                  items:
                    type: string
                reason:
                  type: string
          certificates_list:
            type: array
            items:
              type: object
              properties:
                fqdn:
                  type: string
                projectIds:
                  type: array
                  items:
                    type: string
                certificate:
                  type: string
                privkey:
                  type: string
                chain:
                  type: string
                fullchain:
                  type: string
    