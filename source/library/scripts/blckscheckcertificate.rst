blckscheckcertificate
**********************************
| 檢測域名是否有可用憑證
| 檢測域名是否有可用憑證

.. code-block:: yaml

    id: blckscheckcertificate
    schemaVersion: '0.2'
    version: 0.1.2
    name: 檢測域名是否有可用憑證
    title: 檢測域名是否有可用憑證
    description: 檢測域名是否有可用憑證
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      before:
        name: 域名修改前資訊
        title: 域名修改前資訊
        description: 域名修改前資訊
        type: array
        items:
          type: object
      after:
        name: 域名修改後資訊
        title: 域名修改後資訊
        description: 域名修改後資訊
        type: array
        items:
          type: object
      cert_unusable_tags:
        type: array
        name: 標籤名稱
        title: 標籤名稱
        description: 當憑證有下列標籤時，代表不可使用
        items:
          type: string
    required:
    - resourceIds
    outputs:
      domain_with_certificate:
        type: array
        items:
          type: string
      domain_without_certificate:
        type: array
        items:
          type: string
    