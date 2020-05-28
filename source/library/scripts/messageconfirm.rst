messageconfirm
**********************************
| 工作流程执行确认
| 透过通讯软体，等待审核者审查回应

.. code-block:: yaml

    id: messageconfirm
    schemaVersion: '0.2'
    name: 工作流程执行确认
    title: 工作流程执行确认
    version: 0.1.1
    description: 透过通讯软体，等待审核者审查回应
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      description:
        name: 显示讯息
        title: 显示讯息
        type: string
      whitelist:
        name: 白名单
        title: 白名单
        $ref: pn_sp_textarea_array
        description: 填入通讯软体的使用者帐号
        example:
        - richwang
        - kinglin
      channel_ids:
        $ref: pn_ids_chatpair
    required:
    - channel_ids
    outputs:
      error:
        name: result error code
        title: result error code
        type: integer
        description: 0 表示没有错误
      msg:
        name: result message
        title: result message
        type: string
        description: ''
      result:
        type: object
        properties:
          user_id:
            type: string
          bot_id:
            type: string
          channel_id:
            type: string
          answer:
            type: string
    