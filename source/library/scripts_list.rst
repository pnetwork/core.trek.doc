.. list-table:: 
   :widths: 20 30 30 20
   :class: ref
   :header-rows: 1

   * - Name
     - Script id
     - Description
     - Para schema file


   * - 创建阿里云 (AliCloud) 云服务器
     - alicloud-instance
     - 透过 terraform 创建阿里云 (AliCloud) 云服务器。
     - :doc:`view schema<scripts/alicloud-instance>`

   * - AppStore 上架状态检测器
     - appstorecheck
     - AppStore 上架状态检测器
     - :doc:`view schema<scripts/appstorecheck>`

   * - 列表讯息转换器
     - arraytransformer
     - 将列表讯息转换为字串
     - :doc:`view schema<scripts/arraytransformer>`

   * - 创建亚马逊 (AWS) 云服务器
     - aws-instance
     - 透过 terraform 创建亚马逊 (AWS) 云服务器。
     - :doc:`view schema<scripts/aws-instance>`

   * - 帐户余额告警
     - balances
     - 定期检测帐户余额并发出告警
     - :doc:`view schema<scripts/balances>`

   * - 域名绑定解析商
     - bindresolverkey
     - 尝试替系统内未绑定resolver key的domain，绑定一个可以解析该域名的key
     - :doc:`view schema<scripts/bindresolverkey>`

   * - 绑定子域名
     - bindsubdomain
     - 将指定CDN与指定子域名配对绑定
     - :doc:`view schema<scripts/bindsubdomain>`

   * - 產生 let's encrypt 憑證
     - blcksacmesh
     - 產生 let's encrypt 憑證
     - :doc:`view schema<scripts/blcksacmesh>`

   * - 過濾資產標籤
     - blcksassettagfilter
     - 過濾資產標籤
     - :doc:`view schema<scripts/blcksassettagfilter>`

   * - 角色绑定
     - blcksbindingrole
     - 角色绑定
     - :doc:`view schema<scripts/blcksbindingrole>`

   * - 配發憑證至雲金鑰
     - blckscertdistribute
     - 配發憑證至雲金鑰
     - :doc:`view schema<scripts/blckscertdistribute>`

   * - 檢測域名是否有可用憑證
     - blckscheckcertificate
     - 檢測域名是否有可用憑證
     - :doc:`view schema<scripts/blckscheckcertificate>`

   * - 证书过期检测
     - blckscheckexpiredssl
     - 检测证书是否到期
     - :doc:`view schema<scripts/blckscheckexpiredssl>`

   * - 服务器连线测试
     - blckscheckhostconnection
     - 对服务器连线测试，检测帐密及网路状态
     - :doc:`view schema<scripts/blckscheckhostconnection>`

   * - 删除回收站资产
     - blcksclearrecycled
     - 设定回收资产的清除时间，清除已到期资产
     - :doc:`view schema<scripts/blcksclearrecycled>`

   * - 建立证书
     - blckscreatecert
     - 创建证书并配发至云端
     - :doc:`view schema<scripts/blckscreatecert>`

   * - 添加子域名後同步 CDN
     - blckscreatefqdnascdn
     - 添加子域名後，同步 CDN，若子域名已存在則直接執行同步 CDN。
     - :doc:`view schema<scripts/blckscreatefqdnascdn>`

   * - 取得 Marvin 資產內容
     - blcksgetassets
     - 取得 Marvin 資產內容
     - :doc:`view schema<scripts/blcksgetassets>`

   * - 查找域名 ID
     - blcksgetdomainids
     - 查找域名 ID
     - :doc:`view schema<scripts/blcksgetdomainids>`

   * - 查詢所有憑證相關的CDN
     - blcksgetrelatedcdn
     - 查詢所有憑證相關的CDN
     - :doc:`view schema<scripts/blcksgetrelatedcdn>`

   * - Callback 憑證產生事件
     - blcksmarvineventcallback
     - Callback 憑證產生事件
     - :doc:`view schema<scripts/blcksmarvineventcallback>`

   * - 覆蓋域名解析紀錄
     - blcksmigratefqdns
     - 先將所選擇的域名下的解析紀錄全部移除，再將原域名的解析紀錄覆蓋過去
     - :doc:`view schema<scripts/blcksmigratefqdns>`

   * - 更新应用 AppStore 下架报警的App清单
     - blckspatchappstore
     - 更新应用 AppStore 下架报警的App清单
     - :doc:`view schema<scripts/blckspatchappstore>`

   * - 域名注册与解析资讯查询
     - blckspatchdomains
     - 域名注册与解析资讯查询
     - :doc:`view schema<scripts/blckspatchdomains>`

   * - 批量添加备案失效/域名封禁/微信封禁标签
     - blckssetdomainstags
     - 输入顶级域名，批量添加备案失效/域名封禁/微信封禁标签
     - :doc:`view schema<scripts/blckssetdomainstags>`

   * - 资产设定标签
     - blckssettags
     - 输入 标签名、 新增/移除, 资产类别, 资产 id， 将选定资产新增或移除指定标签。
     - :doc:`view schema<scripts/blckssettags>`

   * - 同步子域名
     - blckssyncfqdns
     - 同步子域名
     - :doc:`view schema<scripts/blckssyncfqdns>`

   * - 鏈路工作流程例外處理
     - blckstunnelexception
     - 链路工作流程例外处理
     - :doc:`view schema<scripts/blckstunnelexception>`

   * - 更新 CDN 所使用的憑證
     - blcksupdatecloudcertificate
     - 更新 CDN 所使用的憑證
     - :doc:`view schema<scripts/blcksupdatecloudcertificate>`

   * - 建立全站域名关联表
     - buildresolverrelation
     - 利用所有使用者汇入系统内的解析商密钥，建立每一把r解析商密钥可解析的域名列表的对照表
     - :doc:`view schema<scripts/buildresolverrelation>`

   * - 复制DNS 记录至另一解析商
     - bulkmigration
     - 将使用者所选取域名及subdomains，添加至选定的解析商密钥内
     - :doc:`view schema<scripts/bulkmigration>`

   * - 批量修改源站设置
     - bulkorigins
     - 批量修改 CDN 的 origins
     - :doc:`view schema<scripts/bulkorigins>`

   * - 批量刷新
     - bulkpurge
     - | 输入需要刷新对象的 URL（需要 http:// 或 https://）或资料夹，一行一笔。
       | 例如：
       | http://www.abc.com/test.html
       | http://www.abc.com/
       | 
     - :doc:`view schema<scripts/bulkpurge>`

   * - 批量修改 HTTP 头
     - bulkreqheaders
     - 批量修改cdn的http request headers
     - :doc:`view schema<scripts/bulkreqheaders>`

   * - 批量修改域名解析商
     - bulkresolver
     - 仅支持域名注册商为 GoDaddy 及阿里云，域名注册商为 GoDaddy 支持切换任意域名解析商，域名注册商为阿里云仅支持切换回阿里云！
     - :doc:`view schema<scripts/bulkresolver>`

   * - 链路标籤
     - bulktunneltag
     - 链路标籤处理与链路安装日誌
     - :doc:`view schema<scripts/bulktunneltag>`

   * - 链路对外连线测试
     - bulktunneltest
     - 测试链路是否畅通，是否可对外连线
     - :doc:`view schema<scripts/bulktunneltest>`

   * - 批量下线域名
     - bulkupdatenameservers
     - 批量下线域名与切换 name servers
     - :doc:`view schema<scripts/bulkupdatenameservers>`

   * - 批量预热
     - bulkwarmup
     - | 输入需要预热对象的 URL（需要 http:// 或 https://），一行一笔。
       | 例如：
       | http://www.abc.com/test.html
       | http://www.abc.com/test2.html
       | 
     - :doc:`view schema<scripts/bulkwarmup>`

   * - 链路 修改项目白名单
     - bulkwhitelist
     - 链路 修改项目白名单
     - :doc:`view schema<scripts/bulkwhitelist>`

   * - 链路服务升级与重启脚本
     - byos-chisel-restart
     - 奔腾预设脚本，对服务器升级与重启链路服务。
     - :doc:`view schema<scripts/byos-chisel-restart>`

   * - 安装链路元件脚本
     - byos-tunnel-install
     - 奔腾预设脚本，对服务器安装链路元件脚本。
     - :doc:`view schema<scripts/byos-tunnel-install>`

   * - 设定链路脚本
     - byos-tunnel-setup
     - 奔腾预设脚本，对服务器设定链路脚本，支持 Ansible2.9。
     - :doc:`view schema<scripts/byos-tunnel-setup>`

   * - 链路连线测试脚本
     - byos-tunnel-test
     - 奔腾预设脚本，对链路连线测试脚本。
     - :doc:`view schema<scripts/byos-tunnel-test>`

   * - 呼叫 blcks SDK 服务
     - callservice
     - 呼叫 blcks SDK 服务
     - :doc:`view schema<scripts/callservice>`

   * - 修改SSH密码脚本
     - change-password
     - 奔腾预设脚本，对服务器修改SSH连线密码。
     - :doc:`view schema<scripts/change-password>`

   * - 修改SSH金钥脚本
     - change-ssh-key
     - 奔腾预设脚本，对服务器修改SSH金钥。
     - :doc:`view schema<scripts/change-ssh-key>`

   * - 服务器过期检测
     - checkexpiredhosts
     - 检测服务器是否到期
     - :doc:`view schema<scripts/checkexpiredhosts>`

   * - 服务器过期检测讯息转换器
     - checkexpiredhostsadapter
     - 重组服务器过期检测讯息
     - :doc:`view schema<scripts/checkexpiredhostsadapter>`

   * - 域名过期检测
     - checkexpiredtime
     - 检测域名是否到期
     - :doc:`view schema<scripts/checkexpiredtime>`

   * - 域名过期检测讯息转换器
     - checkexpiredtimeadapter
     - 重组域名过期检测讯息
     - :doc:`view schema<scripts/checkexpiredtimeadapter>`

   * - SSH登录白名单检测
     - checkwhitelist
     - 检测非白名单SSH登录目标机時发出告警
     - :doc:`view schema<scripts/checkwhitelist>`

   * - 移除过期24小时的下载档案
     - expiredfile
     - 移除过期24小时的下载档案
     - :doc:`view schema<scripts/expiredfile>`

   * - 文件上传
     - fileupload
     - 将档案上传至指定服务器
     - :doc:`view schema<scripts/fileupload>`

   * - 创建 Google Cloud 云服务器
     - gcp-instance
     - 透过 terraform 创建 Google Cloud 云服务器。
     - :doc:`view schema<scripts/gcp-instance>`

   * - 取得所属权限的失效 CDN
     - getcdns
     - 取得所属权限的失效 CDN
     - :doc:`view schema<scripts/getcdns>`

   * - 取得云帐号
     - getcloudaccounts
     - 取得云帐号
     - :doc:`view schema<scripts/getcloudaccounts>`

   * - 取得JWT所属权限的域名
     - getdomains
     - 取得JWT所属权限的域名
     - :doc:`view schema<scripts/getdomains>`

   * - 批量检查域名是否被 GFW 封禁
     - gfwcheck
     - 输入顶级域名，批量检查域名是否被 GFW 封禁
     - :doc:`view schema<scripts/gfwcheck>`

   * - 服务器资讯抓取脚本
     - heartbeat-gethostsinfo
     - 奔腾预设脚本，对服务器抓取资讯脚本。
     - :doc:`view schema<scripts/heartbeat-gethostsinfo>`

   * - 部署奔腾 bootstrap 脚本
     - host-bootstrap-install
     - 奔腾预设脚本，对服务器部署SSH纪录监控服务、服务器资讯监控服务、档案下载服务脚本。想了解安装详情，请参考用户手册。
     - :doc:`view schema<scripts/host-bootstrap-install>`

   * - 移除奔腾 bootstrap 脚本
     - host-bootstrap-uninstall
     - 奔腾预设脚本，移除 bootstrap 脚本部署在服务器上的各项服务。
     - :doc:`view schema<scripts/host-bootstrap-uninstall>`

   * - 重启监控服务脚本
     - host-monitor-restart
     - 奔腾预设脚本，对服务器重启监控服务脚本。
     - :doc:`view schema<scripts/host-monitor-restart>`

   * - 重启服务器脚本
     - host-reboot
     - 奔腾预设脚本，重启服务器脚本。
     - :doc:`view schema<scripts/host-reboot>`

   * - 设定 net.core.somaxconn 至最大值
     - host-somaxconn-max
     - 奔腾预设脚本，针对 CentOS 7 设定 net.core.somaxconn 至最大值。
     - :doc:`view schema<scripts/host-somaxconn-max>`

   * - 安装 CDN 自动刷新/预热脚本
     - host.filewatch.install
     - 奔腾预设脚本，监控服务器上 web 服务的静态档案资料夹，如果有档案更新则自动驱动 CDN 预热刷新。
     - :doc:`view schema<scripts/host.filewatch.install>`

   * - 移除 CDN 自动刷新/预热脚本
     - host.filewatch.remove
     - 奔腾预设脚本，对服务器部署移除静态资料夹监控脚本。
     - :doc:`view schema<scripts/host.filewatch.remove>`

   * - 批量检查域名是否未备案
     - icpcheck
     - 输入顶级域名，批量检查域名是否未备案
     - :doc:`view schema<scripts/icpcheck>`

   * - 工作流程执行确认
     - messageconfirm
     - 透过通讯软体，等待审核者审查回应
     - :doc:`view schema<scripts/messageconfirm>`

   * - 下载远端档案脚本
     - mget-fetch-script
     - 奔腾预设脚本，下载远端档案脚本。
     - :doc:`view schema<scripts/mget-fetch-script>`

   * - 清除远端档案
     - mget-fetch-script-remove
     - 奔腾预设脚本，清除远端档案。
     - :doc:`view schema<scripts/mget-fetch-script-remove>`

   * - 解析下载档案资讯
     - mgetadapter
     - 解析来源服务器资讯和档案位置
     - :doc:`view schema<scripts/mgetadapter>`

   * - 行动介面处理
     - mobileadapter
     - 请输入标题及描述
     - :doc:`view schema<scripts/mobileadapter>`

   * - 传送讯息至指定频道
     - notification
     - 選擇 bot 配對，傳送訊息至指定頻道
     - :doc:`view schema<scripts/notification>`

   * - 产生下载档案存取路径
     - objecturl
     - 从脚本执行日志输出解析档案存取路径，并且发送出 Marvin 事件，通知用户。
     - :doc:`view schema<scripts/objecturl>`

   * - 奔腾预设脚本 ls
     - pentium-demo-ls
     - 奔腾预设脚本，ls。
     - :doc:`view schema<scripts/pentium-demo-ls>`

   * - Pentium Execute Commnad
     - pentium-execute-command
     - 奔腾预设脚本，Execute Commnad.
     - :doc:`view schema<scripts/pentium-execute-command>`

   * - Pentium Execute Shell Script
     - pentium-shell-script-trigger
     - 奔腾预设脚本，Execute Shell Script.
     - :doc:`view schema<scripts/pentium-shell-script-trigger>`

   * - 部署金钥
     - pentium-upload-public-key
     - 奔腾预设脚本，部署金钥脚本.
     - :doc:`view schema<scripts/pentium-upload-public-key>`

   * - 准备 CDN
     - preparecdn
     - 创建 CDN 并导入至平台
     - :doc:`view schema<scripts/preparecdn>`

   * - 安装脚本所需程式库
     - python-lib-install
     - 奔腾预设脚本，对服务器安装脚本所需程式库。
     - :doc:`view schema<scripts/python-lib-install>`

   * - 服务器批量修改SSH端口
     - sethostsport
     - 服务器批量修改SSH端口
     - :doc:`view schema<scripts/sethostsport>`

   * - 服务器批量添加标签
     - sethoststags
     - 服务器批量添加标签
     - :doc:`view schema<scripts/sethoststags>`

   * - SSH 日志处理
     - sshlogadapter
     - SSH 日志处理
     - :doc:`view schema<scripts/sshlogadapter>`

   * - 同步云帐号的资产
     - syncassets
     - 同步云帐号的资产
     - :doc:`view schema<scripts/syncassets>`

   * - 全站云主机同步
     - syncinstances
     - 批量同步平台所有云金钥的主机资讯
     - :doc:`view schema<scripts/syncinstances>`

   * - 讯息转换器
     - templateengine
     - 讯息转换器
     - :doc:`view schema<scripts/templateengine>`

   * - 訊息轉換器(python3)
     - templatepython3
     - 訊息轉換器(python3)
     - :doc:`view schema<scripts/templatepython3>`

   * - 创建腾讯云云服务器
     - tencentcloud-instance
     - 透过 terraform 创建腾讯云 (TencentCloud) 云服务器。
     - :doc:`view schema<scripts/tencentcloud-instance>`

   * - 链路事件处理
     - tunneleventhandler
     - 链路事件处理
     - :doc:`view schema<scripts/tunneleventhandler>`

   * - 更新CDN
     - updatecdn
     - 更新CDN
     - :doc:`view schema<scripts/updatecdn>`

   * - 批量修改服务器 SSH 帐密
     - updatepassword
     - 批量修改服务器 SSH 帐密
     - :doc:`view schema<scripts/updatepassword>`

   * - 同步数据库资讯至 Yearning
     - updateyearning
     - 同步新增、修改、删除的数据库资讯至 Yearning
     - :doc:`view schema<scripts/updateyearning>`

   * - 创建 VMware 服务器 (Linux 作业系统)
     - vsphere-clone-from-template
     - 透过 terraform 创建 Linux 作业系统之 VMware 服务器。
     - :doc:`view schema<scripts/vsphere-clone-from-template>`

   * - 域名微信封禁检测
     - weixincheck
     - 输入域名，批量检查域名是否被微信封禁
     - :doc:`view schema<scripts/weixincheck>`

   * - 工作流程异常讯息
     - wfexception
     - 收到工作流程异常结束讯息，产生系统日志
     - :doc:`view schema<scripts/wfexception>`