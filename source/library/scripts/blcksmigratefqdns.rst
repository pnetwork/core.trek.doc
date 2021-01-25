blcksmigratefqdns
**********************************
| 覆蓋域名解析紀錄
| 先將所選擇的域名下的解析紀錄全部移除，再將原域名的解析紀錄覆蓋過去

.. code-block:: yaml

    id: blcksmigratefqdns
    schemaVersion: '0.2'
    version: 0.4.1
    title: 覆蓋域名解析紀錄
    description: 先將所選擇的域名下的解析紀錄全部移除，再將原域名的解析紀錄覆蓋過去
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      from_domain_id:
        title: 原域名 ID
        description: 原域名 ID
        type: string
      to_domain_id:
        title: 新域名 ID
        description: 新域名 ID
        type: string
    required:
    - from_domain_id
    - to_domain_id
    outputs:
      success_fqdns:
        title: 解析紀錄成功例表
        description: 覆蓋域名解析紀錄成功例表
        type: array
        items:
          type: object
      failure_fqdns:
        title: 解析紀錄失敗例表
        description: 覆蓋域名解析紀錄失敗例表
        type: array
        items:
          type: object
    