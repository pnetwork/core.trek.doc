************************
Para Schema
************************
Para schema 為 yaml 格式，用來定義腳本的輸入、輸出。
在 Blcks 專案中，Blcks para file 通常以 Blcks function name 方式命名，para file 的位置預設在 ``{your_Blcks_project}/{Blcks_function_name}.para``。

Where is para file?
***********************************
以 Blcks 專案來說，使用 :doc:`trek createblcks <../../reference/cli/commands/createblcks>` detectredis 指令建立 Blcks 專案時，會產生一個 :exlink:`detectredis/ <src/blcks/>` 資料夾，主程式檔案 :exblckslink:`handler/handler.py <handler/handler.py#L14>` 會以 ``detectredis`` 當作 openfaas function name，同時產生一個 :exblckslink:`detectredis.para <detectredis.para#L12>` 參數設定檔。

.. code-block:: shell
    :emphasize-lines: 6, 11,15

    $ trek createblcks detectredis
    Blcks [detectredis] creating...
    Done
    $ tree -a
    .
    └── detectredis
        ├── .gitignore
        ├── .trek
        │   └── config.json
        ├── Makefile
        ├── detectredis.para
        ├── flake8.jenkins
        ├── handler
        │   ├── __init__.py
        │   ├── handler.py
        │   └── requirements.txt
        ├── inputs
        │   └── event.yml
        ├── openfaas.yml
        ├── requirements-test.txt
        ├── skaffold.yaml
        ├── tests
        │   ├── conftest.py
        │   └── test_blcks.py
        └── tox.ini

.. list-table:: 
   :widths: 20 80
   :class: noborder

   * - .. code-block:: yaml
            :linenos:
            :emphasize-lines: 3

            # detectredis.para
            ---
            id: detectredis
            schemaVersion: '0.2'
            name: detectredis
            title: detectredis
            version: "0.1.0"
            description: ""
            namespace: network.pentium
            assets:
                - SCRIPT

            required:
                - tag_name

            inputs:
                message:
                    name: test input
                    title: test input
                    type: string

            outputs:
                code:
                    name: result message code
                    title: result message code
                    type: integer
                    description: ""
                msg:
                    name: result message
                    title: result message
                    type: string
                    description: ""
                result:
                    name: result
                    title: result
                    type: string
                    description: ""
     - .. code-block:: python
            :linenos:
            :emphasize-lines: 4, 13

            # handler/handler.py
            from blcks import blcks

            FAAS_METHOD_NAME = "detectredis"
            logger = blcks.logger


            @blcks
            def main(event, context):
                pass


            @blcks.script(FAAS_METHOD_NAME)
            def process(message):
                result = {
                    "code": 0,
                    "msg": message,
                    "result": "success",
                }
                # Doing something here...
                print(message)
                return result 

How to defind the para schema?
**********************************************
Para schema 可以區分為三大區塊，我們會一一做介紹：

    | :ref:`para_metadata`：Id, name, assets...
    | :ref:`para_inputs`：定義腳本的輸入欄位。
    | :ref:`para_require`：定義腳本的輸入欄位哪些是必填。
    | :ref:`para_outputs`：定義腳本的回傳欄位。

| Para 的 inputs 和 outputs 欄位決定的是腳本主程式的輸入輸出，以 Blcks 來說，主程式就是 :exblckslink:`handler/handler.py process function <handler/handler.py#L15>`，下面以 Blcks 專案來說明：

#. Function parameters 需和 :exblckslink:`detectredis.para <detectredis.para>` 的 inputs 欄位相同。
#. Function 回傳的結果也需和 :exblckslink:`detectredis.para <detectredis.para>` 的 outputs 欄位相同。

.. code-block:: yaml
   :linenos:

    id: detectredis
    { Para metadata... }
    inputs:
        { Para inputs column... }
    required:
        { Para inputs required column... }
    outputs:
        { Para outputs column... }

|

.. _para_metadata:

1. Para Metadata
^^^^^^^^^^^^^^^^^^^^
定義腳本 para 的基本資料，可定義的欄位如下：

.. code-block:: yaml
   :linenos:

    id: detectredis                                 # 腳本 Id
    schemaVersion: '0.2'                            # Para schema version
    name: Redis connection monitor                  # 腳本名稱
    title: Redis connection monitor                 # Title
    version: "0.1.0"                                # 腳本 version
    description: "Detect host redis connection."    # Description
    namespace: network.pentium                      # 腳本 namespace
    assets:                                         # 腳本所屬資產類型
        - HOST                        


| 其中，``id`` 需為唯一值，當有兩個 para 的 id 和 version 相同時，需要進版才能允許覆蓋。
| assets 為腳本的所屬的資產類型，可以是多類型，共有以下種類：

.. code-block:: yaml
   :linenos:

    assets:             # 腳本所屬資產類型
        - SCRIPT            # 腳本
        - HOST              # 服務器
        - DOMAIN            # 域名
        - CDN               # CDN
        - CLOUDACCOUNT      # 雲帳號
        - CERTIFICATE       # 憑證

| 

.. _para_inputs:

2. Para Inputs
^^^^^^^^^^^^^^^^^^^^
| 定義腳本允許的傳入參數，在 inputs 下定義每個輸入欄位：
| 欄位需與主程式 :exblckslink:`handler/handler.py process function <handler/handler.py#L15>` 的傳入參數相同。

.. code-block:: yaml
   :linenos:

    inputs:
        tag_name:
            name: Tag name
            title: Tag name
            type: string
        array_tags_name:
            type: array
            description: The tags name.
            title: Tags name array.
            items:
                type: string

輸入欄位大致分成兩種 :ref:`para_inputs1`、和Pentium 提供的 :ref:`para_inputs2`：

.. _para_inputs1:

2.1. 一般的欄位定義
######################
提供以下欄位資料型態：

.. list-table:: 
   :widths: 20 80
   :header-rows: 1

   * - Inputs Data Type
     - Example
   * - string
     - .. code-block:: yaml

            tag_name:
                name: Tag name
                title: Tag name
                type: string
   * - number
     - .. code-block:: yaml

            expired_within_days:
                name: 幾天後過期
                title: 幾天後過期
                type: integer
                description: 幾天後過期(>0)：範例 10
                examples:
                - 10
   * - boolean
     - .. code-block:: yaml
            
            has_any_valid_project:
                name: 是否通過任一白名單項目
                title: 是否通過任一白名單項目
                description: 是否通過任一白名單項目
                type: boolean
                examples:
                - true
   * - string enum
     - .. code-block:: yaml

            provider:
                type: string
                description: The provider name of IM which only slack, telegram and potato are supported.
                title: The provider of IM.
                enum:
                - slack
                - telegram
                - potato
                enumNames:
                - slack
                - telegram
                - potato
                example: telegram
   * - object
     - .. code-block:: yaml

            certificate:
                title: SSL证书
                type: object
                description: SSL证书
                examples: "{'source': 'NEW', 'name': 'cert_name', 'certificate': 'xxx'}"
   * - array
     - .. code-block:: yaml

            # array of string
            array_tags_name:
                type: array
                description: The tags name.
                title: Tags name array.
                items:
                    type: string
            
            # array of object
            expired_hosts:
                name: 到期服务器列表
                title: 到期服务器列表
                type: array
                description: 到期服务器列表
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

|

.. _para_inputs2:

2.2. 特化輸入欄位定義
#####################
Pentium 提供特別的欄位資料型態，可以在 marvin 上顯示選取資產多選欄、textarea... 的特殊顯示欄位：

.. list-table:: 
   :widths: 10 20 70
   :header-rows: 1

   * - Inputs Data Type
     - Description
     - Example
   * - pn_ids_host
     - 顯示服務器資產清單列表的多選選單
     - .. code-block:: yaml

            resourceIds:
                $ref: pn_ids_host
   * - pn_ids_domain
     - 顯示域名資產清單列表的多選選單
     - .. code-block:: yaml

            resourceIds:
                $ref: pn_ids_domain
   * - pn_ids_cdn
     - 顯示 CDN 資產清單列表的多選選單
     - .. code-block:: yaml

            resourceIds:
                $ref: pn_ids_cdn
   * - pn_ids_script
     - 顯示腳本清單列表的多選選單
     - .. code-block:: yaml

            resourceIds:
                $ref: pn_ids_script
   * - pn_ids_chatpair
     - 顯示通訊帳號資產清單列表的多選選單
     - .. code-block:: yaml

            bot_infos:
                $ref: pn_ids_chatpair
   * - pn_id_keypair
     - 顯示密鑰資產清單列表的多選選單
     - .. code-block:: yaml

            key_id:
                $ref: pn_id_keypair

   * - pn_sp_password
     - 輸入文字有密碼遮罩的 input text
     - .. code-block:: yaml

            password:
                $ref: pn_sp_password
   * - pn_sp_change_password
     - | 修改密碼用，含 [舊密碼] 和 [新密碼] 的 input text，
       | 輸入文字皆有密碼遮罩
     - .. code-block:: yaml

            password:
                $ref: pn_sp_change_password
   * - pn_sp_textarea_str
     - 支援多行的文字輸入欄位
     - .. code-block:: yaml

            str_message:
                name: Message context.
                title: Message context.
                description: The message used to send to the specified channel.
                $ref: pn_sp_textarea_str
   * - pn_sp_textarea_array
     - 支援多行的文字輸入欄位，傳至腳本後為 array of string。
     - .. code-block:: yaml

            str_message:
                name: Message context.
                title: Message context.
                description: The message used to send to the specified channel.
                $ref: pn_sp_textarea_str
   * - pn_id_cloudcredential
     - | 雲帳號資產用，含 [提供商]、[帳號] 以及 [密鑰]
       | 的下拉式選單
     - .. code-block:: yaml

            resolverKey:
                $ref: pn_id_cloudcredential
   * - pn_sp_nsrecord
     - | 域名注册商資訊用，包含 [域名解析商]、[帳號]、[密鑰] 
       | 的下拉式選單，和 [NS] 的 input text
     - .. code-block:: yaml

            resolver:
                $ref: pn_sp_nsrecord
   * - pn_sp_origins
     - CDN origins，包含 [源站協議]、[源站類型]、[源站地址]
     - .. code-block:: yaml

            data:
                name: CDN origins.
                title: CDN origins.
                description: CDN origins.
                $ref: pn_sp_origins

| 

.. _para_require:

3. Para Inputs Required
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
腳本輸入欄位的必填值，若沒有必填值可不用填：


.. code-block:: yaml
   :linenos:

    required:
        - bot_infos
        - str_message

|

.. _para_outputs:

4. Para Outputs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| 執行完腳本後的回傳欄位，可以給下一個腳本做 input 使用。
| 欄位需與主程式 :exblckslink:`handler/handler.py process function <handler/handler.py#L15>` 的回傳值相同。

.. code-block:: yaml
   :linenos:

    outputs:
        code:
            name: result message code
            title: result message code
            type: integer
            description: ""

回傳欄位定義方式請參考 :ref:`para_inputs1`。
