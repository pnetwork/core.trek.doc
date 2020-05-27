tunneleventhandler
**********************************
| 链路事件处理
| 链路事件处理

.. code-block:: yaml

    id: tunneleventhandler
    schemaVersion: '0.2'
    version: 0.10.0
    name: 链路事件处理
    title: 链路事件处理
    description: 链路事件处理
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      mode:
        name: 执行模式
        title: 执行模式
        type: string
        description: 执行模式
        examples:
        - create
        - update
        - delete
      new_tunnel_data:
        name: 新链路资讯
        title: 新链路资讯
        type: object
        description: 新链路资讯
        properties:
          enableToConnect:
            name: 是否可以连线
            title: 是否可以连线
            type: boolean
            examples:
            - false
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
                  examples:
                  - 1
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
                      examples:
                      - S-djtjewohs
                      description: host ID
                    ip:
                      name: chisel-out IP
                      title: chisel-out IP
                      type: string
                      examples:
                      - 1.4.5.6
                      description: chisel-out IP
                    port:
                      name: chisel-out Port
                      title: chisel-out Port
                      type: string
                      examples:
                      - '10003'
                      description: chisel-out Port
                    serviceInstalled:
                      name: 是否已安装
                      title: 是否已安装
                      type: boolean
                      examples:
                      - false
                      description: 服务是否已安装
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
                      examples:
                      - S-djtjewohs
                      description: host ID
                    ip:
                      name: chisel-in IP
                      title: chisel-in IP
                      type: string
                      examples:
                      - 1.4.5.6
                      description: chisel-in IP
                    port:
                      name: chisel-in Port
                      title: chisel-in Port
                      type: string
                      examples:
                      - '10002'
                      description: chisel-in Port
                    serviceInstalled:
                      name: 是否已安装
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
            name: 链路是否启用
            title: 链路是否启用
            type: boolean
            examples:
            - true
            description: 链路是否启用
          name:
            name: 链路名称
            title: 链路名称
            type: string
            examples:
            - 路径 2
            description: 链路名称
          id:
            name: 链路 ID
            title: 链路 ID
            type: string
            examples:
            - TN-cjwah7zvt
            description: 链路 ID
      old_tunnel_data:
        name: 旧链路资讯
        title: 旧链路资讯
        type: array
        description: 旧链路资讯
        items:
          type: object
          properties:
            enableToConnect:
              name: 是否可以连线
              title: 是否可以连线
              type: boolean
              examples:
              - false
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
                    examples:
                    - 1
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
                        examples:
                        - S-djtjewohs
                        description: host ID
                      ip:
                        name: chisel-out IP
                        title: chisel-out IP
                        type: string
                        examples:
                        - 1.4.5.6
                        description: chisel-out IP
                      port:
                        name: chisel-out Port
                        title: chisel-out Port
                        type: string
                        examples:
                        - '10003'
                        description: chisel-out Port
                      serviceInstalled:
                        name: 是否已安装
                        title: 是否已安装
                        type: boolean
                        examples:
                        - false
                        description: 服务是否已安装
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
                        examples:
                        - S-djtjewohs
                        description: host ID
                      ip:
                        name: chisel-in IP
                        title: chisel-in IP
                        type: string
                        examples:
                        - 1.4.5.6
                        description: chisel-in IP
                      port:
                        name: chisel-in Port
                        title: chisel-in Port
                        type: string
                        examples:
                        - '10002'
                        description: chisel-in Port
                      serviceInstalled:
                        name: 是否已安装
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
              name: 链路是否启用
              title: 链路是否启用
              type: boolean
              examples:
              - true
              description: 链路是否启用
            name:
              name: 链路名称
              title: 链路名称
              type: string
              examples:
              - 路径 2
              description: 链路名称
            id:
              name: 链路 ID
              title: 链路 ID
              type: string
              examples:
              - TN-cjwah7zvt
              description: 链路 ID
      marvin_ips:
        type: array
        name: Marvin 平台 IP 列表
        title: Marvin 平台 IP 列表
        description: Marvin 平台的内外网 IP，将会添加至链路起点的 Iptables 规则内
        items:
          type: string
      default_port_begin:
        type: integer
        title: 链路port号预设起点
        name: 链路port号预设起点
      default_port_end:
        type: integer
        title: 链路port号预设终点
        name: 链路port号预设终点
    outputs:
      hostIds:
        name: 链路上的所有hostID
        title: 链路上的所有hostID
        type: array
        description: 链路上的所有hostID
        items:
          type: string
      mode:
        name: 链路脚本执行模式 start/stop
        title: 链路脚本执行模式 start/stop
        type: string
        description: 链路脚本执行模式 start/stop
      tunnel_account:
        name: 链路连线帐号
        title: 链路连线帐号
        type: string
        description: 链路连线帐号
      tunnel_password:
        name: 链路连线密码
        title: 链路连线密码
        type: string
        description: 链路连线密码
      server_vars:
        name: 链路 server 需求参数
        title: 链路 server 需求参数
        type: object
        description: 链路 server 需求参数
      client_vars:
        name: 链路 client 需求参数
        title: 链路 client 需求参数
        type: object
        description: 链路 client 需求参数
      testing_vars:
        name: 连线测试参数
        title: 连线测试参数
        type: array
        description: 连线测试参数
        items:
          type: object
          properties:
            hostId:
              name: hostId
              title: hostId
              type: string
              description: hostId
            remoteIP:
              name: 测试连线IP
              title: 测试连线IP
              type: string
              description: 测试连线IP
            remotePort:
              name: 测试连线 Port
              title: 测试连线 Port
              type: integer
              description: 测试连线 Port
    