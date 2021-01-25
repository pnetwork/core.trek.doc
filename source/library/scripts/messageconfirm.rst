messageconfirm
**********************************
| 工作流程执行确认
| 透过通讯软体，等待审核者审查回应

.. code-block:: yaml

    id: messageconfirm
    schemaVersion: '0.2'
    title: 工作流程执行确认
    version: 0.4.0
    description: 透过通讯软体，等待审核者审查回应
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      description:
        title: 审核原因
        type: string
      whitelist:
        title: 白名单
        $ref: pn_sp_textarea_array
        description: 填入通讯软体的使用者帐号
        examples:
        - richwang
        - kinglin
      channel_ids:
        $ref: pn_ids_chatpair
    required:
    - channel_ids
    - description
    outputs:
      error:
        title: result error code
        type: integer
        description: 0 表示没有错误
      msg:
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
    