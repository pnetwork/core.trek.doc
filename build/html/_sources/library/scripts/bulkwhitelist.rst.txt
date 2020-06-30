bulkwhitelist
**********************************
| 链路 修改项目白名单
| 链路 修改项目白名单

.. code-block:: yaml

    id: bulkwhitelist
    schemaVersion: '0.2'
    version: 0.4.0
    name: 链路 修改项目白名单
    title: 链路 修改项目白名单
    description: 链路 修改项目白名单
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      mode:
        type: string
        description: the option to add or delete whitelist
      tunnel_data:
        type: array
        items:
          type: object
          properties:
            enableToConnect:
              name: 是否可以连线
              title: 是否可以连线
              type: boolean
              description: 是否可以连线
            nodes:
              name: 链路节点资讯
              title: 链路节点资讯
              type: array
              description: 链路节点资讯
              items:
                type: object
                properties:
                  sequence:
                    name: 节点编号
                    title: 节点编号
                    type: integer
                    description: 节点编号
                  outgoing:
                    name: chisel-out 内容
                    title: chisel-out 内容
                    type: object
                    description: chisel-out 内容
                    properties:
                      id:
                        name: hostId
                        title: hostId
                        type: string
                        description: host ID
                      ip:
                        name: chisel-out IP
                        title: chisel-out IP
                        type: string
                        description: chisel-out IP
                      port:
                        name: chisel-out Port
                        title: chisel-out Port
                        type: string
                        description: chisel-out Port
                  incoming:
                    name: chisel-in 内容
                    title: chisel-in 内容
                    type: object
                    description: chisel-in 内容
                    properties:
                      id:
                        name: hostId
                        title: hostId
                        type: string
                        description: host ID
                      ip:
                        name: chisel-in IP
                        title: chisel-in IP
                        type: string
                        description: chisel-in IP
                      port:
                        name: chisel-in Port
                        title: chisel-in Port
                        type: string
                        description: chisel-in Port
                  id:
                    type: string
                    description: tunnel node ID
            enable:
              name: 链路是否启用
              title: 链路是否启用
              type: boolean
              description: 链路是否启用
            name:
              name: 链路名称
              title: 链路名称
              type: string
              description: 链路名称
            id:
              name: 链路 ID
              title: 链路 ID
              type: string
              description: 链路 ID
            projectId:
              type: string
              description: 项目ID
    required:
    - mode
    - tunnel_data
    outputs:
      result:
        type: boolean
        description: 是否成功结束
    