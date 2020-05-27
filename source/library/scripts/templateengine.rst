templateengine
**********************************
| 讯息转换器
| 讯息转换器

.. code-block:: yaml

    id: templateengine
    schemaVersion: '0.2'
    name: 讯息转换器
    title: 讯息转换器
    version: 0.1.1
    description: 讯息转换器
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      wf_obj:
        name: 工作流程来的物件
        title: 工作流程来的物件
        type: object
      wf_list:
        name: 工作流程来的列表
        title: 工作流程来的列表
        type: array
        items:
          type: object
      params:
        name: 传入参数
        title: 传入参数
        $ref: pn_sp_textarea_str
        description: 传入参数 (JSON format)
      template_string:
        name: 模板文本
        title: 模板文本
        $ref: pn_sp_textarea_str
        description: 模板文本
      raise_exception:
        name: 抛出例外
        title: 抛出例外
        type: integer
        default: 0
        examples:
        - 0
        - 1
    outputs:
      code:
        name: 执行结果代码
        title: 执行结果代码
        type: integer
        description: 执行结果代码
      msg:
        name: 执行结果讯息
        title: 执行结果讯息
        type: string
        description: 执行结果讯息
      result:
        name: 回传结果
        title: 回传结果
        type: string
        description: 回传结果
    