alicloud-instance
**********************************
| 创建阿里云 (AliCloud) 云服务器
| 透过 terraform 创建阿里云 (AliCloud) 云服务器。

.. code-block:: yaml

    id: alicloud-instance
    schemaVersion: '0.2'
    version: 0.2.0
    name: 创建阿里云 (AliCloud) 云服务器
    title: 创建阿里云 (AliCloud) 云服务器
    description: 透过 terraform 创建阿里云 (AliCloud) 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      cloudaccount:
        name: 云帐号
        title: 云帐号
        desctiption: 云帐号
        $ref: pn_sp_cloudhostcredential
      access_key:
        name: 云帐号 access_key
        title: 云帐号 access_key
        desctiption: 云帐号 access_key
        type: string
      secret_key:
        name: 云帐号 secret_key
        title: 云帐号 secret_key
        desctiption: 云帐号 secret_key
        type: string
      region:
        name: 地区
        title: 地区
        description: 创建地区(region)
        type: string
        examples: "- cn-hongkong \n"
      image_id:
        name: 阿里云系统映象识别码
        title: 阿里云系统映象识别码
        description: 阿里云系统映象识别码(image_id)
        type: string
        examples: '- centos_7_06_64_20G_alibase_20190711.vhd
    
          '
      instance_type:
        name: 阿里云执行个体类型
        title: 阿里云执行个体类型
        description: 阿里云执行个体类型(instance_type)
        type: string
        examples: '- ecs.n4.large
    
          '
      security_groups:
        name: 安全性群组
        title: 安全性群组
        description: 安全性群组(security_groups)
        type: array
        items:
          type: string
        default: []
      vswitch_id:
        name: 虚拟交换机识别码
        title: 虚拟交换机识别码
        description: 虚拟交换机识别码(vswitch_id)
        type: string
    required:
    - region
    - image_id
    - security_groups
    - vswitch_id
    - instance_type
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples: "---\nYou may now begin working with Terraform. Try running \"terraform\
          \ plan\" to see\nalicloud_instance.ins[0]: Creating...\nalicloud_instance.ins[0]:\
          \ Still creating... [10s elapsed]\nalicloud_instance.ins[0]: Creation complete\
          \ after 15s [id=i-j6cga8430tlrz3opcpxr]\n\nApply complete! Resources: 1 added,\
          \ 0 changed, 0 destroyed.\n\nOutputs:\n\ninstance_info = [\n  [\n    {\n   \
          \   \"auto_release_time\" = \"\"\n      \"availability_zone\" = \"cn-hongkong-c\"\
          \n      \"credit_specification\" = \"Standard\"\n      \"data_disks\" = []\n\
          \      \"deletion_protection\" = false\n      \"description\" = \"\"\n     \
          \ \"dry_run\" = false\n      \"host_name\" = \"iZj6cga8430tlrz3opcpxrZ\"\n \
          \     \"id\" = \"i-j6cga8430tlrz3opcpxr\"\n      \"image_id\" = \"centos_7_06_64_20G_alibase_20190711.vhd\"\
          \n  ...    \n"
    