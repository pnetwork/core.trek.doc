aws-instance
**********************************
| 创建亚马逊 (AWS) 云服务器
| 透过 terraform 创建亚马逊 (AWS) 云服务器。

.. code-block:: yaml

    id: aws-instance
    schemaVersion: '0.2'
    version: 0.9.1
    title: 创建亚马逊 (AWS) 云服务器
    description: 透过 terraform 创建亚马逊 (AWS) 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      credential:
        title: 云帐号
        description: 云帐号
        type: object
      access_key:
        title: 云帐号 access_key
        description: 云帐号 access_key
        type: string
      secret_key:
        title: 云帐号 secret_key
        description: 云帐号 secret_key
        type: string
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
      region:
        title: 地区
        description: 创建地区(region)
        type: string
        examples:
        - ap-northeast-1
      amount:
        title: 创建数量
        description: 创建云服务器数量
        type: integer
        default: 1
      image_id:
        title: 亚马逊系统映象识别码
        description: 亚马逊系统映象识别码(ami)
        type: string
        examples:
        - ami-045f38c93733dd48d
      instance_type:
        title: 亚马逊执行个类型
        description: 亚马逊执行个体类型(instance_type)
        type: string
        examples:
        - t2.micro
      vpc_security_group_ids:
        title: 安全组清单
        description: 指定新创建实例所属于的安全组ID，提供一个或多个安全组ID。
        default: []
        type: array
        items:
          type: string
      subnet_id:
        title: 子网路识别码
        description: 子网路识别码(subnet_id)
        type: string
      associate_public_ip_address:
        title: 指派公有 IPv4 地址
        description: 指派公有 IPv4 地址
        type: boolean
      key_name:
        title: 密钥对名称
        description: 密钥对名称
        type: string
      tags:
        title: 标签
        description: 标签
        type: object
        examples:
        - mytagkey: mytagvalue
      root_disk:
        title: 系统数据盘
        description: 系统数据盘
        type: object
        properties:
          volume_type:
            description: 数据盘的云盘种类，请参考系统盘的云盘种类
            enum:
            - gp2
            - io1
            - standard
            type: string
            default: gp2
          volume_size:
            type: integer
            description: 数据盘的容量大小，单位 GB，最小为 8 GB
            default: 8
          delete_on_termination:
            type: boolean
            description: 表示数据盘是否随实例释放
            default: true
          encrypted:
            type: boolean
            description: 表示数据盘是否加密
            default: false
          iops:
            type: integer
            description: IOPS 数量。如果使用 "io1" 云盘种类，则必须指定 IOPS
            default: null
      disks:
        title: 数据盘
        description: 数据盘
        type: array
        items:
          type: object
          properties:
            device_name:
              type: string
              description: 数据盘的驱动器名称(Device Name)
              examples:
              - /dev/sdb
            volume_type:
              description: 数据盘的云盘种类
              enum:
              - gp2
              - io1
              - standard
              - sc1
              - st1
              type: string
              default: gp2
            volume_size:
              type: integer
              description: 数据盘的容量大小，单位 GB，最小为 8 GB
              default: 8
            delete_on_termination:
              type: boolean
              description: 表示数据盘是否随实例释放
              default: false
            encrypted:
              type: boolean
              description: 表示数据盘是否加密
              default: false
            iops:
              type: integer
              description: IOPS 数量。如果使用 "io1" 云盘种类，则必须指定 IOPS
              default: null
    required:
    - region
    - image_id
    - instance_type
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
    