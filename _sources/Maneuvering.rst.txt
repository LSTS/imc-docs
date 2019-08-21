Maneuvering Messages
=====================

.. _Goto:

Goto Maneuver
--------------

A "Goto" is a maneuver specifying a movement of the vehicle to a
target waypoint. The waypoint is described by the WGS-84
waypoint coordinate and target Z reference.

Mandatory parameters defined for a "Goto" are
timeout, speed and speed units.

Optional parameters may be defined for the target Euler
Angles (roll, pitch and yaw) though these parameters may
not be considered by all maneuver controllers in charge
of the execution of this type of maneuver.

- Abbreviation: Goto
- Identification Number: 450
- Payload Size: 54+  bytes
- Message Size: 76+  bytes

+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                                   | Range                    | 
+==============================+==============+==========================+===========+===============================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t  | The amount of time the maneuver is allowed to run.            | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                           | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                               | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.                          | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                               | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t    | Target reference in the z axis. Use z_units to specify        | Same as field type       | 
|                              |              |                          |           | whether z represents depth, altitude or other.                |                          | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                                     | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                               |                          | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | Maneuver speed reference.                                     | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Speed units.                                                  | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                               |                          | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Roll                         | roll         | *rad*                    | fp64_t    | The phi Euler angle in which the vehicle should set its       | min=-1,                  | 
|                              |              |                          |           | attitude. Use '-1' for this field to be                       | max=6.283185307179586    | 
|                              |              |                          |           | unconsidered. Otherwise the value spans from 0 to 2 Pi.       |                          | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Pitch                        | pitch        | *rad*                    | fp64_t    | The theta Euler angle in which the vehicle should set its     | min=-1,                  | 
|                              |              |                          |           | attitude. Use '-1' for this field to be                       | max=6.283185307179586    | 
|                              |              |                          |           | disconcerted. Otherwise the value spans from 0 to 2 Pi.       |                          | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Yaw                          | yaw          | *rad*                    | fp64_t    | The psi Euler angle in which the vehicle should set its       | min=-1,                  | 
|                              |              |                          |           | attitude. Use '-1' for this field to be considered. Otherwise | max=6.283185307179586    | 
|                              |              |                          |           | the value spans from 0 to 2 Pi.                               |                          | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                                 | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+---------------------------------------------------------------+--------------------------+

.. _PopUp:

PopUp Maneuver
---------------

The Pop Up maneuver makes the vehicle come to the surface at a
specific waypoint. This maneuver is restricted to underwater vehicles.

- Abbreviation: PopUp
- Identification Number: 451
- Payload Size: 37+  bytes
- Message Size: 59+  bytes

+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                          | Type      | Description                                                  | Range                    | 
+==============================+==============+===============================+===========+==============================================================+==========================+
| Timeout                      | timeout      | *s*                           | uint16_t  | The amount of time the maneuver is allowed to run. If the    | Same as field type       | 
|                              |              |                               |           | maneuver is not completed in the amount of time specified an |                          | 
|                              |              |                               |           | error will be generated.                                     |                          | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                         | fp64_t    | WGS-84 Latitude.                                             | min=-1.5707963267948966, | 
|                              |              |                               |           |                                                              | max=1.5707963267948966   | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                         | fp64_t    | WGS-84 Longitude.                                            | min=-3.141592653589793,  | 
|                              |              |                               |           |                                                              | max=3.141592653589793    | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                           | fp32_t    | Maneuver reference in the z axis. Use z_units to specify     | Same as field type       | 
|                              |              |                               |           | whether z represents depth, altitude or other.               |                          | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*                  | uint8_t   | Units of the z reference.                                    | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)          |           |                                                              |                          | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                           | fp32_t    | Maneuver speed reference.                                    | Same as field type       | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                  | uint8_t   | Speed units.                                                 | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)      |           |                                                              |                          | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Duration                     | duration     | *s*                           | uint16_t  | The duration of this maneuver at surface level.              | Same as field type       | 
|                              |              |                               |           | Only used if flag WAIT_AT_SURFACE is on.                     |                          | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Radius                       | radius       | *m*                           | fp32_t    | Radius of the maneuver.                                      | min=1,                   | 
|                              |              |                               |           | Only used if flag STATION_KEEP is on.                        | max=100000               | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Flags                        | flags        | *Bitfield*                    | uint8_t   | Flags of the maneuver.                                       | Same as field type       | 
|                              |              | (:ref:`PopUp-bitfield-flags`) |           |                                                              |                          | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                   | plaintext | Custom settings for maneuver.                                | Same as field type       | 
+------------------------------+--------------+-------------------------------+-----------+--------------------------------------------------------------+--------------------------+

.. _PopUp-bitfield-flags:

.. _PopUp-bitfield-prefix-FLG:

Bitfield Flags
^^^^^^^^^^^^^^^

Flags of the maneuver.

- Abbreviation: flags
- Prefix: FLG

+-------+-----------------------------+-----------------+-------------------------------------------------------------------------+
| Value | Name                        | Abbreviation    | Description                                                             | 
+=======+=============================+=================+=========================================================================+
| 0x01  | Start from current position | CURR_POS        | If this flag is set, lat/lon/start_z fields should be                   | 
|       |                             |                 | ignored and current vehicle position should be considered as            | 
|       |                             |                 | starting point for ascent/descent.                                      | 
+-------+-----------------------------+-----------------+-------------------------------------------------------------------------+
| 0x02  | Wait at surface             | WAIT_AT_SURFACE | If this flag is set, duration field is used to hold position at surface | 
|       |                             |                 | for that amount of time.                                                | 
+-------+-----------------------------+-----------------+-------------------------------------------------------------------------+
| 0x04  | Station keeping             | STATION_KEEP    | This flag will only make sense if WAIT_AT_SURFACE is also set.          | 
|       |                             |                 | While holding position at surface the vehicle will assume a             | 
|       |                             |                 | station keeping behavior.                                               | 
+-------+-----------------------------+-----------------+-------------------------------------------------------------------------+

.. _Teleoperation:

Teleoperation Maneuver
-----------------------

The Teleoperation Maneuver lets the vehicle be controlled by an
external human operator.

- Abbreviation: Teleoperation
- Identification Number: 452
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+------------------------------+--------------+-------------+-----------+-------------------------------+--------------------+
| Name                         | Abbreviation | Unit        | Type      | Description                   | Range              | 
+==============================+==============+=============+===========+===============================+====================+
| Custom settings for maneuver | custom       | *TupleList* | plaintext | Custom settings for maneuver. | Same as field type | 
+------------------------------+--------------+-------------+-----------+-------------------------------+--------------------+

.. _Loiter:

Loiter Maneuver
----------------

The Loiter maneuver makes the vehicle circle around a specific
waypoint with fixed depth reference.

- Abbreviation: Loiter
- Identification Number: 453
- Payload Size: 50+  bytes
- Message Size: 72+  bytes

+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                           | Type      | Description                                                   | Range                    | 
+==============================+==============+================================+===========+===============================================================+==========================+
| Timeout                      | timeout      | *s*                            | uint16_t  | The timeout indicates the time that an error should occur if  | Same as field type       | 
|                              |              |                                |           | exceeded.                                                     |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                          | fp64_t    | WGS-84 Latitude coordinate.                                   | min=-1.5707963267948966, | 
|                              |              |                                |           |                                                               | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                          | fp64_t    | WGS-84 Longitude coordinate.                                  | min=-3.141592653589793,  | 
|                              |              |                                |           |                                                               | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                            | fp32_t    | Maneuver reference in the z axis. Use z_units to specify      | Same as field type       | 
|                              |              |                                |           | whether z represents depth, altitude or other.                |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*                   | uint8_t   | Units of the z reference.                                     | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)           |           |                                                               |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Duration                     | duration     | *s*                            | uint16_t  | The duration of this maneuver. Use '0' for unlimited duration | Same as field type       | 
|                              |              |                                |           | time.                                                         |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                            | fp32_t    | Maneuver speed reference.                                     | Same as field type       | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                   | uint8_t   | Speed units.                                                  | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)       |           |                                                               |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Loiter Type                  | type         | *Enumerated*                   | uint8_t   | Loiter maneuver type.                                         | max=4                    | 
|                              |              | (:ref:`Loiter-enum-type`)      |           |                                                               |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Radius                       | radius       | *m*                            | fp32_t    | Radius of the maneuver.                                       | min=1,                   | 
|                              |              |                                |           |                                                               | max=100000               | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Length                       | length       | *m*                            | fp32_t    | Length of the maneuver.                                       | min=1,                   | 
|                              |              |                                |           |                                                               | max=100000               | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Bearing                      | bearing      | *rad*                          | fp64_t    | Bearing of the maneuver.                                      | min=0,                   | 
|                              |              |                                |           |                                                               | max=6.283185307179586    | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Direction                    | direction    | *Enumerated*                   | uint8_t   | Desired direction.                                            | max=3                    | 
|                              |              | (:ref:`Loiter-enum-direction`) |           |                                                               |                          | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                    | plaintext | Custom settings for maneuver.                                 | Same as field type       | 
+------------------------------+--------------+--------------------------------+-----------+---------------------------------------------------------------+--------------------------+

.. _Loiter-enum-type:

.. _Loiter-enum-prefix-LT:

Enum Loiter Type
^^^^^^^^^^^^^^^^^

Loiter maneuver type.

- Abbreviation: type
- Prefix: LT

+-------+------------+--------------+-------------+
| Value | Name       | Abbreviation | Description | 
+=======+============+==============+=============+
| 0     | Default    | DEFAULT      | *-*         | 
+-------+------------+--------------+-------------+
| 1     | Circular   | CIRCULAR     | *-*         | 
+-------+------------+--------------+-------------+
| 2     | Race track | RACETRACK    | *-*         | 
+-------+------------+--------------+-------------+
| 3     | Figure 8   | EIGHT        | *-*         | 
+-------+------------+--------------+-------------+
| 4     | Hover      | HOVER        | *-*         | 
+-------+------------+--------------+-------------+

.. _Loiter-enum-direction:

.. _Loiter-enum-prefix-LD:

Enum Direction
^^^^^^^^^^^^^^^

Desired direction.

- Abbreviation: direction
- Prefix: LD

+-------+-----------------------+--------------+-------------+
| Value | Name                  | Abbreviation | Description | 
+=======+=======================+==============+=============+
| 0     | Vehicle Dependent     | VDEP         | *-*         | 
+-------+-----------------------+--------------+-------------+
| 1     | Clockwise             | CLOCKW       | *-*         | 
+-------+-----------------------+--------------+-------------+
| 2     | Counter Clockwise     | CCLOCKW      | *-*         | 
+-------+-----------------------+--------------+-------------+
| 3     | Into the wind/current | IWINDCURR    | *-*         | 
+-------+-----------------------+--------------+-------------+

.. _IdleManeuver:

Idle Maneuver
--------------

Causes the vehicle to stay idle for some time.

- Abbreviation: IdleManeuver
- Identification Number: 454
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+------------------------------+--------------+-------------+-----------+---------------------------------------------------------------+--------------------+
| Name                         | Abbreviation | Unit        | Type      | Description                                                   | Range              | 
+==============================+==============+=============+===========+===============================================================+====================+
| Duration                     | duration     | *s*         | uint16_t  | Optional duration of the Idle maneuver. Use '0' for unlimited | Same as field type | 
|                              |              |             |           | duration time (maneuver will have to be explicitly stopped).  |                    | 
+------------------------------+--------------+-------------+-----------+---------------------------------------------------------------+--------------------+
| Custom settings for maneuver | custom       | *TupleList* | plaintext | Custom settings for maneuver.                                 | Same as field type | 
+------------------------------+--------------+-------------+-----------+---------------------------------------------------------------+--------------------+

.. _LowLevelControl:

Low Level Control Maneuver
---------------------------

Low level maneuver that sends a (heading, roll, speed, ...)
reference to a controller of the vehicle and then optionally
lingers for some time.

- Abbreviation: LowLevelControl
- Identification Number: 455
- Payload Size: 6+  bytes
- Message Size: 28+  bytes

+------------------------------+--------------+-------------+-------------------------+--------------------------------------------------------------------------+--------------------+
| Name                         | Abbreviation | Unit        | Type                    | Description                                                              | Range              | 
+==============================+==============+=============+=========================+==========================================================================+====================+
| Control                      | control      | *-*         | message                 | Control command: can be of type DesiredZ, DesiredHeading,                | Same as field type | 
|                              |              |             | (:ref:`ControlCommand`) | DesiredRoll, DesiredPitch, DesiredSpeed, DesiredThrottle or DesiredPath. |                    | 
+------------------------------+--------------+-------------+-------------------------+--------------------------------------------------------------------------+--------------------+
| Duration                     | duration     | *s*         | uint16_t                | Duration of the control.                                                 | Same as field type | 
+------------------------------+--------------+-------------+-------------------------+--------------------------------------------------------------------------+--------------------+
| Custom settings for maneuver | custom       | *TupleList* | plaintext               | Custom settings for maneuver.                                            | Same as field type | 
+------------------------------+--------------+-------------+-------------------------+--------------------------------------------------------------------------+--------------------+

.. _Rows:

Rows Maneuver
--------------

Rows maneuver (i.e: lawn mower type maneuver)

- Abbreviation: Rows
- Identification Number: 456
- Payload Size: 61+  bytes
- Message Size: 83+  bytes

+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                         | Type      | Description                                              | Range                    | 
+==============================+==============+==============================+===========+==========================================================+==========================+
| Timeout                      | timeout      | *s*                          | uint16_t  | The amount of time the maneuver is allowed to run.       | Same as field type       | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                        | fp64_t    | WGS-84 Latitude of target waypoint.                      | min=-1.5707963267948966, | 
|                              |              |                              |           |                                                          | max=1.5707963267948966   | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                        | fp64_t    | WGS-84 Longitude of target waypoint.                     | min=-3.141592653589793,  | 
|                              |              |                              |           |                                                          | max=3.141592653589793    | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                          | fp32_t    | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                              |           | whether z represents depth, altitude or other.           |                          | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*                 | uint8_t   | Units of the z reference.                                | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)         |           |                                                          |                          | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                          | fp32_t    | Maneuver speed reference.                                | Same as field type       | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                 | uint8_t   | Speed units.                                             | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)     |           |                                                          |                          | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Bearing                      | bearing      | *rad*                        | fp64_t    | Rows bearing angle.                                      | min=0,                   | 
|                              |              |                              |           |                                                          | max=6.283185307179586    | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Cross Angle                  | cross_angle  | *rad*                        | fp64_t    | Rows cross angle reference.                              | min=-1.047197551197,     | 
|                              |              |                              |           |                                                          | max=1.047197551197       | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Width                        | width        | *m*                          | fp32_t    | Width of the maneuver.                                   | min=0                    | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Length                       | length       | *m*                          | fp32_t    | Length of the maneuver.                                  | min=0                    | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Horizontal Step              | hstep        | *m*                          | fp32_t    | Horizontal step.                                         | min=0                    | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Curve Offset                 | coff         | *m*                          | uint8_t   | Desired curve offset.                                    | Same as field type       | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Alternation Parameter        | alternation  | *%*                          | uint8_t   | Alternation parameter.                                   | max=100                  | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Flags                        | flags        | *Bitfield*                   | uint8_t   | Maneuver flags.                                          | Same as field type       | 
|                              |              | (:ref:`Rows-bitfield-flags`) |           |                                                          |                          | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                  | plaintext | Custom settings for maneuver.                            | Same as field type       | 
+------------------------------+--------------+------------------------------+-----------+----------------------------------------------------------+--------------------------+

.. _Rows-bitfield-flags:

.. _Rows-bitfield-prefix-FLG:

Bitfield Flags
^^^^^^^^^^^^^^^

Maneuver flags.

- Abbreviation: flags
- Prefix: FLG

+--------+-------------------+--------------+-------------+
| Value  | Name              | Abbreviation | Description | 
+========+===================+==============+=============+
| 0x0001 | Square Curve      | SQUARE_CURVE | *-*         | 
+--------+-------------------+--------------+-------------+
| 0x0002 | First Curve Right | CURVE_RIGHT  | *-*         | 
+--------+-------------------+--------------+-------------+

.. _FollowPath:

Follow Path Maneuver
---------------------

Maneuver constituted by a list of Path Points.

- Abbreviation: FollowPath
- Identification Number: 457
- Payload Size: 32+  bytes
- Message Size: 54+  bytes

+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type               | Description                                              | Range                    | 
+==============================+==============+==========================+====================+==========================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t           | The amount of time the maneuver is allowed to run.       | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t             | WGS-84 Latitude of start point.                          | min=-1.5707963267948966, | 
|                              |              |                          |                    |                                                          | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t             | WGS-84 Longitude of start point.                         | min=-3.141592653589793,  | 
|                              |              |                          |                    |                                                          | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t             | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |                    | whether z represents depth, altitude or other.           |                          | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t            | Units of the z reference.                                | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |                    |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t             | Maneuver speed reference.                                | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t            | Speed units.                                             | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |                    |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Path Points                  | points       | *-*                      | message-list       | List of PathPoint messages, encoding the path points.    | Same as field type       | 
|                              |              |                          | (:ref:`PathPoint`) |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext          | Custom settings for maneuver.                            | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------+----------------------------------------------------------+--------------------------+

.. _PathPoint:

Path Point
-----------

Waypoint coordinate of a Follow Path maneuver.

- Abbreviation: PathPoint
- Identification Number: 458
- Payload Size: 12 bytes
- Message Size: 34 bytes

+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| Name             | Abbreviation | Unit | Type   | Description                                                | Range              | 
+==================+==============+======+========+============================================================+====================+
| North Offset (m) | x            | *m*  | fp32_t | The North offset of the North/East/Down coordinate of this | Same as field type | 
|                  |              |      |        | point in relation to the path start point.                 |                    | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| East Offset (m)  | y            | *m*  | fp32_t | The East offset of the North/East/Down coordinate of this  | Same as field type | 
|                  |              |      |        | point in relation to the path start point.                 |                    | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| Down Offset (m)  | z            | *m*  | fp32_t | The Down offset of the North/East/Down coordinate of this  | Same as field type | 
|                  |              |      |        | point in relation to the path start point.                 |                    | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+

.. _YoYo:

Yo-Yo Maneuver
---------------

A "yo-yo" is a maneuver specifying a vehicle movement to a
target waypoint in which depth/altitude varies along the way
between two values with a desired pitch angle.

- Abbreviation: YoYo
- Identification Number: 459
- Payload Size: 38+  bytes
- Message Size: 60+  bytes

+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                                           | Range                    | 
+==============================+==============+==========================+===========+=======================================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t  | The amount of time the maneuver is allowed to run.                    | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                                   | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                                       | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.                                  | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                                       | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t    | Maneuver reference in the z axis.                                     | Same as field type       | 
|                              |              |                          |           | Use z_units to specify whether z represents depth, altitude or other. |                          | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                                             | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                                       |                          | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Amplitude                    | amplitude    | *m*                      | fp32_t    | Amplitude.                                                            | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Pitch Angle                  | pitch        | *rad*                    | fp32_t    | Pitch angle for use in ascent/descent.                                | min=0,                   | 
|                              |              |                          |           |                                                                       | max=0.78539816           | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | Maneuver speed reference.                                             | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Speed units.                                                          | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                                       |                          | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                                         | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+

.. _TeleoperationDone:

Teleoperation Done
-------------------

Notification of completion of a Teleoperation maneuver.

- Abbreviation: TeleoperationDone
- Identification Number: 460
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _StationKeeping:

Station Keeping
----------------

The Station Keeping maneuver makes the vehicle come to the surface
and then enter a given circular perimeter around a waypoint coordinate
for a certain amount of time.

- Abbreviation: StationKeeping
- Identification Number: 461
- Payload Size: 34+  bytes
- Message Size: 56+  bytes

+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                              | Range                    | 
+==============================+==============+==========================+===========+==========================================================+==========================+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude.                                         | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                          | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude.                                        | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                          | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t    | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |           | whether z represents depth, altitude or other.           |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                                | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                          |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Radius                       | radius       | *m*                      | fp32_t    | Radius.                                                  | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Duration                     | duration     | *s*                      | uint16_t  | Duration (0 for unlimited).                              | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | The value of the desired speed, in the scale specified   | Same as field type       | 
|                              |              |                          |           | by the "Speed Units" field.                              |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Indicates the units used for the speed value.            | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                          |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                            | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------+--------------------------+

.. _Elevator:

Elevator Maneuver
------------------

The Elevator maneuver specifies a vehicle to reach a target
waypoint using a cruise altitude/depth and then ascend or
descend to another target altitude/depth. The ascent/descent
slope and radius can also be optionally specified.

- Abbreviation: Elevator
- Identification Number: 462
- Payload Size: 40+  bytes
- Message Size: 62+  bytes

+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation  | Unit                             | Type      | Description                                                  | Range                    | 
+==============================+===============+==================================+===========+==============================================================+==========================+
| Timeout                      | timeout       | *s*                              | uint16_t  | The amount of time the maneuver is allowed to run. If the    | Same as field type       | 
|                              |               |                                  |           | maneuver is not completed in the amount of time specified an |                          | 
|                              |               |                                  |           | error will be generated.                                     |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Flags                        | flags         | *Bitfield*                       | uint8_t   | Flags of the maneuver.                                       | Same as field type       | 
|                              |               | (:ref:`Elevator-bitfield-flags`) |           |                                                              |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat           | *rad*                            | fp64_t    | WGS-84 Latitude.                                             | min=-1.5707963267948966, | 
|                              |               |                                  |           |                                                              | max=1.5707963267948966   | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon           | *rad*                            | fp64_t    | WGS-84 Longitude.                                            | min=-3.141592653589793,  | 
|                              |               |                                  |           |                                                              | max=3.141592653589793    | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Start Point -- Z Reference   | start_z       | *m*                              | fp32_t    | Altitude or depth of start point. This parameter will be     | Same as field type       | 
|                              |               |                                  |           | ignored if the 'NO_Z' flag is set, or if the 'START' flag is |                          | 
|                              |               |                                  |           | not set.                                                     |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Start Point -- Z Units       | start_z_units | *Enumerated*                     | uint8_t   | Units of the start point's z reference.                      | Same as field type       | 
|                              |               | (:ref:`enum-ZUnits`)             |           |                                                              |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| End Point -- Z Reference     | end_z         | *m*                              | fp32_t    | Depth or altitude for the end point.  This parameter will be | Same as field type       | 
|                              |               |                                  |           | ignored if the 'NO_Z' flag is set.                           |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| End Point -- Z Units         | end_z_units   | *Enumerated*                     | uint8_t   | Units of the end point's z reference.                        | Same as field type       | 
|                              |               | (:ref:`enum-ZUnits`)             |           |                                                              |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Radius                       | radius        | *m*                              | fp32_t    | Radius for use in ascent/descent. If 0 the controller to     | min=0                    | 
|                              |               |                                  |           | should use a custom control strategy.                        |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Speed                        | speed         | *-*                              | fp32_t    | Maneuver speed.                                              | Same as field type       | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units   | *Enumerated*                     | uint8_t   | Speed units.                                                 | Same as field type       | 
|                              |               | (:ref:`enum-SpeedUnits`)         |           |                                                              |                          | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom        | *TupleList*                      | plaintext | Custom settings for maneuver.                                | Same as field type       | 
+------------------------------+---------------+----------------------------------+-----------+--------------------------------------------------------------+--------------------------+

.. _Elevator-bitfield-flags:

.. _Elevator-bitfield-prefix-FLG:

Bitfield Flags
^^^^^^^^^^^^^^^

Flags of the maneuver.

- Abbreviation: flags
- Prefix: FLG

+-------+-----------------------------+--------------+--------------------------------------------------------------+
| Value | Name                        | Abbreviation | Description                                                  | 
+=======+=============================+==============+==============================================================+
| 0x01  | Start from current position | CURR_POS     | If this flag is set, lat/lon/start_z fields should be        | 
|       |                             |              | ignored and current vehicle position should be considered as | 
|       |                             |              | starting point for ascent/descent.                           | 
+-------+-----------------------------+--------------+--------------------------------------------------------------+

.. _FollowTrajectory:

Follow Trajectory
------------------

Maneuver constituted by a list of Trajectory Points.

- Abbreviation: FollowTrajectory
- Identification Number: 463
- Payload Size: 32+  bytes
- Message Size: 54+  bytes

+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type                     | Description                                              | Range                    | 
+==============================+==============+==========================+==========================+==========================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t                 | The amount of time the maneuver is allowed to run.       | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t                   | WGS-84 Latitude for start point.                         | min=-1.5707963267948966, | 
|                              |              |                          |                          |                                                          | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t                   | WGS-84 Longitude for start point.                        | min=-3.141592653589793,  | 
|                              |              |                          |                          |                                                          | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t                   | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |                          | whether z represents depth, altitude or other.           |                          | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t                  | Units of the z reference.                                | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |                          |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t                   | Maneuver speed.                                          | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t                  | Speed units.                                             | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |                          |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Trajectory Points            | points       | *-*                      | message-list             | List of trajectory points.                               | Same as field type       | 
|                              |              |                          | (:ref:`TrajectoryPoint`) |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext                | Custom settings for maneuver.                            | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------------+----------------------------------------------------------+--------------------------+

.. _TrajectoryPoint:

Trajectory Point
-----------------

Waypoint coordinate of a Follow Trajectory maneuver.

- Abbreviation: TrajectoryPoint
- Identification Number: 464
- Payload Size: 16 bytes
- Message Size: 38 bytes

+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| Name             | Abbreviation | Unit | Type   | Description                                                | Range              | 
+==================+==============+======+========+============================================================+====================+
| North Offset (m) | x            | *m*  | fp32_t | The North offset of the North/East/Down coordinate of this | Same as field type | 
|                  |              |      |        | point in relation to the trajectory start point.           |                    | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| East Offset (m)  | y            | *m*  | fp32_t | The East offset of the North/East/Down coordinate of this  | Same as field type | 
|                  |              |      |        | point in relation to the trajectory start point.           |                    | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| Down Offset (m)  | z            | *m*  | fp32_t | The Down offset of the North/East/Down coordinate of this  | Same as field type | 
|                  |              |      |        | point in relation to the trajectory start point.           |                    | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+
| Time Offset (s)  | t            | *s*  | fp32_t | The time offset relative to the previous trajectory point. | Same as field type | 
+------------------+--------------+------+--------+------------------------------------------------------------+--------------------+

.. _CustomManeuver:

Custom Maneuver
----------------

The Custom Maneuver message may be used as specification of a
very specific maneuver not covered by the IMC scope. The
settings of the maneuver are just its id, timeout and other
settings encoded as a tuple list.

- Abbreviation: CustomManeuver
- Identification Number: 465
- Payload Size: 6+  bytes
- Message Size: 28+  bytes

+------------------------------+--------------+-------------+-----------+--------------------------------------------------------------+--------------------+
| Name                         | Abbreviation | Unit        | Type      | Description                                                  | Range              | 
+==============================+==============+=============+===========+==============================================================+====================+
| Timeout                      | timeout      | *s*         | uint16_t  | The amount of time the maneuver is allowed to run. If the    | Same as field type | 
|                              |              |             |           | maneuver is not completed in the amount of time specified an |                    | 
|                              |              |             |           | error will be generated.                                     |                    | 
+------------------------------+--------------+-------------+-----------+--------------------------------------------------------------+--------------------+
| Maneuver Name                | name         | *-*         | plaintext | The maneuver name, used as key by an implementation to bind  | Same as field type | 
|                              |              |             |           | the maneuver to the corresponding controller.                |                    | 
+------------------------------+--------------+-------------+-----------+--------------------------------------------------------------+--------------------+
| Custom settings for maneuver | custom       | *TupleList* | plaintext | Custom settings for maneuver.                                | Same as field type | 
+------------------------------+--------------+-------------+-----------+--------------------------------------------------------------+--------------------+

.. _VehicleFormation:

Vehicle Formation
------------------

Coordinate maneuver using two or more cooperating systems.

- Abbreviation: VehicleFormation
- Identification Number: 466
- Payload Size: 40+  bytes
- Message Size: 62+  bytes

+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type                                 | Description                                              | Range                    | 
+==============================+==============+==========================+======================================+==========================================================+==========================+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t                               | WGS-84 Latitude for start point.                         | min=-1.5707963267948966, | 
|                              |              |                          |                                      |                                                          | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t                               | WGS-84 Longitude for start point.                        | min=-3.141592653589793,  | 
|                              |              |                          |                                      |                                                          | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t                               | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |                                      | whether z represents depth, altitude or other.           |                          | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t                              | Units of the z reference.                                | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |                                      |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t                               | Reference speed.                                         | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t                              | Reference speed units.                                   | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |                                      |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Trajectory Points            | points       | *-*                      | message-list                         | List of trajectory points.                               | Same as field type       | 
|                              |              |                          | (:ref:`TrajectoryPoint`)             |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Formation Participants       | participants | *-*                      | message-list                         | List of formation participants.                          | Same as field type       | 
|                              |              |                          | (:ref:`VehicleFormationParticipant`) |                                                          |                          | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Start Time                   | start_time   | *s*                      | fp64_t                               | Optional start time hint for vehicle formation.          | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext                            | Custom settings for maneuver.                            | Same as field type       | 
+------------------------------+--------------+--------------------------+--------------------------------------+----------------------------------------------------------+--------------------------+

.. _VehicleFormationParticipant:

Vehicle Formation Participant
------------------------------

Definition of a vehicle participant in a VehicleFormation maneuver.

- Abbreviation: VehicleFormationParticipant
- Identification Number: 467
- Payload Size: 14 bytes
- Message Size: 36 bytes

+------------------------------------+--------------+------+----------+----------------------------------------------------------+--------------------+
| Name                               | Abbreviation | Unit | Type     | Description                                              | Range              | 
+====================================+==============+======+==========+==========================================================+====================+
| ID (IMC address)                   | vid          | *-*  | uint16_t | IMC address of vehicle.                                  | Same as field type | 
+------------------------------------+--------------+------+----------+----------------------------------------------------------+--------------------+
| Formation offset -- Along-track    | off_x        | *m*  | fp32_t   | Distance that the system must respect along the xx axis. | Same as field type | 
+------------------------------------+--------------+------+----------+----------------------------------------------------------+--------------------+
| Formation offset -- Cross-track    | off_y        | *m*  | fp32_t   | Distance that the system must respect along the yy axis. | Same as field type | 
+------------------------------------+--------------+------+----------+----------------------------------------------------------+--------------------+
| Formation offset -- Depth/Altitude | off_z        | *m*  | fp32_t   | Distance that the system must respect along the zz axis. | Same as field type | 
+------------------------------------+--------------+------+----------+----------------------------------------------------------+--------------------+

.. _StopManeuver:

Stop Maneuver
--------------

Command used to stop currently executing maneuver.

- Abbreviation: StopManeuver
- Identification Number: 468
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _RegisterManeuver:

Register Maneuver
------------------

Command used to indicate maneuver can be executed in the
vehicle.

- Abbreviation: RegisterManeuver
- Identification Number: 469
- Payload Size: 2 bytes
- Message Size: 24 bytes

+-------------+--------------+------+----------+----------------------------------------+--------------------+
| Name        | Abbreviation | Unit | Type     | Description                            | Range              | 
+=============+==============+======+==========+========================================+====================+
| Maneuver ID | mid          | *-*  | uint16_t | IMC serialization ID of maneuver type. | Same as field type | 
+-------------+--------------+------+----------+----------------------------------------+--------------------+

.. _ManeuverControlState:

Maneuver Control State
-----------------------

Maneuver control state.

- Abbreviation: ManeuverControlState
- Identification Number: 470
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+-----------------+--------------+------------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit                                     | Type      | Description                                                   | Range              | 
+=================+==============+==========================================+===========+===============================================================+====================+
| State           | state        | *Enumerated*                             | uint8_t   | Code indicating maneuver state.                               | Same as field type | 
|                 |              | (:ref:`ManeuverControlState-enum-state`) |           |                                                               |                    | 
+-----------------+--------------+------------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Completion Time | eta          | *s*                                      | uint16_t  | Estimated time to completion of the maneuver, when executing. | Same as field type | 
|                 |              |                                          |           | The value will be 65535 if the time is unknown or undefined.  |                    | 
+-----------------+--------------+------------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Info            | info         | *-*                                      | plaintext | Complementary information, e.g., regarding errors.            | Same as field type | 
+-----------------+--------------+------------------------------------------+-----------+---------------------------------------------------------------+--------------------+

.. _ManeuverControlState-enum-state:

.. _ManeuverControlState-enum-prefix-MCS:

Enum State
^^^^^^^^^^^

Code indicating maneuver state.

- Abbreviation: state
- Prefix: MCS

+-------+----------------------+--------------+-----------------------+
| Value | Name                 | Abbreviation | Description           | 
+=======+======================+==============+=======================+
| 0     | Maneuver in progress | EXECUTING    | Maneuver in progress. | 
+-------+----------------------+--------------+-----------------------+
| 1     | Maneuver completed   | DONE         | Maneuver completed.   | 
+-------+----------------------+--------------+-----------------------+
| 2     | Maneuver error       | ERROR        | Maneuver error.       | 
+-------+----------------------+--------------+-----------------------+
| 3     | Maneuver stopped     | STOPPED      | Maneuver stopped.     | 
+-------+----------------------+--------------+-----------------------+

.. _FollowSystem:

Follow System
--------------

System-following maneuver.

- Abbreviation: FollowSystem
- Identification Number: 471
- Payload Size: 22 bytes
- Message Size: 44 bytes

+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Name             | Abbreviation | Unit                     | Type     | Description                                                 | Range              | 
+==================+==============+==========================+==========+=============================================================+====================+
| System To Follow | system       | *-*                      | uint16_t | IMC address of system to follow.                            | Same as field type | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Duration         | duration     | *s*                      | uint16_t | Duration of maneuver, 0 for unlimited duration.             | Same as field type | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Speed            | speed        | *-*                      | fp32_t   | Reference speed.                                            | Same as field type | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Speed Units      | speed_units  | *Enumerated*             | uint8_t  | Reference speed units.                                      | Same as field type | 
|                  |              | (:ref:`enum-SpeedUnits`) |          |                                                             |                    | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Offset -- X      | x            | *-*                      | fp32_t   | Along-track offset.                                         | Same as field type | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Offset -- Y      | y            | *-*                      | fp32_t   | Cross-track offset.                                         | Same as field type | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Coordinate -- Z  | z            | *-*                      | fp32_t   | Coordinate z during follow maneuver. Use z_units to specify | Same as field type | 
|                  |              |                          |          | whether z represents depth, altitude or other.              |                    | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+
| Z Units          | z_units      | *Enumerated*             | uint8_t  | Units of the z reference.                                   | Same as field type | 
|                  |              | (:ref:`enum-ZUnits`)     |          |                                                             |                    | 
+------------------+--------------+--------------------------+----------+-------------------------------------------------------------+--------------------+

.. _CommsRelay:

Communications Relay
---------------------

In this maneuver, a vehicle drives to the center of two other
systems (a, b) in order to be used as a communications relay.

- Abbreviation: CommsRelay
- Identification Number: 472
- Payload Size: 31 bytes
- Message Size: 53 bytes

+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| Name             | Abbreviation   | Unit                     | Type     | Description                                                 | Range                    | 
+==================+================+==========================+==========+=============================================================+==========================+
| Latitude WGS-84  | lat            | *rad*                    | fp64_t   | WGS-84 Latitude for start point.                            | min=-1.5707963267948966, | 
|                  |                |                          |          |                                                             | max=1.5707963267948966   | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| Longitude WGS-84 | lon            | *rad*                    | fp64_t   | WGS-84 Longitude for start point.                           | min=-3.141592653589793,  | 
|                  |                |                          |          |                                                             | max=3.141592653589793    | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| Speed            | speed          | *-*                      | fp32_t   | Reference speed.                                            | Same as field type       | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| Speed Units      | speed_units    | *Enumerated*             | uint8_t  | Reference speed units.                                      | Same as field type       | 
|                  |                | (:ref:`enum-SpeedUnits`) |          |                                                             |                          | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| Duration         | duration       | *s*                      | uint16_t | Duration of maneuver, 0 for unlimited duration.             | Same as field type       | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| System A         | sys_a          | *-*                      | uint16_t | The IMC id of the system A.                                 | Same as field type       | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| System B         | sys_b          | *-*                      | uint16_t | The IMC id of the system B.                                 | Same as field type       | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+
| Move threshold   | move_threshold | *m*                      | fp32_t   | Move only if the distance to the target is bigger than this | Same as field type       | 
|                  |                |                          |          | threshold.                                                  |                          | 
+------------------+----------------+--------------------------+----------+-------------------------------------------------------------+--------------------------+

.. _CoverArea:

Cover Area
-----------

Given a polygonal area, generates trajectories to cover the
area.

- Abbreviation: CoverArea
- Identification Number: 473
- Payload Size: 30+  bytes
- Message Size: 52+  bytes

+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Name             | Abbreviation | Unit                     | Type                   | Description                                              | Range                    | 
+==================+==============+==========================+========================+==========================================================+==========================+
| Latitude WGS-84  | lat          | *rad*                    | fp64_t                 | WGS-84 Latitude for start point.                         | min=-1.5707963267948966, | 
|                  |              |                          |                        |                                                          | max=1.5707963267948966   | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84 | lon          | *rad*                    | fp64_t                 | WGS-84 Longitude for start point.                        | min=-3.141592653589793,  | 
|                  |              |                          |                        |                                                          | max=3.141592653589793    | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Z Reference      | z            | *m*                      | fp32_t                 | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                  |              |                          |                        | whether z represents depth, altitude or other.           |                          | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Z Units          | z_units      | *Enumerated*             | uint8_t                | Units of the z reference.                                | Same as field type       | 
|                  |              | (:ref:`enum-ZUnits`)     |                        |                                                          |                          | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Speed            | speed        | *-*                      | fp32_t                 | Reference speed.                                         | Same as field type       | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Speed Units      | speed_units  | *Enumerated*             | uint8_t                | Reference speed units.                                   | Same as field type       | 
|                  |              | (:ref:`enum-SpeedUnits`) |                        |                                                          |                          | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| Polygon          | polygon      | *-*                      | message-list           | Message list of type PolygonVertex.                      | Same as field type       | 
|                  |              |                          | (:ref:`PolygonVertex`) |                                                          |                          | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+
| CustomParameters | custom       | *TupleList*              | plaintext              | Additional parameters to be used by the controller.      | Same as field type       | 
+------------------+--------------+--------------------------+------------------------+----------------------------------------------------------+--------------------------+

.. _PolygonVertex:

Polygon Vertex
---------------

This message is used to store the various polygon vertices for
CoverArea maneuvers.

- Abbreviation: PolygonVertex
- Identification Number: 474
- Payload Size: 16 bytes
- Message Size: 38 bytes

+------------------+--------------+-------+--------+-----------------------------------+--------------------------+
| Name             | Abbreviation | Unit  | Type   | Description                       | Range                    | 
+==================+==============+=======+========+===================================+==========================+
| Latitude WGS-84  | lat          | *rad* | fp64_t | WGS-84 Latitude for start point.  | min=-1.5707963267948966, | 
|                  |              |       |        |                                   | max=1.5707963267948966   | 
+------------------+--------------+-------+--------+-----------------------------------+--------------------------+
| Longitude WGS-84 | lon          | *rad* | fp64_t | WGS-84 Longitude for start point. | min=-3.141592653589793,  | 
|                  |              |       |        |                                   | max=3.141592653589793    | 
+------------------+--------------+-------+--------+-----------------------------------+--------------------------+

.. _CompassCalibration:

Compass Calibration Maneuver
-----------------------------

This maneuver is a mix between the Loiter maneuver and the YoYo maneuver.
The vehicle cirlcles around a specific waypoint with a variable Z
reference between a minimum and maximum value.

- Abbreviation: CompassCalibration
- Identification Number: 475
- Payload Size: 45+  bytes
- Message Size: 67+  bytes

+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                                       | Type      | Description                                                         | Range                    | 
+==============================+==============+============================================+===========+=====================================================================+==========================+
| Timeout                      | timeout      | *s*                                        | uint16_t  | The timeout indicates the time that an error should occur if        | Same as field type       | 
|                              |              |                                            |           | exceeded.                                                           |                          | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                                      | fp64_t    | WGS-84 Latitude coordinate.                                         | min=-1.5707963267948966, | 
|                              |              |                                            |           |                                                                     | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                                      | fp64_t    | WGS-84 Longitude coordinate.                                        | min=-3.141592653589793,  | 
|                              |              |                                            |           |                                                                     | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                                        | fp32_t    | Maneuver reference in the z axis. Use z_units to specify            | Same as field type       | 
|                              |              |                                            |           | whether z represents depth, altitude or other.                      |                          | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*                               | uint8_t   | Units of the z reference.                                           | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)                       |           |                                                                     |                          | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Pitch                        | pitch        | *rad*                                      | fp32_t    | Pitch angle used to perform the maneuver.                           | min=-1.5707963267948966, | 
|                              |              |                                            |           |                                                                     | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Amplitude                    | amplitude    | *m*                                        | fp32_t    | Yoyo motion amplitude.                                              | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Duration                     | duration     | *s*                                        | uint16_t  | The duration of this maneuver. Use '0' for unlimited duration time. | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                                        | fp32_t    | Maneuver speed.                                                     | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                               | uint8_t   | Speed units.                                                        | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)                   |           |                                                                     |                          | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Radius                       | radius       | *m*                                        | fp32_t    | Radius of the maneuver.                                             | min=1,                   | 
|                              |              |                                            |           |                                                                     | max=100000               | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Direction                    | direction    | *Enumerated*                               | uint8_t   | Direction of the maneuver.                                          | max=3                    | 
|                              |              | (:ref:`CompassCalibration-enum-direction`) |           |                                                                     |                          | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                                | plaintext | Custom settings for maneuver.                                       | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+-----------+---------------------------------------------------------------------+--------------------------+

.. _CompassCalibration-enum-direction:

.. _CompassCalibration-enum-prefix-LD:

Enum Direction
^^^^^^^^^^^^^^^

Direction of the maneuver.

- Abbreviation: direction
- Prefix: LD

+-------+-----------------------+--------------+-------------+
| Value | Name                  | Abbreviation | Description | 
+=======+=======================+==============+=============+
| 0     | Vehicle Dependent     | VDEP         | *-*         | 
+-------+-----------------------+--------------+-------------+
| 1     | Clockwise             | CLOCKW       | *-*         | 
+-------+-----------------------+--------------+-------------+
| 2     | Counter Clockwise     | CCLOCKW      | *-*         | 
+-------+-----------------------+--------------+-------------+
| 3     | Into the wind/current | IWINDCURR    | *-*         | 
+-------+-----------------------+--------------+-------------+

.. _FormationParameters:

Formation Parameters
---------------------

A "Formation" is defined by the relative positions of the vehicles
inside the formation, and the reference frame where this positions are defined.

The formation reference frame may be:
- Earth Fixed: Where the vehicles relative position do not depend on the followed path.
This results in all UAVs following the same path with an offset relative to each other;
- Path Fixed:  Where the vehicles relative position depends on the followed path,
changing the inter-vehicle offset direction with the path direction.
- Path Curved:  Where the vehicles relative position depends on the followed path,
changing the inter-vehicle offset direction with the path direction and direction
change rate.
An offset in the xx axis results in a distance over the curved path line.
An offset in the yy axis results in an offset of the vehicle path line relative to the
formation center path line.

- Abbreviation: FormationParameters
- Identification Number: 476
- Payload Size: 7+  bytes
- Message Size: 29+  bytes

+-------------------------------+-----------------+---------------------------------------------------+--------------------------------------+--------------------------------------------------+--------------------+
| Name                          | Abbreviation    | Unit                                              | Type                                 | Description                                      | Range              | 
+===============================+=================+===================================================+======================================+==================================================+====================+
| Formation Name                | formation_name  | *-*                                               | plaintext                            | Name of the formation configuration.             | Same as field type | 
+-------------------------------+-----------------+---------------------------------------------------+--------------------------------------+--------------------------------------------------+--------------------+
| Formation Reference Frame     | reference_frame | *Enumerated*                                      | uint8_t                              | Formation reference frame                        | Same as field type | 
|                               |                 | (:ref:`FormationParameters-enum-reference_frame`) |                                      |                                                  |                    | 
+-------------------------------+-----------------+---------------------------------------------------+--------------------------------------+--------------------------------------------------+--------------------+
| Formation Participants        | participants    | *-*                                               | message-list                         | List of formation participants.                  | Same as field type | 
|                               |                 |                                                   | (:ref:`VehicleFormationParticipant`) |                                                  |                    | 
+-------------------------------+-----------------+---------------------------------------------------+--------------------------------------+--------------------------------------------------+--------------------+
| Custom settings for formation | custom          | *TupleList*                                       | plaintext                            | Custom settings for the formation configuration. | Same as field type | 
+-------------------------------+-----------------+---------------------------------------------------+--------------------------------------+--------------------------------------------------+--------------------+

.. _FormationParameters-enum-reference_frame:

.. _FormationParameters-enum-prefix-OP:

Enum Formation Reference Frame
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Formation reference frame

- Abbreviation: reference_frame
- Prefix: OP

+-------+-------------+--------------+-------------+
| Value | Name        | Abbreviation | Description | 
+=======+=============+==============+=============+
| 0     | Earth Fixed | EARTH_FIXED  | *-*         | 
+-------+-------------+--------------+-------------+
| 1     | Path Fixed  | PATH_FIXED   | *-*         | 
+-------+-------------+--------------+-------------+
| 2     | Path Curved | PATH_CURVED  | *-*         | 
+-------+-------------+--------------+-------------+

.. _FormationPlanExecution:

Formation Plan Execution
-------------------------

A "Formation Plan" is a maneuver specifying a plan for a team of vehicles.
The maneuver defines:
- Vehicles included in the formation group
- Formation shape configuration
- Plan (set of maneuvers) to be followed by the formation center
- Speed at which that plan is followed
- Path contrains (virtual leader bank limit)
- Supervision settings

- Abbreviation: FormationPlanExecution
- Identification Number: 477
- Payload Size: 40+  bytes
- Message Size: 62+  bytes

+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Name                               | Abbreviation        | Unit        | Type      | Description                                                                                                  | Range              | 
+====================================+=====================+=============+===========+==============================================================================================================+====================+
| Target Group Name                  | group_name          | *-*         | plaintext | Target group for the formation plan.                                                                         | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Name                     | formation_name      | *-*         | plaintext | Name of the formation configuration.                                                                         | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Plan ID                  | plan_id             | *-*         | plaintext | The flight plan's identifier.                                                                                | Same as field type | 
|                                    |                     |             |           | Flight plan defined to be tracked by the formation leader.                                                   |                    | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Plan Description                   | description         | *-*         | plaintext | Verbose text description of plan.                                                                            | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Leader Flight Airspeed   | leader_speed        | *m/s*       | fp32_t    | Formation leader flight airspeed during the plan tracking.                                                   | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation leader flight bank limit | leader_bank_lim     | *m/s*       | fp32_t    | Formation leader flight bank limit during the plan tracking.                                                 | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Position mismatch limit            | pos_sim_err_lim     | *m*         | fp32_t    | Limit for the position mismatch between real and simulated position, before a maneuver abort is asserted.    | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Position mismatch threshold        | pos_sim_err_wrn     | *m*         | fp32_t    | Warning threshold for the position mismatch between real and simulated position.                             | Same as field type | 
|                                    |                     |             |           | Above this threshold a time-out limit is evaluated to assert a maneuver abort state.                         |                    | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Position mismatch time-out         | pos_sim_err_timeout | *s*         | uint16_t  | The amount of time the maneuver is allowed to run after the position mismatch threshold is surpassed.        | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence threshold              | converg_max         | *m*         | fp32_t    | Threshold for the convergence measure, above which a time-out limit                                          | Same as field type | 
|                                    |                     |             |           | is evaluated to assert a maneuver abort state.                                                               |                    | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence time-out               | converg_timeout     | *s*         | uint16_t  | The amount of time the maneuver is allowed to run after the convergence threshold is surpassed.              | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Communications time-out            | comms_timeout       | *s*         | uint16_t  | The amount of time the maneuver is allowed to run without any update on the other formation vehicles states. | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Turbulence limit                   | turb_lim            | *m/s*       | fp32_t    | Turbulence limit above which a maneuver abort is asserted.                                                   | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Custom settings for maneuver       | custom              | *TupleList* | plaintext | Custom settings for maneuver.                                                                                | Same as field type | 
+------------------------------------+---------------------+-------------+-----------+--------------------------------------------------------------------------------------------------------------+--------------------+

.. _FollowReference:

Follow Reference Maneuver
--------------------------

This maneuver follows a reference given by an external entity.

- Abbreviation: FollowReference
- Identification Number: 478
- Payload Size: 15 bytes
- Message Size: 37 bytes

+--------------------------+-------------------+------+----------+--------------------------------------------------------------------------------------------------------------------+--------------------+
| Name                     | Abbreviation      | Unit | Type     | Description                                                                                                        | Range              | 
+==========================+===================+======+==========+====================================================================================================================+====================+
| Controlling Source       | control_src       | *-*  | uint16_t | The IMC identifier of the source system that is allowed to provide references to this maneuver.                    | Same as field type | 
|                          |                   |      |          | If the value ''0xFFFF'' is used, any system is allowed to command references.                                      |                    | 
+--------------------------+-------------------+------+----------+--------------------------------------------------------------------------------------------------------------------+--------------------+
| Controlling Entity       | control_ent       | *-*  | uint8_t  | The entity identifier of the entity that is allowed to provide references to this maneuver.                        | Same as field type | 
|                          |                   |      |          | If the value ''0xFF'' is used, any entity is allowed to command references.                                        |                    | 
+--------------------------+-------------------+------+----------+--------------------------------------------------------------------------------------------------------------------+--------------------+
| Reference Update Timeout | timeout           | *-*  | fp32_t   | The ammount of time, in seconds, after which the maneuver will be terminated if no reference has                   | Same as field type | 
|                          |                   |      |          | been received. In other words, the controlling entity should send reference updates in shorter periods than        |                    | 
|                          |                   |      |          | 'timeout'.                                                                                                         |                    | 
+--------------------------+-------------------+------+----------+--------------------------------------------------------------------------------------------------------------------+--------------------+
| Loiter Radius            | loiter_radius     | *-*  | fp32_t   | Whenever an intended reference is achieved, this maneuver will maintain the vehicle in vaticiny of that            | Same as field type | 
|                          |                   |      |          | location. The loiter radius is used to define the radius of this (xy) area.                                        |                    | 
+--------------------------+-------------------+------+----------+--------------------------------------------------------------------------------------------------------------------+--------------------+
| Altitude Interval        | altitude_interval | *-*  | fp32_t   | Similarly to Loiter Radius, this field is used to define the "z" distance considered to be inside the vacitiny of  | Same as field type | 
|                          |                   |      |          | the target location. An AUV may, for instance, be floating until it more than z units above the current reference, |                    | 
|                          |                   |      |          | in which case it actively changes its position in order to achieve the desired depth / altitude.                   |                    | 
+--------------------------+-------------------+------+----------+--------------------------------------------------------------------------------------------------------------------+--------------------+

.. _Reference:

Reference To Follow
--------------------

No description

- Abbreviation: Reference
- Identification Number: 479
- Payload Size: 39 bytes
- Message Size: 61 bytes

+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+
| Name                | Abbreviation | Unit                              | Type                  | Description | Range              | 
+=====================+==============+===================================+=======================+=============+====================+
| Flags               | flags        | *Bitfield*                        | uint8_t               |             | Same as field type | 
|                     |              | (:ref:`Reference-bitfield-flags`) |                       |             |                    | 
+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+
| Speed Reference     | speed        | *-*                               | message               |             | Same as field type | 
|                     |              |                                   | (:ref:`DesiredSpeed`) |             |                    | 
+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+
| Z Reference         | z            | *-*                               | message               |             | Same as field type | 
|                     |              |                                   | (:ref:`DesiredZ`)     |             |                    | 
+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+
| Latitude Reference  | lat          | *-*                               | fp64_t                |             | Same as field type | 
+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+
| Longitude Reference | lon          | *-*                               | fp64_t                |             | Same as field type | 
+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+
| Radius              | radius       | *-*                               | fp32_t                |             | Same as field type | 
+---------------------+--------------+-----------------------------------+-----------------------+-------------+--------------------+

.. _Reference-bitfield-flags:

.. _Reference-bitfield-prefix-FLAG:

Bitfield Flags
^^^^^^^^^^^^^^^

No description

- Abbreviation: flags
- Prefix: FLAG

+-------+----------------------------------------------------------+--------------+-------------+
| Value | Name                                                     | Abbreviation | Description | 
+=======+==========================================================+==============+=============+
| 0x01  | Use Location Reference                                   | LOCATION     | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+
| 0x02  | Use Speed Reference                                      | SPEED        | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+
| 0x04  | Use Z Reference                                          | Z            | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+
| 0x08  | Use Radius Reference                                     | RADIUS       | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+
| 0x10  | Use this Reference as Start Position for PathControler   | START_POINT  | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+
| 0x20  | Use Current Position as Start Position for PathControler | DIRECT       | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+
| 0x80  | Flag Maneuver Completion                                 | MANDONE      | *-*         | 
+-------+----------------------------------------------------------+--------------+-------------+

.. _FollowRefState:

Follow Reference State
-----------------------

No description

- Abbreviation: FollowRefState
- Identification Number: 480
- Payload Size: 46 bytes
- Message Size: 68 bytes

+--------------------+--------------+--------------------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit                                       | Type               | Description                                                                     | Range              | 
+====================+==============+============================================+====================+=================================================================================+====================+
| Controlling Source | control_src  | *-*                                        | uint16_t           | The IMC identifier of the source system that is allowed to control the vehicle. | Same as field type | 
|                    |              |                                            |                    | If the value ''0xFFFF'' is used, any system is allowed to command references.   |                    | 
+--------------------+--------------+--------------------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Controlling Entity | control_ent  | *-*                                        | uint8_t            | The entity identifier of the entity that is allowed to control the vehicle.     | Same as field type | 
|                    |              |                                            |                    | If the value ''0xFF'' is used, any entity is allowed to command references.     |                    | 
+--------------------+--------------+--------------------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Reference          | reference    | *-*                                        | message            | Reference currently being followed.                                             | Same as field type | 
|                    |              |                                            | (:ref:`Reference`) |                                                                                 |                    | 
+--------------------+--------------+--------------------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| State              | state        | *Enumerated*                               | uint8_t            |                                                                                 | Same as field type | 
|                    |              | (:ref:`FollowRefState-enum-state`)         |                    |                                                                                 |                    | 
+--------------------+--------------+--------------------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Proximity          | proximity    | *Bitfield*                                 | uint8_t            |                                                                                 | Same as field type | 
|                    |              | (:ref:`FollowRefState-bitfield-proximity`) |                    |                                                                                 |                    | 
+--------------------+--------------+--------------------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+

.. _FollowRefState-enum-state:

.. _FollowRefState-enum-prefix-FR:

Enum State
^^^^^^^^^^^

No description

- Abbreviation: state
- Prefix: FR

+-------+---------------------------------------------------+--------------+-------------+
| Value | Name                                              | Abbreviation | Description | 
+=======+===================================================+==============+=============+
| 1     | Waiting for first reference                       | WAIT         | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 2     | Going towards received reference                  | GOTO         | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 3     | Loitering after arriving at the reference         | LOITER       | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 4     | Hovering after arriving at the reference          | HOVER        | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 5     | Moving in z after arriving at the target cylinder | ELEVATOR     | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 6     | Controlling system timed out                      | TIMEOUT      | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+

.. _FollowRefState-bitfield-proximity:

.. _FollowRefState-bitfield-prefix-PROX:

Bitfield Proximity
^^^^^^^^^^^^^^^^^^^

No description

- Abbreviation: proximity
- Prefix: PROX

+-------+-------------------------------------+----------------+-------------+
| Value | Name                                | Abbreviation   | Description | 
+=======+=====================================+================+=============+
| 0x01  | Far from the destination            | FAR            | *-*         | 
+-------+-------------------------------------+----------------+-------------+
| 0x02  | Near in the horizontal plane        | XY_NEAR        | *-*         | 
+-------+-------------------------------------+----------------+-------------+
| 0x04  | Near in the vertical plane          | Z_NEAR         | *-*         | 
+-------+-------------------------------------+----------------+-------------+
| 0x08  | Unreachable in the horizontal plane | XY_UNREACHABLE | *-*         | 
+-------+-------------------------------------+----------------+-------------+
| 0x10  | Unreachable in the vertical plane   | Z_UNREACHABLE  | *-*         | 
+-------+-------------------------------------+----------------+-------------+

.. _FormationMonitor:

Formation Monitoring Data
--------------------------

Monitoring variables for the formation state and performance.

- Abbreviation: FormationMonitor
- Identification Number: 481
- Payload Size: 74+  bytes
- Message Size: 96+  bytes

+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Name                               | Abbreviation | Unit | Type                   | Description                                                                       | Range              | 
+====================================+==============+======+========================+===================================================================================+====================+
| Commanded X Acceleration (North)   | ax_cmd       | *-*  | fp32_t                 | Commanded acceleration computed by the formation controller: northward direction. | Same as field type | 
|                                    |              |      |                        | On the vehicle directional reference frame.                                       |                    | 
|                                    |              |      |                        | Constrained by the vehicle operational limits.                                    |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Commanded Y Acceleration (East)    | ay_cmd       | *-*  | fp32_t                 | Commanded acceleration computed by the formation controller: eastward direction.  | Same as field type | 
|                                    |              |      |                        | On the vehicle directional reference frame.                                       |                    | 
|                                    |              |      |                        | Constrained by the vehicle operational limits.                                    |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Commanded Z Acceleration (Down)    | az_cmd       | *-*  | fp32_t                 | Commanded acceleration computed by the formation controller: downward direction.  | Same as field type | 
|                                    |              |      |                        | On the vehicle directional reference frame.                                       |                    | 
|                                    |              |      |                        | Constrained by the vehicle operational limits.                                    |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Desired X Acceleration (North)     | ax_des       | *-*  | fp32_t                 | Desired acceleration computed by the formation controller: northward direction.   | Same as field type | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Desired Y Acceleration (East)      | ay_des       | *-*  | fp32_t                 | Desired acceleration computed by the formation controller: eastward direction.    | Same as field type | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Desired Z Acceleration (Down)      | az_des       | *-*  | fp32_t                 | Desired acceleration computed by the formation controller: downward direction.    | Same as field type | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| X Virtual Error (North)            | virt_err_x   | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Overall formation combined virtual error: northward direction.                    |                    | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Y Virtual Error (East)             | virt_err_y   | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Overall formation combined virtual error: eastward direction.                     |                    | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Z Virtual Error (Down)             | virt_err_z   | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Overall formation combined virtual error: downward direction.                     |                    | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| X Sliding Surface Feedback (North) | surf_fdbk_x  | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Overall formation combined sliding surface feedback: northward direction.         |                    | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Y Sliding Surface Feedback (East)  | surf_fdbk_y  | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Overall formation combined sliding surface feedback: eastward direction.          |                    | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Z Sliding Surface Feedback (Down)  | surf_fdbk_z  | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Overall formation combined sliding surface feedback: downward direction.          |                    | 
|                                    |              |      |                        | On the fixed reference frame.                                                     |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| X Uncertainty Compensation (North) | surf_unkn_x  | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Dynamics uncertainty compensation: northward direction.                           |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Y Uncertainty Compensation (East)  | surf_unkn_y  | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Dynamics uncertainty compensation: eastward direction.                            |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Z Uncertainty Compensation (Down)  | surf_unkn_z  | *-*  | fp32_t                 | Components of the vehicle desired acceleration.                                   | Same as field type | 
|                                    |              |      |                        | Dynamics uncertainty compensation: downward direction.                            |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| X Convergence Deviation (North)    | ss_x         | *-*  | fp32_t                 | Combined deviation from convergence (sliding surface): North component.           | Same as field type | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Y Convergence Deviation (East)     | ss_y         | *-*  | fp32_t                 | Combined deviation from convergence (sliding surface): East component.            | Same as field type | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Z Convergence Deviation (Down)     | ss_z         | *-*  | fp32_t                 | Combined deviation from convergence (sliding surface): Down component.            | Same as field type | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+
| Relative State                     | rel_state    | *-*  | message-list           | List of RelativeState messages, encoding the inter-vehicle formation state.       | Same as field type | 
|                                    |              |      | (:ref:`RelativeState`) |                                                                                   |                    | 
+------------------------------------+--------------+------+------------------------+-----------------------------------------------------------------------------------+--------------------+

.. _RelativeState:

Relative State
---------------

Inter-vehicle formation state.

- Abbreviation: RelativeState
- Identification Number: 482
- Payload Size: 86+  bytes
- Message Size: 108+  bytes

+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Name                                       | Abbreviation | Unit | Type      | Description                                                                                     | Range              | 
+============================================+==============+======+===========+=================================================================================================+====================+
| System Identifier                          | s_id         | *-*  | plaintext | The identifier of the vehicle whose relative state is being reported.                           | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Distance                                   | dist         | *-*  | fp32_t    | Distance between vehicles.                                                                      | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Position Error                             | err          | *-*  | fp32_t    | Relative position error norm.                                                                   | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Control Importance                         | ctrl_imp     | *-*  | fp32_t    | Weight in the computation of the desired acceleration.                                          | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Relative Direction X (North)               | rel_dir_x    | *-*  | fp32_t    | Inter-vehicle direction vector: North component.                                                | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Relative Direction Y (East)                | rel_dir_y    | *-*  | fp32_t    | Inter-vehicle direction vector: East component.                                                 | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Relative Direction Z (Down)                | rel_dir_z    | *-*  | fp32_t    | Inter-vehicle direction vector: Down component.                                                 | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| X Position Error (North)                   | err_x        | *-*  | fp32_t    | Relative position error: North component.                                                       | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Y Position Error (East)                    | err_y        | *-*  | fp32_t    | Relative position error: East component.                                                        | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Z Position Error (Down)                    | err_z        | *-*  | fp32_t    | Relative position error: Down component.                                                        | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| X Position Error In Relative Frame (North) | rf_err_x     | *-*  | fp32_t    | Relative position error: X component on the inter-vehicle reference frame.                      | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Y Position Error In Relative Frame (East)  | rf_err_y     | *-*  | fp32_t    | Relative position error: Y component on the inter-vehicle reference frame.                      | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Z Position Error In Relative Frame (Down)  | rf_err_z     | *-*  | fp32_t    | Relative position error: Z component on the inter-vehicle reference frame.                      | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| X Velocity Error In Relative Frame (North) | rf_err_vx    | *-*  | fp32_t    | Relative veloctity error: X component in the inter-vehicle reference frame.                     | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Y Velocity Error In Relative Frame (East)  | rf_err_vy    | *-*  | fp32_t    | Relative velocity error: Y component on the inter-vehicle reference frame.                      | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Z Velocity Error In Relative Frame (Down)  | rf_err_vz    | *-*  | fp32_t    | Relative velocity error: Z component on the inter-vehicle reference frame.                      | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| X Convergence Deviation (North)            | ss_x         | *-*  | fp32_t    | Deviation from convergence (sliding surface): X component on the inter-vehicle reference frame. | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Y Convergence Deviation (East)             | ss_y         | *-*  | fp32_t    | Deviation from convergence (sliding surface): Y component on the inter-vehicle reference frame. | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Z Convergence Deviation (Down)             | ss_z         | *-*  | fp32_t    | Deviation from convergence (sliding surface): Z component on the inter-vehicle reference frame. | Same as field type | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| X Virtual Error (North)                    | virt_err_x   | *-*  | fp32_t    | Components of the vehicle desired acceleration.                                                 | Same as field type | 
|                                            |              |      |           | Relative virtual error: northward direction.                                                    |                    | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Y Virtual Error (East)                     | virt_err_y   | *-*  | fp32_t    | Components of the vehicle desired acceleration.                                                 | Same as field type | 
|                                            |              |      |           | Relative virtual error: eastward direction.                                                     |                    | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+
| Z Virtual Error (Down)                     | virt_err_z   | *-*  | fp32_t    | Components of the vehicle desired acceleration.                                                 | Same as field type | 
|                                            |              |      |           | Relative virtual error: downward direction.                                                     |                    | 
+--------------------------------------------+--------------+------+-----------+-------------------------------------------------------------------------------------------------+--------------------+

.. _Dislodge:

Dislodge Maneuver
------------------

A "Dislodge" is a maneuver ordering the vehicle to attempt a
series of thruster operations that will hopefully get it
unstuck from an entangled condition.

Parameters are RPMs for the motor when attempting dislodge and
and a flag specifying whether the thrust burst should be attempted
forward, backward or auto (letting the vehicle decide).

- Abbreviation: Dislodge
- Identification Number: 483
- Payload Size: 9+  bytes
- Message Size: 31+  bytes

+------------------------------+--------------+----------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Name                         | Abbreviation | Unit                             | Type      | Description                                               | Range              | 
+==============================+==============+==================================+===========+===========================================================+====================+
| Timeout                      | timeout      | *s*                              | uint16_t  | The amount of time the maneuver is allowed to run.        | Same as field type | 
+------------------------------+--------------+----------------------------------+-----------+-----------------------------------------------------------+--------------------+
| RPM                          | rpm          | *-*                              | fp32_t    | Maneuver RPM reference.                                   | Same as field type | 
+------------------------------+--------------+----------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Direction                    | direction    | *Enumerated*                     | uint8_t   | Direction to which the vehicle should attempt to unstuck. | Same as field type | 
|                              |              | (:ref:`Dislodge-enum-direction`) |           |                                                           |                    | 
+------------------------------+--------------+----------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Custom settings for maneuver | custom       | *TupleList*                      | plaintext | Custom settings for maneuver.                             | Same as field type | 
+------------------------------+--------------+----------------------------------+-----------+-----------------------------------------------------------+--------------------+

.. _Dislodge-enum-direction:

.. _Dislodge-enum-prefix-DIR:

Enum Direction
^^^^^^^^^^^^^^^

Direction to which the vehicle should attempt to unstuck.

- Abbreviation: direction
- Prefix: DIR

+-------+--------------------------+--------------+-------------+
| Value | Name                     | Abbreviation | Description | 
+=======+==========================+==============+=============+
| 0     | Let the vehicle decide   | AUTO         | *-*         | 
+-------+--------------------------+--------------+-------------+
| 1     | Attempt to move forward  | FORWARD      | *-*         | 
+-------+--------------------------+--------------+-------------+
| 2     | Attempt to move backward | BACKWARD     | *-*         | 
+-------+--------------------------+--------------+-------------+

.. _Formation:

Formation
----------

The "Formation" is a controller to execute a maneuver with a team of vehicles.
It defines the:
- Vehicles included in the formation group
- Vehicles relative positions inside the formation
- Reference frame where the relative positions are defined
- Formation shape configuration
- Plan (set of maneuvers) to be followed by the formation center
- Plan contrains (virtual leader speed and bank limits)
- Supervision settings

The formation reference frame may be:
- Earth Fixed: Where the vehicles relative position do not depend on the followed path.
This results in all UAVs following the same path with an offset relative to each other;
- Path Fixed:  Where the vehicles relative position depends on the followed path,
changing the inter-vehicle offset direction with the path direction.
- Path Curved:  Where the vehicles relative position depends on the followed path,
changing the inter-vehicle offset direction with the path direction and direction
change rate.
An offset in the xx axis results in a distance over the curved path line.
An offset in the yy axis results in an offset of the vehicle path line relative to the
formation center path line.

- Abbreviation: Formation
- Identification Number: 484
- Payload Size: 57+  bytes
- Message Size: 79+  bytes

+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Name                              | Abbreviation        | Unit                                    | Type                                 | Description                                                                                                  | Range              | 
+===================================+=====================+=========================================+======================================+==============================================================================================================+====================+
| Formation Name                    | formation_name      | *-*                                     | plaintext                            | Name of the formation configuration.                                                                         | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Type                              | type                | *Enumerated*                            | uint8_t                              | Indicates if the message is a request, or a reply to a previous request.                                     | Same as field type | 
|                                   |                     | (:ref:`Formation-enum-type`)            |                                      |                                                                                                              |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Operation                         | op                  | *Enumerated*                            | uint8_t                              | Operation to perform.                                                                                        | Same as field type | 
|                                   |                     | (:ref:`Formation-enum-op`)              |                                      |                                                                                                              |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Target Group Name                 | group_name          | *-*                                     | plaintext                            | Target group for the formation plan.                                                                         | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Plan ID                 | plan_id             | *-*                                     | plaintext                            | The flight plan's identifier.                                                                                | Same as field type | 
|                                   |                     |                                         |                                      | Flight plan defined to be tracked by the formation leader.                                                   |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Plan Description                  | description         | *-*                                     | plaintext                            | Verbose text description of plan.                                                                            | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Reference Frame         | reference_frame     | *Enumerated*                            | uint8_t                              | Formation reference frame                                                                                    | Same as field type | 
|                                   |                     | (:ref:`Formation-enum-reference_frame`) |                                      |                                                                                                              |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Participants            | participants        | *-*                                     | message-list                         | List of formation participants.                                                                              | Same as field type | 
|                                   |                     |                                         | (:ref:`VehicleFormationParticipant`) |                                                                                                              |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Leader Bank Limit       | leader_bank_lim     | *rad*                                   | fp32_t                               | Maximum absolute bank allowed for the formation leader.                                                      | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Leader Minimum Speed    | leader_speed_min    | *m/s*                                   | fp32_t                               | Minimum speed allowed for the formation leader flight.                                                       | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Leader Maximum Speed    | leader_speed_max    | *m/s*                                   | fp32_t                               | Maximum speed allowed for the formation leader flight.                                                       | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Leader Minimum Altitude | leader_alt_min      | *m*                                     | fp32_t                               | Minimum altitude allowed for the formation leader flight.                                                    | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Formation Leader Maximum Altitude | leader_alt_max      | *m*                                     | fp32_t                               | Maximum altitude allowed for the formation leader flight.                                                    | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Position mismatch limit           | pos_sim_err_lim     | *m*                                     | fp32_t                               | Limit for the position mismatch between real and simulated position, before a maneuver abort is asserted.    | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Position mismatch threshold       | pos_sim_err_wrn     | *m*                                     | fp32_t                               | Warning threshold for the position mismatch between real and simulated position.                             | Same as field type | 
|                                   |                     |                                         |                                      | Above this threshold a time-out limit is evaluated to assert a maneuver abort state.                         |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Position mismatch time-out        | pos_sim_err_timeout | *s*                                     | uint16_t                             | The amount of time the maneuver is allowed to run after the position mismatch threshold is surpassed.        | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence threshold             | converg_max         | *m*                                     | fp32_t                               | Threshold for the convergence measure, above which a time-out limit                                          | Same as field type | 
|                                   |                     |                                         |                                      | is evaluated to assert a maneuver abort state.                                                               |                    | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Convergence time-out              | converg_timeout     | *s*                                     | uint16_t                             | The amount of time the maneuver is allowed to run after the convergence threshold is surpassed.              | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Communications time-out           | comms_timeout       | *s*                                     | uint16_t                             | The amount of time the maneuver is allowed to run without any update on the other formation vehicles states. | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Turbulence limit                  | turb_lim            | *m/s*                                   | fp32_t                               | Turbulence limit above which a maneuver abort is asserted.                                                   | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+
| Custom settings for maneuver      | custom              | *TupleList*                             | plaintext                            | Custom settings for maneuver.                                                                                | Same as field type | 
+-----------------------------------+---------------------+-----------------------------------------+--------------------------------------+--------------------------------------------------------------------------------------------------------------+--------------------+

.. _Formation-enum-type:

.. _Formation-enum-prefix-FC:

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

.. _Formation-enum-op:

.. _Formation-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: OP

+-------+-----------+--------------+-------------------------------+
| Value | Name      | Abbreviation | Description                   | 
+=======+===========+==============+===============================+
| 0     | Start     | START        | Start the formation maneuver. | 
+-------+-----------+--------------+-------------------------------+
| 1     | Stop      | STOP         | Stop the formation maneuver.  | 
+-------+-----------+--------------+-------------------------------+
| 2     | Ready     | READY        | Stop the formation maneuver.  | 
+-------+-----------+--------------+-------------------------------+
| 3     | Executing | EXECUTING    | Stop the formation maneuver.  | 
+-------+-----------+--------------+-------------------------------+
| 4     | Failure   | FAILURE      | Stop the formation maneuver.  | 
+-------+-----------+--------------+-------------------------------+

.. _Formation-enum-reference_frame:

.. _Formation-enum-prefix-OP:

Enum Formation Reference Frame
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Formation reference frame

- Abbreviation: reference_frame
- Prefix: OP

+-------+-------------+--------------+-------------+
| Value | Name        | Abbreviation | Description | 
+=======+=============+==============+=============+
| 0     | Earth Fixed | EARTH_FIXED  | *-*         | 
+-------+-------------+--------------+-------------+
| 1     | Path Fixed  | PATH_FIXED   | *-*         | 
+-------+-------------+--------------+-------------+
| 2     | Path Curved | PATH_CURVED  | *-*         | 
+-------+-------------+--------------+-------------+

.. _Launch:

Launch Maneuver
----------------

A "Launch" is a maneuver specifying a movement of the vehicle to a
target waypoint after being launched from a ship or pier.
The waypoint is described by the WGS-84 waypoint coordinate and
target Z reference.

Mandatory parameters defined for a "Launch" are
timeout, speed and speed units.

- Abbreviation: Launch
- Identification Number: 485
- Payload Size: 30+  bytes
- Message Size: 52+  bytes

+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                            | Range                    | 
+==============================+==============+==========================+===========+========================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t  | The amount of time the maneuver is allowed to run.     | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                    | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                        | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.                   | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                        | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t    | Target reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |           | whether z represents depth, altitude or other.         |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                              | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | Maneuver speed reference.                              | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Speed units.                                           | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                          | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+

.. _Drop:

Drop Maneuver
--------------

A "Drop" is a maneuver specifying a movement of the vehicle to a
target waypoint. The waypoint is described by the WGS-84
waypoint coordinate and target Z reference.

Mandatory parameters defined for a "Goto" are
timeout, speed and speed units.

- Abbreviation: Drop
- Identification Number: 486
- Payload Size: 30+  bytes
- Message Size: 52+  bytes

+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                            | Range                    | 
+==============================+==============+==========================+===========+========================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t  | The amount of time the maneuver is allowed to run.     | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                    | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                        | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.                   | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                        | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t    | Target reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |           | whether z represents depth, altitude or other.         |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                              | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | Maneuver speed reference.                              | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Speed units.                                           | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                          | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+

.. _ScheduledGoto:

Scheduled Goto
---------------

This maneuver is used to command the vehicle to arrive at some destination at
a specified absolute time.

The vehicle's speed will vary according to environment conditions and/or maneuver start time.

- Abbreviation: ScheduledGoto
- Identification Number: 487
- Payload Size: 35 bytes
- Message Size: 57 bytes

+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation   | Unit                                | Type    | Description                                                                | Range                    | 
+==============================+================+=====================================+=========+============================================================================+==========================+
| Time of arrival              | arrival_time   | *s*                                 | fp64_t  | Unix timestamp, in seconds, for the arrival at the destination.            | Same as field type       | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Destination Latitude WGS-84  | lat            | *rad*                               | fp64_t  | WGS-84 Latitude of target waypoint.                                        | min=-1.5707963267948966, | 
|                              |                |                                     |         |                                                                            | max=1.5707963267948966   | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Destination Longitude WGS-84 | lon            | *rad*                               | fp64_t  | WGS-84 Longitude of target waypoint.                                       | min=-3.141592653589793,  | 
|                              |                |                                     |         |                                                                            | max=3.141592653589793    | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Destination Z Reference      | z              | *m*                                 | fp32_t  | Target reference in the z axis. Use z_units to specify                     | Same as field type       | 
|                              |                |                                     |         | whether z represents depth, altitude or other.                             |                          | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units        | *Enumerated*                        | uint8_t | Units of the destination z reference.                                      | Same as field type       | 
|                              |                | (:ref:`enum-ZUnits`)                |         |                                                                            |                          | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Travel Z Reference           | travel_z       | *m*                                 | fp32_t  | Z reference to use while travelling to the destination.                    | Same as field type       | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Travel Z Units               | travel_z_units | *Enumerated*                        | uint8_t | Z reference units to use while travelling to the destination.              | Same as field type       | 
|                              |                | (:ref:`enum-ZUnits`)                |         |                                                                            |                          | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+
| Delayed Behavior             | delayed        | *Enumerated*                        | uint8_t | What to do if the vehicle fails to arrive before or at the requested time. | Same as field type       | 
|                              |                | (:ref:`ScheduledGoto-enum-delayed`) |         |                                                                            |                          | 
+------------------------------+----------------+-------------------------------------+---------+----------------------------------------------------------------------------+--------------------------+

.. _ScheduledGoto-enum-delayed:

.. _ScheduledGoto-enum-prefix-DBEH:

Enum Delayed Behavior
^^^^^^^^^^^^^^^^^^^^^^

What to do if the vehicle fails to arrive before or at the requested time.

- Abbreviation: delayed
- Prefix: DBEH

+-------+--------+--------------+---------------------------------------------------------------------------------------------+
| Value | Name   | Abbreviation | Description                                                                                 | 
+=======+========+==============+=============================================================================================+
| 0     | Resume | RESUME       | If the vehicle fails to arrive at the specified time, it will keep going to the destination | 
|       |        |              | at top speed and only then consider this maneuver completed.                                | 
+-------+--------+--------------+---------------------------------------------------------------------------------------------+
| 1     | Skip   | SKIP         | If the vehicle fails to arrive at the specified time, it will stop the current maneuver and | 
|       |        |              | advance to the next one (independently of how far it is from destination).                  | 
+-------+--------+--------------+---------------------------------------------------------------------------------------------+
| 2     | Fail   | FAIL         | If the vehicle fails to arrive at the specified time, it will stop the execution of this    | 
|       |        |              | maneuver with a FAILED result (the entire plan will be stopped).                            | 
+-------+--------+--------------+---------------------------------------------------------------------------------------------+

.. _RowsCoverage:

Rows Coverage
--------------

Rows coverage (i.e: lawn mower type maneuver) but with adaptive cover

- Abbreviation: RowsCoverage
- Identification Number: 488
- Payload Size: 61+  bytes
- Message Size: 83+  bytes

+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                                 | Type      | Description                                                                    | Range                    | 
+==============================+==============+======================================+===========+================================================================================+==========================+
| Latitude WGS-84              | lat          | *rad*                                | fp64_t    | WGS-84 Latitude of target waypoint.                                            | min=-1.5707963267948966, | 
|                              |              |                                      |           |                                                                                | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                                | fp64_t    | WGS-84 Longitude of target waypoint.                                           | min=-3.141592653589793,  | 
|                              |              |                                      |           |                                                                                | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                                  | fp32_t    | Maneuver reference in the z axis. Use z_units to specify                       | Same as field type       | 
|                              |              |                                      |           | whether z represents depth, altitude or other.                                 |                          | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*                         | uint8_t   | Units of the z reference.                                                      | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)                 |           |                                                                                |                          | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                                  | fp32_t    | Maneuver speed reference.                                                      | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                         | uint8_t   | Speed units.                                                                   | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)             |           |                                                                                |                          | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Bearing                      | bearing      | *rad*                                | fp64_t    | Rows bearing angle.                                                            | min=0,                   | 
|                              |              |                                      |           |                                                                                | max=6.283185307179586    | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Cross Angle                  | cross_angle  | *rad*                                | fp64_t    | Rows cross angle reference.                                                    | min=-1.047197551197,     | 
|                              |              |                                      |           |                                                                                | max=1.047197551197       | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Width                        | width        | *m*                                  | fp32_t    | Width of the maneuver.                                                         | min=0                    | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Length                       | length       | *m*                                  | fp32_t    | Length of the maneuver.                                                        | min=0                    | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Curve Offset                 | coff         | *m*                                  | uint8_t   | Desired curve offset.                                                          | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Angular Aperture             | angAperture  | *rad*                                | fp32_t    | Angular aperture of the sensor (looking downwards).                            | min=-3.141592653589793,  | 
|                              |              |                                      |           |                                                                                | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Range                        | range        | *m*                                  | uint16_t  | Maximum range of the sensor (in meters downwards from the vehicle's position). | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Overlap                      | overlap      | *%*                                  | uint8_t   | Amount of overlap among different transect surveys.                            | max=100                  | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Flags                        | flags        | *Bitfield*                           | uint8_t   | Maneuver optional flags.                                                       | Same as field type       | 
|                              |              | (:ref:`RowsCoverage-bitfield-flags`) |           |                                                                                |                          | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                          | plaintext | Custom settings for maneuver.                                                  | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+--------------------------------------------------------------------------------+--------------------------+

.. _RowsCoverage-bitfield-flags:

.. _RowsCoverage-bitfield-prefix-FLG:

Bitfield Flags
^^^^^^^^^^^^^^^

Maneuver optional flags.

- Abbreviation: flags
- Prefix: FLG

+-------+-------------------+--------------+------------------------------------------------------------------------------------------------------+
| Value | Name              | Abbreviation | Description                                                                                          | 
+=======+===================+==============+======================================================================================================+
| 0x01  | Square Curve      | SQUARE_CURVE | Whether to move between transects using an additional perpendicular transect.                        | 
+-------+-------------------+--------------+------------------------------------------------------------------------------------------------------+
| 0x02  | First Curve Right | CURVE_RIGHT  | Shall the vehicle turn towards the right after the first transect (alternatively it will turn left). | 
+-------+-------------------+--------------+------------------------------------------------------------------------------------------------------+

.. _Sample:

Sample Maneuver
----------------

A "Sample" is a maneuver specifying a movement of the vehicle to a
target waypoint. The waypoint is described by the WGS-84
waypoint coordinate and target Z reference.

Mandatory parameters defined for a "Goto" are
timeout, speed and speed units.

- Abbreviation: Sample
- Identification Number: 489
- Payload Size: 33+  bytes
- Message Size: 55+  bytes

+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                            | Range                    | 
+==============================+==============+==========================+===========+========================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t  | The amount of time the maneuver is allowed to run.     | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                    | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                        | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.                   | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                        | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                      | fp32_t    | Target reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                          |           | whether z represents depth, altitude or other.         |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                              | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | Maneuver speed reference.                              | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Speed units.                                           | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Syringe0                     | syringe0     | *Enumerated*             | uint8_t   | True when sampling with servo 0.                       | Same as field type       | 
|                              |              | (:ref:`enum-Boolean`)    |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Syringe1                     | syringe1     | *Enumerated*             | uint8_t   | True when sampling with servo 1.                       | Same as field type       | 
|                              |              | (:ref:`enum-Boolean`)    |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Syringe2                     | syringe2     | *Enumerated*             | uint8_t   | True when sampling with servo 2.                       | Same as field type       | 
|                              |              | (:ref:`enum-Boolean`)    |           |                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                          | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+--------------------------------------------------------+--------------------------+

.. _ImageTracking:

Image Tracking
---------------

A "ImageTracking" is a maneuver specifying a particular heading to the
detected object.

- Abbreviation: ImageTracking
- Identification Number: 490
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _Takeoff:

Takeoff Maneuver
-----------------

Automatic takeoff for UAVs.
This maneuver specifies a target waypoint where to takeoff.

Takeoff direction is set from the direction the plane is pointing when the auto takeoff command is started.
It will remain that way until the vehicle reaches the target z reference. After that it will go to the target waypoint.

- Abbreviation: Takeoff
- Identification Number: 491
- Payload Size: 32+  bytes
- Message Size: 54+  bytes

+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Name                         | Abbreviation  | Unit                     | Type      | Description                                          | Range                    | 
+==============================+===============+==========================+===========+======================================================+==========================+
| Latitude WGS-84              | lat           | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                  | min=-1.5707963267948966, | 
|                              |               |                          |           |                                                      | max=1.5707963267948966   | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon           | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.                 | min=-3.141592653589793,  | 
|                              |               |                          |           |                                                      | max=3.141592653589793    | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Z Reference                  | z             | *m*                      | fp32_t    | Target altitude or height for the automatic takeoff. | Same as field type       | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Z Units                      | z_units       | *Enumerated*             | uint8_t   | Units of the z reference.                            | Same as field type       | 
|                              |               | (:ref:`enum-ZUnits`)     |           |                                                      |                          | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Speed                        | speed         | *-*                      | fp32_t    | Maneuver speed reference.                            | Same as field type       | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units   | *Enumerated*             | uint8_t   | Speed units.                                         | Same as field type       | 
|                              |               | (:ref:`enum-SpeedUnits`) |           |                                                      |                          | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Pitch Angle                  | takeoff_pitch | *rad*                    | fp32_t    | Minimum pitch angle during automatic takeoff.        | min=0,                   | 
|                              |               |                          |           |                                                      | max=1.57079632679490     | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom        | *TupleList*              | plaintext | Custom settings for maneuver.                        | Same as field type       | 
+------------------------------+---------------+--------------------------+-----------+------------------------------------------------------+--------------------------+

.. _Land:

Land Maneuver
--------------

Automatic landing on the ground, for UAVs.
This maneuver specifies the target touchdown location and sets the final approach based on the maneuver bearing and glide slope parameters.

- Abbreviation: Land
- Identification Number: 492
- Payload Size: 45+  bytes
- Message Size: 67+  bytes

+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation    | Unit                     | Type      | Description                                                                                                                                      | Range                    | 
+==============================+=================+==========================+===========+==================================================================================================================================================+==========================+
| Latitude WGS-84              | lat             | *rad*                    | fp64_t    | WGS-84 Latitude of touchdown waypoint.                                                                                                           | min=-1.5707963267948966, | 
|                              |                 |                          |           |                                                                                                                                                  | max=1.5707963267948966   | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon             | *rad*                    | fp64_t    | WGS-84 Longitude of touchdown waypoint.                                                                                                          | min=-3.141592653589793,  | 
|                              |                 |                          |           |                                                                                                                                                  | max=3.141592653589793    | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Z Reference                  | z               | *m*                      | fp32_t    | Target altitude or height for the automatic landing.                                                                                             | Same as field type       | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units         | *Enumerated*             | uint8_t   | Units of the z reference and abort z reference.                                                                                                  | Same as field type       | 
|                              |                 | (:ref:`enum-ZUnits`)     |           |                                                                                                                                                  |                          | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Speed                        | speed           | *-*                      | fp32_t    | Maneuver speed reference.                                                                                                                        | Same as field type       | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units     | *Enumerated*             | uint8_t   | Speed units.                                                                                                                                     | Same as field type       | 
|                              |                 | (:ref:`enum-SpeedUnits`) |           |                                                                                                                                                  |                          | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Abort Z Reference            | abort_z         | *m*                      | fp32_t    | Abort altitude or height. If landing is aborted while executing, the UAV will maintain its course and attempt to climb to the abort z reference. | Same as field type       | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Bearing                      | bearing         | *rad*                    | fp64_t    | Land bearing angle.                                                                                                                              | min=0,                   | 
|                              |                 |                          |           |                                                                                                                                                  | max=6.283185307179586    | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Glide Slope                  | glide_slope     | *%*                      | uint8_t   | Ratio of the distance from the last waypoint to the landing point (touchdown) and the height difference between them.                            | max=10                   | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Glide Slope Altitude         | glide_slope_alt | *m*                      | fp32_t    | Height difference between the last waypoint to the landing point (touchdown).                                                                    | Same as field type       | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom          | *TupleList*              | plaintext | Custom settings for maneuver.                                                                                                                    | Same as field type       | 
+------------------------------+-----------------+--------------------------+-----------+--------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------+

.. _AutonomousSection:

Autonomous Section
-------------------

This maneuver triggers an external controller that will guide the vehicle during a specified duration
of time or until it relinquishes control using (ManeuverDone). The external controller is allowed to
drive the vehicle only inside the specified boundaries.

- Abbreviation: AutonomousSection
- Identification Number: 493
- Payload Size: 52+  bytes
- Message Size: 74+  bytes

+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                                       | Type                   | Description                                                                                               | Range                    | 
+==============================+==============+============================================+========================+===========================================================================================================+==========================+
| Latitude WGS-84              | lat          | *rad*                                      | fp64_t                 | WGS-84 Latitude of the initial location.                                                                  | min=-1.5707963267948966, | 
|                              |              |                                            |                        |                                                                                                           | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                                      | fp64_t                 | WGS-84 Longitude of the initial location.                                                                 | min=-3.141592653589793,  | 
|                              |              |                                            |                        |                                                                                                           | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                                        | fp32_t                 | Maneuver speed reference.                                                                                 | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                               | uint8_t                | Speed units.                                                                                              | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)                   |                        |                                                                                                           |                          | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Enforced Limits              | limits       | *Bitfield*                                 | uint8_t                |                                                                                                           | Same as field type       | 
|                              |              | (:ref:`AutonomousSection-bitfield-limits`) |                        |                                                                                                           |                          | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Maximum depth                | max_depth    | *m*                                        | fp64_t                 | Maximum depth the autonomous controller is allowed to drive to.                                           | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Minimum altitude             | min_alt      | *m*                                        | fp64_t                 | Minimum altitude the autonomous controller is allowed to drive to.                                        | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Time Limit                   | time_limit   | *s*                                        | fp64_t                 | The time after which this maneuver should be stopped (if still active and TIMEOUT is enforced).           | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Area Limits                  | area_limits  | *-*                                        | message-list           | The boundaries of the admissable area for this autonomous section.                                        | Same as field type       | 
|                              |              |                                            | (:ref:`PolygonVertex`) |                                                                                                           |                          | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Controller                   | controller   | *-*                                        | plaintext              | The name of the controlling agent that will be allowed to guide the vehicle during the AutononousSection. | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                                | plaintext              | Custom settings for maneuver.                                                                             | Same as field type       | 
+------------------------------+--------------+--------------------------------------------+------------------------+-----------------------------------------------------------------------------------------------------------+--------------------------+

.. _AutonomousSection-bitfield-limits:

.. _AutonomousSection-bitfield-prefix-ENFORCE:

Bitfield Enforced Limits
^^^^^^^^^^^^^^^^^^^^^^^^^

No description

- Abbreviation: limits
- Prefix: ENFORCE

+-------+------------------------+--------------+-------------+
| Value | Name                   | Abbreviation | Description | 
+=======+========================+==============+=============+
| 0x01  | Maximum Depth Limit    | DEPTH        | *-*         | 
+-------+------------------------+--------------+-------------+
| 0x02  | Minimum Altitude Limit | ALTITUDE     | *-*         | 
+-------+------------------------+--------------+-------------+
| 0x04  | Time Limit             | TIMEOUT      | *-*         | 
+-------+------------------------+--------------+-------------+
| 0x08  | Polygonal Area Limits  | AREA2D       | *-*         | 
+-------+------------------------+--------------+-------------+

.. _FollowPoint:

Follow Point Maneuver
----------------------

This maneuver behaves by following a point.

- Abbreviation: FollowPoint
- Identification Number: 494
- Payload Size: 30+  bytes
- Message Size: 52+  bytes

+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                                                            | Range                    | 
+==============================+==============+==========================+===========+========================================================================================+==========================+
| Source To Follow             | target       | *-*                      | plaintext | The identifier of the point source to follow (via RemoteSensorInfo or EstimatedState). | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Maximum Speed                | max_speed    | *m/s*                    | fp32_t    | Use this speed when travelling from afar.                                              | min=0                    | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Indicates the units used for the maximum speed value.                                  | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of maneuver in the map. Ignored during execution.                      | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                                                        | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of maneuver in the map. Ignored during execution.                     | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                                                        | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Z                            | z            | *m*                      | fp32_t    | Use z_units to specify whether z represents depth, altitude or other.                  | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*             | uint8_t   | Units of the z reference.                                                              | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)     |           |                                                                                        |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                                                          | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------------------------------------------+--------------------------+

.. _Alignment:

Alignment Maneuver
-------------------

An "Alignment" is a maneuver specifying a movement of the vehicle to a
target waypoint intended to control activation of an IMU/INS in order
to start aligning navigation for more precise dead reckoning operation.

- Abbreviation: Alignment
- Identification Number: 495
- Payload Size: 25+  bytes
- Message Size: 47+  bytes

+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                     | Type      | Description                                        | Range                    | 
+==============================+==============+==========================+===========+====================================================+==========================+
| Timeout                      | timeout      | *s*                      | uint16_t  | The amount of time the maneuver is allowed to run. | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                    | fp64_t    | WGS-84 Latitude of target waypoint.                | min=-1.5707963267948966, | 
|                              |              |                          |           |                                                    | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                    | fp64_t    | WGS-84 Longitude of target waypoint.               | min=-3.141592653589793,  | 
|                              |              |                          |           |                                                    | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                      | fp32_t    | Maneuver speed reference.                          | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*             | uint8_t   | Speed units.                                       | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`) |           |                                                    |                          | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*              | plaintext | Custom settings for maneuver.                      | Same as field type       | 
+------------------------------+--------------+--------------------------+-----------+----------------------------------------------------+--------------------------+

.. _StationKeepingExtended:

Station Keeping Extended
-------------------------

The Station Keeping Extended maneuver makes the vehicle come to the surface
and then enter a given circular perimeter around a waypoint coordinate
for a certain amount of time. It extends the Station Keeping maneuver with the feature
'Keep Safe', which allows for the vehicle to hold position underwater and popup periodically
to communicate.

- Abbreviation: StationKeepingExtended
- Identification Number: 496
- Payload Size: 39+  bytes
- Message Size: 61+  bytes

+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Name                         | Abbreviation   | Unit                                           | Type      | Description                                                           | Range                    | 
+==============================+================+================================================+===========+=======================================================================+==========================+
| Latitude WGS-84              | lat            | *rad*                                          | fp64_t    | WGS-84 Latitude.                                                      | min=-1.5707963267948966, | 
|                              |                |                                                |           |                                                                       | max=1.5707963267948966   | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon            | *rad*                                          | fp64_t    | WGS-84 Longitude.                                                     | min=-3.141592653589793,  | 
|                              |                |                                                |           |                                                                       | max=3.141592653589793    | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Z Reference                  | z              | *m*                                            | fp32_t    | Maneuver reference in the z axis. Use z_units to specify              | Same as field type       | 
|                              |                |                                                |           | whether z represents depth, altitude or other.                        |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Z Units                      | z_units        | *Enumerated*                                   | uint8_t   | Units of the z reference.                                             | Same as field type       | 
|                              |                | (:ref:`enum-ZUnits`)                           |           |                                                                       |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Radius                       | radius         | *m*                                            | fp32_t    | Radius.                                                               | Same as field type       | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Duration                     | duration       | *s*                                            | uint16_t  | Duration (0 for unlimited).                                           | Same as field type       | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Speed                        | speed          | *-*                                            | fp32_t    | The value of the desired speed, in the scale specified                | Same as field type       | 
|                              |                |                                                |           | by the "Speed Units" field.                                           |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units    | *Enumerated*                                   | uint8_t   | Indicates the units used for the speed value.                         | Same as field type       | 
|                              |                | (:ref:`enum-SpeedUnits`)                       |           |                                                                       |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| PopUp Period                 | popup_period   | *s*                                            | uint16_t  | The period at which the vehicle will popup to report its position.    | Same as field type       | 
|                              |                |                                                |           | Only used if flag KEEP_SAFE is on.                                    |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| PopUp Duration               | popup_duration | *s*                                            | uint16_t  | The duration of the station keeping at surface level when it pops up. | Same as field type       | 
|                              |                |                                                |           | Only used if flag KEEP_SAFE is on.                                    |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Flags                        | flags          | *Bitfield*                                     | uint8_t   | Flags of the maneuver.                                                | Same as field type       | 
|                              |                | (:ref:`StationKeepingExtended-bitfield-flags`) |           |                                                                       |                          | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom         | *TupleList*                                    | plaintext | Custom settings for maneuver.                                         | Same as field type       | 
+------------------------------+----------------+------------------------------------------------+-----------+-----------------------------------------------------------------------+--------------------------+

.. _StationKeepingExtended-bitfield-flags:

.. _StationKeepingExtended-bitfield-prefix-FLG:

Bitfield Flags
^^^^^^^^^^^^^^^

Flags of the maneuver.

- Abbreviation: flags
- Prefix: FLG

+-------+---------------------+--------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Value | Name                | Abbreviation | Description                                                                                                                                                        | 
+=======+=====================+==============+====================================================================================================================================================================+
| 0x01  | Keep safe behaviour | KEEP_SAFE    | If this flag is set, the vehicle will hold position underwater, loitering at z reference.                                                                          | 
|       |                     |              | It will popup periodically to report position. When it pops up, it will stay at surface in "normal" station keeping behaviour for a certain time (popup_duration). | 
+-------+---------------------+--------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. _Magnetometer:

Magnetometer Maneuver
----------------------

Magnetometer calibration maneuver (i.e: one square pattern
in one direction, a second square in the opposite direction)

- Abbreviation: Magnetometer
- Identification Number: 499
- Payload Size: 43+  bytes
- Message Size: 65+  bytes

+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Name                         | Abbreviation | Unit                                 | Type      | Description                                              | Range                    | 
+==============================+==============+======================================+===========+==========================================================+==========================+
| Timeout                      | timeout      | *s*                                  | uint16_t  | The amount of time the maneuver is allowed to run.       | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Latitude WGS-84              | lat          | *rad*                                | fp64_t    | WGS-84 Latitude of target waypoint.                      | min=-1.5707963267948966, | 
|                              |              |                                      |           |                                                          | max=1.5707963267948966   | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Longitude WGS-84             | lon          | *rad*                                | fp64_t    | WGS-84 Longitude of target waypoint.                     | min=-3.141592653589793,  | 
|                              |              |                                      |           |                                                          | max=3.141592653589793    | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Z Reference                  | z            | *m*                                  | fp32_t    | Maneuver reference in the z axis. Use z_units to specify | Same as field type       | 
|                              |              |                                      |           | whether z represents depth, altitude or other.           |                          | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Z Units                      | z_units      | *Enumerated*                         | uint8_t   | Units of the z reference.                                | Same as field type       | 
|                              |              | (:ref:`enum-ZUnits`)                 |           |                                                          |                          | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Speed                        | speed        | *-*                                  | fp32_t    | Maneuver speed reference.                                | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Speed Units                  | speed_units  | *Enumerated*                         | uint8_t   | Speed units.                                             | Same as field type       | 
|                              |              | (:ref:`enum-SpeedUnits`)             |           |                                                          |                          | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Bearing                      | bearing      | *rad*                                | fp64_t    | Rows bearing angle.                                      | min=0,                   | 
|                              |              |                                      |           |                                                          | max=6.283185307179586    | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Width                        | width        | *m*                                  | fp32_t    | Width of the maneuver.                                   | min=50                   | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Direction                    | direction    | *Enumerated*                         | uint8_t   | Desired direction.                                       | max=1                    | 
|                              |              | (:ref:`Magnetometer-enum-direction`) |           |                                                          |                          | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+
| Custom settings for maneuver | custom       | *TupleList*                          | plaintext | Custom settings for maneuver.                            | Same as field type       | 
+------------------------------+--------------+--------------------------------------+-----------+----------------------------------------------------------+--------------------------+

.. _Magnetometer-enum-direction:

.. _Magnetometer-enum-prefix-MD:

Enum Direction
^^^^^^^^^^^^^^^

Desired direction.

- Abbreviation: direction
- Prefix: MD

+-------+-------------------------+---------------+-------------+
| Value | Name                    | Abbreviation  | Description | 
+=======+=========================+===============+=============+
| 0     | Clockwise First         | CLOCKW_FIRST  | *-*         | 
+-------+-------------------------+---------------+-------------+
| 1     | Counter Clockwise First | CCLOCKW_FIRST | *-*         | 
+-------+-------------------------+---------------+-------------+

