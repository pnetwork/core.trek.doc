updatepassword
**********************************
| 批量修改服务器 SSH 帐密
| 批量修改服务器 SSH 帐密

.. code-block:: yaml

    id: updatepassword
    schemaVersion: '0.2'
    version: 0.2.2
    name: 批量修改服务器 SSH 帐密
    title: 批量修改服务器 SSH 帐密
    description: 批量修改服务器 SSH 帐密
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      account:
        name: 登入帐号
        title: 登入帐号
        type: string
        description: 登入帐号
      password:
        $ref: pn_sp_password
      key_id:
        $ref: pn_id_keypair
    required:
    - resourceIds
    - account
    outputs:
      done:
        name: 工作完成
        title: 工作完成
        type: boolean
        description: blcks 工作完成
      successes:
        name: 成功列表
        title: 成功列表
        type: array
        description: 成功列表
        items:
          type: string
      success_count:
        name: 成功总数
        title: 成功总数
        type: integer
        description: 成功总数
      error:
        name: 失敗列表
        title: 失敗列表
        type: array
        description: 失敗列表
        items:
          type: string
      error_count:
        name: 失敗总数
        title: 失敗总数
        type: integer
        description: 失敗总数
    