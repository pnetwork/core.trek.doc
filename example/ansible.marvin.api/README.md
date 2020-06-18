# ansible.marvin.api

透過 ansible 打 Marvin API

## 情境

由 ansible playbook 打 Marvin API 取得使用者資訊 ([GET] api/users/me)，判斷使用者身分後送出不同的訊息至聊天頻道

## Flow

![flow](./.trek/graph.gv.png)

## 所需腳本

- getuserme: 自製 ansible 腳本，打 Marvin API 取得使用者資訊
- notification: 安裝腳本，發送通知

條件式：

使用 regEx 判斷身分後送出不同訊息

## 設置及啟動

**請確認 Trek CLI 版本為 `1.0.0-beta5` 以上**

    $ pip install trek -U -i https://package.pentium.network/repository/pypi-group/simple --trusted-host=package.pentium.network


1. 準備所需的 `inventory.ini` 並設置路徑於 config.json 中的 `local_inventory_file`
2. 填入 channel id 至 `inputs/data.yml` 中的以下區間：

```yaml
3-4:
  bot_infos.0:
    type: string
    value: '{input your chatbot id}'

3-5:
  bot_infos.0:
    type: string
    value: '{input your chatbot id}'
```

3. 安裝腳本


```bash
$ trek install
```


### 啟動

```bash
# 執行
$ trek run --auto
```

或是於 VSCode 中執行 `Trek: Run`

