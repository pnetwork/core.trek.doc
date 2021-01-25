createcdnevent
**********************************
| 自動為 CDN chain 建立節點
| 自動為 CDN chain 建立節點

.. code-block:: yaml

    id: createcdnevent
    schemaVersion: '0.2'
    version: 0.2.0
    title: 自動為 CDN chain 建立節點
    description: 自動為 CDN chain 建立節點
    namespace: network.pentium
    assets:
    - HOST
    - DOMAIN
    - CDN
    inputs:
      provider:
        title: CDN 提供商
        description: 要建立的CDN 提供商
        $ref: pn_sp_cdn_credential
      fqdn_prefix:
        title: FQDN 前綴
        type: string
        description: 設置 FQDN 前綴欄位
        examples:
        - tencent
      fqdn:
        title: FQDN
        type: string
        description: 加上 FQDN 前綴設置為 CDN 的 CNAME
        examples:
        - marvin.pentium.network
      host_id:
        title: Host ID
        type: string
        description: Host ID
        examples:
        - S-abc123
      tag_name:
        title: 標籤名稱
        type: string
        description: 標籤名稱
        examples:
        - cf:marvin.pentium.network
      origin_address:
        title: CDN 源站
        type: string
        description: 設置 CDN 源站，若未設置會以 Host endpoint 當源站
        examples:
        - chain1.marvin.pentium.network
      origin_protocol:
        title: CDN 源站協定
        type: string
        description: 設置 CDN 源站協定，若未設置則預設為 http
        examples:
        - http
      http_headers:
        title: HTTP header 列表
        type: array
        description: HTTP header 列表
        examples:
        - host=www.pentium.network
        items:
          title: HTTP header
          type: string
          description: HTTP header
          examples:
          - host=www.pentium.network
      caches:
        title: 緩存列表
        type: array
        description: 緩存列表
        items:
          type: object
          properties:
            is_global:
              title: 是否為全站緩存
              type: boolean
              description: 是否為全站緩存
              examples:
              - true
            weight:
              title: 優先順序
              type: number
              description: 緩存優先度會根據雲服務商而不同執行模式
              examples:
              - 1
            paths:
              title: 緩存路徑
              type: string
              description: 緩存路徑根據雲服務商有不同的路徑格式
              examples:
              - '阿里雲: /test, /test/, jpg'
              - '騰訊雲: /test, .jpg, /tmp/*.jpg'
              - 'AWS: /test, /test/, jpg, .jpg, /tmp/*.jpg'
              - 'Akamai: /test; /test/; jpg'
            ttl:
              title: 過期時間(秒)
              type: number
              description: 過期時間(秒)
              examples:
              - 86400
    required:
    - provider
    - fqdn_prefix
    outputs:
      cdn_event:
        title: CDN 事件內容
        type: object
        description: CDN 事件內容
        examples:
        - {}
    