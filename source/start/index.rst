Getting Started
================

Introduction
-------------------
Trek 是一個幫助你開發 Marvin 上的自動化開發工具。Pentium Internet (奔騰網路) 提供多種開發環境，你可以透過 CLI 界面或 VScode 擴展開發自動化流程腳本。 

這份 trek 文件會幫助你學習和使用 trek 自動化開發工具，從你的第一個腳本，一直到優化複雜的複雜的工作流程。夠過 "trek" 指令，你可以在本機上完成所有的開發包含撰寫腳本、工作流程、除錯、開發工作流程，最後部署你開發的工具到你指定的 Marvin 平台。

Installation dev kit
-----------------------
首先我們要安裝 trek cli 工具，請使用以下指令安裝 trek：

::

    $ pip install trek -i https://package.pentium.network/repository/pypi-group/simple --trusted-host=package.pentium.network

使用指令查看 trek 版本確認安裝成功

::

    $ trek version

恭喜，您已成功安裝 trek !

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
        "marvin_secret": "",
        "router_port": 5000,
        "action_timeout": 30,
        "blcks_code_base": "",
        "ansible_code_base": "",
        "shell_script_base": "",
        "script_repository": "https://hub.pentium.network/scripts/",
        "input_data_path": "",
        "input_event_path": "",
        "local_inventory_file": "",
        "envs": {
            "BLCKS_DEBUG_LOG_MODE": "table",
            "BLCKS_DEBUG_LOG_TABLE_WIDTH": 100,
            "BLCKS_DEBUG_LOG_FIELDS": "data",
            "BLCKS_DEBUG_LOG_FORMAT": "{message} => inputParams: {data[inputParamsStr]}"
        },
        "flow_home"
    }

Trek config.json 支援以下設置：

- marvin_url: marvin 平台 url，於本地端執行時將會使用此平台資產。若不使用透過 api 取得資產則不需要填，像是 ansible / shell。
- marvin_JWT: marvin 平台 jwt tocken 設置，屬於 marvin_url 的 jwt token。若不使用透過 api 取得資產則不需要填，像是 ansible / shell。
- marvin_secret: 
- router_port: 本地端 router 啟用埠號。
- action_timeout: action 過期時間。
- blcks_code_base: blcks 腳本於本地端位置(非必填)。
- ansible_code_base: ansible 腳本於本地端位置(非必填)。
- shell_script_base: shell 腳本於本地端位置(非必填)。
- script_repository: nexus server 位置設置。 以 nexus 開發環境來說是 "https://hub-preview.pentium.network/scripts/"
- input_data_path: 工作流程參數檔案位置(非必填)。
- input_event_path: 事件參數檔案位置(非必填)。
- local_inventory_file: ansible inventory 環境設置檔(非必填)。本地端開發執行 ansible 腳本時，服務器資產不一定要在 marvin 平台內，以下為使用範例：
- env: 
- flow_home: 