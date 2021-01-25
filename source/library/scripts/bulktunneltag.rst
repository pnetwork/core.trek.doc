bulktunneltag
**********************************
| 链路标籤
| 链路标籤处理与链路安装日誌

.. code-block:: yaml

    id: bulktunneltag
    schemaVersion: '0.2'
    version: 0.2.0
    title: 链路标籤
    description: 链路标籤处理与链路安装日誌
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      tunnel_ids:
        title: 需测试的链路ID列表
        description: 列表为空时，将测试平台内所有链路
        type: array
        items:
          type: string
      tunnel_state:
        type: string
        title: 链路安装状态
        description: 链路安装状态 install-success / install-failed / testing / connection-failure
          / available
      tags:
        title: 链路标籤资讯
        description: 新增/删除 链路标籤
        type: array
        items:
          type: object
          properties:
            name:
              type: string
              title: 标籤名称
              description: 填入标籤名称
            option:
              type: string
              title: 模式
              description: 标籤处理模式 add / delete
    required:
    - tunnel_ids
    - tunnel_state
    - tags
    outputs:
      result:
        type: string
    