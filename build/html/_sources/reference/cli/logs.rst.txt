
*****************
logs
*****************

Usage:  [OPTIONS] [ACTIONS]...

  View log output from containers

Options:
  -p, --path TEXT  Marvin workflow project path
  -f, --follow     Follow log output.
  --tail TEXT      Number of lines to show from the end of the logs for each
                   container.
  -v, --verbose    verbose log
  --help           Show this message and exit.




Example
-------

.. code:: console

    # display all logs of containers
    $ trek logs

    # display logs of specific script
    $ trek logs notification

