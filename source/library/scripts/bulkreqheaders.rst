bulkreqheaders
**********************************
| 批量修改 HTTP 头
| 批量修改cdn的http request headers

.. code-block:: yaml

    id: bulkreqheaders
    schemaVersion: '0.2'
    version: 0.2.1
    name: 批量修改 HTTP 头
    title: 批量修改 HTTP 头
    description: 批量修改cdn的http request headers
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      resourceIds:
        $ref: pn_ids_cdn
      headers:
        name: HTTP 头列表
        title: HTTP 头列表
        description: 需要的 HTTP 头列表，请使用 '=' 分隔。范例：X-COM-ID=e799aa0c-35e7-47c4-a005-7febc665ee7e
        $ref: pn_sp_textarea_array
        examples:
        - Content-Type=application/json
        - Content-Language=en_US
    required:
    - resourceIds
    - headers
    outputs:
      success:
        name: 修改 CDN 成功数量
        title: 修改 CDN 成功数量
        description: 修改 CDN 成功数量
        type: integer
        examples: 1
      failure:
        name: 修改 CDN 失败数量
        title: 修改 CDN 失败数量
        description: 修改 CDN 失败数量
        type: integer
        examples: 1
    