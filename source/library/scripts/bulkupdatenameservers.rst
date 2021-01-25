bulkupdatenameservers
**********************************
| 批量下线域名
| 批量下线域名与切换 name servers

.. code-block:: yaml

    id: bulkupdatenameservers
    schemaVersion: '0.2'
    version: 0.2.2
    title: 批量下线域名
    description: 批量下线域名与切换 name servers
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      domains:
        description: 请输入欲下线域名，一行一个 (i.e www.pentium.network)
        $ref: pn_sp_textarea_array
      name_servers:
        description: 请输入欲下线域名的新帐号 ns records (至少两笔资料)
        $ref: pn_sp_textarea_array
    required:
    - domains
    - name_servers
    outputs:
      success:
        description: 执行成功的域名
        type: array
        items:
          type: string
          examples:
          - aaa.com
      failure:
        description: 执行失败的域名
        type: array
        items:
          type: string
          examples:
          - bbb.com
    