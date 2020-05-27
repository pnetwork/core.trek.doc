checkexpiredtime
**********************************
| 域名过期检测
| 检测域名是否到期

.. code-block:: yaml

    id: checkexpiredtime
    schemaVersion: '0.2'
    version: 0.8.0
    name: 域名过期检测
    title: 域名过期检测
    description: 检测域名是否到期
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      expired_within_days:
        name: 几天后过期
        title: 几天后过期
        type: integer
        description: 几天后过期(>0)：范例 10
        examples:
        - 10
      filter_str:
        name: 筛选条件
        title: 筛选条件
        type: string
        description: 请输入筛选条件
        examples:
        - status:使用中
    outputs:
      result:
        type: object
        properties: null
        expired_count:
          name: 到期域名数量
          title: 到期域名数量
          description: 到期域名数量
          type: integer
          examples:
          - 1
        all_domain_ids:
          name: 域名 id 列表
          title: 域名 id 列表
          description: 域名 id 列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        already_expired_ids:
          name: 已过期域名 id 列表
          title: 已过期域名 id 列表
          description: 已过期域名 id 列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        already_expired_names:
          name: 已过期域名列表
          title: 已过期域名列表
          description: 已过期域名列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        already_expired_time:
          name: 已过期时间列表
          title: 已过期时间列表
          description: 已过期时间列表
          type: array
          items:
            type: string
            examples:
            - '2019-06-04T03:26:54+00:00'
        expire_soon_ids:
          name: 即将过期 id 列表
          title: 即将过期 id 列表
          description: 即将过期 id 列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        expire_soon_names:
          name: 即将过期域名列表
          title: 即将过期域名列表
          description: 即将过期域名列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        expire_soon_time:
          name: 即将过期时间列表
          title: 即将过期时间列表
          description: 即将过期时间列表
          type: array
          items:
            type: string
            examples:
            - '2019-06-04T03:26:54+00:00'
        renew_period_ids:
          name: 展延期域名 id 列表
          title: 展延期域名 id 列表
          description: 展延期域名 id 列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        renew_period_names:
          name: 展延期域名列表
          title: 展延期域名列表
          description: 展延期域名列表
          type: array
          items:
            type: string
            examples:
            - D-a1b2c3
        renew_period_time:
          name: 展延期时间列表
          title: 展延期时间列表
          description: 展延期时间列表
          type: array
          items:
            type: string
            examples:
            - '2019-06-04T03:26:54+00:00'
      exception:
        name: 错误讯息，正常执行则无
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    