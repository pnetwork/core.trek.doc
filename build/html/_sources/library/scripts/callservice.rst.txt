callservice
**********************************
| 呼叫 blcks SDK 服务
| 呼叫 blcks SDK 服务

.. code-block:: yaml

    id: callservice
    schemaVersion: '0.2'
    version: 0.3.0
    name: 呼叫 blcks SDK 服务
    title: 呼叫 blcks SDK 服务
    description: 呼叫 blcks SDK 服务
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      service_name:
        name: 服务名称
        title: 服务名称
        type: string
        description: 服务名称
        examples:
        - CDN
        - DomainManager
        - HostsManager
        - CloudAccountManager
        - ChannelManager
        - TunnelManager
        - MiscManager
        - CertificateManager
      method_name:
        name: 方法名称
        title: 方法名称
        type: string
        description: 方法名称
      params:
        name: 传入参数
        title: 传入参数
        type: string
        description: 传入参数 (JSON format)
      raise_exception:
        name: 抛出例外
        title: 抛出例外
        type: integer
        default: 0
        examples:
        - 0
        - 1
    required:
    - service_name
    - method_name
    outputs:
      code:
        name: 执行结果代码
        title: 执行结果代码
        type: integer
        description: 执行结果代码
      msg:
        name: 执行结果讯息
        title: 执行结果讯息
        type: string
        description: 执行结果讯息
      result:
        name: 回传结果
        title: 回传结果
        type: object
        description: 回传结果
    