The Project Directory Structure
===================================

| 一個完整的 Trek 專案目錄結構會如下：
| 資料夾 *trek_packages*、*src/ansible*、*src/blcks*、*src/shell* 需要使用相關指令才會生成。

.. code-block:: shell

    $ tree hello_trek_project
    hello_trek_project/
    ├── .trek
    │   └── config.json     # 專案層級的設定檔
    ├──trek_packages/       # 腳本安裝位置
    ├──inputs               # 存放參數檔，在執行工作流程時可以用到
    │   ├── data.yml        # 執行時參照的工作流程參數檔，同時支援 yaml(預設), json 格式
    │   └── event.yml       # 執行時參照的事件參數檔，同時支援 yaml(預設), json 格式
    ├── manifest.json       # 定義 workflow template 檔案位置
    ├── packages.json       # 制定專案所需的 dependencies 安裝包(類似 python requirements.txt)
    └── src                 # 存放主要程式碼
        ├── ansible/        # 存放 ansible 腳本程式的目錄
        ├── blcks/          # 存放 Blcks 腳本程式的目錄 
        ├── shell/          # 存放 shell script 腳本程式的目錄
        └── graph.yml       # 預設產生的 workflow template 檔案，定義工作流程長相的主要檔案

.. note:: 
    - 若要使用 *inputs/data.yaml* 需要配置 config.json 中的 :ref:`input_data_path 欄位 <config_input_data>` 指定檔案位置。
    - 若要使用 *inputs/event.yaml* 需要配置 config.json 中的 :ref:`input_event_path 欄位 <config_input_event_path>` 指定檔案位置。
