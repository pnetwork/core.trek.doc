gcp-instance
**********************************
| 创建 Google Cloud 云服务器
| 透过 terraform 创建 Google Cloud 云服务器。

.. code-block:: yaml

    id: gcp-instance
    schemaVersion: '0.2'
    version: 0.8.1
    title: 创建 Google Cloud 云服务器
    description: 透过 terraform 创建 Google Cloud 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      credential:
        title: 云帐号
        description: 云帐号
        type: object
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
      project:
        title: 专案识别码
        description: 专案识别码(project_id)
        type: string
        examples:
        - yourproj-268890
      region:
        title: 地域
        description: 创建地域(region)
        type: string
        examples:
        - us-central1
      zone:
        title: 可用区
        description: 可用地区(zone)
        type: string
        examples:
        - us-central1-a
      amount:
        title: 创建数量
        description: 创建云服务器数量
        type: integer
        default: 1
      name:
        title: 执行个体名称
        description: 执行个体名称(instance_name)
        type: string
        examples:
        - company-redis-server
      machine_type:
        title: 资源类型
        description: 资源类型(machine_type)
        type: string
        examples:
        - f1-micro
      image:
        title: 开机磁系统映象识别码
        description: 开机磁碟系统映象识别码
        type: string
        examples:
        - centos-8-v20200205
      boot_disk_size:
        title: 开机磁碟大小
        description: 开机磁碟大小，单位为 GB
        type: integer
        default: 10
      boot_disk_type:
        title: 系统盘的云盘种类
        description: 系统盘的云盘种类
        type: string
        enum:
        - pd-standard
        - pd-ssd
        - pd-balanced
        default: pd-standard
      boot_disk_snapshot_policy:
        title: 系统盘的自动快照策略名称
        description: 系统盘的自动快照策略名称
        type: string
      boot_disk_auto_delete:
        title: 系统盘是否随实例释放
        description: 系统盘是否随实例释放
        type: boolean
        default: true
      disks:
        title: 数据盘
        description: 数据盘清单
        type: array
        items:
          type: object
          properties:
            size:
              type: integer
              description: 数据盘的容量大小，单位 GB
            type:
              type: string
              description: 数据盘的云盘种类，请参考系统盘的云盘种类
              enum:
              - pd-standard
              - pd-ssd
              - pd-balanced
              default: pd-standard
            snapshot_policy:
              description: 自动快照策略名称
              type: string
      networks:
        title: 网络介面
        description: 网络介面清单(network_interface)
        type: array
        items:
          type: object
          properties:
            network:
              type: string
              description: VPC 名称，可填入 VPC 名称或 VPC self_link 值
            subnetwork:
              type: string
              description: 子网路名称，可填入子网路名称或子网路 self_link 值
            external_ip:
              description: 指派公有 IPv4 地址
              type: boolean
        default: '[{"network": "default", "subnetwork": "default", "external_ip": true}]
    
          '
      network_tags:
        title: 网络标记
        description: 利用标记，您可以将防火墙规则和路由应用于特定虚拟机实例
        type: array
        items:
          type: string
      labels:
        title: 标签
        description: 标签
        type: object
        examples:
        - mytagkey: mytagvalue
    required:
    - project
    - region
    - zone
    - name
    - machine_type
    - image
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples:
        - "---\nApply complete! Resources: 1 added, 0 changed, 0 destroyed.\n\nOutputs:\n\
          \ninstance_info = [\n  [\n    {\n      \"attached_disk\" = []\n      \"boot_disk\"\
          \ = [\n... \n"
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
    