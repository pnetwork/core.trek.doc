
*****************
pack
*****************

Usage:  [OPTIONS]

  Pack project

Options:
  -p, --path TEXT  Marvin workflow project path
  -a, --all        Pack all
  --auto-pos       Reposition nodes in graph
  -v, --verbose    verbose log
  --help           Show this message and exit.




Example
-------

.. code:: console

    # pack workflow only
    $ trek pack
    Success packing, output: /Users/pentium/hello_project/bin/hello_project-0.0.0.zip

    # pack all under project
    $ trek pack -a
    Success packing, output: /Users/pentium/hello_project/bin/hello_project-0.0.0.zip
    Packing blcks: /Users/pentium/hello_project/src/blcks/myblcks
    Success packing, output: /Users/pentium/hello_project/bin/blcks.myblcks-0.1.0.zip
    ...

