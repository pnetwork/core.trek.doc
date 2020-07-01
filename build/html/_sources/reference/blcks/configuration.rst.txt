
*************
Configuration
*************

Config in Trek CLI
******************

| 當使用 Trek CLI 建立 Blcks 專案時，Blcks 專案會產生以下的 *{your_blcks_project_path}/.trek/config.json*。

.. code:: json

    {
        "marvin_url": "",
        "marvin_JWT": "",
        "marvin_secret": "",
        "input_event_path": "inputs/event.yml",
        "envs": {
            "BLCKS_DEBUG_LOG_MODE": "table",
            "BLCKS_DEBUG_LOG_TABLE_WIDTH": 100,
            "BLCKS_DEBUG_LOG_FIELDS": "data",
            "BLCKS_DEBUG_LOG_FORMAT": "{message} => inputParams: {data[inputParamsStr]}"
        }
    }

| config.json 提供了專案、Global 兩種層級的設置，優先順序為專案 > Global。
| 若 Blcks 專案是處於 Trek 專案下 (即在其 `src/blcks/` 下) 則讀取的優先順序為 ``Blcks 專案設置 > Trek 專案設置 > Global 設置``。

設置中的 ``envs`` 是 Blcks 執行時讀取的環境變數，與 debug 相關的設定可以參考下面的章節： :trekdoclink:`Environment Variables for Debugging<config/config_env.html>`

若想知道 *config.json* 的詳細介紹，請參考 :trekdoclink:`Configuring Properties<config/config_list.html>`

