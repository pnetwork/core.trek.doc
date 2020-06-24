templatepython3
**********************************
| 訊息轉換器(python3)
| 訊息轉換器(python3)

.. code-block:: yaml

    id: templatepython3
    schemaVersion: '0.2'
    version: 0.1.0
    name: 訊息轉換器(python3)
    title: 訊息轉換器(python3)
    description: 訊息轉換器(python3)
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      wf_obj:
        type: object
      wf_list:
        type: array
        items:
          type: object
      code_snippet:
        name: python3.7 語法
        title: python3.7 語法
        $ref: pn_sp_textarea_str
        description: "python3.7 語法:\nclass PythonClass:\n    def func(self, wf_obj=None,\
          \ wf_list=wf_list):\n        # write your code here \n"
    outputs:
      results:
        type: object
    