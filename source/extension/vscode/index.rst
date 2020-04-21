Extension Supported Commands
=============================
Trek vscode extension 讓您在 vscode 上輕鬆的開發 Marvin 自動化腳本、工作流程，透過 vscode 的命令即可在本機測試、以及把完成的腳本/工作流程打包佈署至您的 Marvin 平台。

Before you begin
------------------------
- 請先安裝 trek cli tool，如何安裝 :ref:`可參考 <install_trek>`。
- 以下會經常用到快捷鍵 Ctrl+Shit+P ( or ⌘+⇧+P ) 呼叫出 Command Palette 並執行 trek vscode extension 指令，Trek 相關指令都以「Trek: XXX」方式命名。
- 本機必需要有啟動中的 docker。

.. include:: install.rst

.. include:: config.rst

Command list
------------------------

.. toctree::
   :maxdepth: 1
   :glob:

   ../../reference/extension/commands/*

The first trek project
------------------------
| 假設我們的開發範例：
| 監控 redis 的連線，若連線不到標註 <redis:unreachable> 標籤，並發送 chatbot 通知。
| 因此 workflow 需要三個腳本：

1. 撈出特定服務器來檢查 redis 是否正常
2. 針對結果打上標籤
3. 發送通知 (若有不正常的)

其中 1 為此次新增腳本，2, 3 則為既有腳本可直接安裝

Step 1. Create project
^^^^^^^^^^^^^^^^^^^^^^^^
| 使用 Command Palette 叫出「Trek: Create Project」指令，並填入以下資訊：

.. image:: ../../_static/images/create_project.gif

#. 選擇專案存放位置
#. 輸入專案名稱為「host.detect.redis」
#. 輸入「N」不產生範本專案
#. 右下角顯示建立專案成功訊息，並以 workspace 方式開啟專案

Step 2. Create blcks
^^^^^^^^^^^^^^^^^^^^^^^^^
| 使用「Trek: Create Blcks」指令建立 blcks 腳本：

.. image:: ../../_static/images/create_blcks.gif

#. 輸入 blcks 腳本名稱為「detectredis」，產生的腳本位置於 *{your_trek_project_path}/src/blcks/* 下。
#. 定義腳本輸入輸出欄位：

   | Inputs: 服務器標籤，撈取含此標籤的服務器做檢查，此範例標籤會是 ``<redis>``；
   | Outputs: 連線不到的服務器、和其數量。

    .. code-block:: yaml

        id: detectredis
        schemaVersion: '0.2'
        name: Redis connection monitor
        title: Redis connection monitor
        version: "0.1.0"
        description: ""
        namespace: network.pentium
        assets:
        - SCRIPT

        inputs:
        tag_name:
            name: Tag name
            title: Tag name
            type: string

        outputs:
        fail_hosts_count:
            name: Fail host count
            title: Fail host count
            type: integer
            description: ""
        fail_hosts:
            name: Fail result
            title: Fail result
            type: array
            description: "Fail result"
            items:
            type: object
            properties:
                id:
                name: 服务器ID
                title: 服务器ID
                type: string
                description: 服务器ID
                examples:
                - S-ajvw371v9
                name:
                name: 服务器名称
                title: 服务器名称
                description: 服务器名称
                type: string
                examples:
                - OS-Ubuntu18.04
                ip:
                name: 服务器IP
                title: 服务器IP
                description: 服务器IP
                type: string
                examples:
                - 1.1.1.1

#. 撰寫腳本主程式：

    | 主程式檔案位於 *detectredis/handler/handler.py*；
    | 撈取含 ``<redis>`` 的服務器，並檢查是否可連線，若連線失敗就把此台服務器加入 outputs 中。

    .. code-block:: python

        from blcks import blcks
        import json
        import redis

        FAAS_METHOD_NAME = "detectredis"
        logger = blcks.logger


        @blcks
        def main(event, context):
            pass


        @blcks.script(FAAS_METHOD_NAME)
        def process(message):

            result = {
                "fail_hosts_count": 0,
                "fail_hosts": []
            }
            host_service = blcks.createService(blcks.ServiceName.HostsManager)
            hosts = host_service.getHosts(search="tag:redis")
            host_tags = []
            for h in hosts.get("data"):
                h_id = h["id"]
                h_ip = h["ip"]
                host_tags.append({"id": h_id, "type": "server"})
                try:
                    redis_host = h_ip
                    r = redis.Redis(redis_host, socket_connect_timeout=5)
                    if not r.ping():
                        result["fail_hosts"].append({"id": h_id, "ip": h_ip, "name": h["name"]})
                except redis.exceptions.RedisError:
                    result["fail_hosts"].append({"id": h_id, "ip": h_ip, "name": h["name"]})

            patch_data = [{"name": tag_name, "tagged": False, "assets": host_tags}]
            tag_service = blcks.createService(blcks.ServiceName.TagManager)
            tag_service.updateTags(patch_data)

            result["fail_hosts_count"] = len(result["fail_hosts"])
            blcks.logger.info(msg="output result", inputParamsStr=json.dumps(result))

            return result

    .. warning::
        - 記得將主程式中使用的套件寫入 `handler/requirements.txt` 中。
        - process function 的參數與 return 要跟 para schema 定義的一致。

Step 3. Install scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^
| 執行「Trek: Install Script」指令，安裝腳本：

- 資產設定標籤(blckssettags)
- 傳送訊息至指定頻道(notification)

| Vscode Terminal 視窗將顯示安裝的進度和結果：

.. image:: ../../_static/images/install_script.gif

Step 4. Edit workflow template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 接著開啟專案下的 ``src/graph.yml`` ，開始編輯 workflow template 檔案，定義好整個工作流程。
| 內容參考：

.. code-block:: yaml

    $schema: 'http://json-schema.pentium.network/marvin-workflows/0.1/schema'
    graph:
    metadata:
        version: 0.0.0
        title: Redis monitor
        templateId: host.detect.redis
        description: "Redis monitor"
        tags: []
        author: mflow
    nodes:
        - metadata:
            sources: []
            type: trigger
            title: trigger
            description: ''
        id: '0'
        - metadata:
            type: terminator
            title: terminator
            description: ''
        id: '1'
        - metadata:
            type: action
            title: 'Monitor redis'
            description: ''
            script: 
            id: detectredis
        id: '2'
        - metadata:
            type: action
            title: 'Tag host'
            description: ''
            script: 
            id: blckssettags
        id: '3'
        - metadata:
            type: selector
            title: selector
        id: '4'
        - metadata:
            type: action
            title: 'Notify'
            description: ''
            script: 
            id: notification
        id: '5'
    edges:
        - source: '0'
        target: '2'
        metadata:
            binding:
            - property: tag_name
            value: 'redis:unreachable'
            type: 'string'
        - source: '2'
        target: '3'
        metadata:
            binding:
            - property: name
            value: 'redis:unreachable'
            type: 'string'
            - property: tagged
            value: true
            type: 'boolean'
            - property: asset_type
            value: server
            type: 'string'
            - property: ids
            value: '{{ 2.fail_hosts[].id }}'
            type: 'array'
        - source: '3'
        target: '4'
        - source: '4'
        target: '5'
        metadata:
            filters:
            property: nodes.2.fail_hosts_count
            operator: '>'
            value: 0
            binding:
            - property: str_message
            value: 'The following host redis connection fail: {{ 2.fail_hosts }}'
            type: 'string'
            - property: bot_infos.0
            value: '{input your chatbot id}' # 此欄位為 chatbot id，請依 marvin 平台設置
            type: 'string'
        - source: '4'
        target: '1'
        metadata:
            filters:
            property: nodes.2.fail_hosts_count
            operator: '<='
            value: 0
        - source: '5'
        target: '1'

| 編輯完成，可以在 vscode  workflow template 的編輯區塊上按右鍵選擇「View Workflow Template Graph」，檢視 workflow 流程圖。

.. image:: ../../_static/images/view_graph.gif

Step 5. Run
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 在 vscode extension 執行工作流程很簡單，先打開 workflow template 檔案，此時編輯視窗右上方會出現按鈕 |run_icon|，按下即可執行：
| 等同於執行「Trek: Run」指令。

.. |run_icon| image:: ../../_static/images/run_icon.png

.. image:: ../../_static/images/run.png

| Vscode Terminal 視窗將顯示執行進度和結果：

.. image:: ../../_static/images/run_result.png

若需要停止執行的環境請使用 |stop_icon|，等同於執行「Trek: Shutdown Env」指令。

.. |stop_icon| image:: ../../_static/images/stop_icon.png

Step 6. Deploy
^^^^^^^^^^^^^^^^^^^^^^^^
| 在本機執行正確後，即可佈署至 Marvin 平台。
| 執行「Trek: Deploy to Marvin」指令，將會進行建置、push to dockerhub、打包和佈署。

.. image:: ../../_static/images/deploy.gif

#. 選擇佈署來源為「The Trek Project」。
#. 輸入「Y」表示覆蓋 Marvin 平台同名腳本及工作流程。
#. Vscode Terminal 視窗將顯示佈署進度和結果。
#. 可以至 Marvin 平台使用此次佈署的腳本及工作流程。