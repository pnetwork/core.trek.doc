Workflow Template Schema
--------------------------
| Workflow schema 為 ``yaml`` 格式，用來定義 workflow template 的流程長相。
| 在 Trek 專案中，workflow template 的位置預設在 ``{your_trek_project}/src/graph.yml``。
| Workflow template 描述檔主要分為三大區塊：

#. Workflow information：id, name, author...
#. Nodes：要做的任務 tasks、起點、終點或條件式。
#. Edges of nodes：描述任務之間的上下游關係、條件式內容、和傳遞 inputs/outputs 欄位值。

.. code-block:: yaml

    $schema: 'http://json-schema.pentium.network/marvin-workflows/0.1/schema'
    graph:
    metadata:
        { Workflow information... } 
    nodes:
        { Nodes... }
    edges:
        { Edges of nodes... }

| 

Workflow Metadata
-----------------------
定義 workflow template 的基本資料，可定義的欄位如下：

.. code-block:: yaml

    $schema: 'http://json-schema.pentium.network/marvin-workflows/0.1/schema'
    graph:
    metadata:
        version: 0.1.0                  # Workflow template version
        title: Redis monitor            # Name
        templateId: host.detect.redis   # Template id
        description: "Redis monitor"    # Description
        tags:                           # Tags，若無 tag 可以是 `tags: []`
        - redis
        author: mflow                   # Author

其中，``templateId`` 需為唯一值，當有兩個 workflow template 的 templateId 和 version 相同時，需要進版才能允許覆蓋。

| 

Workflow Nodes
-----------------------
| 定義 workflow 每個任務要做的事情、trigger 方式、和條件式。
| Node 類型有 4 種： ``action`` 、 ``selector`` 、 ``terminator`` 和 ``trigger``，以下將詳細介紹各類型的不同：

.. code-block:: yaml

      nodes:
        - metadata:             # 起點
            sources: []
            type: trigger 
            title: trigger
            description: ''
          id: '0'
        - metadata:             # 終點
            type: terminator
            title: terminator
            description: ''
          id: '1'
        - metadata:             # 要做的任務
            type: action            # Node type
            title: 'Notify'         # Name
            description: ''         # Description
            script: 
                id: notification    # 任務要執行的 Script id
          id: '5'                   # Node id，必須為數字
        - metadata:             # 條件式
            type: selector
            title: selector
          id: '4'

#. `type: action` : 指定腳本來達到要做的任務。
#. `type: selector` : 條件式節點，條件成立時才能往下走。
#. `type: terminator` : 終點。
#. `type: trigger` : 起點，決定 workflow trigger 方式為 ``定期`` 、 ``事件`` 或 ``手動``：

   #. 定期觸發： type 為 `cron`，data 填入 crontab 排程。
   
        .. code-block:: yaml

            - metadata:
                sources:
                - type: cron
                    data: '*/60 * * * *' # 每 60 分鐘觸發一次
                type: trigger
                ...
                
   #. 事件觸發： 需填入事件 id，{ event_version } 為非必填。
   
        .. code-block:: yaml

            - metadata:
                sources:
                - type: event
                data: network.pentium.platform.logging::{ event_id }::{ event_version }
                type: trigger
                ...

   #. 手動觸發：
   
        .. code-block:: yaml

            - metadata:
                sources: []
                type: trigger
                ...

| 

Workflow Edges of Nodes
--------------------------
| 傳遞每個任務之間的 inputs/outputs value 或定義條件式的條件內容。
| Edges 可以分成 3 種類型，``一般`` 、 ``無輸入/輸出值`` 以及 ``條件式``：

#. 一般： 設定目標 node 的 inputs 值。

    設定 ``nodeId = 2`` 的 input property ``tag_name`` 為 ``redis:unreachable``：

    .. code-block:: yaml

        - source: '0'                       # 來源 nodeId
          target: '2'                       # 目標 nodeId
          metadata:
              binding:
              - property: tag_name          # 目標 nodeId 的 inputs 欄位名稱
                value: 'redis:unreachable'  # 目標 nodeId 的 inputs 欄位值
                type: 'string'              # 目標 nodeId 的 inputs 欄位資料型態
                ...

#. 無輸入/輸出值：無 inputs/outputs 值需要傳遞，像是目標 node 為終點時。

    .. code-block:: yaml

        - source: '5' # 來源 nodeId
          target: '1' # 終點 nodeId

#. 條件式： `IF...THEN...` 當 ( `IF` ) 條件成立時，要 ( `THEN` ) 處理什麼事情 。

  以下範例為：當 ``nodeId=4`` 的 outputs 欄位 ``fail_hosts_count > 0`` 時，將訊息文字填入 ``nodeId=5`` 的 intputs 欄位 ``str_message``；其他情況則直接結束。

    .. code-block:: yaml
    
        - source: '4'                           # 來源 nodeId ，為條件式 node
          target: '5'                           # 目標 nodeId
          metadata:
              filters:                              # IF nodes.4.fail_hosts_count > 0
                property: nodes.4.fail_hosts_count  # 條件式比較欄位
                operator: '>'                       # 條件式比較方式
                value: 0                            # 條件式比較目標
              binding:                              # THEN 當 IF 條件成立時要設置的欄位
              - property: str_message               # nodeId=5 的 input str_message 欄位
                value: 'The following host redis connection fail: {{ 2.fail_hosts }}'
                type: 'string'
        - source: '4'                           # 來源 nodeId
          target: '1'                           # 目標 nodeId ，為終點 node
          metadata:
              filters:                              # IF nodes.4.fail_hosts_count <= 0
                property: nodes.4.fail_hosts_count  # 條件式比較欄位
                operator: '<='                      # 條件式比較方式
                value: 0                            # 條件式比較目標



.. note::

    完整的 workflow template 長相可以參考範例專案 :examplelink:`workflow template <src/graph.yml>`。
