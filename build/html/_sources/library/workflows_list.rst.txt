.. list-table:: 
   :widths: 20 50 30
   :class: ref
   :header-rows: 1

   * - Name
     - Template id
     - Description


   * - 106短信帐户剩余短信告警
     - network.pentium.accountbalances.106.chatbot
     - 每一小时检查一次指定帐户下的剩余短信，如果低于某个水位 (余额阀值) 则发送短信至指定聊天室 

   * - 106接口帐户余额告警
     - network.pentium.accountbalances.106jiekou.chatbot
     - 每一小时检查一次指定帐户下的余额，如果低于某个水位 (余额阀值) 则发送短信至指定聊天室 

   * - 阿里云帐户余额告警
     - network.pentium.accountbalances.aliyun.chatbot
     - 每一小时检查一次指定帐户下的余额，如果低于某个水位 (余额阀值) 则发送短信至指定聊天室 

   * - 腾讯云帐户余额告警
     - network.pentium.accountbalances.tencent.chatbot
     - 每一小时检查一次指定帐户下的余额，如果低于某个水位 (余额阀值) 则发送短信至指定聊天室 

   * - 云片帐户余额告警
     - network.pentium.accountbalances.yunpian.chatbot
     - 每一小时检查一次指定帐户下的余额，如果低于某个水位 (余额阀值) 则发送短信至指定聊天室 

   * - 应用 AppStore 下架报警
     - network.pentium.appstore.exist
     - 输入多组 <应用名称>, <app ID>, <备注> 的组合，此工作流程会定时做检测，并且在无法从 AppStore 上面找到组合中指定的应用时往预先设定好的群发送报警 

   * - 定期清除回收站资产
     - network.pentium.asset.clearrecycled
     - 设定标签与时间，定期清除回收站内部特定标签之资产 

   * - 定期同步阿里云云资产
     - network.pentium.asset.syncaliyun
     - 预设每小时针对设定用户可看到的帐户权限同步阿里云云资产 

   * - 定期同步亚马逊云资产
     - network.pentium.asset.syncaws
     - 预设每小时针对设定用户可看到的帐户权限同步亚马逊云资产 

   * - 定期同步 Azure 云资产
     - network.pentium.asset.syncazure
     - 预设每小时针对设定用户可看到的帐户权限同步 Azure 云资产 

   * - 添加云帐号后自动导入资产
     - network.pentium.asset.syncbyevent
     - 当云帐号的 key 加入后自动针对该云帐号扫描支持的云资产导入到平台内 

   * - 定期同步 CF 云资产
     - network.pentium.asset.synccloudflare
     - 预设每小时针对设定用户可看到的帐户权限同步 CF 云资产 

   * - 定期同步 DNSPod 云资产
     - network.pentium.asset.syncdnspod
     - 预设每小时针对设定用户可看到的帐户权限同步 DNSPod 云资产 

   * - 定期同步 GCP 云资产
     - network.pentium.asset.syncgcp
     - 预设每小时针对设定用户可看到的帐户权限同步 GCP 云资产 

   * - 定期同步狗爹云资产
     - network.pentium.asset.syncgodaddy
     - 预设每小时针对设定用户可看到的帐户权限同步狗爹云资产 

   * - 定期同步 NS1 云资产
     - network.pentium.asset.syncns1
     - 预设每小时针对设定用户可看到的帐户权限同步 NS1 云资产 

   * - 定期同步腾讯云云资产
     - network.pentium.asset.synctencent
     - 预设每小时针对设定用户可看到的帐户权限同步腾讯云云资产 

   * - 定期同步 VMware 云资产
     - network.pentium.asset.syncvmware
     - 预设每小时针对设定用户可看到的帐户权限同步 VMware 云资产 

   * - 阿里云 CDN 域名失效告警
     - network.pentium.cdn.aliyun.chatbot
     - 每五分钟检查一次 CDN 状态，如果 CDN 失效时则发送短信至指定聊天室 

   * - CDN 自动刷新/预热
     - network.pentium.cdn.changed
     - 监控服务器上 web 服务的静态档案资料夹，如果有档案更新则自动驱动 CDN 预热刷新 

   * - 新增憑證後，自動更新CDN使用憑證
     - network.pentium.cdn.cloudcertificate.update
     - 新增憑證自動觸發更新 CDN 憑證 

   * - CDN 自动绑定
     - network.pentium.cdn.create
     - 当添加新 CDN 时系统会自动绑定FQDN (若是云端导入，则不触发绑定) 

   * - 阿里云 CDN 域名失效告警
     - network.pentium.cdn.monitoring
     - 每五分钟检查一次 CDN 状态，如果 CDN 失效时，往指定 Telegram Channel 发送 CDN 域名失效告警 

   * - 腾讯云 CDN 域名失效告警
     - network.pentium.cdn.tencent.chatbot
     - 每五分钟检查一次 CDN 状态，如果 CDN 失效则发送短信至指定聊天室 

   * - 檢測過期憑證
     - network.pentium.certificate.expired.check
     - 定期執行, 檢測過期/即將過期域名,並使用發出事件, 讓 Let's Encrypt 自動申請憑證 

   * - 阿里云帐户余额告警
     - network.pentium.cloudaccount.balances
     - 每一小时检查一次指定帐户下的余额，如果低于某个水位 (余额阀值) 则往指定的 Telegram 发送 

   * - 快速添加日常工作流程
     - network.pentium.dailyroutine.shortcut
     - 快速添加日常工作流程 

   * - 数据库修改审核结果告警
     - network.pentium.database.audit
     - 数据库修改审核结果告警 

   * - 修改数据库请求告警
     - network.pentium.database.sqlrequest
     - 修改数据库请求告警 

   * - 檢查域名是否有可用憑證
     - network.pentium.domain.certificate.check
     - 檢查域名是否有可用憑證，若無則觸發  Let's Encrypt 自動申請憑證 

   * - 新增 cloudflare DNS 紀錄後自動添加 CDN
     - network.pentium.domain.cloudflare.fqdn.create
     - 新增 Cloudflare DNS 紀錄時，若主要解析商非 Cloudflare 則自動將該紀錄設定為 CDN 並且導入平台 (此功能僅支持 Enterprise Plan) 

   * - 域名注册商资讯查询(定期)
     - network.pentium.domain.cronpatch.provider
     - 域名注册商资讯查询(定期) 

   * - 域名解析商资讯查询(定期)
     - network.pentium.domain.cronpatch.resolver
     - 域名解析商资讯查询(定期) 

   * - 自動選擇域名並覆蓋解析紀錄
     - network.pentium.domain.fqdn.migration
     - 當域名被標注封禁時，選擇另一個可以使用的域名，並且將原域名的解析紀錄覆蓋過去。 

   * - 域名注册商资讯查询
     - network.pentium.domain.patch.provider
     - 域名注册商资讯查询 

   * - 域名解析商资讯查询
     - network.pentium.domain.patch.resolver
     - 域名解析商资讯查询 

   * - 同步子域名
     - network.pentium.domain.syncsubdomain
     - 预设每天针对设定用户可看到的域名同步子域名 

   * - 域名过期侦测
     - network.pentium.expiredomains.monitoring
     - 定期侦测域名是否过期，如果过期的话对指定的 TG 群发送报警 

   * - 域名过期侦测告警
     - network.pentium.expiredomains.monitoring.chatbot
     - 定期侦测域名是否过期，如果过期则发送短信至指定聊天室 

   * - 阿里云服务器过期侦测告警
     - network.pentium.expirehosts.aliyun.chatbot
     - 定期侦测服务器是否过期，如果过期则发送短信至指定聊天室 

   * - 阿里云服务器过期侦测
     - network.pentium.expirehosts.monitoring
     - 定期侦测服务器是否过期，如果过期的话对指定的 Telegram 群发送报警 

   * - 腾讯云服务器过期侦测告警
     - network.pentium.expirehosts.tencent.chatbot
     - 定期侦测服务器是否过期，如果过期则发送短信至指定聊天室 

   * - 自动检测证书到期日
     - network.pentium.expiressl.monitoring.chatbot
     - 自动检测证书到期日，当证书到期时自动发送IM通知 

   * - 域名封禁检测
     - network.pentium.gfw.monitoring
     - 针对输入的一串域名每五分钟做一次域名封禁检测，如果发现域名在中国禁内被封则对被封禁域名发送 TG 报警 

   * - 域名封禁检测告警
     - network.pentium.gfw.monitoring.chatbot
     - 针对输入的一串域名每五分钟做一次域名封禁检测，如果发现域名在中国境内被封则发送短信至指定聊天室 

   * - 删除过期下载档案
     - network.pentium.host.expiredfile.schedule
     - 删除过期下载档案 

   * - 准备档案下载资讯
     - network.pentium.hosts.filedownload
     - 准备档案下载资讯 

   * - 创建服务器后自动监控
     - network.pentium.hosts.monitoring.install
     -  

   * - 修改服务器 SSH 登录信息后自动监控
     - network.pentium.hosts.monitoring.installwhenupdate
     - 修改服务器 SSH 登录信息后，自动执行监控脚本，撷取硬体作业系统资讯，并即时回传硬体资源使用状况 

   * - 域名备案检测
     - network.pentium.icp.monitoring
     - 定期检测输入域名在中国境内的备案情况，如果备案侦测失败会对指定 TG 群发送报警 

   * - 域名备案检测告警
     - network.pentium.icp.monitoring.chatbot
     - 定期检测输入域名在中国境内的备案情况，如果备案侦测失败则发送短信至指定聊天室 

   * - 產生 Let's Encrypt 憑證
     - network.pentium.letsencrypt.certificate.apply
     - 由事件 [ 產生 Let's Encrypt 憑證 ] 觸發 

   * - 行动介面处理
     - network.pentium.mobile.ui
     - 事件发生时，根据用户编排的资讯产生一个页面并且生成一个 URL 

   * - 项目管理员角色绑定
     - network.pentium.rbac.role.binding
     - 在创建项目管理员时,自动绑定全站工作流程权限 

   * - 删除暂存脚本
     - network.pentium.script.expiredfile.schedule
     - 工作流程支援 Terraform 時，既有執行 Terraform 端點 (/scripts/terraform/deployments)，產生的暫存腳本檔案，透過此工作流程自動清除暫存腳本。 

   * - 非白名单 SSH 登录告警
     - network.pentium.ssh.checkwhitelist.chatbot
     - 侦测所有服务器的 SSH 登录，若不在白名单 IP 地址中则发送短信至指定聊天室 

   * - SSH 登录日志
     - network.pentium.ssh.loginlog
     -  

   * - 链路连线检测
     - network.pentium.tunnel.connectiontest
     - 定期与链路安装完毕後,检测链路对外连线功能 

   * - 新增链路
     - network.pentium.tunnel.create
     - 进行链路连线安装 

   * - 删除链路
     - network.pentium.tunnel.delete
     - 进行链路连线移除 

   * - 手动测试链路
     - network.pentium.tunnel.test
     - 进行链路线检查 

   * - 修改链路
     - network.pentium.tunnel.update
     - 进行链路连线更新 

   * - 域名微信封禁检测告警
     - network.pentium.weixin.monitoring.chatbot
     - 针对输入的一串域名六小时做一次域名微信封禁检测，如果发现域名在微信被封则发送短信至指定聊天室 

   * - 新增应用 AppStore 下架报警的App清单
     - network.pentium.workflow.addappstore
     - 新增应用 AppStore 下架报警的App清单 

   * - 删除应用 AppStore 下架报警的App清单
     - network.pentium.workflow.deleteappstore
     - 删除应用 AppStore 下架报警的App清单 

   * - 列出应用 AppStore 下架报警的App清单
     - network.pentium.workflow.listappstore
     - 列出应用 AppStore 下架报警的App清单 

   * - Yearning - 添加数据库绑定
     - network.pentium.yearning.createdb
     - 当一数据库被添加到平台中，会自动触发工作流程并绑定数据库资讯到 Yearning 中 

   * - Yearning - 删除数据库绑定
     - network.pentium.yearning.deletedb
     - 当数据库从平台中被删除时，会自动触发工作流程并从 Yearning 中删除数据库绑定资讯 

   * - Yearning - 更新数据库绑定
     - network.pentium.yearning.updatedb
     - 当数据库在平台中被更新时，会自动触发工作流程并更新 Yearning 中的数据库绑定资讯 