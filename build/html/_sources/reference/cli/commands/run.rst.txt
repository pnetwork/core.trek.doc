
*****************
run
*****************

Usage:  [OPTIONS]

  Run workflow

Options:
  -p, --path TEXT       Marvin workflow project path
  --detail              Show logs of action containers
  --next-interval TEXT  Time interval to call next action. (second)
  --auto                Auto re-up when graph changed
  --once                Auto down environment after done.
  -v, --verbose         verbose log
  --help                Show this message and exit.




Example
-------

.. code:: console

    $ trek run
    Closing environment...
    closing trek-router...
    closing all other containers...
    Done

