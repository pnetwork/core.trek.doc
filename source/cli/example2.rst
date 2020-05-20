Redis connnection detect project
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| 假設我們的開發範例：
| 監控 redis 的連線，若連線不到標註 ``<redis:unreachable>`` 標籤，並發送 chatbot 通知。
| 因此 workflow 需要三個腳本：

1. 撈出特定服務器來檢查 redis 是否正常
2. 針對結果打上標籤
3. 發送通知 (若有不正常的)

其中 1 為此次新增腳本，2, 3 則為既有腳本可直接安裝

.. note::
    
    以下專案程式請參考 :examplelink:`範例專案 < >`。

Step 1. Create project
""""""""""""""""""""""""""""""""""""""""""""""""
| 開始建立一個 Trek 專案。
| 執行 :doc:`../../reference/cli/commands/createproject` 指令建立 Trek 專案「host.detect.redis」，接著會詢問是否要進行 ``config.json`` 的設置，每個 Trek 專案都有一份設定檔 ``config.json``，您可以決定要定義專案層級的設置、或是全局的設置，這裡問的是專案層級的設置，若不需要可以不輸入文字直接按下 enter：
| 想進一步了解 config 欄位 :ref:`請參考 <config_trek>`。

.. code-block:: shell

    $ trek createproject host.detect.redis
    Project [host.detect.redis] creating...
    This utility will walk you through creating a config.json file.
    Marvin url []:
    Marvin JWT []:
    Marvin secret []:
    Done

| 創建成功的 Trek 專案目錄結構會如下：
| 若想了解每個檔案、資料夾的意義請參考 :doc:`../start/project_folder`。

.. code-block:: shell

    $ tree -a host.detect.redis
    host.detect.redis/
    ├── .trek
    │   └── config.json
    ├──inputs
    │   ├── data.yml
    │   └── event.yml
    ├── manifest.json
    ├── packages.json
    └── src
        └── graph.yml


Step 2. Create blcks
""""""""""""""""""""""""""""""""""""""""""""""""
| 建立一個 blcks 腳本，用來檢查 redis 連線。
| 在專案目錄下，執行 :doc:`../../reference/cli/commands/createblcks` 指令產生 blcks detectredis 腳本：

.. code-block:: shell

    $ cd host.detect.redis
    $ trek createblcks detectredis
    Blcks [detectredis] creating...
    Done
    $ tree -a
    .
    ├── .trek
    │   └── config.json
    ├── inputs
    │   ├── data.yml
    │   └── event.yml
    ├── manifest.json
    ├── packages.json
    └── src
        ├── blcks
        │   └── detectredis
        │       ├── .gitignore
        │       ├── Makefile
        │       ├── detectredis.para
        │       ├── flake8.jenkins
        │       ├── handler
        │       │   ├── __init__.py
        │       │   ├── handler.py
        │       │   └── requirements.txt
        │       ├── openfaas.yml
        │       ├── requirements-test.txt
        │       ├── skaffold.yaml
        │       ├── tests
        │       │   ├── conftest.py
        │       │   └── test_blcks.py
        │       └── tox.ini
        └── graph.yml

| 產生的腳本位置於 :examplelink:`host.detect.redis/src/blcks/ <src/blcks/>`，接下來我們可以開始開發 blcks 腳本了。
| 首先，先制定腳本參數檔 para schema 於 :examplelink:`detectredis/detectredis.para <src/blcks/detectredis/detectredis.para>`，定義輸入輸出欄位長相：

    - Inputs: 服務器標籤。撈取含此標籤的服務器做檢查，此範例標籤會是 ``<redis>``；
    - Outputs: 連線不到的服務器、和其數量。

.. literalinclude:: ../../example/host.detect.redis/src/blcks/detectredis/detectredis.para
   :language: yaml
   :linenos:

| 接著，要開發主要的程式 :examplelink:`detectredis/handler/handler.py <src/blcks/detectredis/handler/handler.py>`：
| 撈取含 ``<redis>`` 的服務器，並檢查是否可連線，若連線失敗就把此台服務器加入 outputs，其中要注意：

- 主要程式會放在 process( ) function：

    - Function 參數 (tag_name) 與 para schema 的 inputs 欄位一致。
    - Function return (fail_hosts_count, fail_hosts...) 要與 para schema 的 outputs 定義的欄位一致。

- 在 ``handler.py`` 中可以使用 blcks sdk 提供的 service 來操作 Marvin 平台上的資產，請參考 :doc:`../../blcks/index` 。

.. literalinclude:: ../../example/host.detect.redis/src/blcks/detectredis/handler/handler.py
   :language: python
   :linenos:

接著，記得將主程式中使用的套件 ``redis`` 寫入 :examplelink:`handler/requirements.txt <src/blcks/detectredis/handler/requirements.txt>` 中：

.. literalinclude:: ../../example/host.detect.redis/src/blcks/detectredis/handler/requirements.txt
   :language: python
   :linenos:

Step 3. Install scripts
""""""""""""""""""""""""""""""""""""""""""""""""
| 從 script repository 下載安裝腳本。
| 執行安裝指令 :doc:`../../reference/cli/commands/install`，現在我們要安裝腳本：

- 資產設定標籤(blckssettags)
- 傳送訊息至指定頻道(notification)

.. code-block:: shell

    $ trek install notification
    saving: {your_trek_project_path}/host.detect.redis/trek_packages/script.zip
    100%|███████████████████████████████████████████████████████| 1/1 [00:00<00:00, 2949.58KB/s]
    extracting zip...
    notification:0.5.0 installed
    $ trek install blckssettags
    ...
    blckssettags:==0.3.0 installed
    $ tree -a
    .
    ├── .trek
    │   └── config.json
    ├── inputs
    ├── src
    │   ...
    └── trek_packages
        └── notification
            ├── notification.para
            └── openfaas.yml

| 安裝下載的腳本檔案放在 :examplelink:`trek_packages/ <trek_packages>` 資料夾下；同時將下載腳本寫入至依賴安裝描述檔 :examplelink:`packages.json <packages.json>`：

.. literalinclude:: ../../example/host.detect.redis/packages.json
   :language: json
   :linenos:

.. note::
    可下載的腳本清單來自 Pentium 提供的公眾腳本 :ref:`scripts_list`。

Step 4. Edit workflow template
""""""""""""""""""""""""""""""""""""""""""""""""
| 決定好腳本後，開啟專案下的 :examplelink:`src/graph.yml <src/graph.yml>` 開始編輯 workflow template 檔案，定義好整個工作流程：

.. literalinclude:: ../../example/host.detect.redis/src/graph.yml
   :language: yaml
   :linenos:

| 編輯完成，若要使用進階功能查看 workflow 流程圖，可以下指令 :doc:`graph <../../reference/cli/commands/graph>`：

.. code-block:: shell

    $trek graph --show
    digraph "host.detect.redis" {
        dpi=150 rankdir=LR size="8,5"
        0 [label=trigger shape=oval]
        1 [label=terminator shape=oval]
        2 [label=detectredis shape=box]
        3 [label=blckssettags shape=box]
        4 [label=selector shape=diamond]
        5 [label=notification shape=box]
        0 -> 2 [label="0-2"]
        2 -> 3 [label="2-3"]
        3 -> 4 [label="3-4"]
        4 -> 5 [label="4-5"]
        4 -> 1 [label="4-1"]
        5 -> 1 [label="5-1"]
    }

.. image:: ../_static/images/graph.png

Step 5. Run
""""""""""""""""""""""""""""""""""""""""""""""""
| 開發和安裝都完成後，我們可以在本機執行了。
| 提供兩種執行方式執行工作流程，擇一即可： :ref:`auto_run`、:ref:`manual_run`


.. _auto_run:

方法 1. 自動執行
#########################

| 使用自動執行，當程式有異動時，使用 :doc:`run --auto <../../reference/cli/commands/run>` 自動偵測環境是否需要重啟。

.. code-block:: shell

    $ trek run --auto
    Warning! lost containers: [notification, detectredis]
    auto re-UP
    starting blcks detectredis...
    starting blcks blckssettags...
    starting blcks notification...
    starting trek-router...
    Workflow [host.detect.redis] start...
    [TRIGGER] id: 0, type: trigger, interval: 0
    [TRIGGER] id: 2, type: action, interval: 0
    [EXEC] id: 2, type: action, scriptId: detectredis, scriptType: blcks
    [FINISH] id: 2, type: action, scriptId: detectredis, scriptType: blcks
    [TRIGGER] id: 3, type: action, interval: 0
    [EXEC] id: 3, type: action, scriptId: blckssettags, scriptType: blcks
    [FINISH] id: 3, type: action, scriptId: blckssettags, scriptType: blcks
    [TRIGGER] id: 4, type: selector, interval: 0
    [EXEC] id: 4, type: selector, scriptId: , scriptType: not_script
    [FINISH] id: 4, type: selector, scriptId: , scriptType: not_script
    [TRIGGER] id: 1, type: terminator, interval: 0
    [EXEC] id: 1, type: terminator, scriptId: , scriptType: not_script
    [FINISH] id: 1, type: terminator, scriptId: , scriptType: not_script
    Done. [host.detect.redis]

.. _manual_run:

方法 2. 手動執行
#########################

| 不需要靠系統自動偵測，直接手動啟動或停止執行環境。
| 當 ``config.json`` 的環境參數、或是 workflow template 的圖結構有異動時，需要重啟 (先 :doc:`../../reference/cli/commands/shutdownenv` 再 :doc:`../../reference/cli/commands/initenv`)。
| 首先使用指令 :doc:`../../reference/cli/commands/initenv` 啟動執行環境：

.. code-block:: shell

    $ trek initenv
    Starting environment...
    starting blcks detectredis...
    starting blcks blckssettags...
    starting blcks notification...
    starting trek-router...
    Done

.. code-block:: shell

    $ trek run
    Workflow [host.detect.redis] start...
    [TRIGGER] id: 0, type: trigger, interval: 0
    [TRIGGER] id: 2, type: action, interval: 0
    [EXEC] id: 2, type: action, scriptId: detectredis, scriptType: blcks
    [FINISH] id: 2, type: action, scriptId: detectredis, scriptType: blcks
    [TRIGGER] id: 3, type: action, interval: 0
    [EXEC] id: 3, type: action, scriptId: blckssettags, scriptType: blcks
    [FINISH] id: 3, type: action, scriptId: blckssettags, scriptType: blcks
    [TRIGGER] id: 4, type: selector, interval: 0
    [EXEC] id: 4, type: selector, scriptId: , scriptType: not_script
    [FINISH] id: 4, type: selector, scriptId: , scriptType: not_script
    [TRIGGER] id: 1, type: terminator, interval: 0
    [EXEC] id: 1, type: terminator, scriptId: , scriptType: not_script
    [FINISH] id: 1, type: terminator, scriptId: , scriptType: not_script
    Done. [host.detect.redis]


| 執行完成後可以查看剛剛設定在 workflow template 的 chatbot，若 redis 連線異常會有告警訊息!
|
| 如果想要手動停止執行環境，可以使用 :doc:`../../reference/cli/commands/shutdownenv` 指令：

.. code-block:: shell

    $ trek shutdownenv
    Closing environment...
    closing blcks detectredis...
    closing blcks blckssettags...
    closing blcks notification...
    closing trek-router...
    Done


Step 6. Deploy
""""""""""""""""""""""""""""""""""""""""""""""""
| 當在本機開發測試一切就續後，我們可以透過佈署指令直接把腳本、工作流程安裝到 marvin 平台，並在 marvin 平台上實際上操作使用。
| Trek 提供兩種方法讓您佈佈署至 marvin 平台：:ref:`auto_deploy`、:ref:`manual_deploy`

.. _auto_deploy:

方法 1. 自動佈署
#########################

自動佈署 :doc:`../../reference/cli/commands/deploy` 動作包含建置、打包、佈署：

.. code-block:: shell

    $ trek deploy -a --autobuildpush --autopack
    Deploy workflow with all packages...
    Build blcks: detectredis
    Path: {your_trek_project_path}/host.detect.redis/src/blcks/detectredis/handler
    1: Pulling from baseimg/python3-blcks-flask
    bdf0201bxxx: Already exists
    ...
    building blcks [detectredis]...
    Step 1/30 : FROM dockerhub.pentium.network/baseimg/faas-python3-flask:20191018-0448e4d as builder
    ...
    Blcks image complete.
    Finish building. [detectredis]
    Push blcks: detectredis
    Path: {your_trek_project_path}/host.detect.redis/src/blcks/detectredis/handler
    Push image: {your_dockerhub_path}/detectredis:0.1.0
    The push refers to repository [{your_dockerhub_path}/detectredis]
    ...
    Finish pushing. [detectredis]
    Success packing, output: {your_trek_project_path}/host.detect.redis/bin/host.detect.redis-0.0.0.zip
    Packing blcks: {your_trek_project_path}/host.detect.redis/src/blcks/detectredis
    Success packing, output: {your_trek_project_path}/host.detect.redis/bin/blcks.detectredis-0.1.0.zip
    Deploying: {your_trek_project_path}/host.detect.redis/bin/host.detect.redis-0.0.0.zip
    Done

.. _manual_deploy:

方法 2. 手動佈署
#########################

#.  :doc:`../../reference/cli/commands/build`: 手動佈署首先要建置腳本的 image 檔

    .. code-block:: shell

        $ trek build
        Build blcks: detectredis
        Path: {your_trek_project_path}/host.detect.redis/src/blcks/detectredis/handler
        1: Pulling from baseimg/python3-blcks-flask
        Digest: sha256:3d3a3b209e77xxxx
        Status: Image is up to date for dockerhub.pentium.network/baseimg/python3-blcks-flask:1
        building blcks [detectredis]...
        ...
        Successfully built 6a61xxx
        Successfully tagged {your_dockerhub_path}/detectredis:0.1.0
        Blcks image complete.
        Finish building. [detectredis]

#.  :doc:`../../reference/cli/commands/push`: 將 image 檔推到 dockerhub 上

    .. code-block:: shell

        $ trek push
        Push blcks: detectredis
        Path: {your_trek_project_path}/host.detect.redis/src/blcks/detectredis/handler
        Push image: {your_dockerhub_path}/detectredis:0.1.0
        The push refers to repository [{your_dockerhub_path}/detectredis] 
        ...
        Finish pushing. [detectredis]

#.  :doc:`../../reference/cli/commands/pack`: 打包要上傳到 marvin 平台的檔案：

    .. code-block:: shell

        $ trek pack -a
        Success packing, output: {your_trek_project_path}/host.detect.redis/bin/host.detect.redis-0.0.0.zip 
        Packing blcks: {your_trek_project_path}/host.detect.redis/src/blcks/detectredis
        Success packing, output: {your_trek_project_path}/host.detect.redis/bin/blcks.detectredis-0.1.0.zip

#.  :doc:`../../reference/cli/commands/deploy`: 佈署至 marvin 平台：

    .. code-block:: shell

        $ trek deploy -a
        Deploy workflow with all packages...
        Deploying: {your_trek_project_path}/host.detect.redis/bin/blcks.detectredis-0.1.0.zip
        Deploying: {your_trek_project_path}/host.detect.redis/bin/host.detect.redis-0.0.0.zip
        Done

恭喜! Trek 專案完成了。