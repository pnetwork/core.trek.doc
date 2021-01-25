blckscdnsigning
**********************************
| CDN 鑒權設定
| 對給定的 CDN 物件列表進行鑒權設定

.. code-block:: yaml

    id: blckscdnsigning
    schemaVersion: '0.2'
    version: 0.2.0
    title: CDN 鑒權設定
    description: 對給定的 CDN 物件列表進行鑒權設定
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      cdn_objects:
        title: CDN 物件列表
        description: CDN 物件列表
        type: array
        items:
          type: object
      auth_key:
        title: 鑒權使用的加密密鑰
        description: 鑒權使用的加密密鑰(6-32字元，大小寫英文以及數字)，若未給值則略過鑒權
        type: string
      expires_in:
        title: 有效時間
        description: 有效時間，單位為秒
        type: integer
      signing_type:
        title: 鑒權模式
        description: 鑒權模式，目前只支援 a、b、c 三種
        type: string
        default: a
    outputs:
      cdns_signing_success_list:
        title: 成功執行鑒權設定 cdns 列表
        description: 成功執行鑒權設定 cdns 列表
        type: array
        items:
          type: object
      cdns_signing_failed_list:
        title: 執行鑒權設定失敗 cdns 列表
        description: 執行鑒權設定失敗 cdns 列表
        type: array
        items:
          type: object
    