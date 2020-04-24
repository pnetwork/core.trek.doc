
*****************
config
*****************

Usage:  [OPTIONS] [KEY] [VALUE]

  Get and set config

Options:
  --global    Use config from global
  --unset     Remove the matching key from config.
  -l, --list  List all variables set in config file.
  --help      Show this message and exit.




Example
-------

.. code:: console

    $ trek config marvin_url https://mymarvin.com
    $ cat .trek/config.json
    {
        "marvin_url": "https://mymarvin.com",
        "marvin_JWT": "",
        "marvin_secret": "",
        "router_port": 5000,
        "action_timeout": 30,
        "input_data_path": "inputs/data.yml",
        "input_event_path": "inputs/event.yml",
        "local_inventory_file": "",
        "envs": {
            "BLCKS_DEBUG_LOG_MODE": "table",
            "BLCKS_DEBUG_LOG_TABLE_WIDTH": 100,
            "BLCKS_DEBUG_LOG_FIELDS": "data",
            "BLCKS_DEBUG_LOG_FORMAT": "{message} => inputParams: {data[inputParamsStr]}"
        }
    }

