
***********
Ansible
***********

You can use ``Trek`` CLI to create an Ansible project.

.. code:: console

    $ trek createansible myansible
    Ansible [myansible] creating...
    Done


And then, you got a new Ansible project named myansible.
You can write some codes in ``myansible.yml``

.. code:: ansible

    ---
    - name: myansible
        become: yes
        gather_facts: no
        hosts: hosts
        tasks:
        - command: "echo {{message}}"
        - command: "ls"
        - debug: 
            msg: "trek CLI ansible example"


Working with Trek CLI
*********************

Trek can let you develop and test Ansible project in local machine.

1. create project

.. code:: console

    $ trek createansible myansible
    Blcks [myansible] creating...
    This utility will walk you through creating a config.json file.
    Marvin url []: https://your-marvin-url.com
    Marvin JWT []: marvinJTW
    Marvin secret []: marvinSecret
    Done

2. write your own code

3. execute Ansible in local machine

.. code:: console

    $ cd myansible
    $ trek runansible
    starting ansible myansible...

4. pack and deploy to Marvin

.. code:: console

    $ trek deployansible --autobuildpush -y
    Deploy Ansible script...
    Packing ansible: /Users/ansible_trek/myansible
    Success packing, output: /Users/ansible_trek/myansible/bin/ansible.myansible-0.1.0.zip
    Deploying: /Users/ansible_trek/myansible/bin/ansible.myansible-0.1.0.zip
    Done


Built-in Variables in Ansible Runner
************************************

There are some built-in variables that can be used in marvin ansible:

* ``authorization``: JWT token for caller 
* ``baseUrlWebhook``: Marvin URL
* ``pn_task_id``: Task ID for log tracking
