blckscreatecert
**********************************
| 建立证书
| 创建证书并配发至云端

.. code-block:: yaml

    id: blckscreatecert
    schemaVersion: '0.2'
    version: 0.4.1
    title: 建立证书
    description: 创建证书并配发至云端
    namespace: network.pentium
    assets:
    - CERTIFICATE
    inputs:
      provider_id:
        title: 云代码
        type: string
        description: 云代码
        examples:
        - CP-000000000
      key_id:
        title: 云金钥 ID
        type: string
        description: 云金钥 ID
        examples:
        - CA-bjsvljdue
      domain_info:
        title: 域名资讯
        type: object
        description: 域名资讯
        examples:
        - '{''id'': ''D-abc123'', ''name'': ''pentium.network'', ''resolverId'': ''CP-000000000''}'
      certificate:
        title: SSL 证书
        type: object
        description: SSL 证书
        examples:
        - '{''source'': ''NEW'', ''name'': ''cert_name'', ''certificate'': ''xxx''}'
      project_ids:
        title: 项目 ID 列表
        type: array
        description: 证书项目 ID 列表
        items:
          type: string
        examples:
        - P1
        - P2
      csr_info:
        title: 证书签发资讯
        type: object
        description: 签发证书资讯 (仅支持 Akamai)
    required:
    - provider_id
    - key_id
    - certificate
    outputs:
      certificate:
        title: SSL 证书
        type: object
        description: SSL 证书
        examples:
        - '{''cloudeCertificateId'': ''cert_id''}'
    