syncassets
**********************************
| 同步云帐号的资产
| 同步云帐号的资产

.. code-block:: yaml

    id: syncassets
    schemaVersion: '0.2'
    version: 0.10.1
    title: 同步云帐号的资产
    description: 同步云帐号的资产
    namespace: network.pentium
    assets:
    - CLOUDACCOUNT
    inputs:
      provider_id:
        title: 服务商 ID
        type: string
        description: 服务商 ID
        examples:
        - CP-000000000
        - CP-000000001
        - CP-000000002
      asset_type:
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
      append_project:
        title: 自动分配项目
        type: boolean
        description: 决定是否要自动分配云帐号的项目到同步后的资产
        enum:
        - true
        - false
        enumNames:
        - 'Yes'
        - 'No'
    required:
    - provider_id
    - asset_type
    outputs:
      provider_id:
        title: 服务商 ID
        type: string
        description: 服务商 ID
      asset_type:
        title: 资产类型
        type: string
        description: 资产类型
      accounts:
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
    