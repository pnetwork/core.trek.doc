blcksgetdomainids
**********************************
| 查找域名 ID
| 查找域名 ID

.. code-block:: yaml

    id: blcksgetdomainids
    schemaVersion: '0.2'
    version: 0.1.1
    name: 查找域名 ID
    title: 查找域名 ID
    description: 查找域名 ID
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      fqdns:
        name: fqdn 列表
        title: fqdn 列表
        description: fqdn 列表
        type: array
        items:
          type: string
    required:
    - fqdns
    outputs:
      domain_ids:
        type: array
        items:
          type: string
    