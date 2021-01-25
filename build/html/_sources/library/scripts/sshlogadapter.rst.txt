sshlogadapter
**********************************
| SSH 日志处理
| SSH 日志处理

.. code-block:: yaml

    id: sshlogadapter
    schemaVersion: '0.2'
    version: 0.7.0
    title: SSH 日志处理
    description: SSH 日志处理
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      marvinHashId:
        type: string
        description: The hashID generated from marvin.
      ssh_account:
        type: string
        description: the account used to ssh login
      clientIP:
        type: string
        description: The ssh source IP.
        examples:
        - 10.0.0.1
      targetIP:
        type: string
        description: The destination IP, since record in target host, it must record private
          IP.
        examples:
        - 192.168.1.100
      targetPort:
        type: integer
        description: The destination connection port
        examples:
        - '22'
      time:
        type: string
        description: The event generating time, in RFC3339 format with milliseconds.
        examples:
        - '2019-07-24 14:58:44.812895649+08:00'
      hostname:
        type: string
        description: The target hostname
        examples:
        - centos7.domain
      bootstrapMarvinHashId:
        type: string
        description: The bootstrap hashID generated from marvin.
      sshType:
        type: string
        description: The ssh log type.
        examples:
        - sshrec
    outputs:
      alert:
        type: boolean
        description: Need alert or not
      clientIP:
        type: string
        description: the login ip where user logined from
      ssh_account:
        type: string
        description: the account is used to do ssh login
      hostname:
        type: string
        description: the hostname
    