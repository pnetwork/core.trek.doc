mobileadapter
**********************************
| 行动介面处理
| 请输入标题及描述

.. code-block:: yaml

    id: mobileadapter
    schemaVersion: '0.2'
    version: '0.2'
    name: 行动介面处理
    title: 行动介面处理
    description: 请输入标题及描述
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      title:
        name: 网页标题
        title: 网页标题
        type: string
        description: 网页标题
        maxLength: 4000
      description:
        name: 网页开头描述
        title: 网页开头描述
        type: string
        description: 网页开头描述
        maxLength: 4000
      customMessage:
        name: 使用者自定义内容
        title: 使用者自定义内容
        type: array
        description: 输入自定义内容与网址
        component:
          type: mobileadapter
        items:
          type: object
          properties:
            messageText:
              name: 内容
              title: 内容
              type: string
              description: 内容
            messageUrl:
              name: 内嵌网址
              title: 内嵌网址
              type: string
              description: 内嵌网址
              examples:
              - 仅支援https
    outputs:
      state:
        name: 执行状态
        title: 执行状态
        type: boolean
        description: 执行状态
      url:
        name: web url
        title: web url
        type: string
        description: web url
      err_msg:
        name: 错误讯息
        title: 错误讯息
        type: string
      err_code:
        name: 错误代码
        title: 错误代码
        type: integer
    