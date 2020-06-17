vsphere-clone-from-template
**********************************
| 创建 VMware 服务器 (Linux 作业系统)
| 透过 terraform 创建 Linux 作业系统之 VMware 服务器。

.. code-block:: yaml

    id: vsphere-clone-from-template
    schemaVersion: '0.2'
    version: 0.1.4
    name: 创建 VMware 服务器 (Linux 作业系统)
    title: 创建 VMware 服务器 (Linux 作业系统)
    description: 透过 terraform 创建 Linux 作业系统之 VMware 服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      server:
        name: vCenter Server 主机
        title: vCenter Server 主机
        desctiption: vCenter Server 主机
        type: string
        examples: '- 192.168.1.30
    
          '
      user:
        name: 用户
        title: 用户
        description: 用户
        type: string
        examples: '- admin@domain.com
    
          '
      password:
        name: 密码
        title: 密码
        description: 密码
        type: string
      allow_unverified_ssl:
        name: 允许未认证证书
        title: 允许未认证证书
        description: 当使用自签证书时，需要允许未认证证书
        type: boolean
      datacenter:
        name: 资料中心
        title: 资料中心
        description: vSphere 资料中心名稱
        type: string
      datastore:
        name: 资料存放区
        title: 资料存放区
        description: vSphere 资料存放区(datastore)
        type: string
      resource_pool:
        name: 资源集区
        title: 资源集区
        description: vSphere 资源集区(resource_pool)
        type: string
      network:
        name: 网路
        title: 网路
        description: vSphere 网路名称
        type: string
      template:
        name: 虚拟机器范本
        title: 虚拟机器范本
        description: 虚拟机器范本
        type: string
      name:
        name: 服务器名称
        title: 服务器名称
        description: 服务器名称
        type: string
      num_cpus:
        name: 服务器 CPU 数量
        title: 服务器 CPU 数量
        description: 服务器 CPU 数量
        type: integer
      memory:
        name: 服务器记忆体
        title: 服务器记忆体
        description: 服务器记忆体，单位 MB。
        type: integer
      disk_size:
        name: 硬盘容量
        title: 硬盘容量
        description: 硬盘容量大小，不填则使用虚拟机器范本硬盘大小，单位 GB。
        type: integer
      wait_for_guest_net_timeout:
        name: 逾时设定值
        title: 逾时设定值
        description: 逾时设定值，预设为 5 分钟。
        type: integer
    required:
    - server
    - user
    - password
    - datacenter
    - datastore
    - resource_pool
    - network
    - template
    - name
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples: '---
    
          aws_instance.ins[0]: Creating...
    
          aws_instance.ins[0]: Still creating... [10s elapsed]
    
          aws_instance.ins[0]: Still creating... [20s elapsed]
    
          aws_instance.ins[0]: Creation complete after 23s [id=i-0cdd466a32cbae878]
    
          Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    
          Outputs:
    
          instance_id = [
    
          ...
    
          '
    