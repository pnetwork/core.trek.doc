gcp-instance
**********************************
| 创建 Google Cloud 云服务器
| 透过 terraform 创建 Google Cloud 云服务器。

.. code-block:: yaml

    id: gcp-instance
    schemaVersion: '0.2'
    version: 0.1.4
    name: 创建 Google Cloud 云服务器
    title: 创建 Google Cloud 云服务器
    description: 透过 terraform 创建 Google Cloud 云服务器。
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      cloudcredentials:
        name: 云帐号
        title: 云帐号
        desctiption: 云帐号
        $ref: pn_sp_cloudhostcredential
      region:
        name: 地域
        title: 地域
        description: 创建地域(region)
        type: string
        examples: "- us-central1 \n"
      project_id:
        name: 专案识别码
        title: 专案识别码
        description: 专案识别码(project_id)
        type: string
        examples: "- yourproj-268890 \n"
      instance_name:
        name: 执行个体名称
        title: 执行个体名称
        description: 执行个体名称(instance_name)
        type: string
        examples: '- company-redis-server
    
          '
      zone:
        name: 可用区
        title: 可用区
        description: 可用地区(zone)
        type: string
        examples: "- us-central1-a \n"
      boot_disk_image:
        name: 开机磁碟系统映象识别码
        title: 开机磁系统映象识别码
        description: 开机磁碟系统映象识别码(boot_disk_image)
        type: string
        examples: "- centos-8-v20200205 \n"
      machine_type:
        name: 资源类型
        title: 资源类型
        description: 资源类型(machine_type)
        type: string
        examples: '- f1-micro
    
          '
      network_interface:
        name: 网络介面
        title: 网络介面
        description: 网络介面(network_interface)
        type: string
        examples: '- default
    
          '
        default: default
    required:
    - cloudaccount
    - region
    - project_id
    - instance_name
    - boot_disk_image
    - machine_type
    - zone
    - network_interface
    outputs:
      stdout:
        description: 脚本执行标准输出内容
        type: string
        examples: "---\nApply complete! Resources: 1 added, 0 changed, 0 destroyed.\n\n\
          Outputs:\n\ninstance_info = [\n  [\n    {\n      \"attached_disk\" = []\n  \
          \    \"boot_disk\" = [\n... \n"
    