bulkpurge
**********************************
| 批量刷新
| | 输入需要刷新对象的 URL（需要 http:// 或 https://）或资料夹，一行一笔。
       | 例如：
       | http://www.abc.com/test.html
       | http://www.abc.com/
       | 

.. code-block:: yaml

    id: bulkpurge
    schemaVersion: '0.2'
    version: 0.2.1
    name: 批量刷新
    title: 批量刷新
    description: '输入需要刷新对象的 URL（需要 http:// 或 https://）或资料夹，一行一笔。
    
      例如：
    
      http://www.abc.com/test.html
    
      http://www.abc.com/
    
      '
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      urls:
        name: 刷新对象
        title: 刷新对象
        description: 需要刷新对象 URL，一行一笔
        $ref: pn_sp_textarea_array
    required:
    - urls
    outputs:
      done:
        name: blcks 工作完成
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
      failed_urls:
        name: 刷新失败的 URL 列表
        title: 刷新失败的 URL 列表
        decription: 刷新失败的 URL 列表
        type: array
        items:
          type: string
    