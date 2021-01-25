bindsubdomain
**********************************
| 绑定子域名
| 将指定CDN与指定子域名配对绑定

.. code-block:: yaml

    id: bindsubdomain
    schemaVersion: '0.2'
    version: 0.4.0
    title: 绑定子域名
    description: 将指定CDN与指定子域名配对绑定
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      key_id:
        type: string
        title: key id
        description: 请输入key id
      project_ids:
        type: array
        title: project id
        description: 请输入project id
        items:
          type: string
      fqdn_info:
        title: fqdn 资讯
        type: object
        description: fqdn 资讯
      cdn_info:
        title: cdn 资讯
        type: object
        description: cdn 资讯
      domain_info:
        title: 域名资讯
        type: object
        description: 域名资讯
      update_cdn_result:
        title: CDN 更新结果
        type: object
        description: 此次CDN更新之结果，可能包含部分更新失败
    required:
    - fqdn_info
    - domain_info
    - cdn_info
    - update_cdn_result
    - key_id
    - project_ids
    outputs:
      fqdn:
        title: fqdn 更新结果
        description: fqdn 更新结果
        type: object
    