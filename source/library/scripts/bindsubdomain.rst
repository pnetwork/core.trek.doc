bindsubdomain
**********************************
| 绑定子域名
| 将指定CDN与指定子域名配对绑定

.. code-block:: yaml

    id: bindsubdomain
    schemaVersion: '0.2'
    version: 0.1.0
    name: 绑定子域名
    title: 绑定子域名
    description: 将指定CDN与指定子域名配对绑定
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      key_id:
        type: string
        name: key id
        title: key id
        description: 请输入key id
      project_ids:
        type: array
        name: project id
        title: project id
        description: 请输入project id
        items:
          type: string
      fqdn:
        name: fqdn
        title: fqdn
        type: string
        description: 请输入fqdn
        examples:
        - name: example.0987.coffee
      composed_id:
        name: CDN组合ID
        title: CDN组合ID
        type: string
        description: 请输入CDN组合ID
        examples:
        - name:CDN-GG88:SD-5566
      update_cdn_result:
        name: CDN更新结果
        title: CDN更新结果
        type: object
        description: 此次CDN更新之结果，可能包含部分更新失败
    required:
    - fqdn
    - composed_id
    - update_cdn_result
    outputs:
      result_success:
        name: CDN更新成功项目
        title: CDN更新成功项目
        description: CDN更新成功项目
        type: array
        items:
          type: string
          examples:
          - httpHeaders
      result_errors:
        name: CDN更新失败项目
        title: CDN更新失败项目
        description: CDN更新失败项目
        type: array
        items:
          type: string
          examples:
          - httpHeaders
      composed_id:
        name: CDN组合ID
        title: CDN组合ID
        description: CDN组合ID
        type: string
    