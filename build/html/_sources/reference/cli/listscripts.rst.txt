
*****************
listscripts
*****************

Usage:  [OPTIONS] [SCRIPT]

  List packages on Nexus

Options:
  -v, --verbose  verbose log
  --help         Show this message and exit.




Example
-------

.. code:: console

    # list all available scripts
    $ trek listscripts
    available scripts:
    wfexception [0.2]
    weixincheck [0.4.0, 0.3.1, 0.3.0, 0.2]
    updateyearning [0.3, 0.2]
    ...

    # list available versions of specific script
    $ trek listscripts notification
    [notification] available versions:
    0.5.0
    0.4.0
    ...

