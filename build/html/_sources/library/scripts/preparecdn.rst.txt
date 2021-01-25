preparecdn
**********************************
| 准备 CDN
| 创建 CDN 并导入至平台

.. code-block:: yaml

    id: preparecdn
    schemaVersion: '0.2'
    title: 准备 CDN
    version: 0.8.0
    description: 创建 CDN 并导入至平台
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      create_info:
        title: 创建资讯
        type: object
        description: 创建资讯
      certificate:
        title: SSL证书
        type: object
        description: SSL证书
        examples:
        - '{''id'': ''cert_id'', ''name'': ''cert_name''}'
      polling_interval:
        title: 检查间格 (秒)
        type: integer
        description: 检查间格 (秒)
        default: 30
      timeout:
        title: 检查逾时时间 (秒)
        type: integer
        description: 检查逾时时间 (秒)
        default: 1500
    required:
    - create_info
    outputs:
      fqdn:
        title: fqdn 资讯
        type: object
        description: fqdn 资讯
      cdn:
        title: cdn 资讯
        type: object
        description: cdn 资讯
    