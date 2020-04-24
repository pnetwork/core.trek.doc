Before You Begin
------------------------

#. 請先安裝 trek clikit tool，如何安裝 :ref:`可參考 <install_trek>`。
#. 以下會經常用到快捷鍵 Ctrl+Shit+P ( or ⌘+⇧+P ) 呼叫出 Command Palette 並執行 trek vscode extension 指令，Trek 相關指令都以「Trek: XXX」方式命名。
#. 本機必需要有啟動中的 docker。

.. include:: install.rst

Configuring Trek Vscode Extension
-------------------------------------
| 在使用 trek vscode extension 之前，請先指定已安裝 trek clikit 的位置，若是安裝於 global (非虛擬環境)，可不用特別設定。
| 開啟 vscode 設定檔，尋找 Extensions 下的 Pentium Trek，並設定 trek clikit 位置，如: */User/pentium/trek/env_trek/bin/trek*。

.. image:: ../../_static/images/config_trek_path.gif