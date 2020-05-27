blckspatchappstore
**********************************
| 更新应用 AppStore 下架报警的App清单
| 更新应用 AppStore 下架报警的App清单

.. code-block:: yaml

    id: blckspatchappstore
    schemaVersion: '0.2'
    version: 0.2.0
    name: 更新应用 AppStore 下架报警的App清单
    title: 更新应用 AppStore 下架报警的App清单
    description: 更新应用 AppStore 下架报警的App清单
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      command:
        name: 指令
        title: 指令
        type: string
        description: 请输入指令
        examples:
        - list, add, delete
      apps:
        name: app参数
        title: app参数
        type: string
        description: 请输入app参数
        examples:
        - haha , 5566123, my-test\nheyhey , 556678, test123
    required:
    - command
    outputs:
      result:
        description: 执行结果
        type: object
    