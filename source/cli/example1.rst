Sample project
^^^^^^^^^^^^^^^^^^^^^^^^^

| 建立範本專案：
| 取得所屬權限下項目，並將其結果發送 chatbot 通知。
| Workflow 會需要安裝兩個公眾腳本：

1. 使用 callservice (呼叫 blcks SDK 服務) 腳本取得所屬權限下項目。
2. 使用 notification (傳送通知至指定頻道)腳本來發送訊息。

Step 1. Create a sample project
""""""""""""""""""""""""""""""""""""""""""""""""
| 執行 :doc:`../../reference/cli/commands/createproject` 指令建立 Trek 專案「host.detect.redis」，接著會詢問是否要進行 ``config.json`` 的設置，每個 Trek 專案都有一份設定檔 ``config.json``，您可以決定要定義專案層級的設置、或是全局的設置，這裡問的是專案層級的設置，若不需要可以不輸入文字直接按下 enter：
| 想進一步了解 config 欄位 :ref:`請參考 <config_trek>`。

.. code-block:: shell

    $ trek createproject --example sample.project
    Project [sample.project] creating...
    This utility will walk you through creating a config.json file.
    Marvin url []:
    Marvin JWT []:
    Marvin secret []:
    Done

| 創建成功的 Trek 專案目錄結構會如下：
| 若想了解每個檔案、資料夾的意義請參考 :doc:`../start/project_folder`。

.. code-block:: shell

    $ tree -a sample.project
    sample.project/
    ├── .trek
    │   └── config.json
    ├──inputs
    │   ├── data.yml
    │   └── event.yml
    ├── manifest.json
    ├── packages.json
    └── src
        └── graph.yml

Step 2. Install scripts
""""""""""""""""""""""""""""""""""""""""""""""""
*sample.project/packages.json* 是依賴安裝描述檔，如同 python 的 requiremenets.txt；範例專案已填寫好要下載安裝的腳本有哪些：

.. code-block:: json
   :linenos:
   
   {
        "packages": {
            "notification": "==0.5.0",
            "callservice": "==0.3.0"
        }
    }

我們可以直接執行指令 :doc:`../../reference/cli/commands/install` 從 script repository 下載安裝腳本：

- 傳送訊息至指定頻道(notification)
- 呼叫 blcks SDK 服務(callservice)

| 安裝下載的腳本檔案放在 *sample.project/trek_packages/* 資料夾下。

.. code-block:: shell

    $ trek installtrek install
    available versions: ['0.5.0', '0.4.0', '0.3.0', '0.2', '0.0.8888', '0.0.0']
    install script notification:0.5.0
    download script from: https://hub.pentium.network/scripts/notification/0.5.0/dist/script.zip
    saving: {your_trek_project_path}/sample.project/trek_packages/script.zip
    100%|██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 1/1 [00:00<00:00, 4563.99KB/s]
    extracting zip...
    notification:0.5.0 installed
    available versions: ['0.4.1', '0.4.0', '0.3.0', '0.2', '0.0.8888', '0.0.0']
    install script callservice:0.3.0
    download script from: https://hub.pentium.network/scripts/callservice/0.3.0/dist/script.zip
    saving: {your_trek_project_path}/sample.project/trek_packages/script.zip
    100%|██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 1/1 [00:00<00:00, 6898.53KB/s]
    extracting zip...
    callservice:0.3.0 installed
    $ tree -a
    .
    ├── .trek
    │   └── config.json
    ├── inputs
    ├── src
    │   ...
    └── trek_packages
        ├── callservice
        │   ├── callservice.para
        │   └── openfaas.yml
        └── notification
            ├── notification.para
            └── openfaas.yml

.. note::
    可下載的腳本清單來自 Pentium 提供的公眾腳本 :ref:`scripts_list`。

Step 3. View workflow template
""""""""""""""""""""""""""""""""""""""""""""""""

我們可以使用進階功能查看 sample workflow 流程圖，可以下指令 :doc:`graph <../../reference/cli/commands/graph>`：

.. code-block:: shell

    $ trek graph --show
    digraph "sample.project" {
        dpi=150 rankdir=LR size="8,5"
        0 [label=trigger shape=oval]
        1 [label=terminator shape=oval]
        2 [label=callservice shape=box]
        3 [label=notification shape=box]
        2 -> 3 [label="2-3"]
        3 -> 1 [label="3-1"]
        0 -> 2 [label="0-2"]
    }

.. image:: ../_static/images/sample_graph.png


Step 4. Edit test data
""""""""""""""""""""""""""""""""""""""""""""""""
| 範本專案已定義好整個 workflow 流程的長相，在 run 之前，我們需要設置傳送至哪個 chatbot。
| Workflow template 通常是定義流程範本，不會寫死指定特定的資產；在本機執行測試時，我們會需要指定要傳送訊息的 chatbot，這時可以使用 :ref:`config.json <config_trek>` 的工作流程參數檔案 ( :ref:`config_input_data`) 來設置 chatbot ID：

| 首先，我們要先取得 chatbot ID。先至 marvin 平台，也就是 Trek config.json 定義的 :ref:`marvin_url <marvin_url>`，到左側目錄中「資產管理」-> 「通訊帳號」點取要的 chatbot，從下方詳情視窗中找到 ID 欄位並把它複製起來：

.. image:: ../_static/images/marvin_chatbot.png

| 接著，將 chatbot ID 填入工作流程參數檔案，打開專案資料夾下 *sample.project/inputs/data.yaml*，編輯如下：

.. code-block:: yaml
    :linenos:

    2-3:                        # from node id - to node id
        bot_infos.0:                # property name
            type: string            # property type
            value: 'CH-bka3d88zc'   # property value: chatbot id

Step 5. Run
""""""""""""""""""""""""""""""""""""""""""""""""
| 接著開始在本機執行 workflow 。
| 提供兩種執行方式執行工作流程，擇一即可： :ref:`sample_auto_run`、:ref:`sample_manual_run`

.. _sample_auto_run:

方法 1. 自動執行
#########################

| 使用自動執行，當程式有異動時，使用 :doc:`run --auto <../../reference/cli/commands/run>` 自動偵測環境是否需要重啟。

.. code-block:: shell

    $ trek run --auto
    Warning! lost containers: [notification, callservice]
    auto re-UP
    starting blcks callservice...
    starting blcks notification...
    starting trek-router...
    Workflow [sample.project] start...
    [TRIGGER] id: 0, type: trigger, interval: 0
    [TRIGGER] id: 2, type: action, interval: 0
    [EXEC] id: 2, type: action, scriptId: callservice, scriptType: blcks
    [FINISH] id: 2, type: action, scriptId: callservice, scriptType: blcks
    [TRIGGER] id: 3, type: action, interval: 0
    [EXEC] id: 3, type: action, scriptId: notification, scriptType: blcks
    [FINISH] id: 3, type: action, scriptId: notification, scriptType: blcks
    [TRIGGER] id: 1, type: terminator, interval: 0
    [EXEC] id: 1, type: terminator, scriptId: , scriptType: not_script
    [FINISH] id: 1, type: terminator, scriptId: , scriptType: not_script
    Done. [sample.project]

.. _sample_manual_run:

方法 2. 手動執行
#########################

| 不需要靠系統自動偵測，直接手動啟動或停止執行環境。
| 當 ``config.json`` 的環境參數、或是 workflow template 的圖結構有異動時，需要重啟 (先 :doc:`../../reference/cli/commands/shutdownenv` 再 :doc:`../../reference/cli/commands/initenv`)。
| 首先使用指令 :doc:`../../reference/cli/commands/initenv` 啟動執行環境：

.. code-block:: shell

    $ trek initenv
    Starting environment...
    starting blcks callservice...
    starting blcks notification...
    starting trek-router...
    Done

.. code-block:: shell

    $ trek run
    Workflow [sample.project] start...
    [TRIGGER] id: 0, type: trigger, interval: 0
    [TRIGGER] id: 2, type: action, interval: 0
    [EXEC] id: 2, type: action, scriptId: callservice, scriptType: blcks
    [FINISH] id: 2, type: action, scriptId: callservice, scriptType: blcks
    [TRIGGER] id: 3, type: action, interval: 0
    [EXEC] id: 3, type: action, scriptId: notification, scriptType: blcks
    [FINISH] id: 3, type: action, scriptId: notification, scriptType: blcks
    [TRIGGER] id: 1, type: terminator, interval: 0
    [EXEC] id: 1, type: terminator, scriptId: , scriptType: not_script
    [FINISH] id: 1, type: terminator, scriptId: , scriptType: not_script
    Done. [sample.project]


| 執行完成後可以查看剛剛設定在 workflow template 的 chatbot，若 redis 連線異常會有告警訊息!
|
| 如果想要手動停止執行環境，可以使用 :doc:`../../reference/cli/commands/shutdownenv` 指令：

.. code-block:: shell

    $ trek shutdownenv
    Closing environment...
    closing blcks callservice...
    closing blcks notification...
    closing trek-router...
    Done


Step 6. Deploy
""""""""""""""""""""""""""""""""""""""""""""""""
| 當在本機開發測試一切就續後，我們可以透過佈署指令直接把腳本、工作流程安裝到 marvin 平台，並在 marvin 平台上實際上操作使用。
| Trek 提供兩種方法讓您佈佈署至 marvin 平台：:ref:`sample_auto_deploy`、:ref:`sample_manual_deploy`

.. _sample_auto_deploy:

方法 1. 自動佈署
#########################

自動佈署 :doc:`../../reference/cli/commands/deploy` 動作包含建置、打包、佈署：

.. code-block:: shell

    $ trek deploy -a --autobuildpush --autopack
    Deploy workflow with all packages...
    Deploying: {your_trek_project_path}/sample.project/bin/sample.project-0.0.0.zip
    Done

.. _sample_manual_deploy:

方法 2. 手動佈署
#########################

#.  :doc:`../../reference/cli/commands/build`: 手動佈署首先要建置腳本的 image 檔，但此範本專案使用的是下載的腳本，所以會查無腳本可以 build：

    .. code-block:: shell

        $ trek build
        Finish building. []

#.  :doc:`../../reference/cli/commands/push`: 將 image 檔推到 dockerhub 上，但此範本專案使用的是下載的腳本，所以會查無腳本可以 push：

    .. code-block:: shell

        $ trek push
        Finish pushing. []

#.  :doc:`../../reference/cli/commands/pack`: 打包要上傳到 marvin 平台的檔案：

    .. code-block:: shell

        $ trek pack -a
        Success packing, output: {your_trek_project_path}/sample.project/bin/sample.project-0.0.0.zip

#.  :doc:`../../reference/cli/commands/deploy`: 佈署至 marvin 平台：

    .. code-block:: shell

        $ trek deploy -a
        Deploy workflow with all packages...
        Deploying: {your_trek_project_path}/sample.project/bin/sample.project-0.0.0.zip
        Done



若 marvin 上已有相同的 workflow template 時會出現是否覆蓋的詢問訊息，輸入 y 直接覆蓋即可：

.. code-block:: shell

    Workflow duplicated: sample.project
    Do you want to overwrite remote template? [y/N]: y

恭喜! Trek 專案完成了。