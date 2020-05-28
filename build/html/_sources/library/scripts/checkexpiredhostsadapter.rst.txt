checkexpiredhostsadapter
**********************************
| 服务器过期检测讯息转换器
| 重组服务器过期检测讯息

.. code-block:: yaml

    id: checkexpiredhostsadapter
    schemaVersion: '0.2'
    version: '0.2'
    name: 服务器过期检测讯息转换器
    title: 服务器过期检测讯息转换器
    description: 重组服务器过期检测讯息
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      expired_hosts:
        name: 到期服务器列表
        title: 到期服务器列表
        type: array
        description: 到期服务器列表
        items:
          type: object
          properties:
            id:
              name: 服务器ID
              title: 服务器ID
              type: string
              description: 服务器ID
              examples:
              - S-ajvw371v9
            name:
              name: 服务器名称
              title: 服务器名称
              description: 服务器名称
              type: string
              examples:
              - OS-Ubuntu18.04
            ip:
              name: 服务器IP
              title: 服务器IP
              description: 服务器IP
              type: string
              examples:
              - 1.1.1.1
            provider:
              name: 提供商名称
              title: 提供商名称
              description: 提供商名称
              type: string
              examples:
              - 阿里云
            expire_date:
              name: 到期时间
              title: 到期时间
              description: 到期时间
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
    required:
    - expired_hosts
    outputs:
      combination_message:
        name: 服务器过期检测讯息
        title: 服务器过期检测讯息
        description: 服务器过期检测讯息
        type: array
        items:
          type: object
          properties:
            id:
              name: 服务器ID
              title: 服务器ID
              type: string
              description: 服务器ID
              examples:
              - S-ajvw371v9
            name:
              name: 服务器名称
              title: 服务器名称
              description: 服务器名称
              type: string
              examples:
              - OS-Ubuntu18.04
            expire_date:
              name: 到期时间
              title: 到期时间
              description: 到期时间
              type: string
              examples:
              - 2019-01-01 00:00:00 (UTC+8)
      exception:
        name: 错误讯息，正常执行则无
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    