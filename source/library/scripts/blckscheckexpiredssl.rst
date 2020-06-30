blckscheckexpiredssl
**********************************
| 证书过期检测
| 检测证书是否到期

.. code-block:: yaml

    id: blckscheckexpiredssl
    schemaVersion: '0.2'
    version: 0.2.0
    name: 证书过期检测
    title: 证书过期检测
    description: 检测证书是否到期
    namespace: network.pentium
    assets:
    - CERTIFICATE
    inputs:
      expired_within_days:
        name: 几天后过期
        title: 几天后过期
        type: integer
        description: 几天后过期(>0)：范例 10
        examples:
        - 10
    outputs:
      expired_within_days:
        name: 即将到期天数
        title: 即将到期天数
        description: 即将到期天数
        type: integer
        examples:
        - 5
      expired_count:
        name: 到期证书数量
        title: 到期证书数量
        description: 到期证书数量
        type: integer
        examples:
        - 5
      expired_ssl_list:
        name: 到期证书列表
        title: 到期证书列表
        description: 到期证书列表
        type: array
        items:
          type: object
          properties:
            id:
              type: string
              name: 证书ID
              title: 证书ID
              description: 到期证书ID
              examples:
              - CRT-gkb1nbolk
            name:
              type: string
              name: 到期证书名称
              title: 到期证书名称
              description: 到期证书名称
              examples:
              - abcde.com
            time:
              type: string
              name: 证书到期時間
              title: 证书到期時間
              description: 证书到期時間
              examples:
              - '2020-03-03T09:46:40Z'
            type:
              type: string
              name: 证书到期类型
              title: 证书到期类型
              description: 证书到期类型
              examples:
              - expired
      not_expired_count:
        name: 未到期证书数量
        title: 未到期证书数量
        description: 未到期证书数量
        type: integer
        examples:
        - 6
      not_expired_ssl_list:
        name: 未到期证书列表
        title: 未到期证书列表
        description: 未到期证书列表
        type: array
        items:
          type: object
          properties:
            id:
              type: string
              name: 证书ID
              title: 证书ID
              description: 到期证书ID
              examples:
              - CRT-gkb1nbolk
            name:
              type: string
              name: 未到期证书名称
              title: 未到期证书名称
              description: 未到期证书名称
              examples:
              - abcde.com
            time:
              type: string
              name: 证书到期時間
              title: 证书到期時間
              description: 证书到期時間
              examples:
              - '2020-03-03T09:46:40Z'
      exception:
        name: 错误讯息，正常执行则无
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    