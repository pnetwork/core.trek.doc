blcksbindingrole
**********************************
| 角色绑定
| 角色绑定

.. code-block:: yaml

    id: blcksbindingrole
    schemaVersion: '0.2'
    version: 0.4.0
    title: 角色绑定
    description: 角色绑定
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      users:
        title: 使用者列表
        type: array
        description: 欲绑定使用者列表
        items:
          type: object
      role_id:
        title: 角色 ID
        type: string
        description: 欲绑定角色 ID
    required:
    - users
    - role_id
    outputs:
      result:
        title: 角色更新结果
        description: 角色更新结果
        type: object
    