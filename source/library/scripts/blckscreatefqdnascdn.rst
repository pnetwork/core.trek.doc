blckscreatefqdnascdn
**********************************
| 添加子域名後同步 CDN
| 添加子域名後，同步 CDN，若子域名已存在則直接執行同步 CDN。

.. code-block:: yaml

    id: blckscreatefqdnascdn
    schemaVersion: '0.2'
    title: 添加子域名後同步 CDN
    version: 0.3.1
    description: 添加子域名後，同步 CDN，若子域名已存在則直接執行同步 CDN。
    namespace: network.pentium
    assets:
    - DOMAIN
    - CDN
    inputs:
      domain_info:
        title: 域名資訊
        type: object
        properties:
          id:
            title: 域名 ID
            type: string
            examples:
            - D-ajvw371v9
          name:
            title: 域名名稱
            type: string
          resolver_id:
            title: 域名解析商 ID
            type: string
            examples:
            - CP-000000001
      sub_domain_info:
        title: 子域名資訊
        type: object
        properties:
          name:
            title: 域名名稱
            type: string
          record_type:
            title: 域名型態
            type: string
            enum:
            - A
            - AAAA
            - CNAME
            - TXT
          record_value:
            title: 解析內容
            type: string
      key_id:
        title: 子域名解析商 Key ID
        type: string
      project_ids:
        title: 子域名項目 ID
        type: array
        items:
          type: string
    required:
    - domain_info
    - sub_domain_info
    - key_id
    outputs:
      result:
        title: 子域名資訊
        type: object
        description: 子域名資訊
    