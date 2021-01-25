alicloud-instance
**********************************
| 创建阿里云 (AliCloud) 云服务器
| 透过 terraform 创建阿里云 (AliCloud) 云服务器。

.. code-block:: yaml

    id: alicloud-instance
    schemaVersion: '0.2'
    version: 0.7.1
    title: 创建阿里云 (AliCloud) 云服务器
    description: 透过 terraform 创建阿里云 (AliCloud) 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      credential:
        title: 云帐号
        description: 云帐号
        type: object
      access_key:
        title: 云帐号 Access Key
        description: 云帐号 Access Key
        type: string
      secret_key:
        title: 云帐号 Access Key Secret
        description: 云帐号 Access Key Secret
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
        - cn-beijing
      availability_zone:
        title: 可用性区域
        description: 可用性区域（Zone）
        type: string
        examples:
        - cn-beijing-b
      image_id:
        title: 阿里云系统镜像 ID
        description: 镜像 ID，启动实例时选择的镜像资源。
        type: string
        examples:
        - centos_6_09_64_20G_alibase_20180326.vhd
      instance_type:
        title: 实例规格
        description: 实例的资源规格(instance_type)
        type: string
        examples:
        - ecs.t5-lc2m1.nano
      amount:
        title: 创建数量
        description: 创建云服务器数量
        type: integer
        default: 1
      security_groups:
        title: 安全组清单
        description: 指定新创建实例所属于的安全组ID，提供一个或多个阿里云安全组ID。
        default: []
        type: array
        items:
          type: string
      vswitch_id:
        title: 虚拟交换机 ID
        description: 虚拟交换机ID。如果您创建的是VPC类型ECS实例，必须指定虚拟交换机ID，且安全组和虚拟交换机在同一个专有网络VPC中。
        type: string
        examples:
        - vsw-abcdefj123456
      instance_name:
        title: 实例名称
        description: 实例名称。长度为2~128个字符，必须以大小字母或中文开头，不能以http://和https://开头。可以包含中文、英文、数字、半角冒号（:）、下划线（_）、点号（.）或者连字符（-）。默认值为
          ECS-Instance。
        type: string
      host_name:
        title: 实例主机名称
        description: 实例主机名称
        type: string
      description:
        title: 实例描述
        description: 实例的描述。长度为2~256个英文或中文字符，不能以http://和https://开头。
        type: string
      system_disk_category:
        title: 系统盘的云盘种类
        description: 系统盘的云盘种类
        enum:
        - cloud_efficiency
        - cloud_ssd
        type: string
        default: cloud_efficiency
      system_disk_size:
        title: 系统盘大小
        description: 系统盘大小，单位为GiB。取值范围：20~500，预设 40 GB
        type: integer
        default: 40
      system_disk_auto_snapshot_policy_id:
        title: 自动快照策略 ID
        description: 系统盘采用的自动快照策略 ID。
        type: string
        examples:
        - sp-abcdefj123456
      disks:
        title: 数据盘
        description: 数据盘清单
        type: array
        items:
          type: object
          properties:
            name:
              type: string
              description: 数据盘名称
            size:
              type: integer
              description: 数据盘的容量大小，单位 GB
            category:
              type: string
              description: 数据盘的云盘种类，请参考系统盘的云盘种类
            description:
              type: string
              description: 数据盘的描述
            auto_snapshot_policy_id:
              type: string
              description: 自动快照策略 ID
            delete_with_instance:
              type: boolean
              description: 表示数据盘是否随实例释放
      tags:
        title: 标签
        description: 标签
        type: object
        examples:
        - mytagkey: mytagvalue
      key_name:
        title: 密钥对名称
        description: 密钥对名称
        type: string
      password:
        title: 实例密码
        description: 8 - 30 个字符，必须同时包含三项(大写字母、小写字母、数字、()`~!@#$%^&*_-+=|{}[]:;'<>,.?/ 中的特殊符号)，其中
          Windows 实例不能以斜线号 (/) 为首字符。
        type: string
      internet_charge_type:
        title: 网络计费类型
        description: 网络计费类型。取值范围：PayByBandwidth：按固定带宽计费。PayByTraffic（默认）：按使用流量计费。
        type: string
        enum:
        - PayByBandwidth
        - PayByTraffic
        default: PayByTraffic
      internet_max_bandwidth_out:
        title: 公网出带宽最大值
        description: 公网出带宽最大值，单位为Mbit/s。取值范围：0~100 默认值：0。
        type: integer
        default: 0
      instance_charge_type:
        title: 付费方式
        description: 付费方式，包年包月或按量付费
        type: string
        enum:
        - PrePaid
        - PostPaid
        default: PostPaid
      period_unit:
        title: 付费方式单位
        description: 当选择包年包月，请设定付费单位为周或月
        type: string
        enum:
        - Week
        - Month
        default: Month
      period:
        title: 付费方式数量
        description: 当选择包年包月，请设定付费数量，选择周可填入 [1-3]，选择月请填入 [1-9, 12, 24, 36, 48, 60]
        type: integer
        default: 1
      renewal_status:
        title: 自动续约
        description: 当选择包年包月，可设定自动续约，不自动续约，或不续约并停止通知
        type: string
        enum:
        - AutoRenewal
        - Normal
        - NotRenewal
        default: Normal
    required:
    - region
    - image_id
    - instance_type
    - vswitch_id
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples:
        - "---\nYou may now begin working with Terraform. Try running \"terraform plan\"\
          \ to see\nalicloud_instance.ins[0]: Creating...\nalicloud_instance.ins[0]: Still\
          \ creating... [10s elapsed]\nalicloud_instance.ins[0]: Creation complete after\
          \ 15s [id=i-j6cga8430tlrz3opcpxr]\n\nApply complete! Resources: 1 added, 0 changed,\
          \ 0 destroyed.\n\nOutputs:\n\n  instance_info = [\n    [\n      {\n        \"\
          auto_release_time\" = \"\"\n        \"availability_zone\" = \"cn-hongkong-c\"\
          \n        \"credit_specification\" = \"Standard\"\n        \"data_disks\" =\
          \ []\n        \"deletion_protection\" = false\n        \"description\" = \"\"\
          \n        \"dry_run\" = false\n        \"host_name\" = \"iZj6cga8430tlrz3opcpxrZ\"\
          \n        \"id\" = \"i-j6cga8430tlrz3opcpxr\"\n        \"image_id\" = \"centos_7_06_64_20G_alibase_20190711.vhd\"\
          \n    ...\n"
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
    