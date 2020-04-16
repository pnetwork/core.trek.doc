# Marvin Automation Development Guide

Pentium Internet (奔騰網路) 提供多種開發環境，你可以透過 CLI 界面或 VScode 擴展開發自動化流程腳本。 


## 開發工具

- Trek CLI
- Trek VSCode Extension


## How to build documents

使用 Spinx 產生文件，需先安裝相關套件

    $ pip install -r requirements-docs.txt

執行 `build.sh` 產出文件

```bash
# 產生文件
$ sh build.sh
# 先 build mflow 後再一併產生文件
$ sh build.sh 1
```

