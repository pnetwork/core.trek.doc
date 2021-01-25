appstorecheck
**********************************
| AppStore 上架状态检测器
| AppStore 上架状态检测器

.. code-block:: yaml

    id: appstorecheck
    schemaVersion: '0.2'
    title: AppStore 上架状态检测器
    version: 0.5.0
    description: AppStore 上架状态检测器
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      check_list:
        title: 检测列表
        $ref: pn_sp_textarea_array
        description: 填入格式为 <应用名称>, <id>, <备注>
        examples:
        - WhatsApp Messenger, 310633997, my-note
    required:
    - check_list
    outputs:
      code:
        title: 执行结果代码
        type: integer
        description: 执行结果代码
      msg:
        title: 执行结果讯息
        type: string
        description: 执行结果讯息
      exists_count:
        title: 架上数量
        type: integer
      exists:
        title: 架上列表
        type: array
        items:
          type: object
          properties:
            name:
              title: 应用名称
              type: string
            id:
              title: 应用 id
              type: string
            note:
              title: 备注
              type: string
      notfounds_count:
        title: 下架数量
        type: integer
      notfounds:
        title: 下架列表
        type: array
        items:
          type: object
          properties:
            name:
              title: 应用名称
              type: string
            id:
              title: 应用 id
              type: string
            note:
              title: 备注
              type: string
      failures_count:
        title: 檢測失敗数量
        type: integer
      failures:
        title: 檢測失敗列表
        type: array
        items:
          type: object
          properties:
            name:
              title: 应用名称
              type: string
            id:
              title: 应用 id
              type: string
            note:
              title: 备注
              type: string
    