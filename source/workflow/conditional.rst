Workflow Operators
---------------------

當一個 node 為條件式時 ``type: selector``：

.. code-block:: yaml
    :linenos:
    
      - metadata: 
        type: selector
        title: selector
        id: '4'

條件式的條件會在 edge 上，若符合條件繼續往下執行，一個條件式的長相如下：

.. code-block:: yaml
    :linenos:

      - source: '4' # 條件式 node id
        target: '5' # 條件式吻合時的下個 node id
        metadata:
            filters:
                property: nodes.4.fail_hosts_count  # 條件式比較欄位
                operator: '>'                       # 條件式運算方式
                value: 0                            # 條件式比較目標
            binding:
            # 當符合條件式時，要傳給下個 node 的 inputs 欄位 
            - property: str_message
              ...

下面會一一介紹 workflow 所支援的條件式運算子。

=\=
###########
| 比較兩值是否相等。
| 假設 |a_len| 為 array 的長度，下面例子 if |a_len| == 0：

.. code-block:: yaml

    # False
    filters:
        property:  nodes.4.fail_hosts_count # 1
        operator: '=='                       
        value: 0 

!= 
#######
| 比較兩值是否不相等。
| 假設 |a_len| 為 array 的長度，下面例子 if |a_len| != 0：

.. code-block:: yaml

    # True
    filters:
        property: nodes.4.fail_hosts_count # 1
        operator: '!='                       
        value: 0 

\> 
#######
| 比較值是否大於指定數值。
| 假設 |a_len| 為 array 的長度，下面例子 if |a_len| > 0：

.. code-block:: yaml

    # True
    filters:
        property: nodes.4.fail_hosts_count # 1
        operator: '>'                       
        value: 0 

\>= 
#######
| 比較值是否大於等於指定數值。
| 假設 |a_len| 為 array 的長度，下面例子 if |a_len| >= 0：

.. code-block:: yaml

    # True
    filters:
        property: nodes.4.fail_hosts_count # 1
        operator: '>='                       
        value: 0 

\<
#######
| 比較值是否小於指定數值。
| 假設 |a_len| 為 array 的長度，下面例子 if |a_len| < 0：

.. code-block:: yaml

    # False
    filters:
        property: nodes.4.fail_hosts_count # 1
        operator: '<'                       
        value: 0 

\<= 
#######
| 比較值是否小於等於指定數值。
| 假設 |a_len| 為 array 的長度，下面例子 if |a_len| <= 0：

.. code-block:: yaml

    # False
    filters:
        property: nodes.4.fail_hosts_count # 1
        operator: '<='                       
        value: 0 

sizeEquals 
##############
| 比較 array or string 的長度是否等於指定的數字。
| 假設 |a| 為 list of objects，下面例子 if len( |a| ) == 1：

.. code-block:: yaml

    # True
    filters:
        property: nodes.4.fail_hosts  # [{"id: "H-123", "name": "I'm host"}]
        operator: 'sizeEquals'                       
        value: 1 

sizeNotEquals 
###################
| 比較 array or string 的長度是否不等於指定的數字。
| 假設 |a| 為 list of objects，下面例子 if len( |a| ) != 1：

.. code-block:: yaml

    # False
    filters:
        property: nodes.4.fail_hosts  # [{"id: "H-123", "name": "I'm host"}]
        operator: 'sizeNotEquals'                       
        value: 1 

sizeLessThan 
###################
| 比較 array or string 的長度是否小於指定的數字。
| 假設 |a| 為 list of objects，下面例子 if len( |a| ) < 5 。

.. code-block:: yaml

    # True
    filters:
        property: nodes.4.fail_hosts  # [{"id: "H-123", "name": "I'm host"}]
        operator: 'sizeLessThan'                       
        value: 5

sizeLessThanEquals 
######################
| 比較 array or string 的長度是否小於等於指定的數字。
| 假設 |a| 為 list of objects，下面例子 if len( |a| ) <= 1 。

.. code-block:: yaml

    # True
    filters:
        property: nodes.4.fail_hosts  # [{"id: "H-123", "name": "I'm host"}]
        operator: 'sizeLessThanEquals'                       
        value: 1

sizeGreaterThan 
######################
| 比較 array or string 的長度是否大於指定的數字。
| 假設 |a| 為 list of objects，下面例子 if len( |a| ) > 5：

.. code-block:: yaml

    # False
    filters:
        property: nodes.4.fail_hosts  # [{"id: "H-123", "name": "I'm host"}]
        operator: 'sizeGreaterThan'                       
        value: 5

sizeGreaterThanEquals 
######################
| 比較 array or string 的長度是否大於等於指定的數字。
| 假設 |a| 為 list of objects，下面例子 if len( |a| ) >= 5：

.. code-block:: yaml

    # False
    filters:
        property: nodes.4.fail_hosts  # [{"id: "H-123", "name": "I'm host"}]
        operator: 'sizeGreaterThanEquals'                       
        value: 5

lengthEquals 
######################
| 比較 string 的長度是否相同。
| 假設 |a_str| 為 string，下面例子 if len( |a_str| ) == len( |b_str| )：

.. code-block:: yaml

    # False
    filters:
        property: nodes.2.result  # "Good"
        operator: 'lengthEquals'                       
        value: 'Good morning'

lengthNotEquals 
######################
| 比較 string 的長度是否不相同。
| 假設 |a_str| 為 string，下面例子 if len( |a_str| ) != len( |b_str| )：

.. code-block:: yaml

    # True
    filters:
        property: nodes.2.result  # "Good"
        operator: 'lengthNotEquals'                       
        value: 'Good morning'

lengthLessThan 
######################
| 比較 string 的長度是否小於被比較的 string。
| 假設 |a_str| 為 string，下面例子 if len( |a_str| ) < len( |b_str| )：

.. code-block:: yaml

    # True
    filters:
        property: nodes.2.result  # "Good"
        operator: 'lengthLessThan'                       
        value: 'Good morning'

lengthLessThanEquals 
######################
| 比較 string 的長度是否小於等於被比較的 string。
| 假設 |a_str| 為 string，下面例子 if len( |a_str| ) <= len( |b_str| )：

.. code-block:: yaml

    # True
    filters:
        property: nodes.2.result  # "Good"
        operator: 'lengthLessThanEquals'                       
        value: 'Good morning'

lengthGreaterThan 
######################
| 比較 string 的長度是否大於被比較的 string。
| 假設 |a_str| 為 string，下面例子 if len( |a_str| ) > len( |b_str| )：

.. code-block:: yaml

    # False
    filters:
        property: nodes.2.result  # "Good"
        operator: 'lengthGreaterThan'                       
        value: 'Good morning'

lengthGreaterThanEquals 
###########################
| 比較 string 的長度是否大於等於被比較的 string。
| 假設 |a_str| 為 string，下面例子 if len( |a_str| ) >= len( |b_str| )：

.. code-block:: yaml

    # False
    filters:
        property: nodes.2.result  # "Good"
        operator: 'lengthGreaterThanEquals'                       
        value: 'Good morning'

have 
###########################
| 判斷指定值是否存在於 string or array 中。
| 假設 |a_str| 為 string，下面例子 if |a_str| in |b_str| ：

.. code-block:: yaml

    # True
    filters:
        property: nodes.2.result  # "Good"
        operator: 'have'                       
        value: 'Good morning'

notHave 
###########################
| 判斷指定值是否不存在於 string or array 中。
| 假設 |a_str| 為 string，下面例子 if |a_str| not in |b_str| ：

.. code-block:: yaml

    # False
    filters:
        property: nodes.2.result  # "Good"
        operator: 'notHave'                       
        value: 'Good morning'

regEx 
###########################
| Regular expression。
| 假設 |a_str| 為 string，下面例子 if |a_str| not in |b_str| ：

.. code-block:: yaml

    # True
    filters:
        property: nodes.2.result  # "Good"
        operator: 'regEx'                       
        value: '[A-Za-z]'



.. |a_len| replace:: nodes.4.fail_hosts_count
.. |a| replace:: nodes.4.fail_hosts
.. |a_str| replace:: nodes.2.result
.. |b_str| replace:: "Good"
