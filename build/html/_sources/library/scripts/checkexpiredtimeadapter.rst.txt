checkexpiredtimeadapter
**********************************
| 域名过期检测讯息转换器
| 重组域名过期检测讯息

.. code-block:: yaml

    id: checkexpiredtimeadapter
    schemaVersion: '0.2'
    version: '0.2'
    name: 域名过期检测讯息转换器
    title: 域名过期检测讯息转换器
    description: 重组域名过期检测讯息
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      expired_domains:
        name: 到期域名物件列表
        title: 到期域名物件列表
        description: 到期域名物件列表
        type: array
        items:
          type: object
          properties:
            name:
              name: 域名
              title: 域名
              type: string
              description: 域名
              examples:
              - google.com
              - yahoo.com
            status:
              name: 狀態
              title: 狀態
              type: string
              description: 狀態
              examples:
              - ONLINE
            expire_date:
              name: 到期时间
              title: 到期时间
              description: 到期时间
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
    required:
    - expired_domains
    outputs:
      combination_message:
        name: 域名过期检测讯息
        title: 域名过期检测讯息
        description: 域名过期检测讯息
        type: array
        items:
          type: object
          properties:
            name:
              name: 域名名称
              title: 域名名称
              description: 域名名称
              type: string
              examples:
              - Aliyun.com
            expire_date:
              name: 到期时间
              title: 到期时间
              description: 到期时间
              type: string
              examples:
              - '2019-06-04T03:26:54+00:00'
    