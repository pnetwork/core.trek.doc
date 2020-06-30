blckssetdomainstags
**********************************
| 批量添加备案失效/域名封禁/微信封禁标签
| 输入顶级域名，批量添加备案失效/域名封禁/微信封禁标签

.. code-block:: yaml

    id: blckssetdomainstags
    schemaVersion: '0.2'
    version: 0.1.3
    name: 批量添加备案失效/域名封禁/微信封禁标签
    title: 批量添加备案失效/域名封禁/微信封禁标签
    description: 输入顶级域名，批量添加备案失效/域名封禁/微信封禁标签
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      tag_name:
        name: 标签名称
        title: 标签名称
        description: 标签名称
        type: string
        enum:
        - 备案失效
        - 域名封禁
        - 微信封禁
        enumNames:
        - 备案失效
        - 域名封禁
        - 微信封禁
      domains:
        name: 域名列表
        title: 域名列表
        description: 请输入欲添加标签域名，一行一个 (i.e www.pentium.network)
        $ref: pn_sp_textarea_array
    required:
    - tag_name
    - domains
    outputs:
      result:
        type: string
    