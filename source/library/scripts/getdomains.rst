getdomains
**********************************
| 取得JWT所属权限的域名
| 取得JWT所属权限的域名

.. code-block:: yaml

    id: getdomains
    schemaVersion: '0.2'
    version: 0.9.3
    title: 取得JWT所属权限的域名
    description: 取得JWT所属权限的域名
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      filter_str:
        title: 筛选条件
        type: string
        description: 请输入筛选条件
        examples:
        - name:domain.com
      fire_event:
        title: 取得每個域名發送 event
        description: Yes/No (true/false)
        type: boolean
        enum:
        - 0
        - 1
        enumNames:
        - 'no'
        - 'yes'
    outputs:
      domain_names:
        title: 域名列表
        description: 域名列表
        type: array
        items:
          type: string
          examples:
          - google.com
          - yahoo.com
      domain_ids:
        title: 域名ID列表
        description: 域名ID列表
        type: array
        items:
          type: string
          examples:
          - D-12345
      exception:
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    