Core Messages
==============

.. _EntityState:

Entity State
-------------

State reported by an entity in the vehicle. The source entity is
identified in the message header.

- Abbreviation: EntityState
- Identification Number: 1
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+---------------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Name                      | Abbreviation | Unit                                | Type      | Description                                               | Range              | 
+===========================+==============+=====================================+===========+===========================================================+====================+
| State                     | state        | *Enumerated*                        | uint8_t   | State of entity.                                          | Same as field type | 
|                           |              | (:ref:`EntityState-enum-state`)     |           |                                                           |                    | 
+---------------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Flags                     | flags        | *Bitfield*                          | uint8_t   | Complementary entity state flags.                         | Same as field type | 
|                           |              | (:ref:`EntityState-bitfield-flags`) |           |                                                           |                    | 
+---------------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Complementary description | description  | *-*                                 | plaintext | Complementary human-readable description of entity state. | Same as field type | 
+---------------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+

.. _EntityState-enum-state:

.. _EntityState-enum-prefix-ESTA:

Enum State
^^^^^^^^^^^

State of entity.

- Abbreviation: state
- Prefix: ESTA

+-------+------------------+--------------+-------------+
| Value | Name             | Abbreviation | Description | 
+=======+==================+==============+=============+
| 0     | Bootstrapping    | BOOT         | *-*         | 
+-------+------------------+--------------+-------------+
| 1     | Normal Operation | NORMAL       | *-*         | 
+-------+------------------+--------------+-------------+
| 2     | Fault            | FAULT        | *-*         | 
+-------+------------------+--------------+-------------+
| 3     | Error            | ERROR        | *-*         | 
+-------+------------------+--------------+-------------+
| 4     | Failure          | FAILURE      | *-*         | 
+-------+------------------+--------------+-------------+

.. _EntityState-bitfield-flags:

.. _EntityState-bitfield-prefix-EFLA:

Bitfield Flags
^^^^^^^^^^^^^^^

Complementary entity state flags.

- Abbreviation: flags
- Prefix: EFLA

+-------+-----------------------------+--------------------+-------------+
| Value | Name                        | Abbreviation       | Description | 
+=======+=============================+====================+=============+
| 0x01  | Human Intervention Required | HUMAN_INTERVENTION | *-*         | 
+-------+-----------------------------+--------------------+-------------+

.. _QueryEntityState:

Query Entity State
-------------------

Request entities to report their state. Entities should respond
by issuing an appropriate EntityState message.

- Abbreviation: QueryEntityState
- Identification Number: 2
- Payload Size: 0 bytes
- Message Size: 22 bytes
- Flags: periodic

This message has no fields.

.. _EntityInfo:

Entity Information
-------------------

This message describes an entity.

- Abbreviation: EntityInfo
- Identification Number: 3
- Payload Size: 9+  bytes
- Message Size: 31+  bytes

+-------------------+--------------+------+-----------+-------------------------------------------------------------+--------------------+
| Name              | Abbreviation | Unit | Type      | Description                                                 | Range              | 
+===================+==============+======+===========+=============================================================+====================+
| Entity Identifier | id           | *-*  | uint8_t   | Entity identifier.                                          | Same as field type | 
+-------------------+--------------+------+-----------+-------------------------------------------------------------+--------------------+
| Label             | label        | *-*  | plaintext | Entity label or empty if the entity id is not valid.        | Same as field type | 
+-------------------+--------------+------+-----------+-------------------------------------------------------------+--------------------+
| Component name    | component    | *-*  | plaintext | Name of the plugin/component/subsystem associated with this | Same as field type | 
|                   |              |      |           | entity.                                                     |                    | 
+-------------------+--------------+------+-----------+-------------------------------------------------------------+--------------------+
| Activation Time   | act_time     | *s*  | uint16_t  | Amount of time needed to properly activate the entity.      | Same as field type | 
+-------------------+--------------+------+-----------+-------------------------------------------------------------+--------------------+
| Deactivation Time | deact_time   | *s*  | uint16_t  | Amount of time needed to properly deactivate the entity.    | Same as field type | 
+-------------------+--------------+------+-----------+-------------------------------------------------------------+--------------------+

.. _QueryEntityInfo:

Query Entity Information
-------------------------

Request information about an entity identifier. The receiving
system shall reply with an EntityInfo message with the details
of that entity.

- Abbreviation: QueryEntityInfo
- Identification Number: 4
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-------------------+--------------+------+---------+--------------------+--------------------+
| Name              | Abbreviation | Unit | Type    | Description        | Range              | 
+===================+==============+======+=========+====================+====================+
| Entity Identifier | id           | *-*  | uint8_t | Entity identifier. | Same as field type | 
+-------------------+--------------+------+---------+--------------------+--------------------+

.. _EntityList:

Entity List
------------

This message describes the names and identification numbers of
all entities in the system.

- Abbreviation: EntityList
- Identification Number: 5
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-----------+--------------+-----------------------------+-----------+-----------------------------+--------------------+
| Name      | Abbreviation | Unit                        | Type      | Description                 | Range              | 
+===========+==============+=============================+===========+=============================+====================+
| operation | op           | *Enumerated*                | uint8_t   | Operation to perform.       | Same as field type | 
|           |              | (:ref:`EntityList-enum-op`) |           |                             |                    | 
+-----------+--------------+-----------------------------+-----------+-----------------------------+--------------------+
| list      | list         | *TupleList*                 | plaintext | Example: "Battery=11;CTD=3" | Same as field type | 
+-----------+--------------+-----------------------------+-----------+-----------------------------+--------------------+

.. _EntityList-enum-op:

.. _EntityList-enum-prefix-OP:

Enum operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: OP

+-------+--------+--------------+-------------+
| Value | Name   | Abbreviation | Description | 
+=======+========+==============+=============+
| 0     | Report | REPORT       | *-*         | 
+-------+--------+--------------+-------------+
| 1     | Query  | QUERY        | *-*         | 
+-------+--------+--------------+-------------+

.. _CpuUsage:

CPU Usage
----------

Report of software CPU usage.

- Abbreviation: CpuUsage
- Identification Number: 7
- Payload Size: 1 bytes
- Message Size: 23 bytes
- Flags: periodic

+------------------+--------------+------+---------+--------------------------------------------------------+---------+
| Name             | Abbreviation | Unit | Type    | Description                                            | Range   | 
+==================+==============+======+=========+========================================================+=========+
| Usage percentage | value        | *%*  | uint8_t | The CPU usage, in percentage, of the sending software. | max=100 | 
+------------------+--------------+------+---------+--------------------------------------------------------+---------+

.. _TransportBindings:

Transport Bindings
-------------------

Message generated when tasks bind to messages.

- Abbreviation: TransportBindings
- Identification Number: 8
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+--------------------+--------------+------+-----------+--------------------------------------------+--------------------+
| Name               | Abbreviation | Unit | Type      | Description                                | Range              | 
+====================+==============+======+===========+============================================+====================+
| Consumer name      | consumer     | *-*  | plaintext | The name of the consumer (e.g. task name). | Same as field type | 
+--------------------+--------------+------+-----------+--------------------------------------------+--------------------+
| Message Identifier | message_id   | *-*  | uint16_t  | The id of the message to be listened to.   | Same as field type | 
+--------------------+--------------+------+-----------+--------------------------------------------+--------------------+

.. _RestartSystem:

Restart System
---------------

Request the destination system to restart itself.

- Abbreviation: RestartSystem
- Identification Number: 9
- Payload Size: 1 bytes
- Message Size: 23 bytes

+--------------+--------------+----------------------------------+---------+-------------+--------------------+
| Name         | Abbreviation | Unit                             | Type    | Description | Range              | 
+==============+==============+==================================+=========+=============+====================+
| Restart Type | type         | *Enumerated*                     | uint8_t |             | Same as field type | 
|              |              | (:ref:`RestartSystem-enum-type`) |         |             |                    | 
+--------------+--------------+----------------------------------+---------+-------------+--------------------+

.. _RestartSystem-enum-type:

.. _RestartSystem-enum-prefix-RSTYPE:

Enum Restart Type
^^^^^^^^^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: RSTYPE

+-------+--------+--------------+---------------------------+
| Value | Name   | Abbreviation | Description               | 
+=======+========+==============+===========================+
| 1     | Dune   | DUNE         | Request a DUNE restart    | 
+-------+--------+--------------+---------------------------+
| 2     | System | SYSTEM       | Request a system restart. | 
+-------+--------+--------------+---------------------------+

.. _DevCalibrationControl:

Device Calibration Control
---------------------------

This message controls the calibration procedure of a given
device. The destination device is selected using the destination
entity identification number.

- Abbreviation: DevCalibrationControl
- Identification Number: 12
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-----------+--------------+----------------------------------------+---------+-----------------------+--------------------+
| Name      | Abbreviation | Unit                                   | Type    | Description           | Range              | 
+===========+==============+========================================+=========+=======================+====================+
| Operation | op           | *Enumerated*                           | uint8_t | Operation to perform. | Same as field type | 
|           |              | (:ref:`DevCalibrationControl-enum-op`) |         |                       |                    | 
+-----------+--------------+----------------------------------------+---------+-----------------------+--------------------+

.. _DevCalibrationControl-enum-op:

.. _DevCalibrationControl-enum-prefix-DCAL:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: DCAL

+-------+-----------------------------------+---------------+-----------------------------------------------------+
| Value | Name                              | Abbreviation  | Description                                         | 
+=======+===================================+===============+=====================================================+
| 0     | Start                             | START         | Start calibration procedure.                        | 
+-------+-----------------------------------+---------------+-----------------------------------------------------+
| 1     | Stop                              | STOP          | Stop calibration procedure.                         | 
+-------+-----------------------------------+---------------+-----------------------------------------------------+
| 2     | Perform Next Calibration Step     | STEP_NEXT     | Perform next step of the calibration procedure.     | 
+-------+-----------------------------------+---------------+-----------------------------------------------------+
| 3     | Perform Previous Calibration Step | STEP_PREVIOUS | Perform previous step of the calibration procedure. | 
+-------+-----------------------------------+---------------+-----------------------------------------------------+

.. _DevCalibrationState:

Device Calibration State
-------------------------

State of the calibration procedure.

- Abbreviation: DevCalibrationState
- Identification Number: 13
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+---------------------+--------------+---------------------------------------------+-----------+-----------------------------------------------------+--------------------+
| Name                | Abbreviation | Unit                                        | Type      | Description                                         | Range              | 
+=====================+==============+=============================================+===========+=====================================================+====================+
| Total Steps         | total_steps  | *-*                                         | uint8_t   | Total number of steps of the calibration procedure. | Same as field type | 
+---------------------+--------------+---------------------------------------------+-----------+-----------------------------------------------------+--------------------+
| Current Step Number | step_number  | *-*                                         | uint8_t   | Number of the current step being performed.         | Same as field type | 
+---------------------+--------------+---------------------------------------------+-----------+-----------------------------------------------------+--------------------+
| Description         | step         | *-*                                         | plaintext | Human-readable description of the current step.     | Same as field type | 
+---------------------+--------------+---------------------------------------------+-----------+-----------------------------------------------------+--------------------+
| Flags               | flags        | *Bitfield*                                  | uint8_t   | Additional flags.                                   | Same as field type | 
|                     |              | (:ref:`DevCalibrationState-bitfield-flags`) |           |                                                     |                    | 
+---------------------+--------------+---------------------------------------------+-----------+-----------------------------------------------------+--------------------+

.. _DevCalibrationState-bitfield-flags:

.. _DevCalibrationState-bitfield-prefix-DCS:

Bitfield Flags
^^^^^^^^^^^^^^^

Additional flags.

- Abbreviation: flags
- Prefix: DCS

+-------+------------------------------------+------------------------+----------------------------------------------------------------+
| Value | Name                               | Abbreviation           | Description                                                    | 
+=======+====================================+========================+================================================================+
| 0x01  | Previous Step Not Supported        | PREVIOUS_NOT_SUPPORTED | Jumping to the previous calibration step is not supported.     | 
+-------+------------------------------------+------------------------+----------------------------------------------------------------+
| 0x02  | Next Step Not Supported            | NEXT_NOT_SUPPORTED     | Jumping to the next calibration step is not supported.         | 
+-------+------------------------------------+------------------------+----------------------------------------------------------------+
| 0x04  | Waiting Device Calibration Control | WAITING_CONTROL        | The calibration procedure was suspended and must be resumed or | 
|       |                                    |                        | cancelled with a DeviceCalibrationControl message.             | 
+-------+------------------------------------+------------------------+----------------------------------------------------------------+
| 0x08  | Calibration Error                  | ERROR                  | Calibration was interrupted due to an error and must be        | 
|       |                                    |                        | restarted or cancelled with a DeviceCalibrationControl         | 
|       |                                    |                        | message.                                                       | 
+-------+------------------------------------+------------------------+----------------------------------------------------------------+
| 0x10  | Calibration Procedure Completed    | COMPLETED              | The calibration procedure was completed.                       | 
+-------+------------------------------------+------------------------+----------------------------------------------------------------+

.. _EntityActivationState:

Entity Activation State
------------------------

State of entity activation/deactivation.

- Abbreviation: EntityActivationState
- Identification Number: 14
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-------+--------------+-------------------------------------------+-----------+-------------------------------+--------------------+
| Name  | Abbreviation | Unit                                      | Type      | Description                   | Range              | 
+=======+==============+===========================================+===========+===============================+====================+
| State | state        | *Enumerated*                              | uint8_t   | Current state.                | Same as field type | 
|       |              | (:ref:`EntityActivationState-enum-state`) |           |                               |                    | 
+-------+--------------+-------------------------------------------+-----------+-------------------------------+--------------------+
| Error | error        | *-*                                       | plaintext | Human-readable error message. | Same as field type | 
+-------+--------------+-------------------------------------------+-----------+-------------------------------+--------------------+

.. _EntityActivationState-enum-state:

.. _EntityActivationState-enum-prefix-EAS:

Enum State
^^^^^^^^^^^

Current state.

- Abbreviation: state
- Prefix: EAS

+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| Value | Name                     | Abbreviation | Description                                                                         | 
+=======+==========================+==============+=====================================================================================+
| 0     | Entity is Inactive       | INACTIVE     | Entity is inactive.                                                                 | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 1     | Entity is Active         | ACTIVE       | Entity is active.                                                                   | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 2     | Activation in Progress   | ACT_IP       | Activation is in progress.                                                          | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 3     | Activation Completed     | ACT_DONE     | Activation is completed.                                                            | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 4     | Activation Failed        | ACT_FAIL     | The activation procedure failed and the field 'error' contains the error message.   | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 5     | Deactivation In Progress | DEACT_IP     | Deactivation is in progress.                                                        | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 6     | Deactivation Completed   | DEACT_DONE   | Deactivation is in progress.                                                        | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+
| 7     | Deactivation Failed      | DEACT_FAIL   | The deactivation procedure failed and the field 'error' contains the error message. | 
+-------+--------------------------+--------------+-------------------------------------------------------------------------------------+

.. _QueryEntityActivationState:

Query Entity Activation State
------------------------------

Query the activation/deactivation state of an entity. The
recipient shall reply with an EntityActivationState message.

- Abbreviation: QueryEntityActivationState
- Identification Number: 15
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _VehicleOperationalLimits:

Vehicle Operational Limits
---------------------------

Vehicle opertional limits.
For aircraft this should represent the flight envelope and the dynamic contraints.

- Abbreviation: VehicleOperationalLimits
- Identification Number: 16
- Payload Size: 69 bytes
- Message Size: 91 bytes

+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Name                                     | Abbreviation       | Unit                                      | Type    | Description                                                                           | Range              | 
+==========================================+====================+===========================================+=========+=======================================================================================+====================+
| Action on the vehicle operational limits | op                 | *Enumerated*                              | uint8_t | Action on the vehicle operation limits                                                | Same as field type | 
|                                          |                    | (:ref:`VehicleOperationalLimits-enum-op`) |         |                                                                                       |                    | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Minimum speed                            | speed_min          | *m/s*                                     | fp32_t  | Minimum operation speed.                                                              | min=0              | 
|                                          |                    |                                           |         | For aircraft this is equal or larger then the stall speed.                            |                    | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum speed                            | speed_max          | *m/s*                                     | fp32_t  | Maximum operation speed.                                                              | min=0              | 
|                                          |                    |                                           |         | For aircraft this is limited by the engine power or structural contrains.             |                    | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Longitudinal maximum acceleration        | long_accel         | *m/s/s*                                   | fp32_t  | Maximum longitudinal acceleration.                                                    | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum MSL altitude                     | alt_max_msl        | *m*                                       | fp32_t  | Maximum altitude above mean-sea-level.                                                | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum Dive Rate Speed Fraction         | dive_fraction_max  | *-*                                       | fp32_t  | Maximum dive rate (negative vertical speed) as a fraction of the longitudinal speed.  | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum Climb Rate Speed Fraction        | climb_fraction_max | *-*                                       | fp32_t  | Maximum climb rate (positive vertical speed) as a fraction of the longitudinal speed. | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Bank limit                               | bank_max           | *rad*                                     | fp32_t  | Limit to the bank angle (roll; angle over the xx body-axis).                          | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Bank rate limit                          | p_max              | *rad/s*                                   | fp32_t  | Limit to the bank angular rate (roll; angle over the xx body-axis).                   | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Minimum pitch angle                      | pitch_min          | *rad*                                     | fp32_t  | Minimum pitch angle (angle over the xx body-axis).                                    | Same as field type | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum pitch angle                      | pitch_max          | *rad*                                     | fp32_t  | Maximum pitch angle (angle over the xx body-axis).                                    | Same as field type | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum pitch rate                       | q_max              | *rad/s*                                   | fp32_t  | Maximum pitch angular rate (angle over the xx body-axis).                             | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Minimum load factor                      | g_min              | *g*                                       | fp32_t  | Minimum load factor, i.e., maximum positive acceleration in the zz body-axis          | max=0              | 
|                                          |                    |                                           |         | as a factor of the gravity acceleration at mean-sea-level.                            |                    | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum load factor                      | g_max              | *g*                                       | fp32_t  | Maximum load factor, i.e., maximum negative acceleration in the zz body-axis          | min=0              | 
|                                          |                    |                                           |         | as a factor of the gravity acceleration at mean-sea-level.                            |                    | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum lateral load factor              | g_lat_max          | *g*                                       | fp32_t  | Maximum lateral load factor, i.e., maximum acceleration in the yy body-axis           | min=0              | 
|                                          |                    |                                           |         | as a factor of the gravity acceleration at mean-sea-level.                            |                    | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Minimum RPMs                             | rpm_min            | *rpm*                                     | fp32_t  | Minimum motor RPMs.                                                                   | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum RPMs                             | rpm_max            | *rpm*                                     | fp32_t  | Maximum motor RPMs.                                                                   | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+
| Maximum RPM rate                         | rpm_rate_max       | *rpm/s*                                   | fp32_t  | Maximum motor RPMs' rate of change.                                                   | min=0              | 
+------------------------------------------+--------------------+-------------------------------------------+---------+---------------------------------------------------------------------------------------+--------------------+

.. _VehicleOperationalLimits-enum-op:

.. _VehicleOperationalLimits-enum-prefix-OP:

Enum Action on the vehicle operational limits
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Action on the vehicle operation limits

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

.. _MsgList:

Message List
-------------

No description

- Abbreviation: MsgList
- Identification Number: 20
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+----------+--------------+------+--------------+-------------+--------------------+
| Name     | Abbreviation | Unit | Type         | Description | Range              | 
+==========+==============+======+==============+=============+====================+
| Messages | msgs         | *-*  | message-list |             | Same as field type | 
+----------+--------------+------+--------------+-------------+--------------------+

