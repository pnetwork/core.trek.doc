getsubdomain
**********************************
| 取得FQDN资讯
| 取得FQDN资讯

.. code-block:: yaml

    id: getsubdomain
    schemaVersion: '0.2'
    version: 0.2.1
    title: 取得FQDN资讯
    description: 取得FQDN资讯
    namespace: network.pentium
    assets:
    - DOMAIN
    inputs:
      fqdns:
        title: 受检测的FQDN
        description: "欲受检测的FQDN：范例\naaa.0987.site\nbbb.0988.online \n"
        $ref: pn_sp_textarea_array
        examples:
        - aaa.0987.site
        - bbb.0988.online
      fire_event:
        title: 取得每個子域名並發送 event
        description: Yes/No (true/false)
        type: boolean
        enum:
        - 0
        - 1
        enumNames:
        - 'no'
        - 'yes'
    required:
    - fqdns
    - fire_event
    outputs:
      fqdns:
        title: fqdn 详细资讯
        type: array
        items:
          type: object
      unknown_fqdns:
        title: 查无所属域名之 fqdn
        type: array
        items:
          type: string
          examples:
          - aaa.sssgg.site
    