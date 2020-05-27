syncassets
**********************************
| 同步云帐号的资产
| 同步云帐号的资产

.. code-block:: yaml

    id: syncassets
    schemaVersion: '0.2'
    version: 0.6.0
    name: 同步云帐号的资产
    title: 同步云帐号的资产
    description: 同步云帐号的资产
    namespace: network.pentium
    assets:
    - CLOUDACCOUNT
    inputs:
      provider_id:
        name: 服务商 ID
        title: 服务商 ID
        type: string
        description: 服务商 ID
        examples:
        - CP-000000000
        - CP-000000001
        - CP-000000002
      asset_type:
        name: 资产类型
        title: 资产类型
        type: string
        description: 资产类型
        enum:
        - host
        - cdn
        - domain
        - certificate
        enumNames:
        - host
        - cdn
        - domain
        - certificate
      accounts:
        name: 云帐号
        title: 云帐号
        type: array
        description: 云帐号
        items:
          type: object
          description: ''
          properties:
            id:
              type: string
            name:
              type: string
    required:
    - provider_id
    - asset_type
    outputs:
      done:
        name: 工作完成
        title: 工作完成
        type: string
        description: blcks 工作完成
      provider_id:
        name: 服务商 ID
        title: 服务商 ID
        type: string
        description: 服务商 ID
      asset_type:
        name: 资产类型
        title: 资产类型
        type: string
        description: 资产类型
      accounts:
        name: 云帐号
        title: 云帐号
        type: array
        description: 云帐号
        items:
          type: object
          properties:
            id:
              type: string
            name:
              type: string
    