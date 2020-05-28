bulkresolver
**********************************
| 批量修改域名解析商
| 仅支持域名注册商为 GoDaddy 及阿里云，域名注册商为 GoDaddy 支持切换任意域名解析商，域名注册商为阿里云仅支持切换回阿里云！

.. code-block:: yaml

    id: bulkresolver
    version: 0.4.0
    schemaVersion: '0.2'
    title: 批量修改域名解析商
    name: 批量修改域名解析商
    description: 仅支持域名注册商为 GoDaddy 及阿里云，域名注册商为 GoDaddy 支持切换任意域名解析商，域名注册商为阿里云仅支持切换回阿里云！
    namespace: network.pentium
    type: object
    assets:
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_domain
      resolver:
        title: 域名注册商
        name: 域名注册商
        description: 域名注册商
        $ref: pn_sp_nsrecord
    required:
    - resourceIds
    - resolver
    outputs:
      done:
        title: blcks 工作完成旗标
        name: blcks 工作完成旗标
        description: blcks 工作完成旗标
        type: boolean
      success:
        title: 修改域名成功数量
        name: 修改域名成功数量
        description: 修改域名成功数量
        type: integer
        examples: 1
      failure:
        title: 修改域名失败数量
        name: 修改域名失败数量
        description: 修改域名失败数量
        type: integer
        examples: 1
    