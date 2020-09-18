Introduction
================
Trek 是一個幫助你開發 Marvin 上的自動化開發工具。Pentium Network (奔騰網路) 提供多種開發環境，你可以透過 CLI 界面或 VScode 擴展開發自動化流程腳本。 

這份 Trek 文件會幫助你學習和使用 Trek 自動化開發工具，從你的第一個腳本，一直到優化複雜的複雜的工作流程。夠過 ``trek`` 指令，你可以在本機上完成所有的開發包含撰寫腳本、工作流程、除錯、開發工作流程，最後部署你開發的工具到你指定的 Marvin 平台。

System Requirements
=======================

在安裝前請確認系統是否符合需求

* macOS 10.14+
* Docker 19.03+ ( |docker_link| )
* Python 3.7+ ( |python_link| )
* graphviz 2.42.2+ : 使用指令 :doc:`../../reference/cli/commands/graph` 時用到。 ( |graphviz_link| )

.. |docker_link| raw:: html

   <a href="https://docs.docker.com/get-docker/" target="_blank">Download here</a>

.. |python_link| raw:: html

   <a href="https://www.python.org/downloads/" target="_blank">Download here</a>

.. |graphviz_link| raw:: html

   <a href="https://www.graphviz.org/download/" target="_blank">Download here</a>

.. _install_trek:

Installing Trek CLI
==================================
首先我們要安裝 Trek CLI 工具，請使用以下指令安裝 trek：

.. code-block:: shell

    $ pip install trek -i https://package.pentium.network/repository/pypi-group/simple --trusted-host=package.pentium.network

使用指令查看 Trek 版本確認安裝成功

.. code-block:: shell

    $ trek version

恭喜，您已成功安裝 Trek !

| 接著，參考 :doc:`quick_start` 試著建立第一個 Trek 專案吧!


