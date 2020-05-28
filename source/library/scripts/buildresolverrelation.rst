buildresolverrelation
**********************************
| 建立全站域名关联表
| 利用所有使用者汇入系统内的解析商密钥，建立每一把r解析商密钥可解析的域名列表的对照表

.. code-block:: yaml

    id: buildresolverrelation
    schemaVersion: '0.2'
    version: '0.3'
    name: 建立全站域名关联表
    title: 建立全站域名关联表
    description: 利用所有使用者汇入系统内的解析商密钥，建立每一把r解析商密钥可解析的域名列表的对照表
    namespace: network.pentium
    assets:
    - DOMAIN
    outputs:
      done:
        name: blcks 工作完成
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
    