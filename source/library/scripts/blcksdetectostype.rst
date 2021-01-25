blcksdetectostype
**********************************
| 伺服器作業系統類型查詢
| 查詢並更新伺服器作業系統類型欄位，若有設定 Windows 伺服器的前置名稱與標籤名稱欄位則視為合併條件。

.. code-block:: yaml

    id: blcksdetectostype
    schemaVersion: '0.2'
    version: 0.1.4
    title: 伺服器作業系統類型查詢
    description: 查詢並更新伺服器作業系統類型欄位，若有設定 Windows 伺服器的前置名稱與標籤名稱欄位則視為合併條件。
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      host_ids:
        $ref: pn_ids_host
      windows_prefix_str:
        title: Windows 伺服器的前置名稱
        description: 伺服器名稱符合前置時，視為 windows 機器
        type: string
        examples:
        - windows
      windows_tag:
        title: Windows 伺服器的標籤名稱
        description: 伺服器的標籤含此名稱時，視為 windows 機器
        type: string
        examples:
        - windows
    required:
    - host_ids
    outputs:
      not_windows_host_ids:
        title: 非 Windows 作業系統類型的伺服器 ID 列表
        type: array
        items:
          type: string
      windows_host_ids:
        title: Windows 作業系統類型的伺服器 ID 列表
        type: array
        items:
          type: string
      update_success_host:
        title: 更新伺服器作業系統類型成功列表
        type: array
        items:
          type: object
      update_fail_host_ids:
        title: 更新伺服器作業系統類型失敗列表
        type: array
        items:
          type: string
      ignore_host_ids:
        title: 已有作業系統類型伺服器列表
        type: array
        items:
          type: string
    