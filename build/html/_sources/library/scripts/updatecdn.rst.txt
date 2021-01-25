updatecdn
**********************************
| 更新CDN
| 更新CDN

.. code-block:: yaml

    id: updatecdn
    schemaVersion: '0.2'
    version: 0.7.0
    title: 更新CDN
    description: 更新CDN
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      identifier:
        title: CDN识别码
        description: CDN识别码
        type: string
      cdn_info:
        title: CDN更新资讯
        type: object
        description: CDN更新资讯
      certificate:
        title: SSL证书
        description: SSL证书
        type: object
        examples:
        - '{"source": "EXISTED", "cloudCertificateId": None, "certificateId": "CRT-skj2gr743",
          "providerCertId": None}'
    required:
    - identifier
    - cdn_info
    outputs:
      id:
        title: CDN识别码
        description: CDN识别码
        type: string
      result:
        title: CDN更新结果
        description: CDN更新结果
        type: object
    