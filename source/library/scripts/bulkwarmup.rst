bulkwarmup
**********************************
| 批量预热
| 输入需要预热对象的 URL（需要 http:// 或 https://），一行一笔。

例如：
http://www.abc.com/test.html
http://www.abc.com/test2.html


.. code-block:: yaml

    id: bulkwarmup
    schemaVersion: '0.2'
    version: 0.2.1
    name: 批量预热
    title: 批量预热
    description: '输入需要预热对象的 URL（需要 http:// 或 https://），一行一笔。
    
      例如：
    
      http://www.abc.com/test.html
    
      http://www.abc.com/test2.html
    
      '
    namespace: network.pentium
    assets:
    - CDN
    inputs:
      urls:
        name: 预热对象
        title: 预热对象
        description: 需要预热对象 URL，一行一笔
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
        name: 预热失败的 URL 列表
        title: 预热失败的 URL 列表
        decription: 预热失败的 URL 列表
        type: array
        items:
          type: string
    