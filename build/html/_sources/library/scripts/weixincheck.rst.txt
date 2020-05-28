weixincheck
**********************************
| 域名微信封禁检测
| 输入域名，批量检查域名是否被微信封禁

.. code-block:: yaml

    id: weixincheck
    schemaVersion: '0.2'
    version: 0.6.0
    name: 域名微信封禁检测
    title: 域名微信封禁检测
    description: 输入域名，批量检查域名是否被微信封禁
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      domain_names:
        name: 域名列表
        title: 域名列表
        type: array
        description: '欲检测的域名：范例
    
          www.google.com
    
          facebook.com
    
          '
        items:
          type: string
        examples:
        - abc.com
        - cde.life
      api_info:
        name: API 资讯 (用户名和 key)
        title: API 资讯 (用户名和 key)
        description: 微信封禁检测 API 用户名和 key(api_account,api_key)。请使用 Enter (换行) 输入第二笔资料
        $ref: pn_sp_textarea_array
        examples:
        - api_account,api_key
      api_interval_second:
        name: API 提交间隔秒数
        title: API 提交间隔秒数
        description: API 每次提交间隔秒数
        type: number
        default: 1
        examples:
        - 1
      consecutive_errors:
        name: API 连绩错误次数
        title: API 连绩错误次数
        description: API 每次提交允许的连绩错误次数
        type: number
        default: 5
        examples:
        - 5
    required:
    - domain_names
    - api_info
    outputs:
      blocked_count:
        name: 微信封禁域名总数
        title: 微信封禁域名总数
        type: integer
        description: 微信封禁域名总数
      blocked_domains:
        name: 微信封禁域名列表
        title: 微信封禁域名列表
        type: array
        description: 微信封禁域名列表
        items:
          type: string
        examples:
        - abc.com
      invalid_domains:
        name: 不合法或无法解析之域名
        title: 不合法或无法解析之域名
        type: array
        description: 不合法或无法解析之域名
        items:
          type: string
        examples:
        - iaminvaliddomain.com
      unchecked_domains:
        name: 未处理域名
        title: 未处理域名
        type: array
        description: 未处理域名
        items:
          type: string
        examples:
        - abc.com
      safe_domains:
        name: 合法可被解析之域名
        title: 合法可被解析之域名
        type: array
        description: 合法可被解析之域名
        items:
          type: string
        examples:
        - baidu.com
    