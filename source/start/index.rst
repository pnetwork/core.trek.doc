Getting Started
================

Introduction
-------------------
Trek 是一個幫助你開發 Marvin 上的自動化開發工具。Pentium Internet (奔騰網路) 提供多種開發環境，你可以透過 CLI 界面或 VScode 擴展開發自動化流程腳本。 

這份 trek 文件會幫助你學習和使用 trek 自動化開發工具，從你的第一個腳本，一直到優化複雜的複雜的工作流程。夠過 "trek" 指令，你可以在本機上完成所有的開發包含撰寫腳本、工作流程、除錯、開發工作流程，最後部署你開發的工具到你指定的 Marvin 平台。

System Requirements
-------------------

在安裝前請確認系統是否符合需求

* macOS 10.14+
* Docker 19.03+
* Python 3.7+

.. _install_trek:

Installation dev kit
-----------------------
首先我們要安裝 trek cli 工具，請使用以下指令安裝 trek：

.. code-block:: shell

    $ pip install trek -i https://package.pentium.network/repository/pypi-group/simple --trusted-host=package.pentium.network

使用指令查看 trek 版本確認安裝成功

.. code-block:: shell

    $ trek version

恭喜，您已成功安裝 trek !

.. _config_trek:

Config development environment
-----------------------------------
成功安裝 trek cli 工具後，我們需要設置 trek config。
trek config 提供專案、Global兩種層級的設置，專案設置可以覆蓋 Global 設置。舉例來說，若 Global 和專案皆設置了 router_port 欄位，mflow 將優先以專案設置的為主。

專案設定檔位於專案內 ``{your_trek_project_path}/.trek/config.json``，Global 位於 ``~/.trek/config.json``。

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

|

.. include:: project_folder.rst