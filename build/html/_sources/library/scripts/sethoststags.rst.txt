sethoststags
**********************************
| 服务器批量添加标签
| 服务器批量添加标签

.. code-block:: yaml

    id: sethoststags
    schemaVersion: '0.2'
    version: 0.3.1
    name: 服务器批量添加标签
    title: 服务器批量添加标签
    description: 服务器批量添加标签
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      tag:
        name: 标签列表
        title: 标签列表
        type: array
        description: 请输入欲添加的标签内容，多个标签之间可用逗号 “,”。
        items:
          type: string
        examples:
        - AC/DC
        - Queen
    required:
    - resourceIds
    - tag
    outputs:
      result:
        description: 执行结果
        type: string
        items:
          type: string
          examples:
          - success
      exception:
        name: 错误讯息，正常执行则无
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    