gfwcheck
**********************************
| 批量检查域名是否被 GFW 封禁
| 输入顶级域名，批量检查域名是否被 GFW 封禁

.. code-block:: yaml

    id: gfwcheck
    schemaVersion: '0.2'
    version: 0.7.0
    title: 批量检查域名是否被 GFW 封禁
    description: 输入顶级域名，批量检查域名是否被 GFW 封禁
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_domain
      domains:
        title: 域名列表
        description: "欲检测的域名：范例\nwww.google.com\nfacebook.com \n"
        $ref: pn_sp_textarea_array
        examples:
        - abc.com
        - cde.life
    required:
    - domains
    outputs:
      blocked_count:
        title: 被封禁域名总数
        type: integer
        description: 被封禁域名总数
      blocked_domains:
        title: 被封禁域名列表
        type: array
        description: 被封禁域名列表
        items:
          type: string
        examples:
        - abc.com
      blocked_locations:
        title: 域名被封禁地區
        type: array
        description: 域名被封禁地區
        items:
          type: object
      unchecked_domains:
        title: 未处理域名
        type: array
        description: 未处理域名
        items:
          type: string
        examples:
        - abc.com
      invalid_domains:
        title: 不合法或无法解析之域名
        type: array
        description: 不合法或无法解析之域名
        items:
          type: string
        examples:
        - iaminvaliddomain.com
      safe_domains:
        title: 合法可被解析之域名
        type: array
        description: 合法可被解析之域名
        items:
          type: string
        examples:
        - baidu.com
      blocked_domains_message:
        title: 长城封禁域名列表
        type: array
        description: 长城封禁域名列表
        items:
          type: string
          examples:
          - abc.com
      blocked_domains_str:
        title: 长城封禁域名列表字串
        type: string
        description: 长城封禁域名列表字串
        examples:
        - abc.com
      error_message:
        title: 错误讯息
        type: string
        description: 错误讯息
    