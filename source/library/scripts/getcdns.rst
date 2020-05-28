getcdns
**********************************
| 取得所属权限的失效 CDN
| 取得所属权限的失效 CDN

.. code-block:: yaml

    id: getcdns
    schemaVersion: '0.2'
    version: '0.5'
    name: 取得所属权限的失效 CDN
    title: 取得所属权限的失效 CDN
    description: 取得所属权限的失效 CDN
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      provider:
        name: 欲查询的CDN提供商
        title: 欲查询的CDN提供商
        enum:
        - aws
        - cloudflare
        - tencent
        - aliyun
        enumNames:
        - aws
        - cloudflare
        - tencent
        - aliyun
        type: string
        description: 指定的CDN提供商
        examples:
        - aws
      filter_str:
        name: 筛选条件
        title: 筛选条件
        type: string
        description: 请输入筛选条件
        examples:
        - status:已启动
    outputs:
      failure_cdns:
        name: 失效 CDN 列表
        title: 失效 CDN 列表
        description: 失效 CDN 列表
        type: array
        items:
          type: string
        examples: -'注意 CDN 失效， shunshun3.ararpindao.com 失效'
      count:
        name: 失效CDN数量
        title: 失效CDN数量
        description: 失效CDN数量
        type: integer
        examples:
        - 1
      cdns:
        name: 失效 CDN 列表
        title: 失效 CDN 列表
        description: 失效 CDN 列表
        type: array
        items:
          type: object
          properties:
            name:
              name: CDN
              title: CDN
              type: string
              description: CDN
              examples:
              - 0530ben-01.dtdphb.cn
              - 0530ben-02.dtdphb.cn
      exception:
        name: 错误讯息，正常执行则无
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    