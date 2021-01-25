blcksdatatypetransformer
**********************************
| 字串格式转换器
| 将字串转换成阵列或物件

.. code-block:: yaml

    id: blcksdatatypetransformer
    schemaVersion: '0.2'
    version: 0.2.0
    title: 字串格式转换器
    description: 将字串转换成阵列或物件
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      str_to_array:
        type: string
        title: 字串转阵列
        description: 将字串依指定字元切割后，转换成阵列。
      char_for_split:
        type: string
        title: 字串切割字元
        description: 指定的字元用来切割字串
      str_to_dict:
        type: string
        title: 字串转物件
        description: 字串转物件
    outputs:
      result_str_to_array:
        type: array
        items:
          type: string
      result_str_to_dict:
        type: object
    required:
    - str_to_array
    