System Requirements
------------------------

在安裝前請確認系統是否符合需求：

* VSCode 1.41.0+ ( |vscode_link| )
* Trek CLI 1.0.0-beta3+ ( :ref:`Reference here<install_trek>` )
* Trek VSCode Extension 1.0.3-beta+ ( |vsext_link| )

.. |vscode_link| raw:: html

   <a href="https://code.visualstudio.com/" target="_blank">Download here</a>

.. |vsext_link| raw:: html

   <a href="https://github.com/pnetwork/core.vscode.extension.mflow/raw/gh-pages/release/" target="_blank">Reference here</a>


Installing Trek VSCode Extension
-------------------------------------
請先準備好 Pentium Trek vscode extension 的 vsix 安裝檔。

請使用以下任一方式安裝：

| **安裝方式 1.**
| 打開 vscode，點選左側 Extension，點選右上角「...」，選擇 「Install from VSIX...」後，選擇 Trek vsix 安裝檔：

.. image:: ../../_static/images/install_vsix1.png

| **安裝方式 2.**
| 叫出 Command Palette，選擇「Extension: Install from VSIX」後，選擇 Trek vsix 安裝檔。

.. image:: ../../_static/images/install_vsix2.png

成功安裝後，右下角會出現「Completed installing the extension Pentium Trek.」提示訊息。

.. image:: ../../_static/images/install_suc.png

| 在使用 Trek vscode extension 之前，請先指定 ``Trek CLI Path``，若是安裝於 global (非虛擬環境)，可不用特別設定。
| 開啟 vscode 設定檔，尋找 Extensions 下的 Pentium Trek，並設定 Trek CLI 位置，如: */User/pentium/trek/env_trek/bin/trek*。

.. image:: ../../_static/images/config_trek_path.gif


叫出 Command Palette，輸入 ``trek`` 顯示多項 Trek 指令。

.. image:: ../../_static/images/show_cmds.png

接著執行「 :doc:`../../reference/extension/commands/version` 」指令，顯示 Trek 版號於 Terminal 即表示安裝成功：

.. image:: ../../_static/images/show_version.png

