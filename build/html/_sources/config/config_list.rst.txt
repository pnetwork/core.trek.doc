.. role:: red

Trek config.json 提供以下設定：

.. _marvin_url:

marvin_url :red:`*`
#######################
| Marvin 平台 url。
| 若需使用 Marvin 平台資產、或佈署時必需填入，若不使用則可以不需要填。


.. _marvin_jwt:

marvin_JWT :red:`*` 
#######################
| Marvin 平台 jwt tocken 設置，屬於 ``marvin_url`` 的 jwt token。
| 若僅知道 marvin 帳號密碼，在 trek 專案下執行指令 :doc:`../reference/cli/commands/login` 來登入平台，系統即自動填入專案層級的 ``marvin_JWT`` 欄位。

.. note:: 若 ``marvin_url`` 有設置需求時，``marvin_JWT`` 也必需設置。

router_port
#######################
| 在執行工作流程時，本地端 router 啟用埠號，預設值 5000。

action_timeout
#######################
| 工作流程中 Action 腳本執行的過期時間 (秒)，預設值為 30 秒。

blcks_code_base
#######################
| Blcks 腳本於本地端的資料夾位置。
| 假設資料夾 */User/pentium/trek/blcks/* 下有多個 Blcks 腳本(如下)，則 ``blcks_code_base`` 可設置為 */User/pentium/trek/blcks*。

::

    $ tree /User/pentium/trek/blcks
    /User/pentium/trek/blcks
    ├── blckssettags
    ├── balances
    ├── ...
    └── notifiction

ansible_code_base
#######################
| Ansible 腳本於本地端位置。設置方式如同 ``blcks_code_base``。

shell_script_base
#######################
| Shell 腳本於本地端位置。設置方式如同 ``blcks_code_base`` 。

.. _script_repo:

script_repository
#######################
| 腳本下載 Packages server 位置設置。
| 若需遠端安裝、查看腳本，使用指令 :doc:`../reference/cli/commands/install`、:doc:`../reference/cli/commands/listscripts` 需要設定腳本存放的位置。

.. _config_input_data:

input_data_path
#######################
| 工作流程參數檔案位置，預設為 *{your_trek_project_path}/inputs/data.yml*，支援 yaml, json 兩種格式。
| 當 workflow template 不想設定可供選擇的值時 (如: chatbot)，可透過工作流程參數檔案設定欄位值，通常於本機執行測試時使用。
| 填寫的方式請參考：

.. code-block:: yaml

    4-5:                # Node id: from - to 
        bot_infos.0:        # Property name: bot_infos is an array of string, so bot_infos.0 means bot_infos[0]
            type: string        # Property data type
            value: CH-bka2bbkpl # Property value

.. _config_input_event_path:

input_event_path
#######################
| 工作流程事件參數檔案位置，預設為 *{your_trek_project_path}/inputs/event.yml*，支援 yaml, json 兩種格式。
| 當工作流程為事件觸發時，此參數將指定事件內容檔案位置；當執行 Blcks 時 input_event_path 表示輸入參數。
| 如下：

.. code-block:: yaml

    tag_name: "redis"   # Property name: value

env
#######################
| 腳本環境變數。
| 若腳本需要讀取環境變數時，可以在此欄位進行設置。請參考：

.. toctree::

   config_env

flow_home
#######################
| 執行管理介面指令 :doc:`../reference/cli/commands/webserver` 時可以指定要監控的 Trek 專案放置路徑。
| 假設有一個 Trek 專案位置為 */User/Pentium/trek/hello_trek_project*，則設置 ``flow_home="/User/Pentium/trek/"``。

local_inventory_file
#######################
| Ansible inventory 環境設置檔。本地端開發執行 ansible 腳本時，服務器資產不一定要在 marvin 平台內。
| 當有一個 ansible inventory 檔案為：

.. code-block:: ini
   :linenos:

   #FilePath: /Users/pentium/ansible/inventory.ini
   #FileName: Ansible inventory.ini 
   [hosts]
   192.168.101.231 ansible_user=pentium ansible_password=pentium_password ansible_port=22

| 將 config.json 中的 ``local_inventory_file`` 設置為 */Users/pentium/ansible/inventory.ini*：

.. code-block:: json
   :linenos:

   {
       "local_inventory_file":"/Users/pentium/ansible/inventory.ini"
   }

| 在 workflow template file 的服務器資產指定為 ``_local_`` ：

.. code-block:: yaml
   :linenos:

   #FileName: Workflow template file
   ...
   - source: '2'
     target: '3'
     metadata:
       binding:
         - property: resourceIds.0
           value: _local_ # 當 value 為 _local_ 時，服務器位置及登入資訊為 config.json 中的 local_inventory_file 設置
           type: string


