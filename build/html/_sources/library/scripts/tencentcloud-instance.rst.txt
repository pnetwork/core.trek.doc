tencentcloud-instance
**********************************
| 创建腾讯云 (TencentCloud) 云服务器
| 透过 terraform 创建腾讯云 (TencentCloud) 云服务器。

.. code-block:: yaml

    id: tencentcloud-instance
    schemaVersion: '0.2'
    version: 0.8.1
    title: 创建腾讯云 (TencentCloud) 云服务器
    description: 透过 terraform 创建腾讯云 (TencentCloud) 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      credential:
        title: 云帐号
        description: 云帐号
        type: object
      secret_id:
        title: 云帐号 secret_id
        description: 云帐号 secret_id
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
        title: 地域
        description: 创建地域(region)
        type: string
        examples:
        - cn-hongkong
      availability_zone:
        title: 可用区
        description: 可用地区(availability_zone)
        type: string
        examples:
        - cn-hongkong-2
      charge_type:
        title: 付费方式
        description: 付费方式，包年包月或按量付费
        type: string
        enum:
        - PREPAID
        - POSTPAID_BY_HOUR
        default: POSTPAID_BY_HOUR
      prepaid_period:
        title: 付费方式数量
        description: 当选择包年包月，请设定付费数量，选择月请填入 [1-12, 24, 36]
        type: integer
        default: 1
      prepaid_auto_renewal:
        title: 自动续约
        description: 当选择包年包月，可设定自动续约或不自动续约
        type: boolean
        default: true
      amount:
        title: 创建数量
        description: 创建云服务器数量
        type: integer
        default: 1
      image:
        title: 系统映象识别码
        description: 系统映象识别码(image_id)
        type: string
        examples:
        - img-9qabwvbn
      instance_type:
        title: 执行个体类型
        description: 执行个体类型(instance_type)
        type: string
        examples:
        - S1.SMALL1
      vpc_id:
        title: 私有网络 VPC ID
        description: 私有网络 VPC ID
        type: string
        examples:
        - vpc-123abc
      subnet_id:
        title: 子网 ID
        description: 子网 ID (subnet)
        type: string
        examples:
        - subnet-123abc
      security_groups:
        title: 安全性群组
        description: 安全性群组(security_groups)
        type: array
        items:
          type: string
        default: []
      internet_charge_type:
        title: 网络计费类型
        description: '网络计费类型。BANDWIDTH：按固定带宽计费。TRAFFIC_POSTPAID_BY_HOUR（默认）：按使用流量计费。
    
          若选择服务器包年包月和网路固定带宽计费时，将会使用网路固定带宽包年包月模式。
    
          '
        type: string
        enum:
        - TRAFFIC_POSTPAID_BY_HOUR
        - BANDWIDTH
        default: TRAFFIC_POSTPAID_BY_HOUR
      internet_max_bandwidth_out:
        title: 公网出带宽最大值
        description: 公网出带宽最大值，单位为Mbit/s。取值范围：0~100 默认值：0。
        type: integer
        default: 0
      instance_name:
        title: 实例名称
        description: 实例名称。长度为2~128个字符，必须以大小字母或中文开头，不能以http://和https://开头。可以包含中文、英文、数字、半角冒号（:）、下划线（_）、点号（.）或者连字符（-）。默认值为
          CVM-Instance。
        type: string
      hostname:
        title: 实例主机名称
        description: 实例主机名称
        type: string
      key_id:
        title: 密钥对 ID
        description: 密钥对 ID
        type: string
        examples:
        - skey-123abc
      password:
        title: 实例密码
        description: 8 - 30 个字符，必须同时包含三项(大写字母、小写字母、数字、()`~!@#$%^&*_-+=|{}[]:;'<>,.?/ 中的特殊符号)，其中
          Windows 实例不能以斜线号 (/) 为首字符。
        type: string
      system_disk_type:
        title: 系统盘的云盘种类
        description: 系统盘的云盘种类
        type: string
        enum:
        - CLOUD_BASIC
        - CLOUD_SSD
        - CLOUD_PREMIUM
        default: CLOUD_PREMIUM
      system_disk_size:
        title: 系统盘大小
        description: 系统盘大小，单位为GiB。取值范围：50~1000，预设 50 GB
        type: integer
        default: 50
      system_disk_snapshot_policy:
        title: 自动快照策略 ID
        description: 系统盘采用的自动快照策略 ID。
        type: string
        examples:
        - asp-123abc
      disks:
        title: 数据盘
        description: 数据盘清单
        type: array
        items:
          type: object
          properties:
            size:
              type: integer
              description: 数据盘的容量大小，取值范围：10~16000，预设 10 GB
            type:
              type: string
              description: 数据盘的云盘种类
              enum:
              - CLOUD_BASIC
              - CLOUD_SSD
              - CLOUD_PREMIUM
              default: CLOUD_PREMIUM
            delete_with_instance:
              type: boolean
              description: 表示数据盘是否随实例释放
      data_disk_snapshot_policy:
        title: 数据盘自动快照策略 ID
        description: 数据盘采用的自动快照策略 ID，套用到全部的数据盘。
        type: string
        examples:
        - asp-123abc
      tags:
        title: 标签
        description: 标签
        type: object
        examples:
        - mytagkey: mytagvalue
    required:
    - region
    - availability_zone
    - image
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
          ,\n            \"private_ip\": \"172.31.220.103\"\n          }\n        }\n\
          \      ]\n    }\n  ]\n}\n"
    