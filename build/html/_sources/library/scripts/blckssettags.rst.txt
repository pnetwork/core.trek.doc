blckssettags
**********************************
| 资产设定标签
| 输入 标签名、 新增/移除, 资产类别, 资产 id， 将选定资产新增或移除指定标签。

.. code-block:: yaml

    id: blckssettags
    schemaVersion: '0.2'
    version: 0.4.0
    title: 资产设定标签
    description: 输入 标签名、 新增/移除, 资产类别, 资产 id， 将选定资产新增或移除指定标签。
    namespace: network.pentium
    assets:
    - DOMAIN
    - CDN
    - HOST
    - CERTIFICATE
    inputs:
      name:
        title: 标签名称
        description: 标签名称
        type: string
      tagged:
        title: 新增/移除
        description: 新增/移除 (true/false) 标签
        type: boolean
        enum:
        - 1
        - 0
        enumNames:
        - 新增
        - 移除
      asset_type:
        title: 资产类别
        description: 指定资产的类别
        type: string
        enum:
        - SERVER
        - DOMAIN
        - CDN
        - CERTIFICATE
        enumNames:
        - 服务器
        - 域名
        - CDN
        - 凭证
      ids:
        title: id 列表
        description: 请输入欲添加标签之 id，一行一个 (i.e D-aa123)
        $ref: pn_sp_textarea_array
    required:
    - name
    - tagged
    - asset_type
    - ids
    outputs:
      result:
        type: string
    