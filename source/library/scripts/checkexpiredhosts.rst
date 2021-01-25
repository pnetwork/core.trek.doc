checkexpiredhosts
**********************************
| 服务器过期检测
| 检测服务器是否到期

.. code-block:: yaml

    id: checkexpiredhosts
    schemaVersion: '0.2'
    version: 0.8.0
    title: 服务器过期检测
    description: 检测服务器是否到期
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      provider:
        title: 欲查询的服务器提供商
        type: string
        description: 指定的服务器提供商
        examples:
        - aliyun
        enum:
        - tencent
        - aliyun
        enumNames:
        - tencent
        - aliyun
      expired_within_days:
        title: 几天后过期
        description: 几天后过期(>0)：范例 3
        type: integer
        examples:
        - 3
      filter_str:
        title: 筛选条件
        type: string
        description: 请输入筛选条件
        examples:
        - status:使用中
    outputs:
      expired_count:
        title: 到期服务器数量
        description: 到期服务器数量
        type: integer
      expired_hosts:
        title: 到期服务器列表
        description: 到期服务器列表
        type: array
        items:
          type: object
          properties:
            projects:
              title: 服务器項目
              description: 服务器項目
              type: array
              items:
                type: string
                title: 項目名称
                description: 項目名称
            id:
              title: 服务器ID
              type: string
              description: 服务器ID
              examples:
              - S-ajvw371v9
            name:
              title: 服务器名称
              description: 服务器名称
              type: string
              examples:
              - OS-Ubuntu18.04
            addresses:
              title: 服务器IP
              description: 服务器IP，包含 ssh, private ip, public ip
              type: array
              items:
                type: object
                properties:
                  ip:
                    type: string
                    title: IP
                    description: IP
                    examples:
                    - 1.1.1.1
                  description:
                    type: string
                    title: Description
                    description: Description
                    examples:
                    - public
            cloud_provider:
              title: 提供商名称
              description: 提供商名称
              type: string
              examples:
              - 阿里云
            expire_date:
              title: 到期时间
              description: 到期时间
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
            cloud_account:
              title: 云帳號 - 登入帳號
              description: 云帳號 - 登入帳號
              type: string
      msg_array:
        title: 到期服务器通知讯息阵列
        description: 到期服务器通知讯息阵列
        type: array
        items:
          type: string
          examples:
          - S-ajvw371vz
          - S-ajvw371wi
      exception:
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    