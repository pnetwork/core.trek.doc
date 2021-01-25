blcksmarvineventcallback
**********************************
| Callback 憑證產生事件
| Callback 憑證產生事件

.. code-block:: yaml

    id: blcksmarvineventcallback
    schemaVersion: '0.2'
    version: 0.2.0
    title: Callback 憑證產生事件
    description: Callback 憑證產生事件
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      domain_ids:
        type: array
        title: 欲產生憑證的域名列表
        description: 欲產生憑證的域名列表
        items:
          type: string
      callback_url:
        type: string
        title: Let's Encrypt 憑證事件 Webhook
        description: Let's Encrypt 憑證事件 Webhook
    required:
    - domain_ids
    - callback_url
    outputs:
      success:
        type: array
        items:
          type: string
      failure:
        type: array
        items:
          type: string
    