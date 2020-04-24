
*****************
init
*****************

Usage:  [OPTIONS]

  Initiate target folder to a trek CLI project

Options:
  -p, --path TEXT  Marvin workflow project path
  -y, --yes        Automatic yes to prompts.
  -v, --verbose    verbose log
  --help           Show this message and exit.




Example
-------

.. code:: console

    $ tree -a
    ./hello_init/
    0 directories, 0 files
    $ trek init
    $ tree -a
    ./hello_init
    ├── .trek/
    │   └── config.json
    ├── manifest.json
    ├── trek_packages/
    ├── packages.json
    ├── src/
    │    ├── ansible/
    │    ├── blcks/
    │    ├── graph.yml
    │    └── shell/
    └── inputs/
        ├── data.yml
        └── event.yml

