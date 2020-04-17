Extension Supported Commands
=============================
Trek vscode extension 讓您在 vscode 上輕鬆的開發 Marvin 自動化腳本、工作流程，透過 vscode 的命令即可在本機測試、以及把完成的腳本/工作流程打包佈署至您的 Marvin 平台。

Before you begin
------------------------
- 請先安裝 trek cli tool，如何安裝 :ref:`可參考 <install_trek>`。
- 請先準備好 Pentium trek vscode extension 的 vsix 安裝檔。
- 以下會經常用到快捷鍵 Ctrl+Shit+P ( or ⌘+⇧+P ) 呼叫出 Command Palette 並執行 trek vscode extension 指令，故接下來不再贅述。
- mflow vscode extension 指令都以「mflow: XXX」方式命名。
- 本機必需要有啟動中的 docker。

.. include:: install.rst

.. include:: config.rst

Command list
------------------------
.. TODO

The first trek project
------------------------
| 假設我們的開發範例：
| 監控 redis 的連線，若連線不到標註 <redis:unreachable> 標籤，並發送 chatbot 通知。
| 因此 workflow 需要三個腳本：

1. 撈出特定服務器來檢查 redis 是否正常
2. 針對結果打上標籤
3. 發送通知 (若有不正常的)

其中 1 為此次新增腳本，2, 3 則為既有腳本可直接安裝

Create project
~~~~~~~~~~~~~~~~~~
| 使用 Command Palette 叫出「Trek: Create Project」指令，並填入以下資訊：

.. image:: ../../_static/images/create_project.gif

#. 選擇專案存放位置
#. 輸入專案名稱為「host.detect.redis」
#. 輸入「N」不產生範本專案
#. 右下角顯示建立專案成功訊息，並以 workspace 方式開啟專案

Create blcks
~~~~~~~~~~~~~~~


Install scripts
~~~~~~~~~~~~~~~

Run
~~~~~~~~~~~~~~~


Deploy
~~~~~~~~~~~~~~~
