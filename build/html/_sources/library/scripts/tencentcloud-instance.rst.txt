tencentcloud-instance
**********************************
| 创建腾讯云云服务器
| 透过 terraform 创建腾讯云 (TencentCloud) 云服务器。

.. code-block:: yaml

    id: tencentcloud-instance
    schemaVersion: '0.2'
    version: 0.2.0
    name: 创建腾讯云云服务器
    title: 创建腾讯云 (TencentCloud) 云服务器
    description: 透过 terraform 创建腾讯云 (TencentCloud) 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      cloudaccount:
        name: 云帐号
        title: 云帐号
        desctiption: 云帐号
        $ref: pn_sp_cloudhostcredential
      secret_id:
        name: 云帐号 secret_id
        title: 云帐号 secret_id
        desctiption: 云帐号 secret_id
        type: string
      secret_key:
        name: 云帐号 secret_key
        title: 云帐号 secret_key
        desctiption: 云帐号 secret_key
        type: string
      region:
        name: 地域
        title: 地域
        description: 创建地域(region)
        type: string
        examples: '- cn-hongkong
    
          '
      availability_zone:
        name: 可用区
        title: 可用区
        description: 可用地区(availability_zone)
        type: string
        examples: '- cn-hongkong-2
    
          '
      image_id:
        name: 系统映象识别码
        title: 系统映象识别码
        description: 系统映象识别码(image_id)
        type: string
        examples: '- img-9qabwvbn
    
          '
      instance_type:
        name: 执行个体类型
        title: 执行个体类型
        description: 执行个体类型(instance_type)
        type: string
        examples: "- S1.SMALL1 \n"
      system_disk_type:
        name: 系统磁碟类型
        title: 系统磁碟类型
        description: 系统磁碟类型(system_disk_type)
        type: string
        examples: '- CLOUD_PREMIUM
    
          '
      system_disk_size:
        name: 系统磁碟大小
        title: 系统磁碟大小
        description: 系统磁碟大小(system_disk_size)
        type: integer
        default: 50
      amount:
        name: 创建数量
        title: 创建数量
        description: 创建云服务器数量
        type: integer
        default: 1
      security_groups:
        name: 安全性群组
        title: 安全性群组
        description: 安全性群组(security_groups)
        type: array
        items:
          type: string
        default: []
    required:
    - region
    - availability_zone
    - image_id
    - instance_type
    - system_disk_type
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
    