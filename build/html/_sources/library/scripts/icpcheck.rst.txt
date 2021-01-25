icpcheck
**********************************
| 批量检查域名是否未备案
| 输入顶级域名，批量检查域名是否未备案

.. code-block:: yaml

    id: icpcheck
    schemaVersion: '0.2'
    version: 0.6.0
    title: 批量检查域名是否未备案
    description: 输入顶级域名，批量检查域名是否未备案
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
      icp_blocked_count:
        title: 未备案域名总数
        type: integer
        description: 未备案域名总数
      icp_blocked_domains:
        title: 未备案域名列表
        type: array
        description: 未备案域名列表
        items:
          type: string
        examples:
        - abc.com
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
      invalid_domains_count:
        title: 访问失敗域名总数
        type: integer
        description: 访问失敗域名总数
      safe_domains:
        title: 已备案可被解析之域名
        type: array
        description: 已备案可被解析之域名
        items:
          type: string
        examples:
        - baidu.com
      icp_blocked_domains_message:
        title: 未备案域名列表
        type: array
        description: 未备案域名列表
        items:
          type: string
          examples:
          - abc.com
      icp_blocked_domains_str:
        title: 未备案域名列表字串
        type: string
        description: 未备案域名列表字串
        examples:
        - abc.com, def.com
      error_message:
        title: 错误讯息
        type: string
        description: 错误讯息
    