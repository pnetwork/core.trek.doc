tunneleventhandler
**********************************
| 链路事件处理
| 链路事件处理

.. code-block:: yaml

    id: tunneleventhandler
    schemaVersion: '0.2'
    version: 0.11.0
    title: 链路事件处理
    description: 链路事件处理
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      mode:
        title: 执行模式
        type: string
        description: 执行模式
        examples:
        - create
        - update
        - delete
      new_tunnel_data:
        title: 新链路资讯
        type: object
        description: 新链路资讯
        properties:
          enableToConnect:
            title: 是否可以连线
            type: boolean
            examples:
            - false
            description: 是否可以连线
          nodes:
            title: 链路节点资讯
            type: array
            description: 链路节点资讯
            items:
              type: object
              properties:
                sequence:
                  title: 节点编号
                  type: integer
                  examples:
                  - 1
                  description: 节点编号
                outgoing:
                  title: chisel-out 内容
                  type: object
                  description: chisel-out 内容
                  properties:
                    id:
                      title: hostId
                      type: string
                      examples:
                      - S-djtjewohs
                      description: host ID
                    ip:
                      title: chisel-out IP
                      type: string
                      examples:
                      - 1.4.5.6
                      description: chisel-out IP
                    port:
                      title: chisel-out Port
                      type: string
                      examples:
                      - '10003'
                      description: chisel-out Port
                    serviceInstalled:
                      title: 是否已安装
                      type: boolean
                      examples:
                      - false
                      description: 服务是否已安装
                incoming:
                  title: chisel-in 内容
                  type: object
                  description: chisel-in 内容
                  properties:
                    id:
                      title: hostId
                      type: string
                      examples:
                      - S-djtjewohs
                      description: host ID
                    ip:
                      title: chisel-in IP
                      type: string
                      examples:
                      - 1.4.5.6
                      description: chisel-in IP
                    port:
                      title: chisel-in Port
                      type: string
                      examples:
                      - '10002'
                      description: chisel-in Port
                    serviceInstalled:
                      title: 是否已安装
                      type: boolean
                      examples:
                      - false
                      description: 服务是否已安装
                id:
                  type: string
                  examples:
                  - TS-cjwah7zw3
                  description: tunnel node ID
          enable:
            title: 链路是否启用
            type: boolean
            examples:
            - true
            description: 链路是否启用
          name:
            title: 链路名称
            type: string
            examples:
            - 路径 2
            description: 链路名称
          id:
            title: 链路 ID
            type: string
            examples:
            - TN-cjwah7zvt
            description: 链路 ID
      old_tunnel_data:
        title: 旧链路资讯
        type: array
        description: 旧链路资讯
        items:
          type: object
          properties:
            enableToConnect:
              title: 是否可以连线
              type: boolean
              examples:
              - false
              description: 是否可以连线
            nodes:
              title: 链路节点资讯
              type: array
              description: 链路节点资讯
              items:
                type: object
                properties:
                  sequence:
                    title: 节点编号
                    type: integer
                    examples:
                    - 1
                    description: 节点编号
                  outgoing:
                    title: chisel-out 内容
                    type: object
                    description: chisel-out 内容
                    properties:
                      id:
                        title: hostId
                        type: string
                        examples:
                        - S-djtjewohs
                        description: host ID
                      ip:
                        title: chisel-out IP
                        type: string
                        examples:
                        - 1.4.5.6
                        description: chisel-out IP
                      port:
                        title: chisel-out Port
                        type: string
                        examples:
                        - '10003'
                        description: chisel-out Port
                      serviceInstalled:
                        title: 是否已安装
                        type: boolean
                        examples:
                        - false
                        description: 服务是否已安装
                  incoming:
                    title: chisel-in 内容
                    type: object
                    description: chisel-in 内容
                    properties:
                      id:
                        title: hostId
                        type: string
                        examples:
                        - S-djtjewohs
                        description: host ID
                      ip:
                        title: chisel-in IP
                        type: string
                        examples:
                        - 1.4.5.6
                        description: chisel-in IP
                      port:
                        title: chisel-in Port
                        type: string
                        examples:
                        - '10002'
                        description: chisel-in Port
                      serviceInstalled:
                        title: 是否已安装
                        type: boolean
                        examples:
                        - false
                        description: 服务是否已安装
                  id:
                    type: string
                    examples:
                    - TS-cjwah7zw3
                    description: tunnel node ID
            enable:
              title: 链路是否启用
              type: boolean
              examples:
              - true
              description: 链路是否启用
            name:
              title: 链路名称
              type: string
              examples:
              - 路径 2
              description: 链路名称
            id:
              title: 链路 ID
              type: string
              examples:
              - TN-cjwah7zvt
              description: 链路 ID
      marvin_ips:
        type: array
        title: Marvin 平台 IP 列表
        description: Marvin 平台的内外网 IP，将会添加至链路起点的 Iptables 规则内
        items:
          type: string
      default_port_begin:
        type: integer
        title: 链路port号预设起点
      default_port_end:
        type: integer
        title: 链路port号预设终点
    outputs:
      hostIds:
        title: 链路上的所有hostID
        type: array
        description: 链路上的所有hostID
        items:
          type: string
      mode:
        title: 链路脚本执行模式 start/stop
        type: string
        description: 链路脚本执行模式 start/stop
      tunnel_account:
        title: 链路连线帐号
        type: string
        description: 链路连线帐号
      tunnel_password:
        title: 链路连线密码
        type: string
        description: 链路连线密码
      server_vars:
        title: 链路 server 需求参数
        type: object
        description: 链路 server 需求参数
      client_vars:
        title: 链路 client 需求参数
        type: object
        description: 链路 client 需求参数
      testing_vars:
        title: 连线测试参数
        type: array
        description: 连线测试参数
        items:
          type: object
          properties:
            hostId:
              title: hostId
              type: string
              description: hostId
            remoteIP:
              title: 测试连线IP
              type: string
              description: 测试连线IP
            remotePort:
              title: 测试连线 Port
              type: integer
              description: 测试连线 Port
    