blckscheckhostconnection
**********************************
| 服务器连线测试
| 对服务器连线测试，检测帐密及网路状态

.. code-block:: yaml

    id: blckscheckhostconnection
    schemaVersion: '0.2'
    version: 0.3.1
    name: 服务器连线测试
    title: 服务器连线测试
    description: 对服务器连线测试，检测帐密及网路状态
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
    required:
    - resourceIds
    outputs:
      success_ids:
        title: 可成功连线的服务器 ID 列表
        name: 可成功连线的服务器 ID 列表
        type: array
        items:
          type: string
      invalid_account_ids:
        title: 帐密错误的服务器 ID 列表
        name: 帐密错误的服务器 ID 列表
        type: array
        items:
          type: string
      invalid_network_ids:
        title: 无网路连线的服务器 ID 列表
        name: 无网路连线的服务器 ID 列表
        type: array
        items:
          type: string
      missing_credential:
        title: 缺少密码与金钥的服务器 ID 列表
        name: 缺少密码与金钥的服务器 ID 列表
        type: array
        items:
          type: string
    