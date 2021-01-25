blckscheckhijacked
**********************************
| 透過 17CE 檢測域名劫持狀況
| 输入 17CE 的帐号资讯并且制定测试节点和回传 IP 来判断输入域名是否遭到劫持

.. code-block:: yaml

    id: blckscheckhijacked
    schemaVersion: '0.2'
    title: 透過 17CE 檢測域名劫持狀況
    version: 0.3.0
    description: 输入 17CE 的帐号资讯并且制定测试节点和回传 IP 来判断输入域名是否遭到劫持
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      user:
        title: 17CE 使用者帐号
        type: string
        description: 17CE 使用者帐号
      api_pwd:
        title: 17CE API 密码
        type: string
        description: 17CE API管理 => 我的接口 => api_pwd
      fqdn_info:
        title: 受检测FQDN
        type: object
        description: 受检测FQDN
      node_num:
        title: 节点数
        type: number
        description: 中国境内各省份下分配节点数
      isps:
        title: ISP
        type: array
        uniqueItems: true
        items:
          type: number
          enum:
          - 1
          - 2
          - 3
          - 4
          - 6
          - 7
          - 8
          - 10
          - 11
          - 13
          - 14
          - 15
          - 16
          - 17
          - 19
          enumNames:
          - 电信
          - 联通
          - 国外
          - 其他
          - 铁通
          - 移动
          - 教育网
          - 科技网
          - 华数
          - 鹏博士
          - 有线通
          - 广电网
          - 视讯宽带
          - 香港
          - 澳门
      pro_ids:
        title: 中国境内省份
        type: array
        uniqueItems: true
        items:
          type: number
          enum:
          - 12
          - 49
          - 79
          - 80
          - 180
          - 183
          - 188
          - 189
          - 190
          - 192
          - 193
          - 194
          - 195
          - 196
          - 221
          - 227
          - 235
          - 236
          - 238
          - 239
          - 241
          - 243
          - 250
          - 346
          - 349
          - 350
          - 351
          - 352
          - 353
          - 354
          - 355
          - 356
          - 357
          enumNames:
          - 香港
          - 重庆
          - 福建
          - 甘肃
          - 北京
          - 内蒙古
          - 贵州
          - 宁夏
          - 山东
          - 黑龙江
          - 山西
          - 陕西
          - 广东
          - 河南
          - 上海
          - 云南
          - 湖北
          - 安徽
          - 西藏
          - 江西
          - 澳门
          - 天津
          - 河北
          - 新疆
          - 辽宁
          - 湖南
          - 吉林
          - 广西
          - 四川
          - 海南
          - 浙江
          - 青海
          - 江苏
    required:
    - user
    - api_pwd
    - fqdn_info
    - node_num
    - isps
    - pro_ids
    outputs:
      domain:
        title: 受检测域名
        type: string
      domain_ids:
        title: 受检测域名 id
        type: array
      project_name:
        title: 受检测域名项目
        type: string
      fqdn:
        title: 受检测 FQDN
        type: string
      status:
        title: 封禁状态
        type: string
        description: FQDN 状态, 一共有 safe, hijacked, accessfailure 三种状态。
      17ce_task_id:
        title: 检测任务 ID
        type: string
    