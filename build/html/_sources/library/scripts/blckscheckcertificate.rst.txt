blckscheckcertificate
**********************************
| 檢測域名是否有可用憑證
| 檢測域名是否有可用憑證

.. code-block:: yaml

    id: blckscheckcertificate
    schemaVersion: '0.2'
    version: 0.3.0
    title: 檢測域名是否有可用憑證
    description: 檢測域名是否有可用憑證
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      before:
        title: 域名修改前資訊
        description: 域名修改前資訊
        type: array
        items:
          type: object
      after:
        title: 域名修改後資訊
        description: 域名修改後資訊
        type: array
        items:
          type: object
      cert_unusable_tags:
        type: array
        title: 標籤名稱
        description: 當憑證有下列標籤時，代表不可使用
        items:
          type: string
      domain_tag_modify_after:
        title: 域名修改標籤後資訊列表
        type: array
        description: 欲檢查的域名資訊列表
        items:
          type: object
      host_tag_modify_after:
        title: 服務器修改標籤後資訊列表
        type: array
        description: 欲檢查的帶有子域名的標籤列表。如 cf:subdomain.www.top.domain
        items:
          type: object
      domain:
        title: 簽發域名
        type: string
        description: 欲檢查的簽發域名，如 example.com, subdomain.example.com
    outputs:
      domain_with_certificate:
        type: array
        items:
          type: string
      domain_without_certificate:
        type: array
        items:
          type: string
      skipped_domains_no_resolver:
        type: array
        items:
          type: string
    