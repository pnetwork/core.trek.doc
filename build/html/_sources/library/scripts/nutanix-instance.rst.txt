nutanix-instance
**********************************
| 创建 Nutanix 虚拟服务器
| 透过 terraform 选择映像档创建 Nutanix 虚拟服务器。

.. code-block:: yaml

    id: nutanix-instance
    schemaVersion: '0.2'
    version: 0.6.0
    title: 创建 Nutanix 虚拟服务器
    description: 透过 terraform 选择映像档创建 Nutanix 虚拟服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      terraform_command:
        title: terraform 执行指令
        description: terraform 执行指令介面，目前支援 apply 和 destroy，apply 为建立或更新，destroy 可删除 tfstate
          所管理的 terraform 资料。
        type: string
        enum:
        - apply
        - destroy
        default: apply
      tfstate:
        title: terraform 执行结果
        description: 在本地端执行 terraform 成功后，会在执行目录下留存 terraform.tfstate，内容为该次执行完成后的资源描述。
        type: object
      endpoint:
        title: Nutanix Server 主机
        description: Nutanix Server 主机
        type: string
        examples:
        - 192.168.1.30
      port:
        title: 通讯埠
        description: 通讯埠
        type: integer
        default: 9440
      username:
        title: 登入用户
        description: 登入用户
        type: string
      password:
        title: 密码
        description: 密码
        type: string
      proxy_url:
        title: 链路
        description: 链路
        type: string
        examples:
        - socks5://1.1.1.1:8081
      allow_insecure:
        title: 允许未认证证书
        description: 当使用自签证书时，需要允许未认证证书
        type: boolean
        default: true
      wait_timeout:
        title: 逾时设定值
        description: 逾时设定值，预设为 3 分钟。
        type: integer
        default: 3
      amount:
        title: 创建数量
        description: 创建云服务器数量
        type: integer
        default: 1
      name:
        title: 服务器名称
        description: 服务器名称
        type: string
      cpu:
        title: 服务器 CPU 数量
        description: 服务器 CPU 数量
        type: integer
        default: 1
      cpu_cores:
        title: 服务器 CPU 核心数量
        description: 服务器 CPU 核心数量
        type: integer
        default: 1
      memory:
        title: 服务器记忆体
        description: 服务器记忆体，单位 MB。
        type: integer
        default: 2048
      disks:
        title: 硬盘容量
        description: 硬盘容量大小，不填则使用虚拟机器范本硬盘大小，单位 GB。
        type: array
        items:
          type: integer
      image:
        title: 映像档名称
        description: 映像档名称
        type: string
      nics:
        title: 网路设定物件
        description: 网路设定物件
        type: array
        items:
          type: object
          properties:
            subnet_name:
              type: string
              description: 网路名称
            ip:
              type: string
              description: IPv4 地址, 留空白值则使用 DHCP
    required:
    - endpoint
    - username
    - password
    - image
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples:
        - '---
    
          aws_instance.ins[0]: Creating...
    
          aws_instance.ins[0]: Still creating... [10s elapsed]
    
          aws_instance.ins[0]: Still creating... [20s elapsed]
    
          aws_instance.ins[0]: Creation complete after 23s [id=i-0cdd466a32cbae878]
    
          Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    
          Outputs:
    
          instance_id = [
    
          ...
    
          '
      tfstate:
        description: terraform.tfstate 输出内容
        type: object
        examples:
        - "{\n  \"version\": 4,\n  \"terraform_version\": \"0.12.24\",\n  \"serial\":\
          \ 13,\n  \"lineage\": \"a76b53d0-47fd-3492-05f7-e62d9db54697\",\n  \"outputs\"\
          : {\n    \"instance_info\": {}\n  },\n  \"resources\": [\n    {\n      \"mode\"\
          : \"managed\",\n      \"type\": \"alicloud_instance\",\n      \"name\": \"ins\"\
          ,\n      \"provider\": \"provider.alicloud\",\n      \"instances\": [\n    \
          \    {\n          \"schema_version\": 0,\n          \"attributes\": {\n    \
          \        \"host_name\": \"iZj6ch1vukq7bn1fbo2s0gZ\",\n            \"id\": \"\
          i-j6ch1vukq7bn1fbo2s0g\",\n            \"image_id\": \"centos_6_09_64_20G_alibase_20180326.vhd\"\
          ,\n            \"instance_name\": \"ECS-Instance\",\n            \"instance_type\"\
          : \"ecs.t5-lc2m1.nano\",\n            \"internet_charge_type\": \"PayByTraffic\"\
          ,\n            \"private_ip\": \"172.31.220.103\"\n          }\n        ]\n\
          \      }\n    ]\n  }\n"
    