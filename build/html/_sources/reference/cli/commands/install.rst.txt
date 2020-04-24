
*****************
install
*****************

Usage:  [OPTIONS] [PACKAGES]...

  Install packages

Options:
  -p, --path TEXT  Marvin workflow project path
  -l, --list       List installed packages
  -v, --verbose    verbose log
  --help           Show this message and exit.


install action from Marvin Nexus or zip file

Example
-------

.. code:: console

    $ trek install notification
    available versions: ['0.5.0', '0.4.0', '0.3.0', '0.2', '0.1']
    installing script notification:0.5.0
    saving: ./hello_project/mflow_packages/notification.zip
    1KB [00:00, 10512.04KB/s]
    extract to ./hello_project/mflow_packages/notification
    notification:0.5.0 installed

    $ vi packages.json
    {
        "packages": {
            "notification": "==0.5.0"
        }
    }

    # Download from url
    $ trek install https://package.pentium.network/repository/scripts/notification/0.5.0/dist/script.zip
    $ vi packages.json
    {
        "packages": {
            "notification": "https://package.pentium.network/repository/scripts/notification/0.5.0/dist/script.zip"
        }
    }

