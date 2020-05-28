blckspatchdomains
**********************************
| 域名注册与解析资讯查询
| 域名注册与解析资讯查询

.. code-block:: yaml

    id: blckspatchdomains
    schemaVersion: '0.2'
    version: 0.6.5
    name: 域名注册与解析资讯查询
    title: 域名注册与解析资讯查询
    description: 域名注册与解析资讯查询
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      patch_type:
        name: 域名更新类型
        title: 域名更新类型
        description: 域名更新类型
        type: string
        enum:
        - registrar
        - resolver
        enumNames:
        - 注册商
        - 解析商
      domains_info:
        name: 域名更新资讯列表
        title: 域名更新资讯列表
        type: array
        description: 域名更新资讯列表
        items:
          type: object
      provider:
        name: 域名供应商
        title: 域名供应商
        type: object
        description: 域名供应商
    required:
    - patch_type
    outputs:
      result:
        name: 域名更新结果
        title: 域名更新结果
        description: 域名更新结果
        type: object
    