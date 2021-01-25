templateengine
**********************************
| 讯息转换器
| 讯息转换器

.. code-block:: yaml

    id: templateengine
    schemaVersion: '0.2'
    title: 讯息转换器
    version: 0.2.0
    description: 讯息转换器
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      wf_obj:
        title: 工作流程来的物件
        type: object
      wf_list:
        title: 工作流程来的列表
        type: array
        items:
          type: object
      params:
        title: 传入参数
        $ref: pn_sp_textarea_str
        description: 传入参数 (JSON format)
      template_string:
        title: 模板文本
        $ref: pn_sp_textarea_str
        description: 模板文本
      raise_exception:
        title: 抛出例外
        type: integer
        default: 0
        examples:
        - 0
        - 1
    outputs:
      code:
        title: 执行结果代码
        type: integer
        description: 执行结果代码
      msg:
        title: 执行结果讯息
        type: string
        description: 执行结果讯息
      result:
        title: 回传结果
        type: string
        description: 回传结果
    