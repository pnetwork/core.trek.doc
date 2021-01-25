sethostsport
**********************************
| 服务器批量修改SSH端口
| 服务器批量修改SSH端口

.. code-block:: yaml

    id: sethostsport
    schemaVersion: '0.2'
    version: 0.4.0
    title: 服务器批量修改SSH端口
    description: 服务器批量修改SSH端口
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      port:
        title: SSH端口
        type: string
        examples:
        - '5566'
    required:
    - resourceIds
    - port
    outputs:
      result:
        description: 执行结果
        type: string
        items:
          type: string
          examples:
          - success
      exception:
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    