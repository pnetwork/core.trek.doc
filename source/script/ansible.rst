
*********************
 Developer Ansible
*********************

You can use ``Trek`` CLI to create an Ansible project.

.. code:: console

    $ trek createansible myansible
    Ansible [myansible] creating...
    Done


And then, you got a new Ansible project named myansible.
You can write some codes in ``myansible.yml``

.. code:: yaml

    ---
    - name: myansible
        become: yes
        gather_facts: no
        hosts: hosts
        tasks:
        - command: "echo {{message}}"
        - command: "ls"
        - debug: 
            msg: "trek CLI ansible example"

Configuration
*************

| 當使用 Trek CLI 建立 Ansible 專案會產生以下的 *{your_ansible_project_path}/.trek/config.json*。

.. code:: json

    {
        "marvin_url": "",
        "marvin_JWT": "",
        "marvin_secret": "",
        "local_inventory_file": "",
        "input_event_path": "inputs/event.yml",
        "envs": {}
    }

| config.json 提供了專案、Global 兩種層級的設置，優先順序為專案 > Global。
| 若 Ansible 專案是處於 Trek 專案下 (即在其 `src/ansible/` 下) 則讀取的優先順序為 ``Ansible 專案設置 > Trek 專案設置 > Global 設置``。

設置中的 ``envs`` 是 Ansible 執行時讀取的環境變數。

| :ref:`local_inventory_file<config_local_inventory_file>` 為 Ansible inventory 環境設置檔；:ref:`input_event_path<config_input_event_path>` 為本機執行時指定的腳本輸入參數。
| 若想知道 *config.json* 的詳細介紹，請參考 :trekdoclink:`Configuring Properties<config/config_list.html>`


.. _ansible_default_inputs:

Default Inputs
**************

Ansible 腳本內定有幾個輸入參數，描述於 para 檔中：

.. list-table:: 
   :widths: 5 10 5 5
   :header-rows: 1

   * - Name
     - Description
     - Example
     - Required

   * - resourceIds
     -  要執行的遠端服務器 id，
        當填為 ``_local_`` 表示使用 ``local_inventory_file`` 的檔案，
        請參考 :trekdoclink:`Configuring Properties<config/config_list.html>`
     - S-okbrdo6as
     - No

   * - localhost
     - 表示是否直接在本地 (127.0.0.1) 執行腳本，執行 ``runansible`` 時加上 ``--localhost`` 可使用此功能，或是於 ``event.yml`` 將 localhost 設為 true 也會啟用
     - true
     - No

在 para 檔中的表示如下：

.. code:: yaml

    inputs:
      resourceIds:
        $ref: pn_ids_host
      localhost:
        type: boolean
        default: false


Working with Trek CLI
*********************

Trek can let you develop and test Ansible project in local machine.

1. create project

.. code:: console

    $ trek createansible myansible
    Ansible [myansible] creating...
    This utility will walk you through creating a config.json file.
    Marvin url []: https://your-marvin-url.com
    Marvin JWT []: marvinJTW
    Marvin secret []: marvinSecret
    Done

2. write your own code

3. execute Ansible in local machine

.. code:: console

    $ cd myansible
    $ trek runansible
    starting ansible myansible...

4. pack and deploy to Marvin

.. code:: console

    $ trek deployansible --autobuildpush -y
    Deploy Ansible script...
    Packing ansible: /Users/ansible_trek/myansible
    Success packing, output: /Users/ansible_trek/myansible/bin/ansible.myansible-0.1.0.zip
    Deploying: /Users/ansible_trek/myansible/bin/ansible.myansible-0.1.0.zip
    Done


Built-in Variables in Ansible Runner
************************************

There are some built-in variables that can be used in marvin ansible:

* ``authorization``: JWT token for caller 
* ``baseUrlWebhook``: Marvin URL
* ``pn_task_id``: Task ID for log tracking
