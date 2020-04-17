CLI Supported Commands
=========================
Trek CLI 指令工具將輔助您輕易的開發 Marvin 自動化腳本、工作流程，只需要幾個指令即可在本機測試、以及把完成的腳本/工作流程打包佈署至您的 Marvin 平台。

.. note:: Trek CLI 工具安裝方法 :ref:`請參考 <install_trek>`。

Command list
------------------------

.. toctree::
   :maxdepth: 1
   :glob:

   ../reference/clikit/commands/*

The first trek project
------------------------

Step 1. Create project
^^^^^^^^^^^^^^^^^^^^^^^^
| 開始建立一個 trek 專案。
| 執行 createproject 指令建立 hello_trek_project 專案，同時它會問你是否要設定 marvin 相關專案層級的設置，若不需要專案層級的設置則可不輸入文字直接按下 enter：

.. code-block:: shell

    $ trek createproject hello_trek_project
    Project [hello_trek_project] creating...
    This utility will walk you through creating a config.json file.
    Marvin url []:
    Marvin JWT []:
    Marvin secret []:
    Done

| 每個 trek 專案都有一份設定檔 ``config.json``，您可以決定要定義專案層級的設置、或是全局的設置，config 詳細欄位介紹 :ref:`請參考 <config_trek>`。

| 創建成功的 trek 專案目錄結構會如下：

.. code-block:: shell

    $ tree hello_trek_project
    hello_trek_project/
    ├── .trek
    │   └── config.json
    ├──inputs
    │   ├── data.yml
    │   └── event.yml
    ├── manifest.json
    ├── packages.json
    └── src
        └── graph.yml

| 若想了解每個檔案、資料夾的意義請參考 :doc:`../start/project_folder` 。


Step 2. Create blcks
^^^^^^^^^^^^^^^^^^^^^^^^^
| 建立一個 blcks 腳本。
| 在專案目錄下，執行 blcks create 指令產生 blcks Hello world 專案：

.. code-block:: shell

    $ cd hello_trek_project
    $ trek createblcks blckssayhello
    Blcks [blckssayhello] creating...
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
        │   └── blckssayhello
        │       ├── .gitignore
        │       ├── Makefile
        │       ├── blckssayhello.para
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

| 接下來我們可以開始開發 blcks 腳本了。
| 首先，先制定腳本參數檔 para schema，定義 inputs/outputs 的長相，輸入為訊息的前綴詞，輸出為組合後的訊息：

.. code-block:: yaml

    id: blckssayhello
    schemaVersion: '0.2'
    name: say hello
    title: say hello
    version: "0.1.0"
    description: ""
    namespace: network.pentium
    assets:
    - SCRIPT

    inputs:
    message:
        name: Prefix words
        title: Prefix words
        type: string

    outputs:
    msg:
        name: The result message
        title: The result message
        type: string

| 接著，要開發主要的程式 `src/blcks/blckssayhello/handler/handler.py`

.. code-block:: python

    from blcks import blcks

    FAAS_METHOD_NAME = "blckssayhello"
    logger = blcks.logger


    @blcks
    def main(event, context):
        pass


    @blcks.script(FAAS_METHOD_NAME)
    def process(message):
        hello = "Hello"
        result = {
            "msg": message + " " + hello
        }

        return result

| 到目前為止，您已完成開發 blcks 腳本。

.. warning:: 注意! process function 的參數與 return 要跟 para schema 定義的一致。

Step 3. Install scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^
| 從 script repository 安裝腳本。
| 執行安裝指令，現在我們要安裝最新的 notification 腳本：

.. code-block:: shell

    $ trek install notification
    saving: {your_trek_project_path}/hello_trek_project/trek_packages/script.zip
    100%|███████████████████████████████████████████████████████| 1/1 [00:00<00:00, 2949.58KB/s]
    extracting zip...
    notification:0.5.0 installed
    $ tree -a
    .
    ├── .trek
    │   └── config.json
    ├── inputs
    │   ├── data.yml
    │   └── event.yml
    ├── manifest.json
    ├── packages.json
    ├── src
    │   ├── blcks
    │   │   └── blckssayhello
    │   │       ...
    │   └── graph.yml
    └── trek_packages
        └── notification
            ├── notification.para
            └── openfaas.yml

| 安裝下載的腳本檔案放在 ``./trek_packages/`` 資料夾下； 同時也寫入一筆腳本至依賴安裝描述檔 ``packages.json`` ：

.. code-block:: json

    {
        "packages": {
            "notification": "==0.5.0"
        }
    }

Step 4. Edit workflow template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 決定好腳本後，開始編輯 workflow template 檔案，定義好整個工作流程：

.. code-block:: yaml

    $schema: 'http://json-schema.pentium.network/marvin-workflows/0.1/schema'
    graph:
    metadata:
        version: 0.0.0
        title: Send hello message
        templateId: hello_trek_project
        description: "my workflow"
        tags: []
        author: Pentium
    nodes:
        - metadata:
            sources: []
            type: trigger
            title: trigger
            description: ''
        id: '0'
        - metadata:
            type: action
            title: 'Get message'
            description: ''
            script: 
            id: blckssayhello
        id: '2'
        - metadata:
            type: action
            title: 'Send message'
            description: 'Send message to chatbot'
            script: 
            id: notification
        id: '3'
        - metadata:
            type: terminator
            title: terminator
            description: ''
        id: '1'
    edges:
        - source: '0'
        target: '2'
        metadata:
            binding:
            - property: message
            value: 'Pentium'
            type: 'string'
        - source: '2'
        target: '3'
        metadata:
            binding:
            - property: str_message
            value: '{{ 2.msg }}'
            type: 'string'
            - property: bot_infos.0
            value: '{input your chatbot id}' # 此欄位為 chatbot id，請依 marvin 平台設置
            type: 'string'
        - source: '3'
          target: '1'



Step 5. Run
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 開發和安裝都完成後，我們可以在本機執行了。
| 提供兩種執行方式執行工作流程，擇一即可： :ref:`auto_run`、:ref:`manual_run`

.. _auto_run:

方法 1. 自動執行
"""""""""""""""""""""""""""""""""""""""""""""
| 使用自動執行，當程式有異動時，使用 auto option 自動偵測環境是否需要重啟。

.. code-block:: shell

    $ trek run --auto
    Warning! lost containers: [notification, blckssayhello]
    auto re-UP
    starting blcks blckssayhello...
    starting blcks notification...
    starting trek-router...
    Workflow [hello_trek_project] start...
    [TRIGGER] id: 0, type: trigger, interval: 0
    [TRIGGER] id: 2, type: action, interval: 0
    [EXEC] id: 2, type: action, scriptId: blckssayhello, scriptType: blcks
    [FINISH] id: 2, type: action, scriptId: blckssayhello, scriptType: blcks
    [TRIGGER] id: 3, type: action, interval: 0
    [EXEC] id: 3, type: action, scriptId: notification, scriptType: blcks
    [FINISH] id: 3, type: action, scriptId: notification, scriptType: blcks
    [TRIGGER] id: 1, type: terminator, interval: 0
    [EXEC] id: 1, type: terminator, scriptId: , scriptType: not_script
    [FINISH] id: 1, type: terminator, scriptId: , scriptType: not_script
    Done. [hello_trek_project]

.. _manual_run:

方法 2. 手動執行
"""""""""""""""""""""""""""""""""""""""""""
| 不需要靠系統自動偵測，直接手動啟動或停止執行環境。
| 當 ``config.json`` 的環境參數、或是 workflow template 的圖結構有異動時，需要重啟 (先 shutdownenv 再 initenv)。
| 首先使用指令 initenv 啟動執行環境：

.. code-block:: shell

    $ trek initenv
    Starting environment...
    starting blcks blckssayhello...
    starting blcks notification...
    starting trek-router...
    Done

.. code-block:: shell

    $ trek run
    Workflow [hello_trek_project] start...
    [TRIGGER] id: 0, type: trigger, interval: 0
    [TRIGGER] id: 2, type: action, interval: 0
    [EXEC] id: 2, type: action, scriptId: blckssayhello, scriptType: blcks
    [FINISH] id: 2, type: action, scriptId: blckssayhello, scriptType: blcks
    [TRIGGER] id: 3, type: action, interval: 0
    [EXEC] id: 3, type: action, scriptId: notification, scriptType: blcks
    [FINISH] id: 3, type: action, scriptId: notification, scriptType: blcks
    [TRIGGER] id: 1, type: terminator, interval: 0
    [EXEC] id: 1, type: terminator, scriptId: , scriptType: not_script
    [FINISH] id: 1, type: terminator, scriptId: , scriptType: not_script
    Done. [hello_trek_project]


| 執行完成後可以查看剛剛設定在 workflow template 的 chatbot，會有 Pentium hello 的訊息!
|
| 如果想要手動停止執行環境，可以使用以下指令：

.. code-block:: shell

    $ trek shutdownenv
    Closing environment...
    closing blcks blckssayhello...
    closing blcks notification...
    closing trek-router...
    Done


Step 6. Deploy
^^^^^^^^^^^^^^^^^^^^^^^^
| 當在本機開發測試一切就續後，我們可以透過佈署指令直接把腳本、工作流程安裝到 marvin 平台，並在 marvin 平台上實際上操作使用。
| Trek 提供兩種方法讓您佈佈署至 marvin 平台：:ref:`auto_deploy`、:ref:`manual_deploy`

.. _auto_deploy:

方法 1. 自動佈署
"""""""""""""""""""""""""""""""""""""""""""
自動佈署動作包含建置、打包、佈署：

.. code-block:: shell

    $ trek deploy -a --autobuildpush --autopack
    Deploy workflow with all packages...
    Build blcks: blckssayhello
    Path: {your_trek_project_path}/hello_trek_project/src/blcks/blckssayhello/handler
    1: Pulling from baseimg/python3-blcks-flask
    bdf0201bxxx: Already exists
    ...
    building blcks [blckssayhello]...
    Step 1/30 : FROM dockerhub.pentium.network/baseimg/faas-python3-flask:20191018-0448e4d as builder
    ...
    Blcks image complete.
    Finish building. [blckssayhello]
    Push blcks: blckssayhello
    Path: {your_trek_project_path}/hello_trek_project/src/blcks/blckssayhello/handler
    Push image: {your_dockerhub_path}/blckssayhello:0.1.0
    The push refers to repository [{your_dockerhub_path}/blckssayhello]
    ...
    Finish pushing. [blckssayhello]
    Success packing, output: {your_trek_project_path}/hello_trek_project/bin/hello_trek_project-0.0.0.zip
    Packing blcks: {your_trek_project_path}/hello_trek_project/src/blcks/blckssayhello
    Success packing, output: {your_trek_project_path}/hello_trek_project/bin/blcks.blckssayhello-0.1.0.zip
    Deploying: {your_trek_project_path}/hello_trek_project/bin/hello_trek_project-0.0.0.zip
    Done

.. _manual_deploy:

方法 2. 手動佈署
"""""""""""""""""""""""""""""""""""""""""""

#. Build：手動佈署首先要建置腳本的 image 檔

    .. code-block:: shell

        $ trek build
        Build blcks: blckssayhello
        Path: {your_trek_project_path}/hello_trek_project/src/blcks/blckssayhello/handler
        1: Pulling from baseimg/python3-blcks-flask
        Digest: sha256:3d3a3b209e77xxxx
        Status: Image is up to date for dockerhub.pentium.network/baseimg/python3-blcks-flask:1
        building blcks [blckssayhello]...
        ...
        Successfully built 6a61xxx
        Successfully tagged {your_dockerhub_path}/blckssayhello:0.1.0
        Blcks image complete.
        Finish building. [blckssayhello]

#. Push: 將 image 檔推到 dockerhub 上

    .. code-block:: shell

        $ trek push
        Push blcks: blckssayhello
        Path: {your_trek_project_path}/hello_trek_project/src/blcks/blckssayhello/handler
        Push image: {your_dockerhub_path}/blckssayhello:0.1.0
        The push refers to repository [{your_dockerhub_path}/blckssayhello] 
        ...
        Finish pushing. [blckssayhello]

#. Pack: 打包要上傳到 marvin 平台的檔案：

    .. code-block:: shell

        $ trek pack -a
        Success packing, output: {your_trek_project_path}/hello_trek_project/bin/hello_trek_project-0.0.0.zip 
        Packing blcks: {your_trek_project_path}/hello_trek_project/src/blcks/blckssayhello
        Success packing, output: {your_trek_project_path}/hello_trek_project/bin/blcks.blckssayhello-0.1.0.zip

#. Deploy: 佈署至 marvin 平台：

    .. code-block:: shell

        $ trek deploy -a
        Deploy workflow with all packages...
        Deploying: {your_trek_project_path}/hello_trek_project/bin/blcks.blckssayhello-0.1.0.zip
        Deploying: {your_trek_project_path}/hello_trek_project/bin/hello_trek_project-0.0.0.zip
        Done

恭喜! 第一個 trek 專案完成了。