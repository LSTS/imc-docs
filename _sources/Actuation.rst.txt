Actuation Messages
===================

.. _CameraZoom:

Camera Zoom
------------

Camera Zoom.

- Abbreviation: CameraZoom
- Identification Number: 300
- Payload Size: 3 bytes
- Message Size: 25 bytes

+---------------------+--------------+---------------------------------+---------+------------------------------------------------------+--------------------+
| Name                | Abbreviation | Unit                            | Type    | Description                                          | Range              | 
+=====================+==============+=================================+=========+======================================================+====================+
| Camera Number       | id           | *-*                             | uint8_t | The identification number of the destination camera. | Same as field type | 
+---------------------+--------------+---------------------------------+---------+------------------------------------------------------+--------------------+
| Absolute Zoom Level | zoom         | *-*                             | uint8_t | Absolute zoom level.                                 | Same as field type | 
+---------------------+--------------+---------------------------------+---------+------------------------------------------------------+--------------------+
| Action              | action       | *Enumerated*                    | uint8_t | The zoom action to perform.                          | Same as field type | 
|                     |              | (:ref:`CameraZoom-enum-action`) |         |                                                      |                    | 
+---------------------+--------------+---------------------------------+---------+------------------------------------------------------+--------------------+

.. _CameraZoom-enum-action:

.. _CameraZoom-enum-prefix-ACTION:

Enum Action
^^^^^^^^^^^^

The zoom action to perform.

- Abbreviation: action
- Prefix: ACTION

+-------+--------------+--------------+-------------+
| Value | Name         | Abbreviation | Description | 
+=======+==============+==============+=============+
| 0     | Reset Zoom   | ZOOM_RESET   | *-*         | 
+-------+--------------+--------------+-------------+
| 1     | Zoom In      | ZOOM_IN      | *-*         | 
+-------+--------------+--------------+-------------+
| 2     | Zoom Out     | ZOOM_OUT     | *-*         | 
+-------+--------------+--------------+-------------+
| 3     | Stop Zooming | ZOOM_STOP    | *-*         | 
+-------+--------------+--------------+-------------+

.. _SetThrusterActuation:

Set Thruster Actuation
-----------------------

Actuate directly on a thruster.

- Abbreviation: SetThrusterActuation
- Identification Number: 301
- Payload Size: 5 bytes
- Message Size: 27 bytes

+-----------------+--------------+------+---------+--------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit | Type    | Description                                            | Range              | 
+=================+==============+======+=========+========================================================+====================+
| Thruster Number | id           | *-*  | uint8_t | The identification number of the destination thruster. | Same as field type | 
+-----------------+--------------+------+---------+--------------------------------------------------------+--------------------+
| Actuation Value | value        | *-*  | fp32_t  | Actuation magnitude.                                   | min=-1,            | 
|                 |              |      |         |                                                        | max=1              | 
+-----------------+--------------+------+---------+--------------------------------------------------------+--------------------+

.. _SetServoPosition:

Set Servo Position
-------------------

Set the position of a servo.

- Abbreviation: SetServoPosition
- Identification Number: 302
- Payload Size: 5 bytes
- Message Size: 27 bytes

+------------+--------------+-------+---------+-----------------------------------------------------+--------------------------+
| Name       | Abbreviation | Unit  | Type    | Description                                         | Range                    | 
+============+==============+=======+=========+=====================================================+==========================+
| Identifier | id           | *-*   | uint8_t | The identification number of the destination servo. | Same as field type       | 
+------------+--------------+-------+---------+-----------------------------------------------------+--------------------------+
| Position   | value        | *rad* | fp32_t  | Actuation magnitude.                                | min=-1.5707963267948966, | 
|            |              |       |         |                                                     | max=1.5707963267948966   | 
+------------+--------------+-------+---------+-----------------------------------------------------+--------------------------+

.. _SetControlSurfaceDeflection:

Set Control Surface Deflection
-------------------------------

Set the deflection angle of a control surface.

- Abbreviation: SetControlSurfaceDeflection
- Identification Number: 303
- Payload Size: 5 bytes
- Message Size: 27 bytes

+------------+--------------+-------+---------+---------------------------------------------------------------+--------------------+
| Name       | Abbreviation | Unit  | Type    | Description                                                   | Range              | 
+============+==============+=======+=========+===============================================================+====================+
| Identifier | id           | *-*   | uint8_t | The identification number of the destination control surface. | Same as field type | 
+------------+--------------+-------+---------+---------------------------------------------------------------+--------------------+
| Angle      | angle        | *rad* | fp32_t  | Actuation magnitude.                                          | Same as field type | 
+------------+--------------+-------+---------+---------------------------------------------------------------+--------------------+

.. _RemoteActionsRequest:

Remote Actions Request
-----------------------

This message is used as query to request for the possible remote
actions (operation=QUERY and the list is empty in this
case). The vehicle responds using the same message type
returning the tuplelist with the pairs: Action,Type
(operation=REPORT). The type of action can be Axis, Hat or
Button.

- Abbreviation: RemoteActionsRequest
- Identification Number: 304
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-----------+--------------+---------------------------------------+-----------+------------------------------------------------------+--------------------+
| Name      | Abbreviation | Unit                                  | Type      | Description                                          | Range              | 
+===========+==============+=======================================+===========+======================================================+====================+
| operation | op           | *Enumerated*                          | uint8_t   | Operation to perform.                                | Same as field type | 
|           |              | (:ref:`RemoteActionsRequest-enum-op`) |           |                                                      |                    | 
+-----------+--------------+---------------------------------------+-----------+------------------------------------------------------+--------------------+
| Actions   | actions      | *TupleList*                           | plaintext | Example: "Propulsion=Axis,PanTilt=Hat,Lights=Button" | Same as field type | 
+-----------+--------------+---------------------------------------+-----------+------------------------------------------------------+--------------------+

.. _RemoteActionsRequest-enum-op:

.. _RemoteActionsRequest-enum-prefix-OP:

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

.. _RemoteActions:

Remote Actions
---------------

This message is used to send a periodic update of values for
each remote action. If the action is not on the list the assumed
value is 0.

- Abbreviation: RemoteActions
- Identification Number: 305
- Payload Size: 2+  bytes
- Message Size: 24+  bytes
- Flags: periodic

+---------+--------------+-------------+-----------+-------------------------------------------------------------------------------------+--------------------+
| Name    | Abbreviation | Unit        | Type      | Description                                                                         | Range              | 
+=========+==============+=============+===========+=====================================================================================+====================+
| Actions | actions      | *TupleList* | plaintext | List of values for each remote action (e.g: "Propeller=0.6,PanTilt=0.75,Lights=1"). | Same as field type | 
+---------+--------------+-------------+-----------+-------------------------------------------------------------------------------------+--------------------+

.. _ButtonEvent:

Button Event
-------------

Event of a specific hardware button.

- Abbreviation: ButtonEvent
- Identification Number: 306
- Payload Size: 2 bytes
- Message Size: 24 bytes

+--------+--------------+------+---------+----------------------+--------------------+
| Name   | Abbreviation | Unit | Type    | Description          | Range              | 
+========+==============+======+=========+======================+====================+
| Button | button       | *-*  | uint8_t | Button identifier.   | Same as field type | 
+--------+--------------+------+---------+----------------------+--------------------+
| Value  | value        | *-*  | uint8_t | Value of the button. | Same as field type | 
+--------+--------------+------+---------+----------------------+--------------------+

.. _LcdControl:

LCD Control
------------

Control LCD.

- Abbreviation: LcdControl
- Identification Number: 307
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-----------+--------------+-----------------------------+-----------+--------------------------------------------------+--------------------+
| Name      | Abbreviation | Unit                        | Type      | Description                                      | Range              | 
+===========+==============+=============================+===========+==================================================+====================+
| Operation | op           | *Enumerated*                | uint8_t   | The LCD action to perform                        | Same as field type | 
|           |              | (:ref:`LcdControl-enum-op`) |           |                                                  |                    | 
+-----------+--------------+-----------------------------+-----------+--------------------------------------------------+--------------------+
| Text      | text         | *-*                         | plaintext | Text to be written (if defined write operation). | Same as field type | 
+-----------+--------------+-----------------------------+-----------+--------------------------------------------------+--------------------+

.. _LcdControl-enum-op:

.. _LcdControl-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

The LCD action to perform

- Abbreviation: op
- Prefix: OP

+-------+------------------+--------------+-------------+
| Value | Name             | Abbreviation | Description | 
+=======+==================+==============+=============+
| 0     | Turn off display | TURN_OFF     | *-*         | 
+-------+------------------+--------------+-------------+
| 1     | Turn on display  | TURN_ON      | *-*         | 
+-------+------------------+--------------+-------------+
| 2     | Clear display    | CLEAR        | *-*         | 
+-------+------------------+--------------+-------------+
| 3     | Write Line #0    | WRITE0       | *-*         | 
+-------+------------------+--------------+-------------+
| 4     | Write Line #1    | WRITE1       | *-*         | 
+-------+------------------+--------------+-------------+

.. _PowerOperation:

Power Operation
----------------

This message allows controlling the system's power lines.

- Abbreviation: PowerOperation
- Identification Number: 308
- Payload Size: 13 bytes
- Message Size: 35 bytes

+----------------+--------------+---------------------------------+---------+---------------------------------------+--------------------+
| Name           | Abbreviation | Unit                            | Type    | Description                           | Range              | 
+================+==============+=================================+=========+=======================================+====================+
| Operation      | op           | *Enumerated*                    | uint8_t | Operation type.                       | Same as field type | 
|                |              | (:ref:`PowerOperation-enum-op`) |         |                                       |                    | 
+----------------+--------------+---------------------------------+---------+---------------------------------------+--------------------+
| Time Remaining | time_remain  | *s*                             | fp32_t  | Time remaining to complete operation. | Same as field type | 
+----------------+--------------+---------------------------------+---------+---------------------------------------+--------------------+
| Scheduled Time | sched_time   | *s*                             | fp64_t  | Scheduled time of operation.          | Same as field type | 
+----------------+--------------+---------------------------------+---------+---------------------------------------+--------------------+

.. _PowerOperation-enum-op:

.. _PowerOperation-enum-prefix-POP:

Enum Operation
^^^^^^^^^^^^^^^

Operation type.

- Abbreviation: op
- Prefix: POP

+-------+------------------------+------------------+--------------------------------------------------------------+
| Value | Name                   | Abbreviation     | Description                                                  | 
+=======+========================+==================+==============================================================+
| 0     | Power Down             | PWR_DOWN         | Request the destination entity of this message to power down | 
|       |                        |                  | it's devices immediately. If the destination entity is the   | 
|       |                        |                  | special entity '0' the whole system will power down.         | 
+-------+------------------------+------------------+--------------------------------------------------------------+
| 1     | Power Down in Progress | PWR_DOWN_IP      | The latest power down request is in progress and the time    | 
|       |                        |                  | remaining until power down is given in field 'time_remain'.  | 
+-------+------------------------+------------------+--------------------------------------------------------------+
| 2     | Power Down Aborted     | PWR_DOWN_ABORTED | The latest power down request was aborted.                   | 
+-------+------------------------+------------------+--------------------------------------------------------------+
| 3     | Schedule Power Down    | SCHED_PWR_DOWN   | Request the destination entity of this message to power down | 
|       |                        |                  | it's devices at the time given in the field 'sched_time'. If | 
|       |                        |                  | the destination entity is the special entity '0' the whole   | 
|       |                        |                  | system will power down.                                      | 
+-------+------------------------+------------------+--------------------------------------------------------------+
| 4     | Power Up               | PWR_UP           | Request the destination entity of this message to power up   | 
|       |                        |                  | it's devices.                                                | 
+-------+------------------------+------------------+--------------------------------------------------------------+
| 5     | Power Up in Progress   | PWR_UP_IP        | The latest power up request is in progress.                  | 
+-------+------------------------+------------------+--------------------------------------------------------------+
| 6     | Schedule Power Up      | SCHED_PWR_UP     | Request the destination entity of this message to power up   | 
|       |                        |                  | it's devices at the time given in the field 'sched_time'. If | 
|       |                        |                  | the destination entity is the special entity '0' the whole   | 
|       |                        |                  | system will power up.                                        | 
+-------+------------------------+------------------+--------------------------------------------------------------+

.. _PowerChannelControl:

Power Channel Control
----------------------

This message allows controlling power channels.

- Abbreviation: PowerChannelControl
- Identification Number: 309
- Payload Size: 11+  bytes
- Message Size: 33+  bytes

+----------------+--------------+--------------------------------------+-----------+--------------------------------+--------------------+
| Name           | Abbreviation | Unit                                 | Type      | Description                    | Range              | 
+================+==============+======================================+===========+================================+====================+
| Channel Name   | name         | *-*                                  | plaintext | The name of the power channel. | Same as field type | 
+----------------+--------------+--------------------------------------+-----------+--------------------------------+--------------------+
| Operation      | op           | *Enumerated*                         | uint8_t   | Operation to perform.          | max=6              | 
|                |              | (:ref:`PowerChannelControl-enum-op`) |           |                                |                    | 
+----------------+--------------+--------------------------------------+-----------+--------------------------------+--------------------+
| Scheduled Time | sched_time   | *s*                                  | fp64_t    | Scheduled time of operation.   | Same as field type | 
+----------------+--------------+--------------------------------------+-----------+--------------------------------+--------------------+

.. _PowerChannelControl-enum-op:

.. _PowerChannelControl-enum-prefix-PCC_OP:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: PCC_OP

+-------+--------------------+--------------+-------------------------------------------------------------+
| Value | Name               | Abbreviation | Description                                                 | 
+=======+====================+==============+=============================================================+
| 0     | Turn Off           | TURN_OFF     | Turn off power channel specified in field 'id'.             | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 1     | Turn On            | TURN_ON      | Turn on power channel specified in field 'id'.              | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 2     | Toggle             | TOGGLE       | Toggle power channel specified in field 'id'.               | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 3     | Schedule Turn On   | SCHED_ON     | Turn on power channel specified in field 'id' in            | 
|       |                    |              | 'sched_time' seconds.                                       | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 4     | Schedule Turn Off  | SCHED_OFF    | Turn off power channel specified in field 'id' in           | 
|       |                    |              | 'sched_time' seconds.                                       | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 5     | Reset Schedules    | SCHED_RESET  | Reset all scheduled operations for the channel specified in | 
|       |                    |              | field 'id'.                                                 | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 6     | Save Current State | SAVE         | Save the current state of the channel 'id' to persistent    | 
|       |                    |              | storage.                                                    | 
+-------+--------------------+--------------+-------------------------------------------------------------+
| 7     | Restart            | RESTART      | Restart power channel specified in field 'id'.              | 
+-------+--------------------+--------------+-------------------------------------------------------------+

.. _QueryPowerChannelState:

Query Power Channel State
--------------------------

Request the state of power channels.

- Abbreviation: QueryPowerChannelState
- Identification Number: 310
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _PowerChannelState:

Power Channel State
--------------------

Message conveying the state of a power channel.

- Abbreviation: PowerChannelState
- Identification Number: 311
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-------+--------------+---------------------------------------+-----------+-----------------------------+--------------------+
| Name  | Abbreviation | Unit                                  | Type      | Description                 | Range              | 
+=======+==============+=======================================+===========+=============================+====================+
| Name  | name         | *-*                                   | plaintext | Power Channel Name.         | Same as field type | 
+-------+--------------+---------------------------------------+-----------+-----------------------------+--------------------+
| State | state        | *Enumerated*                          | uint8_t   | State of the Power Channel. | Same as field type | 
|       |              | (:ref:`PowerChannelState-enum-state`) |           |                             |                    | 
+-------+--------------+---------------------------------------+-----------+-----------------------------+--------------------+

.. _PowerChannelState-enum-state:

.. _PowerChannelState-enum-prefix-PCS:

Enum State
^^^^^^^^^^^

State of the Power Channel.

- Abbreviation: state
- Prefix: PCS

+-------+------+--------------+-----------------------+
| Value | Name | Abbreviation | Description           | 
+=======+======+==============+=======================+
| 0     | Off  | OFF          | Power channel is off. | 
+-------+------+--------------+-----------------------+
| 1     | On   | ON           | Power channel is on.  | 
+-------+------+--------------+-----------------------+

.. _LedBrightness:

LED Brightness
---------------

Brightness value of an LED (Light-Emitting Diode).

- Abbreviation: LedBrightness
- Identification Number: 312
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-------+--------------+------+-----------+-------------------+--------------------+
| Name  | Abbreviation | Unit | Type      | Description       | Range              | 
+=======+==============+======+===========+===================+====================+
| Name  | name         | *-*  | plaintext | LED name.         | Same as field type | 
+-------+--------------+------+-----------+-------------------+--------------------+
| Value | value        | *-*  | uint8_t   | Brightness value. | Same as field type | 
+-------+--------------+------+-----------+-------------------+--------------------+

.. _QueryLedBrightness:

Query LED Brightness
---------------------

Query the brightness of an LED (Light-Emitting Diode). The
recipient of this message shall reply with 'LedBrightness'.

- Abbreviation: QueryLedBrightness
- Identification Number: 313
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+------+--------------+------+-----------+-------------+--------------------+
| Name | Abbreviation | Unit | Type      | Description | Range              | 
+======+==============+======+===========+=============+====================+
| Name | name         | *-*  | plaintext | LED name.   | Same as field type | 
+------+--------------+------+-----------+-------------+--------------------+

.. _SetLedBrightness:

Set LED Brightness
-------------------

Control the brightness of an LED (Light-Emitting Diode). The
recipient of this message shall set the intensity of the LED to
the desired 'value' and reply with 'LedBrightness'.

- Abbreviation: SetLedBrightness
- Identification Number: 314
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-------+--------------+------+-----------+---------------------------+--------------------+
| Name  | Abbreviation | Unit | Type      | Description               | Range              | 
+=======+==============+======+===========+===========================+====================+
| Name  | name         | *-*  | plaintext | LED name.                 | Same as field type | 
+-------+--------------+------+-----------+---------------------------+--------------------+
| Value | value        | *-*  | uint8_t   | Desired brightness value. | Same as field type | 
+-------+--------------+------+-----------+---------------------------+--------------------+

.. _SetPWM:

Set PWM
--------

Set properties of a PWM signal channel.

- Abbreviation: SetPWM
- Identification Number: 315
- Payload Size: 9 bytes
- Message Size: 31 bytes

+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit | Type     | Description                                                    | Range              | 
+====================+==============+======+==========+================================================================+====================+
| Channel Identifier | id           | *-*  | uint8_t  | PWM channel identifier.                                        | Same as field type | 
+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Period             | period       | *µs* | uint32_t | The total period of the PWM signal (sum of active and inactive | Same as field type | 
|                    |              |      |          | time of the PWM).                                              |                    | 
+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Duty Cycle         | duty_cycle   | *µs* | uint32_t | The active time of the PWM signal. The duty cycle value must   | Same as field type | 
|                    |              |      |          | be less or equal to the period.                                |                    | 
+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+

.. _PWM:

PWM
----

Properties of a PWM signal channel.

- Abbreviation: PWM
- Identification Number: 316
- Payload Size: 9 bytes
- Message Size: 31 bytes

+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit | Type     | Description                                                    | Range              | 
+====================+==============+======+==========+================================================================+====================+
| Channel Identifier | id           | *-*  | uint8_t  | PWM channel identifier.                                        | Same as field type | 
+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Period             | period       | *µs* | uint32_t | The total period of the PWM signal (sum of active and inactive | Same as field type | 
|                    |              |      |          | time of the PWM).                                              |                    | 
+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Duty Cycle         | duty_cycle   | *µs* | uint32_t | The active time of the PWM signal. The duty cycle value is     | Same as field type | 
|                    |              |      |          | less or equal to the period.                                   |                    | 
+--------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+

