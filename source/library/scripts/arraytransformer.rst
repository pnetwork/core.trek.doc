arraytransformer
**********************************
| 列表讯息转换器
| 将列表讯息转换为字串

.. code-block:: yaml

    id: arraytransformer
    schemaVersion: '0.2'
    version: 0.4.0
    title: 列表讯息转换器
    description: 将列表讯息转换为字串
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      input_array:
        title: 列表讯息
        type: array
        items:
          type: string
    required:
    - input_array
    outputs:
      result:
        description: 转换结果
        type: string
        examples:
        - 1,2,3,hello,world
      exception:
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    