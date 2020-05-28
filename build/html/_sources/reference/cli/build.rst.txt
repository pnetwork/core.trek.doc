
*****************
build
*****************

Usage:  [OPTIONS]

  Build project

Options:
  -p, --path TEXT  Marvin workflow project path
  -v, --verbose    verbose log
  --help           Show this message and exit.


Build all scripts (blcks) under current project.

Example
-------

.. code:: console

    $ trek build
    Build blcks: blcks.test.myblcks
    Path: /Users/guest/blcks.test.myblcks/handler
    ...
    Successfully tagged dockerhub.pentium.network/dev/blcks.test.myblcks:0.1.0
    Blcks image complete.
    Build blcks: notification
    Path: /Users/guest/blcks.python.im.notification/handler
    ...
    Successfully tagged dockerhub.pentium.network/dev/notification:0.5.0
    Blcks image complete.
    Finish building. [blcks.test.myblcks, notification]

