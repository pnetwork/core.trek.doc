blckscreatecert
**********************************
| 建立证书
| 创建证书并配发至云端

.. code-block:: yaml

    id: blckscreatecert
    schemaVersion: '0.2'
    version: 0.1.2
    name: 建立证书
    title: 建立证书
    description: 创建证书并配发至云端
    namespace: network.pentium
    assets:
    - CERTIFICATE
    inputs:
      providerId:
        title: 云代码
        type: string
        description: 云代码
        examples: CP-000000000
      keyId:
        title: 云金钥ID
        type: string
        description: 云金钥ID
        examples: CA-bjsvljdue
      certificate:
        title: SSL证书
        type: object
        description: SSL证书
        examples: '{''source'': ''NEW'', ''name'': ''cert_name'', ''certificate'': ''xxx''}'
      projectIds:
        title: 项目 ID 列表
        type: array
        description: 项目 ID 列表
        items:
          type: string
        examples:
        - P1
        - P2
    required:
    - providerId
    - keyId
    - certificate
    outputs:
      certificate:
        title: SSL证书
        type: object
        description: SSL证书
        examples: '{''cloudeCertificateId'': ''cert_id''}'
    