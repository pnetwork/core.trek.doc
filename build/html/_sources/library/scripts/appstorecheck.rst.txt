appstorecheck
**********************************
| AppStore 上架状态检测器
| AppStore 上架状态检测器

.. code-block:: yaml

    id: appstorecheck
    schemaVersion: '0.2'
    name: AppStore 上架状态检测器
    title: AppStore 上架状态检测器
    version: 0.3.0
    description: AppStore 上架状态检测器
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      check_list:
        name: 检测列表
        title: 检测列表
        $ref: pn_sp_textarea_array
        description: 填入格式为 <应用名称>, <id>, <备注>
        example:
        - WhatsApp Messenger, 310633997, my-note
    required:
    - check_list
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
      exists_count:
        name: 架上数量
        title: 架上数量
        type: integer
      exists:
        name: 架上列表
        title: 架上列表
        type: array
        items:
          type: obejct
          properties:
            name:
              name: 应用名称
              title: 应用名称
              type: string
            id:
              name: 应用 id
              title: 应用 id
              type: string
            note:
              name: 备注
              title: 备注
              type: string
      notfounds_count:
        name: 下架数量
        title: 下架数量
        type: integer
      notfounds:
        name: 下架列表
        title: 下架列表
        type: array
        items:
          type: obejct
          properties:
            name:
              name: 应用名称
              title: 应用名称
              type: string
            id:
              name: 应用 id
              title: 应用 id
              type: string
            note:
              name: 备注
              title: 备注
              type: string
      failures_count:
        name: 檢測失敗数量
        title: 檢測失敗数量
        type: integer
      failures:
        name: 檢測失敗列表
        title: 檢測失敗列表
        type: array
        items:
          type: obejct
          properties:
            name:
              name: 应用名称
              title: 应用名称
              type: string
            id:
              name: 应用 id
              title: 应用 id
              type: string
            note:
              name: 备注
              title: 备注
              type: string
    