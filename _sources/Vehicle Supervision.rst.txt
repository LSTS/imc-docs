Vehicle Supervision Messages
=============================

.. _VehicleState:

Vehicle State
--------------

This message summarizes the overall state of the vehicle. It can
contains information regarding:

- The overall operation mode.
- Any error conditions.
- Current maneuver execution.
- Active control loops.

- Abbreviation: VehicleState
- Identification Number: 500
- Payload Size: 31+  bytes
- Message Size: 53+  bytes

+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Name                      | Abbreviation    | Unit                                 | Type      | Description                                                   | Range              | 
+===========================+=================+======================================+===========+===============================================================+====================+
| Operation Mode            | op_mode         | *Enumerated*                         | uint8_t   | The overall operation mode.                                   | Same as field type | 
|                           |                 | (:ref:`VehicleState-enum-op_mode`)   |           |                                                               |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Errors -- Count           | error_count     | *-*                                  | uint8_t   | Error count for monitored entitites.                          | Same as field type | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Errors -- Entities        | error_ents      | *-*                                  | plaintext | The monitored entities with error conditions. This is a comma | Same as field type | 
|                           |                 |                                      |           | separated list of entity names.                               |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Maneuver -- Type          | maneuver_type   | *-*                                  | uint16_t  | Type of maneuver being executed, when in MANEUVER mode. The   | Same as field type | 
|                           |                 |                                      |           | value is the IMC serialization ID of the corresponding        |                    | 
|                           |                 |                                      |           | maneuver.                                                     |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Maneuver -- Start Time    | maneuver_stime  | *s*                                  | fp64_t    | Start time of maneuver being executed (Epoch time), when in   | Same as field type | 
|                           |                 |                                      |           | MANEUVER mode.                                                |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Maneuver -- ETA           | maneuver_eta    | *s*                                  | uint16_t  | Estimated time for maneuver completion. The value will be     | Same as field type | 
|                           |                 |                                      |           | 65535 if the time is unknown or undefined.                    |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Control Loops             | control_loops   | *Bitfield*                           | uint32_t  | Enabled control loops.                                        | Same as field type | 
|                           |                 | (:ref:`bitfield-CLoopsMask`)         |           |                                                               |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Flags                     | flags           | *Bitfield*                           | uint8_t   |                                                               | Same as field type | 
|                           |                 | (:ref:`VehicleState-bitfield-flags`) |           |                                                               |                    | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Last Error -- Description | last_error      | *-*                                  | plaintext | Description of last error.                                    | Same as field type | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Last Error -- Time        | last_error_time | *s*                                  | fp64_t    | Time of last error (Epoch time).                              | Same as field type | 
+---------------------------+-----------------+--------------------------------------+-----------+---------------------------------------------------------------+--------------------+

.. _VehicleState-enum-op_mode:

.. _VehicleState-enum-prefix-VS:

Enum Operation Mode
^^^^^^^^^^^^^^^^^^^^

The overall operation mode.

- Abbreviation: op_mode
- Prefix: VS

+-------+------------------+--------------+------------------------------+
| Value | Name             | Abbreviation | Description                  | 
+=======+==================+==============+==============================+
| 0     | Service          | SERVICE      | Ready to service requests.   | 
+-------+------------------+--------------+------------------------------+
| 1     | Calibration      | CALIBRATION  | Ongoing vehicle calibration. | 
+-------+------------------+--------------+------------------------------+
| 2     | Error            | ERROR        | Errors are set.              | 
+-------+------------------+--------------+------------------------------+
| 3     | Maneuver         | MANEUVER     | A maneuver is executing.     | 
+-------+------------------+--------------+------------------------------+
| 4     | External Control | EXTERNAL     | External control is active.  | 
+-------+------------------+--------------+------------------------------+
| 5     | Boot             | BOOT         | Booting system.              | 
+-------+------------------+--------------+------------------------------+

.. _VehicleState-bitfield-flags:

.. _VehicleState-bitfield-prefix-VFLG:

Bitfield Flags
^^^^^^^^^^^^^^^

No description

- Abbreviation: flags
- Prefix: VFLG

+-------+---------------+---------------+-------------+
| Value | Name          | Abbreviation  | Description | 
+=======+===============+===============+=============+
| 0x01  | Maneuver Done | MANEUVER_DONE | *-*         | 
+-------+---------------+---------------+-------------+

.. _VehicleCommand:

Vehicle Command
----------------

Vehicle command.

- Abbreviation: VehicleCommand
- Identification Number: 501
- Payload Size: 10+  bytes
- Message Size: 32+  bytes

+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+
| Name             | Abbreviation | Unit                                 | Type              | Description                                           | Range              | 
+==================+==============+======================================+===================+=======================================================+====================+
| Type             | type         | *Enumerated*                         | uint8_t           |                                                       | Same as field type | 
|                  |              | (:ref:`VehicleCommand-enum-type`)    |                   |                                                       |                    | 
+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+
| Request ID       | request_id   | *-*                                  | uint16_t          | Request ID                                            | Same as field type | 
+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+
| Command          | command      | *Enumerated*                         | uint8_t           | The type of command/action to be performed            | Same as field type | 
|                  |              | (:ref:`VehicleCommand-enum-command`) |                   |                                                       |                    | 
+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+
| Maneuver         | maneuver     | *-*                                  | message           | Maneuver to be executed (for 'EXEC_MANEUVER' command) | Same as field type | 
|                  |              |                                      | (:ref:`Maneuver`) |                                                       |                    | 
+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+
| Calibration Time | calib_time   | *s*                                  | uint16_t          | Amount of time to calibrate                           | Same as field type | 
+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+
| Info             | info         | *-*                                  | plaintext         | Complementary human-readable information for replies. | Same as field type | 
+------------------+--------------+--------------------------------------+-------------------+-------------------------------------------------------+--------------------+

.. _VehicleCommand-enum-type:

.. _VehicleCommand-enum-prefix-VC:

Enum Type
^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: VC

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 0     | Request              | REQUEST      | *-*         | 
+-------+----------------------+--------------+-------------+
| 1     | Reply -- Success     | SUCCESS      | *-*         | 
+-------+----------------------+--------------+-------------+
| 2     | Reply -- In Progress | IN_PROGRESS  | *-*         | 
+-------+----------------------+--------------+-------------+
| 3     | Reply -- Failure     | FAILURE      | *-*         | 
+-------+----------------------+--------------+-------------+

.. _VehicleCommand-enum-command:

.. _VehicleCommand-enum-prefix-VC:

Enum Command
^^^^^^^^^^^^^

The type of command/action to be performed

- Abbreviation: command
- Prefix: VC

+-------+-------------------+-------------------+-----------------------------------------------------+
| Value | Name              | Abbreviation      | Description                                         | 
+=======+===================+===================+=====================================================+
| 0     | Execute Maneuver  | EXEC_MANEUVER     | Execute the maneuver specified in 'maneuver' field. | 
+-------+-------------------+-------------------+-----------------------------------------------------+
| 1     | Stop Maneuver     | STOP_MANEUVER     | Stop 'maneuver' being executed.                     | 
+-------+-------------------+-------------------+-----------------------------------------------------+
| 2     | Start Calibration | START_CALIBRATION | Start calibrating vehicle.                          | 
+-------+-------------------+-------------------+-----------------------------------------------------+
| 3     | Stop Calibration  | STOP_CALIBRATION  | Stop calibrating vehicle.                           | 
+-------+-------------------+-------------------+-----------------------------------------------------+

.. _MonitorEntityState:

Monitor Entity State
---------------------

Controls monitoring of entity states in the vehicle.

- Abbreviation: MonitorEntityState
- Identification Number: 502
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+--------------+--------------+------------------------------------------+-----------+---------------------------------------+--------------------+
| Name         | Abbreviation | Unit                                     | Type      | Description                           | Range              | 
+==============+==============+==========================================+===========+=======================================+====================+
| Command      | command      | *Enumerated*                             | uint8_t   | Command.                              | Same as field type | 
|              |              | (:ref:`MonitorEntityState-enum-command`) |           |                                       |                    | 
+--------------+--------------+------------------------------------------+-----------+---------------------------------------+--------------------+
| Entity Names | entities     | *-*                                      | plaintext | Comma separated list of entity names. | Same as field type | 
+--------------+--------------+------------------------------------------+-----------+---------------------------------------+--------------------+

.. _MonitorEntityState-enum-command:

.. _MonitorEntityState-enum-prefix-MES:

Enum Command
^^^^^^^^^^^^^

Command.

- Abbreviation: command
- Prefix: MES

+-------+-----------------------------------------------------+------------------+-------------+
| Value | Name                                                | Abbreviation     | Description | 
+=======+=====================================================+==================+=============+
| 0     | Reset to defaults                                   | RESET            | *-*         | 
+-------+-----------------------------------------------------+------------------+-------------+
| 1     | Enable Monitoring                                   | ENABLE           | *-*         | 
+-------+-----------------------------------------------------+------------------+-------------+
| 2     | Disable Monitoring                                  | DISABLE          | *-*         | 
+-------+-----------------------------------------------------+------------------+-------------+
| 3     | Enable Monitoring (exclusive - disables all others) | ENABLE_EXCLUSIVE | *-*         | 
+-------+-----------------------------------------------------+------------------+-------------+
| 4     | Status Report                                       | STATUS           | *-*         | 
+-------+-----------------------------------------------------+------------------+-------------+

.. _EntityMonitoringState:

Entity Monitoring State
------------------------

No description

- Abbreviation: EntityMonitoringState
- Identification Number: 503
- Payload Size: 19+  bytes
- Message Size: 41+  bytes

+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Name                                  | Abbreviation    | Unit | Type      | Description                                                    | Range              | 
+=======================================+=================+======+===========+================================================================+====================+
| Entities monitored - Count            | mcount          | *-*  | uint8_t   | Number of entitities being monitored.                          | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Entities monitored - Names            | mnames          | *-*  | plaintext | Comma separated list of all entity names being monitored.      | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Entities with errors - Count          | ecount          | *-*  | uint8_t   | Number of entitities with non-critical errors.                 | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Entities with errors - Names          | enames          | *-*  | plaintext | Comma separated list of all entity names with non-critical     | Same as field type | 
|                                       |                 |      |           | errors.                                                        |                    | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Entities with critical errors - Count | ccount          | *-*  | uint8_t   | Number of entitities with critical errors.                     | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Entities with critical errors - Names | cnames          | *-*  | plaintext | Comma separated list of all entity names with critical errors. | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Last Error -- Description             | last_error      | *-*  | plaintext | Description of last error.                                     | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+
| Last Error -- Time                    | last_error_time | *s*  | fp64_t    | Time of last error (Epoch time).                               | Same as field type | 
+---------------------------------------+-----------------+------+-----------+----------------------------------------------------------------+--------------------+

.. _OperationalLimits:

Operational Limits
-------------------

Definition of operational limits.

- Abbreviation: OperationalLimits
- Identification Number: 504
- Payload Size: 53 bytes
- Message Size: 75 bytes

+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Name                     | Abbreviation | Unit                           | Type    | Description | Range                    | 
+==========================+==============+================================+=========+=============+==========================+
| Field Indicator Mask     | mask         | *Bitfield*                     | uint8_t |             | Same as field type       | 
|                          |              | (:ref:`bitfield-OpLimitsMask`) |         |             |                          | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Maximum Depth            | max_depth    | *m*                            | fp32_t  |             | min=0                    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Minimum Altitude         | min_altitude | *m*                            | fp32_t  |             | min=0                    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Maximum Altitude         | max_altitude | *m*                            | fp32_t  |             | min=0                    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Minimum Speed            | min_speed    | *m/s*                          | fp32_t  |             | min=0                    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Maximum Speed            | max_speed    | *m/s*                          | fp32_t  |             | min=0                    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Maximum Vertical Rate    | max_vrate    | *m/s*                          | fp32_t  |             | min=0                    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Area -- WGS-84 Latitude  | lat          | *rad*                          | fp64_t  |             | min=-1.5707963267948966, | 
|                          |              |                                |         |             | max=1.5707963267948966   | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Area -- WGS-84 Longitude | lon          | *rad*                          | fp64_t  |             | min=-3.141592653589793,  | 
|                          |              |                                |         |             | max=3.141592653589793    | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Area -- Orientation      | orientation  | *rad*                          | fp32_t  |             | Same as field type       | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Area -- Width            | width        | *m*                            | fp32_t  |             | Same as field type       | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+
| Area -- Length           | length       | *m*                            | fp32_t  |             | Same as field type       | 
+--------------------------+--------------+--------------------------------+---------+-------------+--------------------------+

.. _GetOperationalLimits:

Get Operational Limits
-----------------------

Command to obtain the operational limits in use by the vehicle.

- Abbreviation: GetOperationalLimits
- Identification Number: 505
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _Calibration:

Calibration
------------

Initiate overall calibration of a vehicle.

- Abbreviation: Calibration
- Identification Number: 506
- Payload Size: 2 bytes
- Message Size: 24 bytes

+----------+--------------+------+----------+--------------------------+--------------------+
| Name     | Abbreviation | Unit | Type     | Description              | Range              | 
+==========+==============+======+==========+==========================+====================+
| Duration | duration     | *s*  | uint16_t | Duration of calibration. | Same as field type | 
+----------+--------------+------+----------+--------------------------+--------------------+

.. _ControlLoops:

Control Loops
--------------

Enable or disable control loops.

- Abbreviation: ControlLoops
- Identification Number: 507
- Payload Size: 9 bytes
- Message Size: 31 bytes

+----------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------------------------+--------------------+
| Name                 | Abbreviation | Unit                              | Type     | Description                                                                              | Range              | 
+======================+==============+===================================+==========+==========================================================================================+====================+
| Enable               | enable       | *Enumerated*                      | uint8_t  |                                                                                          | Same as field type | 
|                      |              | (:ref:`ControlLoops-enum-enable`) |          |                                                                                          |                    | 
+----------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------------------------+--------------------+
| Control Loop Mask    | mask         | *Bitfield*                        | uint32_t | Control loop mask.                                                                       | Same as field type | 
|                      |              | (:ref:`bitfield-CLoopsMask`)      |          |                                                                                          |                    | 
+----------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------------------------+--------------------+
| Scope Time Reference | scope_ref    | *-*                               | uint32_t | Unsigned integer reference for the scope of the control loop message.                    | Same as field type | 
|                      |              |                                   |          | Scope reference should only be set by a maneuver.                                        |                    | 
|                      |              |                                   |          | Should be set to an always increasing reference at the time of dispatching this message. |                    | 
|                      |              |                                   |          | Lower level controllers must inherit the same scope reference sent by maneuver.          |                    | 
|                      |              |                                   |          | This same scope reference must be sent down to lower control layers.                     |                    | 
+----------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------------------------+--------------------+

.. _ControlLoops-enum-enable:

.. _ControlLoops-enum-prefix-CL:

Enum Enable
^^^^^^^^^^^^

No description

- Abbreviation: enable
- Prefix: CL

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Disable | DISABLE      | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Enable  | ENABLE       | *-*         | 
+-------+---------+--------------+-------------+

.. _VehicleMedium:

Vehicle Medium
---------------

Detect current vehicle medium.

- Abbreviation: VehicleMedium
- Identification Number: 508
- Payload Size: 1 bytes
- Message Size: 23 bytes

+--------+--------------+------------------------------------+---------+-----------------+--------------------+
| Name   | Abbreviation | Unit                               | Type    | Description     | Range              | 
+========+==============+====================================+=========+=================+====================+
| Medium | medium       | *Enumerated*                       | uint8_t | Current medium. | Same as field type | 
|        |              | (:ref:`VehicleMedium-enum-medium`) |         |                 |                    | 
+--------+--------------+------------------------------------+---------+-----------------+--------------------+

.. _VehicleMedium-enum-medium:

.. _VehicleMedium-enum-prefix-VM:

Enum Medium
^^^^^^^^^^^^

Current medium.

- Abbreviation: medium
- Prefix: VM

+-------+------------+--------------+-----------------------------+
| Value | Name       | Abbreviation | Description                 | 
+=======+============+==============+=============================+
| 0     | Ground     | GROUND       | Vehicle is on the ground    | 
+-------+------------+--------------+-----------------------------+
| 1     | Air        | AIR          | Vehicle is airborne         | 
+-------+------------+--------------+-----------------------------+
| 2     | Water      | WATER        | Vehicle is at water surface | 
+-------+------------+--------------+-----------------------------+
| 3     | Underwater | UNDERWATER   | Vehicle is underwater       | 
+-------+------------+--------------+-----------------------------+
| 4     | Unknown    | UNKNOWN      | Vehicle medium is unknown   | 
+-------+------------+--------------+-----------------------------+

.. _Collision:

Collision
----------

Detected collision.

- Abbreviation: Collision
- Identification Number: 509
- Payload Size: 5 bytes
- Message Size: 27 bytes

+-----------------+--------------+----------------------------------+---------+-----------------------------------------+--------------------+
| Name            | Abbreviation | Unit                             | Type    | Description                             | Range              | 
+=================+==============+==================================+=========+=========================================+====================+
| Collision value | value        | *m/s/s*                          | fp32_t  | Estimated collision acceleration value. | Same as field type | 
+-----------------+--------------+----------------------------------+---------+-----------------------------------------+--------------------+
| Type            | type         | *Bitfield*                       | uint8_t | Collision flags.                        | Same as field type | 
|                 |              | (:ref:`Collision-bitfield-type`) |         |                                         |                    | 
+-----------------+--------------+----------------------------------+---------+-----------------------------------------+--------------------+

.. _Collision-bitfield-type:

.. _Collision-bitfield-prefix-CD:

Bitfield Type
^^^^^^^^^^^^^^

Collision flags.

- Abbreviation: type
- Prefix: CD

+-------+--------+--------------+----------------------------------+
| Value | Name   | Abbreviation | Description                      | 
+=======+========+==============+==================================+
| 0x01  | X-axis | X            | Collision detected in the x-axis | 
+-------+--------+--------------+----------------------------------+
| 0x02  | Y-axis | Y            | Collision detected in the y-axis | 
+-------+--------+--------------+----------------------------------+
| 0x04  | Z-axis | Z            | Collision detected in the z-axis | 
+-------+--------+--------------+----------------------------------+
| 0x08  | Impact | IMPACT       | Sudden impact detected           | 
+-------+--------+--------------+----------------------------------+

.. _FormState:

Formation Tracking State
-------------------------

Monitoring variables to assert the formation tracking state, i.e., the mismatch between the real and the simulated aircraft position, the convergence state, etc.

- Abbreviation: FormState
- Identification Number: 510
- Payload Size: 15 bytes
- Message Size: 37 bytes

+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Name                      | Abbreviation | Unit                               | Type    | Description                                                                                                                                  | Range              | 
+===========================+==============+====================================+=========+==============================================================================================================================================+====================+
| Position Mismatch         | PosSimErr    | *m*                                | fp32_t  | Mismatch between the real and the simulated aircraft position.                                                                               | Same as field type | 
+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence               | Converg      | *m*                                | fp32_t  | Convergence evalution variable.                                                                                                              | Same as field type | 
|                           |              |                                    |         | Value indicates the position error to which the system is converging, tacking into account the aircraft current position error and velocity. |                    | 
+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Stream Turbulence         | Turbulence   | *m/s/s*                            | fp32_t  | Evaluation of the stream turbulence level, through the stream acceleration.                                                                  | Same as field type | 
+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Position Mismatch Monitor | PosSimMon    | *Enumerated*                       | uint8_t | Position mismatch monitoring flag.                                                                                                           | Same as field type | 
|                           |              | (:ref:`FormState-enum-PosSimMon`)  |         |                                                                                                                                              |                    | 
+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Communications Monitor    | CommMon      | *Enumerated*                       | uint8_t | Communications monitoring flag.                                                                                                              | Same as field type | 
|                           |              | (:ref:`FormState-enum-CommMon`)    |         |                                                                                                                                              |                    | 
+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence               | ConvergMon   | *Enumerated*                       | uint8_t | Convergence monitoring flag.                                                                                                                 | Same as field type | 
|                           |              | (:ref:`FormState-enum-ConvergMon`) |         |                                                                                                                                              |                    | 
+---------------------------+--------------+------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+

.. _FormState-enum-PosSimMon:

.. _FormState-enum-prefix-POS:

Enum Position Mismatch Monitor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Position mismatch monitoring flag.

- Abbreviation: PosSimMon
- Prefix: POS

+-------+-------------------+--------------+-------------+
| Value | Name              | Abbreviation | Description | 
+=======+===================+==============+=============+
| 0     | Ok                | OK           | *-*         | 
+-------+-------------------+--------------+-------------+
| 1     | Warning threshold | WRN          | *-*         | 
+-------+-------------------+--------------+-------------+
| 2     | Limit threshold   | LIM          | *-*         | 
+-------+-------------------+--------------+-------------+

.. _FormState-enum-CommMon:

.. _FormState-enum-prefix-COMMS:

Enum Communications Monitor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Communications monitoring flag.

- Abbreviation: CommMon
- Prefix: COMMS

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Ok      | OK           | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Timeout | TIMEOUT      | *-*         | 
+-------+---------+--------------+-------------+

.. _FormState-enum-ConvergMon:

.. _FormState-enum-prefix-CONV:

Enum Convergence
^^^^^^^^^^^^^^^^^

Convergence monitoring flag.

- Abbreviation: ConvergMon
- Prefix: CONV

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Ok      | OK           | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Timeout | TIMEOUT      | *-*         | 
+-------+---------+--------------+-------------+

.. _AutopilotMode:

Autopilot Mode
---------------

Reports autopilot mode.

- Abbreviation: AutopilotMode
- Identification Number: 511
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+----------------+--------------+--------------------------------------+-----------+------------------------------+--------------------+
| Name           | Abbreviation | Unit                                 | Type      | Description                  | Range              | 
+================+==============+======================================+===========+==============================+====================+
| Autonomy Level | autonomy     | *Enumerated*                         | uint8_t   | Current mode autonomy level. | Same as field type | 
|                |              | (:ref:`AutopilotMode-enum-autonomy`) |           |                              |                    | 
+----------------+--------------+--------------------------------------+-----------+------------------------------+--------------------+
| Mode           | mode         | *-*                                  | plaintext | Current mode name.           | Same as field type | 
+----------------+--------------+--------------------------------------+-----------+------------------------------+--------------------+

.. _AutopilotMode-enum-autonomy:

.. _AutopilotMode-enum-prefix-AL:

Enum Autonomy Level
^^^^^^^^^^^^^^^^^^^^

Current mode autonomy level.

- Abbreviation: autonomy
- Prefix: AL

+-------+----------+--------------+----------------------------+
| Value | Name     | Abbreviation | Description                | 
+=======+==========+==============+============================+
| 0     | Manual   | MANUAL       | Autopilot has no control   | 
+-------+----------+--------------+----------------------------+
| 1     | Assisted | ASSISTED     | Autopilot has some control | 
+-------+----------+--------------+----------------------------+
| 2     | Auto     | AUTO         | Autopilot has full control | 
+-------+----------+--------------+----------------------------+

.. _FormationState:

Formation Tracking State
-------------------------

Monitoring variables to assert the formation tracking state, i.e., the mismatch between the real and the simulated aircraft position, the convergence state, etc.

- Abbreviation: FormationState
- Identification Number: 512
- Payload Size: 17 bytes
- Message Size: 39 bytes

+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Name                      | Abbreviation | Unit                                    | Type    | Description                                                                                                                                  | Range              | 
+===========================+==============+=========================================+=========+==============================================================================================================================================+====================+
| Type                      | type         | *Enumerated*                            | uint8_t | Indicates if the message is a request, or a reply to a previous request.                                                                     | Same as field type | 
|                           |              | (:ref:`FormationState-enum-type`)       |         |                                                                                                                                              |                    | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Operation                 | op           | *Enumerated*                            | uint8_t | Operation to perform.                                                                                                                        | Same as field type | 
|                           |              | (:ref:`FormationState-enum-op`)         |         |                                                                                                                                              |                    | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Position Mismatch         | PosSimErr    | *m*                                     | fp32_t  | Mismatch between the real and the simulated aircraft position.                                                                               | Same as field type | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence               | Converg      | *m*                                     | fp32_t  | Convergence evalution variable.                                                                                                              | Same as field type | 
|                           |              |                                         |         | Value indicates the position error to which the system is converging, tacking into account the aircraft current position error and velocity. |                    | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Stream Turbulence         | Turbulence   | *m/s/s*                                 | fp32_t  | Evaluation of the stream turbulence level, through the stream acceleration.                                                                  | Same as field type | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Position Mismatch Monitor | PosSimMon    | *Enumerated*                            | uint8_t | Position mismatch monitoring flag.                                                                                                           | Same as field type | 
|                           |              | (:ref:`FormationState-enum-PosSimMon`)  |         |                                                                                                                                              |                    | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Communications Monitor    | CommMon      | *Enumerated*                            | uint8_t | Communications monitoring flag.                                                                                                              | Same as field type | 
|                           |              | (:ref:`FormationState-enum-CommMon`)    |         |                                                                                                                                              |                    | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence               | ConvergMon   | *Enumerated*                            | uint8_t | Convergence monitoring flag.                                                                                                                 | Same as field type | 
|                           |              | (:ref:`FormationState-enum-ConvergMon`) |         |                                                                                                                                              |                    | 
+---------------------------+--------------+-----------------------------------------+---------+----------------------------------------------------------------------------------------------------------------------------------------------+--------------------+

.. _FormationState-enum-type:

.. _FormationState-enum-prefix-FC:

Enum Type
^^^^^^^^^^

Indicates if the message is a request, or a reply to a previous request.

- Abbreviation: type
- Prefix: FC

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Request | REQUEST      | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Report  | REPORT       | *-*         | 
+-------+---------+--------------+-------------+

.. _FormationState-enum-op:

.. _FormationState-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: OP

+-------+-------+--------------+-------------------------------+
| Value | Name  | Abbreviation | Description                   | 
+=======+=======+==============+===============================+
| 0     | Start | START        | Start the formation maneuver. | 
+-------+-------+--------------+-------------------------------+
| 1     | Stop  | STOP         | Stop the formation maneuver.  | 
+-------+-------+--------------+-------------------------------+

.. _FormationState-enum-PosSimMon:

.. _FormationState-enum-prefix-POS:

Enum Position Mismatch Monitor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Position mismatch monitoring flag.

- Abbreviation: PosSimMon
- Prefix: POS

+-------+-------------------+--------------+-------------+
| Value | Name              | Abbreviation | Description | 
+=======+===================+==============+=============+
| 0     | Ok                | OK           | *-*         | 
+-------+-------------------+--------------+-------------+
| 1     | Warning threshold | WRN          | *-*         | 
+-------+-------------------+--------------+-------------+
| 2     | Limit threshold   | LIM          | *-*         | 
+-------+-------------------+--------------+-------------+

.. _FormationState-enum-CommMon:

.. _FormationState-enum-prefix-COMMS:

Enum Communications Monitor
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Communications monitoring flag.

- Abbreviation: CommMon
- Prefix: COMMS

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Ok      | OK           | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Timeout | TIMEOUT      | *-*         | 
+-------+---------+--------------+-------------+

.. _FormationState-enum-ConvergMon:

.. _FormationState-enum-prefix-CONV:

Enum Convergence
^^^^^^^^^^^^^^^^^

Convergence monitoring flag.

- Abbreviation: ConvergMon
- Prefix: CONV

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Ok      | OK           | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Timeout | TIMEOUT      | *-*         | 
+-------+---------+--------------+-------------+

.. _ReportControl:

Report Control
---------------

This message is sent to trigger reports to a destination system.

- Abbreviation: ReportControl
- Identification Number: 513
- Payload Size: 6+  bytes
- Message Size: 28+  bytes

+-------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------+--------------------+
| Name                    | Abbreviation   | Unit                                           | Type      | Description                                                     | Range              | 
+=========================+================+================================================+===========+=================================================================+====================+
| Operation               | op             | *Enumerated*                                   | uint8_t   | Operation to perform.                                           | Same as field type | 
|                         |                | (:ref:`ReportControl-enum-op`)                 |           |                                                                 |                    | 
+-------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------+--------------------+
| Communication Interface | comm_interface | *Bitfield*                                     | uint8_t   | Communication interface to be used for reports.                 | Same as field type | 
|                         |                | (:ref:`ReportControl-bitfield-comm_interface`) |           |                                                                 |                    | 
+-------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------+--------------------+
| Period                  | period         | *s*                                            | uint16_t  | Desired periodicity for scheduled reports.                      | Same as field type | 
+-------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------+--------------------+
| Destination System      | sys_dst        | *-*                                            | plaintext | Destination Address to be filled where applicable. It should be | Same as field type | 
|                         |                |                                                |           | interpreted differently depending on communication interface.   |                    | 
+-------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------+--------------------+

.. _ReportControl-enum-op:

.. _ReportControl-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: OP

+-------+--------------------------+----------------+----------------------------------------------------------------------------+
| Value | Name                     | Abbreviation   | Description                                                                | 
+=======+==========================+================+============================================================================+
| 0     | Request Start of Reports | REQUEST_START  | Request a system to periodically send reports through 'interface'.         | 
|       |                          |                | The destination system will reply with a STARTED command. Periodicity      | 
|       |                          |                | will be defined by the field 'period'. If applicable, the destination      | 
|       |                          |                | address is defined in field 'dst'.                                         | 
+-------+--------------------------+----------------+----------------------------------------------------------------------------+
| 1     | Report Started           | STARTED        | The destination system will reply a message with this operation            | 
|       |                          |                | everytime a report is successfully started. The periodicity of             | 
|       |                          |                | reports is indicated in the field 'period' while the communication         | 
|       |                          |                | interface to be used is described in field 'interface'. If applicable,     | 
|       |                          |                | the destination address is defined in field 'dst'.                         | 
+-------+--------------------------+----------------+----------------------------------------------------------------------------+
| 2     | Request Stop of Reports  | REQUEST_STOP   | Request a system to stop dispatching reports through a given               | 
|       |                          |                | communication interface described in 'interface'. The destination          | 
|       |                          |                | system will reply with a STOPPED command. If applicable, the               | 
|       |                          |                | destination address is defined in field 'dst'.                             | 
+-------+--------------------------+----------------+----------------------------------------------------------------------------+
| 3     | Report Stopped           | STOPPED        | The destination system will reply a message with this operation            | 
|       |                          |                | everytime a scheduled report is successfully stopped in a defined          | 
|       |                          |                | communication interface. If applicable, the destination address            | 
|       |                          |                | is defined in field 'dst'.                                                 | 
+-------+--------------------------+----------------+----------------------------------------------------------------------------+
| 4     | Request Single Reports   | REQUEST_REPORT | Request a system to issue a single report in a defined communication       | 
|       |                          |                | interface. The destination system will reply with a REPORT_ISSUED command. | 
|       |                          |                | If applicable, the destination address is defined in field 'dst'.          | 
+-------+--------------------------+----------------+----------------------------------------------------------------------------+
| 5     | Single Report Sent       | REPORT_SENT    | The destination system will reply a single report request with             | 
|       |                          |                | this operation.If applicable, the destination address is defined           | 
|       |                          |                | in field 'dst'.                                                            | 
+-------+--------------------------+----------------+----------------------------------------------------------------------------+

.. _ReportControl-bitfield-comm_interface:

.. _ReportControl-bitfield-prefix-CI:

Bitfield Communication Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Communication interface to be used for reports.

- Abbreviation: comm_interface
- Prefix: CI

+-------+-----------+--------------+---------------------------------------------+
| Value | Name      | Abbreviation | Description                                 | 
+=======+===========+==============+=============================================+
| 0x01  | Acoustic  | ACOUSTIC     | Use acoustic communications                 | 
+-------+-----------+--------------+---------------------------------------------+
| 0x02  | Satellite | SATELLITE    | Use satellite communications                | 
+-------+-----------+--------------+---------------------------------------------+
| 0x04  | GSM       | GSM          | Use Global System for Mobile Communications | 
+-------+-----------+--------------+---------------------------------------------+
| 0x08  | Mobile    | MOBILE       | Use mobile networks                         | 
+-------+-----------+--------------+---------------------------------------------+
| 0x10  | Radio     | RADIO        | Use Radio telemetry                         | 
+-------+-----------+--------------+---------------------------------------------+

.. _StateReport:

State Report
-------------

Concise representation of entire system state.

- Abbreviation: StateReport
- Identification Number: 514
- Payload Size: 24 bytes
- Message Size: 46 bytes

+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Name            | Abbreviation  | Unit   | Type     | Description                                               | Range              | 
+=================+===============+========+==========+===========================================================+====================+
| Time Stamp      | stime         | *s*    | uint32_t | Time, in seconds, since January 1st 1970.                 | Same as field type | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Latitude        | latitude      | *°*    | fp32_t   | Latitude of the system, in degrees.                       | Same as field type | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Longitude       | longitude     | *°*    | fp32_t   | Longitude of the system, in degrees.                      | Same as field type | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Altitude        | altitude      | *dm*   | uint16_t | Altitude of the system, in decimeters.                    | Same as field type | 
|                 |               |        |          |       * *0xFFFF* used for unknown / not applicable value. |                    | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Depth           | depth         | *dm*   | uint16_t | Depth of the system, in decimeters.                       | Same as field type | 
|                 |               |        |          |       * *0xFFFF* used for unknown / not applicable value. |                    | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Heading         | heading       | *-*    | uint16_t | Calculated as `(rads * (0xFFFF / (2 * PI))`               | Same as field type | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Speed           | speed         | *cm/s* | int16_t  | Speed of the system in centimeters per second.            | Same as field type | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Fuel            | fuel          | *%*    | int8_t   | System fuel gauge.                                        | Same as field type | 
|                 |               |        |          |       * *-1* means unknown fuel level.                    |                    | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Execution State | exec_state    | *%*    | int8_t   | Progress of execution or idle state.                      | Same as field type | 
|                 |               |        |          |       * *-1* means Service mode                           |                    | 
|                 |               |        |          |       * *-2* means Boot mode                              |                    | 
|                 |               |        |          |       * *-3* means Calibration mode                       |                    | 
|                 |               |        |          |       * *-4* means Error mode                             |                    | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+
| Plan Checksum   | plan_checksum | *-*    | uint16_t | Checksum of the plan being executed.                      | Same as field type | 
+-----------------+---------------+--------+----------+-----------------------------------------------------------+--------------------+

.. _TransmissionRequest:

Transmission Request
---------------------

Request data to be sent over a specified communication mean.

- Abbreviation: TransmissionRequest
- Identification Number: 515
- Payload Size: 24+  bytes
- Message Size: 46+  bytes

+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit                                        | Type      | Description                                                    | Range              | 
+====================+==============+=============================================+===========+================================================================+====================+
| Request Identifier | req_id       | *-*                                         | uint16_t  | The unique identifier for this request.                        | Same as field type | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Communication Mean | comm_mean    | *Enumerated*                                | uint8_t   | Communication mean to be used to transfer these data.          | Same as field type | 
|                    |              | (:ref:`TransmissionRequest-enum-comm_mean`) |           |                                                                |                    | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Destination System | destination  | *-*                                         | plaintext | The name of the system where to send this message.             | Same as field type | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Deadline           | deadline     | *-*                                         | fp64_t    | Deadline for message transmission (seconds since epoch).       | Same as field type | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Range              | range        | *m*                                         | fp32_t    | The meaning of this field depends on the operation and is      | Same as field type | 
|                    |              |                                             |           | explained in the operation's description.                      |                    | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Data Mode          | data_mode    | *Enumerated*                                | uint8_t   | Type of data to be transmitted.                                | Same as field type | 
|                    |              | (:ref:`TransmissionRequest-enum-data_mode`) |           | Abort and Range mode can only be used with comm_mean=ACOUSTIC  |                    | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Message Data       | msg_data     | *-*                                         | message   | Data to be transmitted if selected *data_mode* is *INLINEMSG*. | Same as field type | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Text Data          | txt_data     | *-*                                         | plaintext | Data to be transmitted if selected *data_mode* is *TEXT*.      | Same as field type | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Raw Data           | raw_data     | *-*                                         | rawdata   | Data to be transmitted if selected *data_mode* is *RAW*.       | Same as field type | 
+--------------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------+--------------------+

.. _TransmissionRequest-enum-comm_mean:

.. _TransmissionRequest-enum-prefix-CMEAN:

Enum Communication Mean
^^^^^^^^^^^^^^^^^^^^^^^^

Communication mean to be used to transfer these data.

- Abbreviation: comm_mean
- Prefix: CMEAN

+-------+-----------+--------------+-------------+
| Value | Name      | Abbreviation | Description | 
+=======+===========+==============+=============+
| 0     | WiFi      | WIFI         | *-*         | 
+-------+-----------+--------------+-------------+
| 1     | Acoustic  | ACOUSTIC     | *-*         | 
+-------+-----------+--------------+-------------+
| 2     | Satellite | SATELLITE    | *-*         | 
+-------+-----------+--------------+-------------+
| 3     | GSM       | GSM          | *-*         | 
+-------+-----------+--------------+-------------+
| 4     | Any       | ANY          | *-*         | 
+-------+-----------+--------------+-------------+
| 5     | All       | ALL          | *-*         | 
+-------+-----------+--------------+-------------+

.. _TransmissionRequest-enum-data_mode:

.. _TransmissionRequest-enum-prefix-DMODE:

Enum Data Mode
^^^^^^^^^^^^^^^

Type of data to be transmitted.
Abort and Range mode can only be used with comm_mean=ACOUSTIC

- Abbreviation: data_mode
- Prefix: DMODE

+-------+----------------+---------------+-------------+
| Value | Name           | Abbreviation  | Description | 
+=======+================+===============+=============+
| 0     | Inline Message | INLINEMSG     | *-*         | 
+-------+----------------+---------------+-------------+
| 1     | Text           | TEXT          | *-*         | 
+-------+----------------+---------------+-------------+
| 2     | Raw Data       | RAW           | *-*         | 
+-------+----------------+---------------+-------------+
| 3     | Abort          | ABORT         | *-*         | 
+-------+----------------+---------------+-------------+
| 4     | Range          | RANGE         | *-*         | 
+-------+----------------+---------------+-------------+
| 5     | Reverse Range  | REVERSE_RANGE | *-*         | 
+-------+----------------+---------------+-------------+

.. _TransmissionStatus:

Transmission Status
--------------------

Reply sent in response to a communications request.

- Abbreviation: TransmissionStatus
- Identification Number: 516
- Payload Size: 9+  bytes
- Message Size: 31+  bytes

+--------------------+--------------+-----------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit                                    | Type      | Description                                               | Range              | 
+====================+==============+=========================================+===========+===========================================================+====================+
| Request Identifier | req_id       | *-*                                     | uint16_t  |                                                           | Same as field type | 
+--------------------+--------------+-----------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Status             | status       | *Enumerated*                            | uint8_t   |                                                           | Same as field type | 
|                    |              | (:ref:`TransmissionStatus-enum-status`) |           |                                                           |                    | 
+--------------------+--------------+-----------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Range              | range        | *m*                                     | fp32_t    | The meaning of this field depends on the operation and is | Same as field type | 
|                    |              |                                         |           | explained in the operation's description.                 |                    | 
+--------------------+--------------+-----------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Information        | info         | *-*                                     | plaintext |                                                           | Same as field type | 
+--------------------+--------------+-----------------------------------------+-----------+-----------------------------------------------------------+--------------------+

.. _TransmissionStatus-enum-status:

.. _TransmissionStatus-enum-prefix-TSTAT:

Enum Status
^^^^^^^^^^^^

No description

- Abbreviation: status
- Prefix: TSTAT

+-------+---------------------+-------------------+-------------+
| Value | Name                | Abbreviation      | Description | 
+=======+=====================+===================+=============+
| 0     | In progress         | IN_PROGRESS       | *-*         | 
+-------+---------------------+-------------------+-------------+
| 1     | Sent                | SENT              | *-*         | 
+-------+---------------------+-------------------+-------------+
| 51    | Delivered           | DELIVERED         | *-*         | 
+-------+---------------------+-------------------+-------------+
| 52    | Delivery is unknown | MAYBE_DELIVERED   | *-*         | 
+-------+---------------------+-------------------+-------------+
| 60    | Range received      | RANGE_RECEIVED    | *-*         | 
+-------+---------------------+-------------------+-------------+
| 101   | Input Error         | INPUT_FAILURE     | *-*         | 
+-------+---------------------+-------------------+-------------+
| 102   | Temporary Error     | TEMPORARY_FAILURE | *-*         | 
+-------+---------------------+-------------------+-------------+
| 103   | Permanent Failure   | PERMANENT_FAILURE | *-*         | 
+-------+---------------------+-------------------+-------------+

.. _SmsRequest:

SMS Transmission Request
-------------------------

Request SMS Text sending.

- Abbreviation: SmsRequest
- Identification Number: 517
- Payload Size: 14+  bytes
- Message Size: 36+  bytes

+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Name               | Abbreviation | Unit | Type      | Description                                  | Range              | 
+====================+==============+======+===========+==============================================+====================+
| Request Identifier | req_id       | *-*  | uint16_t  |                                              | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Destination        | destination  | *-*  | plaintext | Recipient identifier (number or name).       | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Timeout            | timeout      | *s*  | fp64_t    | Period of time to send message (in seconds). | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| SMS Text           | sms_text     | *-*  | plaintext |                                              | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+

.. _SmsStatus:

SMS Transmission Status
------------------------

Reply sent in response to a SMS sending request.

- Abbreviation: SmsStatus
- Identification Number: 518
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+
| Name               | Abbreviation | Unit                           | Type      | Description        | Range              | 
+====================+==============+================================+===========+====================+====================+
| Request Identifier | req_id       | *-*                            | uint16_t  |                    | Same as field type | 
+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+
| Status             | status       | *Enumerated*                   | uint8_t   |                    | Same as field type | 
|                    |              | (:ref:`SmsStatus-enum-status`) |           |                    |                    | 
+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+
| Information        | info         | *-*                            | plaintext | Error description. | Same as field type | 
+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+

.. _SmsStatus-enum-status:

.. _SmsStatus-enum-prefix-SMSSTAT:

Enum Status
^^^^^^^^^^^^

No description

- Abbreviation: status
- Prefix: SMSSTAT

+-------+--------------------------+---------------+-------------+
| Value | Name                     | Abbreviation  | Description | 
+=======+==========================+===============+=============+
| 0     | Queued                   | QUEUED        | *-*         | 
+-------+--------------------------+---------------+-------------+
| 1     | Sent                     | SENT          | *-*         | 
+-------+--------------------------+---------------+-------------+
| 101   | Input Error              | INPUT_FAILURE | *-*         | 
+-------+--------------------------+---------------+-------------+
| 102   | Error trying to send sms | ERROR         | *-*         | 
+-------+--------------------------+---------------+-------------+

.. _VtolState:

VTOL State
-----------

Reports VTOL current state.

- Abbreviation: VtolState
- Identification Number: 519
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-------+--------------+-------------------------------+---------+-------------+--------------------+
| Name  | Abbreviation | Unit                          | Type    | Description | Range              | 
+=======+==============+===============================+=========+=============+====================+
| State | state        | *Enumerated*                  | uint8_t |             | Same as field type | 
|       |              | (:ref:`VtolState-enum-state`) |         |             |                    | 
+-------+--------------+-------------------------------+---------+-------------+--------------------+

.. _VtolState-enum-state:

.. _VtolState-enum-prefix-VTOL_STATE:

Enum State
^^^^^^^^^^^

No description

- Abbreviation: state
- Prefix: VTOL_STATE

+-------+---------------------------+------------------+----------------------------------------------------------+
| Value | Name                      | Abbreviation     | Description                                              | 
+=======+===========================+==================+==========================================================+
| 0     | Undefined                 | UNDEFINED        | Vehicle is not configured as VTOL.                       | 
+-------+---------------------------+------------------+----------------------------------------------------------+
| 1     | Transition to Fixed-Wing  | TRANSITION_TO_FW | Vehicle is in transition from multicopter to fixed-wing. | 
+-------+---------------------------+------------------+----------------------------------------------------------+
| 2     | Transition to MultiCopter | TRANSITION_TO_MC | Vehicle is in transition from fixed-wing to multicopter. | 
+-------+---------------------------+------------------+----------------------------------------------------------+
| 3     | MutiCopter                | MC               | Vehicle is in multicopter state.                         | 
+-------+---------------------------+------------------+----------------------------------------------------------+
| 4     | Fixed-Wing                | FW               | Vehicle is in fixed-wing state.                          | 
+-------+---------------------------+------------------+----------------------------------------------------------+

.. _ArmingState:

Arming State
-------------

Reports if motors are currently armed or disarmed.

- Abbreviation: ArmingState
- Identification Number: 520
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-------+--------------+---------------------------------+---------+-------------+--------------------+
| Name  | Abbreviation | Unit                            | Type    | Description | Range              | 
+=======+==============+=================================+=========+=============+====================+
| State | state        | *Enumerated*                    | uint8_t |             | Same as field type | 
|       |              | (:ref:`ArmingState-enum-state`) |         |             |                    | 
+-------+--------------+---------------------------------+---------+-------------+--------------------+

.. _ArmingState-enum-state:

.. _ArmingState-enum-prefix-MOTORS:

Enum State
^^^^^^^^^^^

No description

- Abbreviation: state
- Prefix: MOTORS

+-------+----------+--------------+-------------+
| Value | Name     | Abbreviation | Description | 
+=======+==========+==============+=============+
| 0     | Armed    | ARMED        | *-*         | 
+-------+----------+--------------+-------------+
| 1     | Disarmed | DISARMED     | *-*         | 
+-------+----------+--------------+-------------+

.. _TCPRequest:

TCP Transmission Request
-------------------------

Request data to be sent over a TCP connection

- Abbreviation: TCPRequest
- Identification Number: 521
- Payload Size: 14+  bytes
- Message Size: 36+  bytes

+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Name               | Abbreviation | Unit | Type      | Description                                  | Range              | 
+====================+==============+======+===========+==============================================+====================+
| Request Identifier | req_id       | *-*  | uint16_t  |                                              | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Destination        | destination  | *-*  | plaintext | Recipient identifier (number or name).       | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Timeout            | timeout      | *s*  | fp64_t    | Period of time to send message (in seconds). | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+
| Message Data       | msg_data     | *-*  | message   | IMC message to be transmitted .              | Same as field type | 
+--------------------+--------------+------+-----------+----------------------------------------------+--------------------+

.. _TCPStatus:

TCP Transmission Status
------------------------

Reply sent in response to a TCP sending request.

- Abbreviation: TCPStatus
- Identification Number: 522
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+
| Name               | Abbreviation | Unit                           | Type      | Description        | Range              | 
+====================+==============+================================+===========+====================+====================+
| Request Identifier | req_id       | *-*                            | uint16_t  |                    | Same as field type | 
+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+
| Status             | status       | *Enumerated*                   | uint8_t   |                    | Same as field type | 
|                    |              | (:ref:`TCPStatus-enum-status`) |           |                    |                    | 
+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+
| Information        | info         | *-*                            | plaintext | Error description. | Same as field type | 
+--------------------+--------------+--------------------------------+-----------+--------------------+--------------------+

.. _TCPStatus-enum-status:

.. _TCPStatus-enum-prefix-TCPSTAT:

Enum Status
^^^^^^^^^^^^

No description

- Abbreviation: status
- Prefix: TCPSTAT

+-------+--------------------------+---------------+-------------+
| Value | Name                     | Abbreviation  | Description | 
+=======+==========================+===============+=============+
| 0     | Queued                   | QUEUED        | *-*         | 
+-------+--------------------------+---------------+-------------+
| 1     | Sent                     | SENT          | *-*         | 
+-------+--------------------------+---------------+-------------+
| 100   | Input Error              | INPUT_FAILURE | *-*         | 
+-------+--------------------------+---------------+-------------+
| 101   | Host Unknown             | HOST_UNKNOWN  | *-*         | 
+-------+--------------------------+---------------+-------------+
| 102   | Can't Connect            | CANT_CONNECT  | *-*         | 
+-------+--------------------------+---------------+-------------+
| 103   | Error trying to send sms | ERROR         | *-*         | 
+-------+--------------------------+---------------+-------------+

