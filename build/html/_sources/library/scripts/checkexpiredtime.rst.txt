checkexpiredtime
**********************************
| 域名过期检测
| 检测域名是否到期

.. code-block:: yaml

    id: checkexpiredtime
    schemaVersion: '0.2'
    version: 0.9.2
    title: 域名过期检测
    description: 检测域名是否到期
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      expired_within_days:
        title: 几天后过期
        type: integer
        description: 几天后过期(>0)：范例 10
        examples:
        - 10
      filter_str:
        title: 筛选条件
        type: string
        description: 请输入筛选条件
        examples:
        - status:使用中
    outputs:
      result:
        title: 输出结果
        description: 输出结果
        type: object
        properties:
          expired_count:
            title: 到期域名数量
            description: 到期域名数量
            type: integer
            examples:
            - 1
          all_domain_ids:
            title: 域名 id 列表
            description: 域名 id 列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          already_expired_ids:
            title: 已过期域名 id 列表
            description: 已过期域名 id 列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          already_expired_names:
            title: 已过期域名列表
            description: 已过期域名列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          already_expired_time:
            title: 已过期时间列表
            description: 已过期时间列表
            type: array
            items:
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
          expire_soon_ids:
            title: 即将过期 id 列表
            description: 即将过期 id 列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          expire_soon_names:
            title: 即将过期域名列表
            description: 即将过期域名列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          expire_soon_time:
            title: 即将过期时间列表
            description: 即将过期时间列表
            type: array
            items:
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
          renew_period_ids:
            title: 展延期域名 id 列表
            description: 展延期域名 id 列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          renew_period_names:
            title: 展延期域名列表
            description: 展延期域名列表
            type: array
            items:
              type: string
              examples:
              - D-a1b2c3
          renew_period_time:
            title: 展延期时间列表
            description: 展延期时间列表
            type: array
            items:
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
      exception:
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    