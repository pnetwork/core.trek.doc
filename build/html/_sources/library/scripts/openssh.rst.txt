openssh
**********************************
| Enable SSH/ SFTP service (Windows)
| Enable SSH/ SFTP service (Windows)

.. code-block:: yaml

    id: openssh
    schemaVersion: '0.2'
    version: 0.1.0
    title: Enable SSH/ SFTP service (Windows)
    description: Enable SSH/ SFTP service (Windows)
    namespace: network.pentium
    assets:
    - HOST
    inputs:
      resourceIds:
        $ref: pn_ids_host
      remoteAddress:
        title: Remote IP addresses for windows firewall rules.
        description: The specific IP addresses allowed through windows firewall rules.
          Please separate IP addresses with space. If not value is set that means 'Any'
          remote ip is allowed.
        type: string
    required:
    - resourceIds
    outputs:
      rc:
        type: array
        title: Script return code
        description: Script return code
      stdout:
        type: array
        title: Script standard output
        description: Script standard output
      stderr:
        type: array
        title: Script error output
        description: Script error output
    