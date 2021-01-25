bulktunneltest
**********************************
| 链路对外连线测试
| 测试链路是否畅通，是否可对外连线

.. code-block:: yaml

    id: bulktunneltest
    schemaVersion: '0.2'
    version: 0.5.0
    title: 链路对外连线测试
    description: 测试链路是否畅通，是否可对外连线
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      tunnel_ids:
        title: 需测试的链路ID列表
        description: 列表为空时，将测试平台内所有链路
        type: array
        items:
          type: string
      marvinWorkflowProperties:
        type: object
    outputs:
      available_tunnel_count:
        title: 可用链路数量
        type: integer
      available_tunnels:
        title: 可用链路
        type: array
        items:
          type: object
      invalid_tunnel_count:
        title: 异常链路数量
        type: integer
      invalid_tunnels:
        title: 对外网路异常链路
        type: array
        items:
          type: object
    