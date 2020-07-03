
***********
Quick Start
***********

You can use ``Trek`` CLI to create a Blcks project.

.. code:: console

    $ trek createblcks myblcks
    Blcks [myblcks] creating...
    Done


And then, you got a new Blcks project named myblcks.
You can write some codes in ``handler/handler.py``

.. code:: python

    from blcks import blcks

    FAAS_METHOD_NAME = "myblcks"
    logger = blcks.logger

    @blcks
    def main(event, context):
        pass

    @blcks.script(FAAS_METHOD_NAME)
    def process(message):
        result = {
            "code": 0,
            "msg": message,
            "result": "success",
        }

        # write your code here
        print("Hello world.")

        return result


Using Services
**************

``Service`` is a Marvin API request utility. You can use them to send requests to Marvin and control assets.

Use service in your code:

.. code:: python

    from blcks import ServiceName
    service = blcks.createService(ServiceName.RBACManager)
    result = service.get_users_me()


So you can use it to get user information in Blcks handler like:

.. code:: python

    from blcks import blcks, ServiceName

    @blcks.script(FAAS_METHOD_NAME)
    def process(message):
        result = {
            "code": 0,
            "msg": message,
            "result": "success",
        }

        service = blcks.createService(ServiceName.RBACManager)
        response = service.get_users_me()
        print(response)
        # {'createdBy': {'name': '预设管理员', 'id': 'system1'}, 'actions': {'PLAYBOOK_READ'...

        return result


Working with Trek CLI
*********************

Trek can let you develop and test Blcks project in local machine.

1. create project

.. code:: console

    $ trek createblcks myblcks
    Blcks [myblcks] creating...
    This utility will walk you through creating a config.json file.
    Marvin url []: https://your-marvin-url.com
    Marvin JWT []: marvinJTW
    Marvin secret []: marvinSecret
    Done

2. write your own code

3. execute Blcks in local machine

.. code:: console

    $ cd myblcks
    $ trek runblcks
    starting blcks myblcks...
    mflow-CLI    |  make request: http://127.0.0.1:60999
    blcks-myblcks|  * Debugger PIN: 108-402-288
    ...
    ...
    mflow-CLI    |  closing blcks myblcks...

4. pack and deploy to Marvin

.. code:: console

    $ trek deployblcks --autopack --autobuildpush -y
    Deploy Blcks...
    ...
    ...
    Successfully built fc7f079e8c88
    Successfully tagged dockerhub.pentium.network/dev/myblcks:0.1.0
    Blcks image complete.
    ...
    Packing blcks: /Users/test/myblcks
    Success packing, output: /Users/test/myblcks/bin/blcks.myblcks.1.0.zip
    Deploying: /Users/test/myblcks/bin/blcks.myblcks-0.1.0.zip
    Done

