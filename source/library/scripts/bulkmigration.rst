bulkmigration
**********************************
| 复制DNS 记录至另一解析商
| 将使用者所选取域名及subdomains，添加至选定的解析商密钥内

.. code-block:: yaml

    id: bulkmigration
    schemaVersion: '0.2'
    version: 0.5.0
    title: 复制DNS 记录至另一解析商
    description: 将使用者所选取域名及subdomains，添加至选定的解析商密钥内
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      resourceIds:
        $ref: pn_ids_domain
      resolverKey:
        $ref: pn_sp_bulkmigration_credential
      mode:
        title: 搬移模式
        description: 资讯搬移模式
        type: string
        examples:
        - insert
        - upsert
        default: insert
    required:
    - resourceIds
    - resolverKey
    outputs:
      done:
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
    