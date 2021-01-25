Configuring the Trek CLI
=====================================
.. _config_trek:

成功安裝 Trek CLI 工具後，我們需要設置 Trek config。
Trek config 提供 scripts 專案、workflow 專案、Global三種層級的設置，專案設置可以覆蓋 Global 設置。

產生 config 方式：

  #. Global *config.json*：在安裝 Trek CLI 時會自動生成在 *~/.trek/config.json*。
  #. Workflow 專案 *config.json*：產生 workflow 專案時會自動生成在 *{your_project_path}/.trek/config.json*。
  #. Script 專案 *config.json*：產生 script 專案時會自動生成在 *{your_script_path}/.trek/config.json*。

*config.json* 優先順序：script 專案 > workflow 專案 > Global

下面是一 *config.json* 範例：

::

    $ vim ~/.trek/config.json
    {
        "marvin_url": "https://marvin.pentium.network/",
        "marvin_JWT": "{your_marvin_jwt_token}",
        "router_port": 5000,
        "action_timeout": 30,
        "blcks_code_base": "",
        "ansible_code_base": "",
        "shell_script_base": "",
        "script_repository": "https://hub.pentium.network/scripts/",
        "input_data_path": "",
        "input_event_path": "",
        "envs": {
            "BLCKS_DEBUG_LOG_MODE": "table",
            "BLCKS_DEBUG_LOG_TABLE_WIDTH": 100,
            "BLCKS_DEBUG_LOG_FIELDS": "data",
            "BLCKS_DEBUG_LOG_FORMAT": "{message} => inputParams: {data[inputParamsStr]}"
        },
        "flow_home": "",
        "local_inventory_file": ""
    }

.. include:: config_list.rst
