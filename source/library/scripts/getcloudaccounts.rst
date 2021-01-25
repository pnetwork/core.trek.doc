getcloudaccounts
**********************************
| 取得云帐号
| 取得云帐号

.. code-block:: yaml

    id: getcloudaccounts
    schemaVersion: '0.2'
    version: 0.3.0
    title: 取得云帐号
    description: 取得云帐号
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
    required:
    - provider_id
    outputs:
      done:
        title: 工作完成
        type: string
        description: blcks 工作完成
      provider_id:
        title: 服务商 ID
        type: string
        description: 服务商 ID
      accounts:
        title: 云帐号列表
        type: array
        description: 云帐号列表
        items:
          type: object
          properties:
            id:
              type: string
            name:
              type: string
    