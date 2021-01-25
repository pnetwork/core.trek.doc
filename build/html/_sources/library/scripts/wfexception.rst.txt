wfexception
**********************************
| 工作流程异常讯息
| 收到工作流程异常结束讯息，产生系统日志

.. code-block:: yaml

    id: wfexception
    schemaVersion: '0.2'
    version: 0.3.0
    title: 工作流程异常讯息
    description: 收到工作流程异常结束讯息，产生系统日志
    namespace: network.pentium
    assets:
    - SCRIPT
    inputs:
      exceptionData:
        title: 造成异常的相关内容
        description: 造成异常的相关内容
        type: object
        properties:
          causeErrorActionId:
            type: string
          errorMessage:
            type: string
    required:
    - exceptionData
    outputs:
      done:
        title: blcks 工作完成
        description: blcks 工作完成
        type: boolean
    