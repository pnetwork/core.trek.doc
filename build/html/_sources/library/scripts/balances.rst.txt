balances
**********************************
| 帐户余额告警
| 定期检测帐户余额并发出告警

.. code-block:: yaml

    id: balances
    schemaVersion: '0.2'
    version: 0.6.0
    title: 帐户余额告警
    description: 定期检测帐户余额并发出告警
    namespace: network.pentium
    assets:
    - CLOUDACCOUNT
    inputs:
      provider:
        title: 欲查询的域名提供商
        enum:
        - aws
        - cloudflare
        - tencent
        - aliyun
        - godaddy
        - dnspod
        - yunpian
        - sms106
        - jiekou106
        enumNames:
        - aws
        - cloudflare
        - tencent
        - aliyun
        - godaddy
        - dnspod
        - yunpian
        - sms106
        - jiekou106
        type: string
        description: 指定的域名提供商
        examples:
        - aws
      balances:
        title: 设定告警余额阀值
        type: number
        description: 设定告警余额阀值
        examples:
        - 5000
    required:
    - provider
    - balances
    outputs:
      balances_result:
        title: 告警帐户余额
        description: 告警帐户余额
        type: array
        items:
          type: string
        examples:
        - '注意 test : 帐号(test) 帐户余额 1169.36，请记得充值!'
      count:
        title: 帐户余额低于阀值数量
        description: 帐户余额低于阀值数量
        type: integer
        examples:
        - 10
      accounts:
        title: 帐户余额低于阀值列表
        description: 帐户余额低于阀值列表
        type: array
        items:
          type: object
          properties:
            name:
              title: 帐号名称
              description: 帐号名称
              type: string
              examples:
              - pentium
            account:
              title: 帐号
              description: 帐号
              type: string
              examples:
              - abc@pentium
            balances:
              title: 帐户余额
              description: 帐户余额
              type: number
              examples:
              - 100
      exception:
        title: 错误讯息，正常执行则无
        description: 错误讯息，正常执行则无
        type: string
    