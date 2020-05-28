bulkorigins
**********************************
| 批量修改源站设置
| 批量修改 CDN 的 origins

.. code-block:: yaml

    id: bulkorigins
    schemaVersion: '0.2'
    version: 0.2.1
    name: 批量修改源站设置
    title: 批量修改源站设置
    description: 批量修改 CDN 的 origins
    namespace: network.pentium
    assets:
    - CDN
    type: object
    inputs:
      resourceIds:
        $ref: pn_ids_cdn
      data:
        $ref: pn_sp_origins
    required:
    - resourceIds
    - data
    outputs:
      success:
        description: 修改 CDN 成功数量
        type: integer
        examples: 1
        name: 修改 CDN 成功数量
        title: 修改 CDN 成功数量
      failure:
        description: 修改 CDN 失败数量
        type: integer
        examples: 1
        name: 修改 CDN 失败数量
        title: 修改 CDN 失败数量
    