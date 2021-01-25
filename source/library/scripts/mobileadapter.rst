mobileadapter
**********************************
| 行动介面处理
| 请输入标题及描述

.. code-block:: yaml

    id: mobileadapter
    schemaVersion: '0.2'
    version: 0.4.0
    title: 行动介面处理
    description: 请输入标题及描述
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      title:
        title: 网页标题
        type: string
        description: 网页标题
        maxLength: 4000
      description:
        title: 网页开头描述
        type: string
        description: 网页开头描述
        maxLength: 4000
      customMessage:
        title: 使用者自定义内容
        type: array
        description: 输入自定义内容与网址
        items:
          type: object
          properties:
            messageText:
              title: 内容
              type: string
              description: 内容
            messageUrl:
              title: 内嵌网址
              type: string
              description: 内嵌网址
              examples:
              - 仅支援https
    outputs:
      state:
        title: 执行状态
        type: boolean
        description: 执行状态
      url:
        title: web url
        type: string
        description: web url
      err_msg:
        title: 错误讯息
        type: string
      err_code:
        title: 错误代码
        type: integer
    