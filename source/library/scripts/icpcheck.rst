icpcheck
**********************************
| 批量检查域名是否未备案
| 输入顶级域名，批量检查域名是否未备案

.. code-block:: yaml

    id: icpcheck
    schemaVersion: '0.2'
    version: 0.4.0
    name: 批量检查域名是否未备案
    title: 批量检查域名是否未备案
    description: 输入顶级域名，批量检查域名是否未备案
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_domain
      domains:
        name: 域名列表
        title: 域名列表
        description: "欲检测的域名：范例\nwww.google.com\nfacebook.com \n"
        $ref: pn_sp_textarea_array
        examples:
        - abc.com
        - cde.life
    required:
    - domains
    outputs:
      icp_blocked_count:
        name: 未备案域名总数
        title: 未备案域名总数
        type: integer
        description: 未备案域名总数
      icp_blocked_domains:
        name: 未备案域名列表
        title: 未备案域名列表
        type: array
        description: 未备案域名列表
        items:
          type: string
        examples:
        - abc.com
      unchecked_domains:
        name: 未处理域名
        title: 未处理域名
        type: array
        description: 未处理域名
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
      invalid_domains_count:
        name: 访问失敗域名总数
        title: 访问失敗域名总数
        type: integer
        description: 访问失敗域名总数
      safe_domains:
        name: 已备案可被解析之域名
        title: 已备案可被解析之域名
        type: array
        description: 已备案可被解析之域名
        items:
          type: string
        examples:
        - baidu.com
      icp_blocked_domains_message:
        name: 未备案域名列表
        title: 未备案域名列表
        type: array
        description: 未备案域名列表
        items:
          type: string
          examples: abc.com
      icp_blocked_domains_str:
        name: 未备案域名列表字串
        title: 未备案域名列表字串
        type: string
        description: 未备案域名列表字串
        examples: abc.com, def.com
      error_message:
        name: 错误讯息
        title: 错误讯息
        type: string
        description: 错误讯息
    