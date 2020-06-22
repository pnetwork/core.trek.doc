*****************************************************************
Trek: Install Script
*****************************************************************

Purpose:

  | 從遠端下載腳本並安裝至 Trek 專案中。  
  | 可下載指定腳本、或將 *packages.json* 檔案中定義的腳本全部下載。  
  | 遠端機器位置於 *config.json* 中 ``script_repository`` 欄位設定


Usage:


- :Please enter script id:
    | 填入 pattern 為 ``*`` 或 ``{scriptid}=={version}``。
    | 請輸入腳本 id 及版號，以安裝 notification 腳本為例：
    
    - ``*`` : 依 Trek project 的 *./packages.json* 檔案中所描述的腳本進行下載。
      
        .. code-block:: shell

            # {your_trek_project_path}/packages.json
            {
                "packages": {
                    "blckssettags": "==0.5.0"
                }
            }

    - ``notification`` : 沒有指定版號代表下載最新版號的腳本。
    - ``notification==0.5.0`` : 下載指定版號 ``0.5.0`` 的腳本。

