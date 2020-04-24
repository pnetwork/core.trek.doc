
*****************
deploy
*****************

Usage:  [OPTIONS]

  Deploy workflow project to Marvin

Options:
  -p, --path TEXT  Marvin workflow project path
  -a, --all        Deploy all
  --projects TEXT  Assign projects
  --autopack       Automatic pack all.
  --autobuildpush  Automatic build and push all if need.
  -y, --yes        Automatic yes to prompts.
  -v, --verbose    verbose log
  --help           Show this message and exit.


If workflow/scripts was installed, it will ask your confirm to overwrite. 

Example
-------

.. code:: console

    $ trek deploy
    Deploy workflow...
    Deploying: /Users/pentium/hello_project/bin/hello_project-0.0.0.zip
    Done

