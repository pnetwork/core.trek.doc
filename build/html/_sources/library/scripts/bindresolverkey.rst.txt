bindresolverkey
**********************************
| 域名绑定解析商
| 尝试替系统内未绑定resolver key的domain，绑定一个可以解析该域名的key

.. code-block:: yaml

    id: bindresolverkey
    schemaVersion: '0.2'
    version: '0.2'
    name: 域名绑定解析商
    title: 域名绑定解析商
    description: 尝试替系统内未绑定resolver key的domain，绑定一个可以解析该域名的key
    namespace: network.pentium
    assets:
    - DOMAIN
    outputs:
      done:
        name: blcks 工作完成
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
    