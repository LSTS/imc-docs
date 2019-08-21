Simulation Messages
====================

.. _SimulatedState:

Simulated State
----------------

This message presents the simulated state of the vehicle. The simulated
state attempts to provide a realistic state interpretation of operating
various kinds of vehicles.

- Abbreviation: SimulatedState
- Identification Number: 50
- Payload Size: 80 bytes
- Message Size: 102 bytes

+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Name                          | Abbreviation | Unit    | Type   | Description                                                | Range                    | 
+===============================+==============+=========+========+============================================================+==========================+
| Latitude (WGS-84)             | lat          | *rad*   | fp64_t | WGS-84 Latitude.                                           | min=-1.5707963267948966, | 
|                               |              |         |        |                                                            | max=1.5707963267948966   | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Longitude (WGS-84)            | lon          | *rad*   | fp64_t | WGS-84 Longitude.                                          | min=-3.141592653589793,  | 
|                               |              |         |        |                                                            | max=3.141592653589793    | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Height (WGS-84)               | height       | *m*     | fp32_t | Height above the WGS-84 ellipsoid.                         | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Offset north (m)              | x            | *m*     | fp32_t | The North offset of the North/East/Down field.             | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Offset east (m)               | y            | *m*     | fp32_t | The East offset of the North/East/Down field.              | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Offset down (m)               | z            | *m*     | fp32_t | The Down offset of the North/East/Down field.              | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Rotation over x axis          | phi          | *rad*   | fp32_t | The phi Euler angle from the vehicle's attitude.           | min=-3.141592653589793,  | 
|                               |              |         |        |                                                            | max=3.141592653589793    | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Rotation over y axis          | theta        | *rad*   | fp32_t | The theta Euler angle from the vehicle's attitude.         | min=-1.57079632679490,   | 
|                               |              |         |        |                                                            | max=1.57079632679490     | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Rotation over z axis          | psi          | *rad*   | fp32_t | The psi Euler angle from the vehicle's attitude.           | min=-3.141592653589793,  | 
|                               |              |         |        |                                                            | max=3.141592653589793    | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Body-Fixed xx Linear Velocity | u            | *m/s*   | fp32_t | Body-fixed frame xx axis linear velocity component.        | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Body-Fixed yy Linear Velocity | v            | *m/s*   | fp32_t | Body-fixed frame yy axis linear velocity component.        | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Body-Fixed zz Linear Velocity | w            | *m/s*   | fp32_t | Body-fixed frame zz axis linear velocity component.        | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Angular Velocity in x         | p            | *rad/s* | fp32_t | The angular velocity over body-fixed xx axis (roll rate).  | min=-3.141592653589793,  | 
|                               |              |         |        |                                                            | max=3.141592653589793    | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Angular Velocity in y         | q            | *rad/s* | fp32_t | The angular velocity over body-fixed yy axis (pitch rate). | min=-3.141592653589793,  | 
|                               |              |         |        |                                                            | max=3.141592653589793    | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Angular Velocity in z         | r            | *rad/s* | fp32_t | The angular velocity over body-fixed zz axis (yaw rate).   | min=-3.141592653589793,  | 
|                               |              |         |        |                                                            | max=3.141592653589793    | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Stream Velocity X (North)     | svx          | *m/s*   | fp32_t | Stream Velocity xx axis velocity component.                | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Stream Velocity Y (East)      | svy          | *m/s*   | fp32_t | Stream Velocity yy axis velocity component.                | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+
| Stream Velocity Z (Down)      | svz          | *m/s*   | fp32_t | Stream Velocity zz axis velocity component.                | Same as field type       | 
+-------------------------------+--------------+---------+--------+------------------------------------------------------------+--------------------------+

.. _LeakSimulation:

Leak Simulation
----------------

Simulate leak behavior.

- Abbreviation: LeakSimulation
- Identification Number: 51
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+---------------+--------------+---------------------------------+-----------+------------------------------------------------------------+--------------------+
| Name          | Abbreviation | Unit                            | Type      | Description                                                | Range              | 
+===============+==============+=================================+===========+============================================================+====================+
| Operation     | op           | *Enumerated*                    | uint8_t   | Indicates whether leaks have been detected or not.         | Same as field type | 
|               |              | (:ref:`LeakSimulation-enum-op`) |           |                                                            |                    | 
+---------------+--------------+---------------------------------+-----------+------------------------------------------------------------+--------------------+
| Leak Entities | entities     | *-*                             | plaintext | Comma separated list of leak entities (empty for all leaks | Same as field type | 
|               |              |                                 |           | configured).                                               |                    | 
+---------------+--------------+---------------------------------+-----------+------------------------------------------------------------+--------------------+

.. _LeakSimulation-enum-op:

.. _LeakSimulation-enum-prefix-LSIM:

Enum Operation
^^^^^^^^^^^^^^^

Indicates whether leaks have been detected or not.

- Abbreviation: op
- Prefix: LSIM

+-------+-----------+--------------+-------------+
| Value | Name      | Abbreviation | Description | 
+=======+===========+==============+=============+
| 0     | Leaks Off | OFF          | *-*         | 
+-------+-----------+--------------+-------------+
| 1     | Leaks On  | ON           | *-*         | 
+-------+-----------+--------------+-------------+

.. _UASimulation:

Underwater Acoustics Simulation
--------------------------------

Underwater acoustics simulation request.

- Abbreviation: UASimulation
- Identification Number: 52
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+--------------------+--------------+---------------------------------+----------+---------------------------------+--------------------+
| Name               | Abbreviation | Unit                            | Type     | Description                     | Range              | 
+====================+==============+=================================+==========+=================================+====================+
| Type               | type         | *Enumerated*                    | uint8_t  | Type of request.                | Same as field type | 
|                    |              | (:ref:`UASimulation-enum-type`) |          |                                 |                    | 
+--------------------+--------------+---------------------------------+----------+---------------------------------+--------------------+
| Transmission Speed | speed        | *bps*                           | uint16_t | Transmission speed.             | Same as field type | 
+--------------------+--------------+---------------------------------+----------+---------------------------------+--------------------+
| Data               | data         | *-*                             | rawdata  | Data for transmission requests. | Same as field type | 
+--------------------+--------------+---------------------------------+----------+---------------------------------+--------------------+

.. _UASimulation-enum-type:

.. _UASimulation-enum-prefix-UAS:

Enum Type
^^^^^^^^^^

Type of request.

- Abbreviation: type
- Prefix: UAS

+-------+-------------------+--------------+-------------+
| Value | Name              | Abbreviation | Description | 
+=======+===================+==============+=============+
| 0     | Data Transmission | DATA         | *-*         | 
+-------+-------------------+--------------+-------------+
| 1     | Ping              | PING         | *-*         | 
+-------+-------------------+--------------+-------------+
| 2     | Ping Reply        | PING_REPLY   | *-*         | 
+-------+-------------------+--------------+-------------+

.. _DynamicsSimParam:

Dynamics Simulation Parameters
-------------------------------

Vehicle dynamics parameters for 3DOF, 4DOF or 5DOF simulations.

- Abbreviation: DynamicsSimParam
- Identification Number: 53
- Payload Size: 9 bytes
- Message Size: 31 bytes

+---------------------------------------------+---------------+-----------------------------------+---------+----------------------------------------------------------------------------------------+--------------------+
| Name                                        | Abbreviation  | Unit                              | Type    | Description                                                                            | Range              | 
+=============================================+===============+===================================+=========+========================================================================================+====================+
| Action on the Vehicle Simulation Parameters | op            | *Enumerated*                      | uint8_t | Action on the vehicle simulation parameters for the formation control                  | Same as field type | 
|                                             |               | (:ref:`DynamicsSimParam-enum-op`) |         |                                                                                        |                    | 
+---------------------------------------------+---------------+-----------------------------------+---------+----------------------------------------------------------------------------------------+--------------------+
| TAS to Longitudinal Acceleration Gain       | tas2acc_pgain | *-*                               | fp32_t  | Proportional gain from the TAS (True Airspeed) error to the longitudinal acceleration. | Same as field type | 
+---------------------------------------------+---------------+-----------------------------------+---------+----------------------------------------------------------------------------------------+--------------------+
| Bank to Bank Rate Gain                      | bank2p_pgain  | *-*                               | fp32_t  | Proportional gain from the bank angle error to the bank angular rate.                  | Same as field type | 
+---------------------------------------------+---------------+-----------------------------------+---------+----------------------------------------------------------------------------------------+--------------------+

.. _DynamicsSimParam-enum-op:

.. _DynamicsSimParam-enum-prefix-OP:

Enum Action on the Vehicle Simulation Parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Action on the vehicle simulation parameters for the formation control

- Abbreviation: op
- Prefix: OP

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Request | REQUEST      | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Set     | SET          | *-*         | 
+-------+---------+--------------+-------------+
| 2     | Report  | REPORT       | *-*         | 
+-------+---------+--------------+-------------+

