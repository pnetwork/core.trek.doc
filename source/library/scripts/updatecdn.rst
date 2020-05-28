updatecdn
**********************************
| 更新CDN
| 更新CDN

.. code-block:: yaml

    id: updatecdn
    schemaVersion: '0.2'
    version: 0.3.1
    name: 更新CDN
    title: 更新CDN
    description: 更新CDN
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      composed_id:
        name: CDN组合ID
        title: CDN组合ID
        description: CDN组合ID
        type: string
      certificate:
        name: SSL证书
        title: SSL证书
        description: SSL证书
        type: object
        example: '{''id'': ''cert_id'', ''name'': ''cert_name''}'
      cdn_info:
        name: CDN更新资讯
        title: CDN更新资讯
        type: object
        description: CDN更新资讯
    required:
    - composed_id
    - cdn_info
    outputs:
      composed_id:
        name: CDN组合ID
        title: CDN组合ID
        description: CDN组合ID
        type: string
      result:
        name: CDN更新结果
        title: CDN更新结果
        description: CDN更新结果
        type: object
    