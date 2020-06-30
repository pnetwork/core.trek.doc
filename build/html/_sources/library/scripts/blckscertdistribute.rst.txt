blckscertdistribute
**********************************
| 配發憑證至雲金鑰
| 配發憑證至雲金鑰

.. code-block:: yaml

    id: blckscertdistribute
    schemaVersion: '0.2'
    version: 0.1.1
    name: 配發憑證至雲金鑰
    title: 配發憑證至雲金鑰
    description: 配發憑證至雲金鑰
    namespace: network.pentium
    assets:
    - CERTIFICATE
    inputs:
      distribute_cert_to_cdns:
        title: 所有需配發的憑證與CDN
        name: 所有需配發的憑證與CDN
        description: 所有需配發的憑證與CDN
        type: array
        items:
          type: object
          properties:
            cert_id:
              type: string
            related_cdns:
              type: array
              items:
                type: object
                properties:
                  composedId:
                    type: string
                  key_id:
                    type: string
                  provider_id:
                    type: string
                  project_ids:
                    type: array
                    items:
                      type: string
    required:
    - distribute_cert_to_cdns
    outputs:
      cdn_with_new_cloudcertificate:
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
      failed_cdn:
        type: array
        items:
          type: string
    