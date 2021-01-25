bulkassetsinfo
**********************************
| 取得资产内容
| 取得资产内容

.. code-block:: yaml

    id: bulkassetsinfo
    schemaVersion: '0.2'
    version: 0.2.0
    title: 取得资产内容
    description: 取得资产内容
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      host_ids:
        $ref: pn_ids_host
      host_os_version:
        type: array
        title: 服务器 OS 版本
        items:
          type: string
      host_with_tags:
        type: array
        title: 服务器含有下列所有的标籤
        items:
          type: string
    outputs:
      host_ids:
        type: array
        items:
          type: string
      hosts:
        type: object
    