pollingcdns
**********************************
| 等待 CDN 啟用
| 輪詢檢查 CDN 狀態，等待 CDN 啟用

.. code-block:: yaml

    id: pollingcdns
    schemaVersion: '0.2'
    version: 0.1.1
    title: 等待 CDN 啟用
    description: 輪詢檢查 CDN 狀態，等待 CDN 啟用
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      cdns:
        title: CDN 資訊列表
        type: array
        description: CDN 資訊列表
        items:
          title: FQDN 資訊
          type: object
          description: FQDN 資訊
          properties:
            provider_id:
              title: CDN 提供商 ID
              type: string
              description: CDN 提供商 ID
              examples:
              - CP-000000000
            fqdn:
              title: FQDN
              type: string
              description: FQDN
              examples:
              - marvin.pentium.network
      polling_interval:
        title: 檢查間格 (秒)
        type: number
        description: 檢查間格 (秒)
        default: 30
      timeout:
        title: 檢查逾時時間 (秒)
        type: number
        description: 檢查逾時時間 (秒)
        default: 1500
    required:
    - cdns
    outputs:
      cdns:
        title: CDN 資訊列表
        type: array
        description: CDN 資訊列表
        items:
          title: CDN 資訊
          type: object
          description: CDN 資訊
    