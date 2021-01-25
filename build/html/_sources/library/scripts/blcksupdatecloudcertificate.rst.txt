blcksupdatecloudcertificate
**********************************
| 更新 CDN 所使用的憑證
| 更新 CDN 所使用的憑證

.. code-block:: yaml

    id: blcksupdatecloudcertificate
    schemaVersion: '0.2'
    version: 0.2.0
    title: 更新 CDN 所使用的憑證
    description: 更新 CDN 所使用的憑證
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      cdn_with_new_cloudcertificate:
        title: 待更新的憑證的CDN列表
        description: 待更新的憑證的CDN列表
        type: array
        items:
          type: object
          properties:
            cdn_composedId:
              type: string
            certificate_id:
              type: string
            cloud_certificate_id:
              type: string
      failed_cdns:
        title: 無法配發的CDN列表
        description: 無法配發的CDN列表
        type: array
        items:
          type: string
    required:
    - cdn_with_new_cloudcertificate
    outputs:
      result:
        type: object
        properties:
          changed_success:
            type: array
            items:
              type: object
          changed_failed:
            type: array
            items:
              type: object
          data_failed:
            type: array
            items:
              type: object
    