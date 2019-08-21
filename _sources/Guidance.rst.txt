Guidance Messages
==================

.. _DesiredHeading:

Desired Heading
----------------

Desired Heading angle reference value for the control layer.

- Abbreviation: DesiredHeading
- Identification Number: 400
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+-------+--------+----------------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                                              | Range              | 
+=======+==============+=======+========+==========================================================+====================+
| Value | value        | *rad* | fp64_t | The value of the desired heading angle, relative to true | Same as field type | 
|       |              |       |        | north, in radians.                                       |                    | 
+-------+--------------+-------+--------+----------------------------------------------------------+--------------------+

.. _DesiredZ:

Desired Z
----------

Desired Z reference value for the control layer.

- Abbreviation: DesiredZ
- Identification Number: 401
- Payload Size: 5 bytes
- Message Size: 27 bytes

+---------+--------------+----------------------+---------+-------------------------------------------------+--------------------+
| Name    | Abbreviation | Unit                 | Type    | Description                                     | Range              | 
+=========+==============+======================+=========+=================================================+====================+
| Value   | value        | *m*                  | fp32_t  | The value of the desired z reference in meters. | Same as field type | 
+---------+--------------+----------------------+---------+-------------------------------------------------+--------------------+
| Z Units | z_units      | *Enumerated*         | uint8_t | Units of the z reference.                       | Same as field type | 
|         |              | (:ref:`enum-ZUnits`) |         |                                                 |                    | 
+---------+--------------+----------------------+---------+-------------------------------------------------+--------------------+

.. _DesiredSpeed:

Desired Speed
--------------

Desired Speed reference value for the control layer.

- Abbreviation: DesiredSpeed
- Identification Number: 402
- Payload Size: 9 bytes
- Message Size: 31 bytes

+-------------+--------------+--------------------------+---------+---------------------------------------------------------------+--------------------+
| Name        | Abbreviation | Unit                     | Type    | Description                                                   | Range              | 
+=============+==============+==========================+=========+===============================================================+====================+
| Value       | value        | *-*                      | fp64_t  | The value of the desired speed, in the scale specified by the | Same as field type | 
|             |              |                          |         | "Speed Units" field.                                          |                    | 
+-------------+--------------+--------------------------+---------+---------------------------------------------------------------+--------------------+
| Speed Units | speed_units  | *Enumerated*             | uint8_t | Indicates the units used for the speed value.                 | Same as field type | 
|             |              | (:ref:`enum-SpeedUnits`) |         |                                                               |                    | 
+-------------+--------------+--------------------------+---------+---------------------------------------------------------------+--------------------+

.. _DesiredRoll:

Desired Roll
-------------

Desired Roll angle reference value for the control layer.

- Abbreviation: DesiredRoll
- Identification Number: 403
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+-------+--------+--------------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                          | Range              | 
+=======+==============+=======+========+======================================+====================+
| Value | value        | *rad* | fp64_t | The value of the desired roll angle. | Same as field type | 
+-------+--------------+-------+--------+--------------------------------------+--------------------+

.. _DesiredPitch:

Desired Pitch
--------------

Desired Pitch angle reference value for the control layer.

- Abbreviation: DesiredPitch
- Identification Number: 404
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+-------+--------+---------------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                           | Range              | 
+=======+==============+=======+========+=======================================+====================+
| Value | value        | *rad* | fp64_t | The value of the desired pitch angle. | Same as field type | 
+-------+--------------+-------+--------+---------------------------------------+--------------------+

.. _DesiredVerticalRate:

Desired Vertical Rate
----------------------

Desired Vertical Rate speed reference value for the control layer.

- Abbreviation: DesiredVerticalRate
- Identification Number: 405
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+-------+--------+------------------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                                                | Range              | 
+=======+==============+=======+========+============================================================+====================+
| Value | value        | *m/s* | fp64_t | The value of the desired vertical rate speed in meters per | Same as field type | 
|       |              |       |        | second.                                                    |                    | 
+-------+--------------+-------+--------+------------------------------------------------------------+--------------------+

.. _DesiredPath:

Desired Path
-------------

Perform path control.

The path is specified by two WGS-84 waypoints, respective
altitude / depth settings, optional loitering at the end point,
and some control flags.

The start and end waypoints are defined by the specified end point fields
('end_{lat/lon/z}') plus:

1. the start waypoint fields ('start_{lat|lon|z}') if the
'START' flag (bit in 'flags' field) is set; or
2. the end point of the previous path recently tracked; or
3. the current location is the 'DIRECT' flag is set or if
the tracker has been idle for some time.

Altitude and depth control can be performed as follows:

1. by default, the tracker will just transmit an altitude/depth
reference value equal to 'end_z' to the appropriate controller;
2. if the 'NO_Z' flag is set no altitude/depth control will take
place, hence they can be controlled independently;
3. if the '3DTRACK' flag is set, 3D-tracking will be done
(if supported by the active controller).

Loitering can be specified at the end point with a certain
radius ('lradius'), duration ('lduration'), and clockwise or
counter-clockwise direction ('CCLOCKW' flag).

- Abbreviation: DesiredPath
- Identification Number: 406
- Payload Size: 56 bytes
- Message Size: 78 bytes

+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Name                            | Abbreviation  | Unit                                | Type     | Description                                                                              | Range                    | 
+=================================+===============+=====================================+==========+==========================================================================================+==========================+
| Path Reference                  | path_ref      | *-*                                 | uint32_t | Unsigned integer reference for the scope of the desired path message.                    | Same as field type       | 
|                                 |               |                                     |          | Path reference should only be set by a maneuver.                                         |                          | 
|                                 |               |                                     |          | Should be set to an always increasing reference at the time of dispatching this message. |                          | 
|                                 |               |                                     |          | Lower level path controllers must inherit the same path reference sent by maneuver.      |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Start Point -- Latitude WGS-84  | start_lat     | *rad*                               | fp64_t   | WGS-84 latitude of start point. This will be ignored unless                              | min=-1.5707963267948966, | 
|                                 |               |                                     |          | the 'START' flag is set.                                                                 | max=1.5707963267948966   | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Start Point -- WGS-84 Longitude | start_lon     | *rad*                               | fp64_t   | WGS-84 longitude of start point. This will be ignored unless                             | min=-3.141592653589793,  | 
|                                 |               |                                     |          | the 'START' flag is set.                                                                 | max=3.141592653589793    | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Start Point -- Z Reference      | start_z       | *m*                                 | fp32_t   | Altitude or depth of start point. This parameter will be                                 | Same as field type       | 
|                                 |               |                                     |          | ignored if the 'NO_Z' flag is set, or if the 'START' flag is                             |                          | 
|                                 |               |                                     |          | not set.                                                                                 |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Start Point -- Z Units          | start_z_units | *Enumerated*                        | uint8_t  | Units of the start point's z reference.                                                  | Same as field type       | 
|                                 |               | (:ref:`enum-ZUnits`)                |          |                                                                                          |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| End Point -- WGS84 Latitude     | end_lat       | *rad*                               | fp64_t   | WGS-84 latitude of end point.                                                            | min=-1.5707963267948966, | 
|                                 |               |                                     |          |                                                                                          | max=1.5707963267948966   | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| End Point -- WGS-84 Longitude   | end_lon       | *rad*                               | fp64_t   | WGS-84 longitude of end point.                                                           | min=-3.141592653589793,  | 
|                                 |               |                                     |          |                                                                                          | max=3.141592653589793    | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| End Point -- Z Reference        | end_z         | *m*                                 | fp32_t   | Depth or altitude for the end point. This parameter will be                              | Same as field type       | 
|                                 |               |                                     |          | ignored if the 'NO_Z' flag is set.                                                       |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| End Point -- Z Units            | end_z_units   | *Enumerated*                        | uint8_t  | Units of the end point's z reference.                                                    | Same as field type       | 
|                                 |               | (:ref:`enum-ZUnits`)                |          |                                                                                          |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Speed                           | speed         | *-*                                 | fp32_t   | Maneuver speed reference.                                                                | Same as field type       | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Speed Units                     | speed_units   | *Enumerated*                        | uint8_t  | Speed units.                                                                             | Same as field type       | 
|                                 |               | (:ref:`enum-SpeedUnits`)            |          |                                                                                          |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Loiter -- Radius                | lradius       | *m*                                 | fp32_t   | Radius for loitering at end point. Specify less or equal to 0                            | Same as field type       | 
|                                 |               |                                     |          | for no loitering.                                                                        |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+
| Flags                           | flags         | *Bitfield*                          | uint8_t  | Desired Path flags.                                                                      | Same as field type       | 
|                                 |               | (:ref:`DesiredPath-bitfield-flags`) |          |                                                                                          |                          | 
+---------------------------------+---------------+-------------------------------------+----------+------------------------------------------------------------------------------------------+--------------------------+

.. _DesiredPath-bitfield-flags:

.. _DesiredPath-bitfield-prefix-FL:

Bitfield Flags
^^^^^^^^^^^^^^^

Desired Path flags.

- Abbreviation: flags
- Prefix: FL

+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| Value | Name                         | Abbreviation | Description                                                             | 
+=======+==============================+==============+=========================================================================+
| 0x01  | Start Point                  | START        | Indicates that the start point specification is given,                  | 
|       |                              |              | therefore it should be considered for tracking.                         | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x02  | Direct                       | DIRECT       | If start point is not given, ignore also the previous path's            | 
|       |                              |              | endpoint and take the start point to be the current vehicle             | 
|       |                              |              | location.                                                               | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x04  | No Altitude/Depth control    | NO_Z         | Ignore altitude/depth setting and let them be controlled                | 
|       |                              |              | independently.                                                          | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x08  | 3D Tracking                  | 3DTRACK      | Perform 3D-tracking, i.e., consider the path formed in the              | 
|       |                              |              | XYZ plane taking into account both the 'start_z' and 'end_z'            | 
|       |                              |              | values.                                                                 | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x10  | Counter-Clockwise loiter     | CCLOCKW      | Indicates that loitering, if defined, should be done                    | 
|       |                              |              | counter-clockwise. Clockwise loitering will apply                       | 
|       |                              |              | otherwise.                                                              | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x20  | Loiter from current position | LOITER_CURR  | Indicates that loitering, if defined, should be done from               | 
|       |                              |              | the current vehicle position. The end_lat and end_lon                   | 
|       |                              |              | fields will be ignored.                                                 | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x40  | Takeoff                      | TAKEOFF      | Indicates that takeoff should be done before going to the end position. | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+
| 0x80  | Land                         | LAND         | Indicates that the system should land at the end position.              | 
+-------+------------------------------+--------------+-------------------------------------------------------------------------+

.. _DesiredControl:

Desired Control
----------------

Set the desired virtual forces and torques to be applied to the
vehicle.

- Abbreviation: DesiredControl
- Identification Number: 407
- Payload Size: 49 bytes
- Message Size: 71 bytes

+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Name                    | Abbreviation | Unit                                   | Type    | Description                          | Range              | 
+=========================+==============+========================================+=========+======================================+====================+
| Force along the x axis  | x            | *N*                                    | fp64_t  | Force X along the vehicle's x axis.  | Same as field type | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Force along the y axis  | y            | *N*                                    | fp64_t  | Force Y along the vehicle's y axis.  | Same as field type | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Force along the z axis  | z            | *N*                                    | fp64_t  | Force Z along the vehicle's z axis.  | Same as field type | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Torque about the x axis | k            | *Nm*                                   | fp64_t  | Torque K about the vehicle's x axis. | Same as field type | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Torque about the y axis | m            | *Nm*                                   | fp64_t  | Torque M about the vehicle's y axis. | Same as field type | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Torque about the z axis | n            | *Nm*                                   | fp64_t  | Torque N about the vehicle's z axis. | Same as field type | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+
| Flags                   | flags        | *Bitfield*                             | uint8_t | Desired Control flags.               | Same as field type | 
|                         |              | (:ref:`DesiredControl-bitfield-flags`) |         |                                      |                    | 
+-------------------------+--------------+----------------------------------------+---------+--------------------------------------+--------------------+

.. _DesiredControl-bitfield-flags:

.. _DesiredControl-bitfield-prefix-FL:

Bitfield Flags
^^^^^^^^^^^^^^^

Desired Control flags.

- Abbreviation: flags
- Prefix: FL

+-------+--------------------------+--------------+-------------------------------------------------+
| Value | Name                     | Abbreviation | Description                                     | 
+=======+==========================+==============+=================================================+
| 0x01  | Value of X is meaningful | X            | If enabled then field X has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x02  | Value of Y is meaningful | Y            | If enabled then field Y has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x04  | Value of Z is meaningful | Z            | If enabled then field Z has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x08  | Value of K is meaningful | K            | If enabled then field K has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x10  | Value of M is meaningful | M            | If enabled then field M has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x20  | Value of N is meaningful | N            | If enabled then field N has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+

.. _DesiredHeadingRate:

Desired Heading Rate
---------------------

Desired Heading Rate speed reference value for the control layer.

- Abbreviation: DesiredHeadingRate
- Identification Number: 408
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+---------+--------+------------------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit    | Type   | Description                                                | Range              | 
+=======+==============+=========+========+============================================================+====================+
| Value | value        | *rad/s* | fp64_t | The value of the desired heading rate speed in radians per | Same as field type | 
|       |              |         |        | second.                                                    |                    | 
+-------+--------------+---------+--------+------------------------------------------------------------+--------------------+

.. _DesiredVelocity:

Desired Velocity
-----------------

Desired value for each linear and angular speeds.

- Abbreviation: DesiredVelocity
- Identification Number: 409
- Payload Size: 49 bytes
- Message Size: 71 bytes

+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Name                        | Abbreviation | Unit                                    | Type    | Description                               | Range              | 
+=============================+==============+=========================================+=========+===========================================+====================+
| Desired Linear Speed in xx  | u            | *m/s*                                   | fp64_t  | Desired speed along the vehicle's x axis. | Same as field type | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Desired Linear Speed in yy  | v            | *m/s*                                   | fp64_t  | Desired speed along the vehicle's y axis. | Same as field type | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Desired Linear Speed in zz  | w            | *m/s*                                   | fp64_t  | Desired speed along the vehicle's z axis. | Same as field type | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Desired Angular Speed in xx | p            | *m/s*                                   | fp64_t  | Desired speed about the vehicle's x axis. | Same as field type | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Desired Angular Speed in yy | q            | *m/s*                                   | fp64_t  | Desired speed about the vehicle's y axis. | Same as field type | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Desired Angular Speed in zz | r            | *m/s*                                   | fp64_t  | Desired speed about the vehicle's z axis. | Same as field type | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+
| Flags                       | flags        | *Bitfield*                              | uint8_t | Desired Velocity flags.                   | Same as field type | 
|                             |              | (:ref:`DesiredVelocity-bitfield-flags`) |         |                                           |                    | 
+-----------------------------+--------------+-----------------------------------------+---------+-------------------------------------------+--------------------+

.. _DesiredVelocity-bitfield-flags:

.. _DesiredVelocity-bitfield-prefix-FL:

Bitfield Flags
^^^^^^^^^^^^^^^

Desired Velocity flags.

- Abbreviation: flags
- Prefix: FL

+-------+--------------------------+--------------+-------------------------------------------------+
| Value | Name                     | Abbreviation | Description                                     | 
+=======+==========================+==============+=================================================+
| 0x01  | Value of u is meaningful | SURGE        | If enabled then field u has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x02  | Value of v is meaningful | SWAY         | If enabled then field u has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x04  | Value of w is meaningful | HEAVE        | If enabled then field w has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x08  | Value of p is meaningful | ROLL         | If enabled then field p has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x10  | Value of q is meaningful | PITCH        | If enabled then field q has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+
| 0x20  | Value of r is meaningful | YAW          | If enabled then field r has a meaningful value. | 
+-------+--------------------------+--------------+-------------------------------------------------+

.. _PathControlState:

Path Control State
-------------------

Path control state issued by Path Controller.

- Abbreviation: PathControlState
- Identification Number: 410
- Payload Size: 81 bytes
- Message Size: 103 bytes

+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Name                            | Abbreviation  | Unit                                     | Type     | Description                                                               | Range                    | 
+=================================+===============+==========================================+==========+===========================================================================+==========================+
| Path Reference                  | path_ref      | *-*                                      | uint32_t | Unsigned integer reference of the desired path message to which this      | Same as field type       | 
|                                 |               |                                          |          | PathControlState message refers to.                                       |                          | 
|                                 |               |                                          |          | Path reference should only be set by a maneuver, not by path controllers. |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Start Point -- Latitude WGS-84  | start_lat     | *rad*                                    | fp64_t   | WGS-84 latitude of start point.                                           | min=-1.5707963267948966, | 
|                                 |               |                                          |          |                                                                           | max=1.5707963267948966   | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Start Point -- WGS-84 Longitude | start_lon     | *rad*                                    | fp64_t   | WGS-84 longitude of start point.                                          | min=-3.141592653589793,  | 
|                                 |               |                                          |          |                                                                           | max=3.141592653589793    | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Start Point -- Z Reference      | start_z       | *m*                                      | fp32_t   | Altitude or depth of start point. This parameter will be                  | Same as field type       | 
|                                 |               |                                          |          | ignored if the 'NO_Z' flag is set, or if the 'START' flag is              |                          | 
|                                 |               |                                          |          | not set.                                                                  |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Start Point -- Z Units          | start_z_units | *Enumerated*                             | uint8_t  | Units of the start point's z reference.                                   | Same as field type       | 
|                                 |               | (:ref:`enum-ZUnits`)                     |          |                                                                           |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| End Point -- Latitude WGS-84    | end_lat       | *rad*                                    | fp64_t   | WGS-84 latitude of end point.                                             | min=-1.5707963267948966, | 
|                                 |               |                                          |          |                                                                           | max=1.5707963267948966   | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| End Point -- WGS-84 Longitude   | end_lon       | *rad*                                    | fp64_t   | WGS-84 longitude of end point.                                            | min=-3.141592653589793,  | 
|                                 |               |                                          |          |                                                                           | max=3.141592653589793    | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| End Point -- Z Reference        | end_z         | *m*                                      | fp32_t   | Depth or altitude for the end point. This parameter should be             | Same as field type       | 
|                                 |               |                                          |          | ignored if the 'NO_Z' flag is set.                                        |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| End Point -- Z Units            | end_z_units   | *Enumerated*                             | uint8_t  | Units of the end point's z reference.                                     | Same as field type       | 
|                                 |               | (:ref:`enum-ZUnits`)                     |          |                                                                           |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Loiter -- Radius                | lradius       | *m*                                      | fp32_t   | Radius for loitering at end point.                                        | Same as field type       | 
|                                 |               |                                          |          | Will be 0 if no loitering is active.                                      |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Flags                           | flags         | *Bitfield*                               | uint8_t  | Path control state flags.                                                 | Same as field type       | 
|                                 |               | (:ref:`PathControlState-bitfield-flags`) |          |                                                                           |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Along Track Position            | x             | *m*                                      | fp32_t   | Along-Track position value.                                               | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Cross Track Position            | y             | *m*                                      | fp32_t   | Cross-Track position value.                                               | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Vertical Track Position         | z             | *m*                                      | fp32_t   | Vertical-Track position value.                                            | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Along Track Velocity            | vx            | *m/s*                                    | fp32_t   | Along-Track velocity value.                                               | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Cross Track Velocity            | vy            | *m/s*                                    | fp32_t   | Cross-Track velocity value.                                               | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Vertical Track Velocity         | vz            | *m/s*                                    | fp32_t   | Vertical-Track velocity value.                                            | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Course Error                    | course_error  | *rad*                                    | fp32_t   | Course error value.                                                       | Same as field type       | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+
| Estimated Time to Arrival (ETA) | eta           | *s*                                      | uint16_t | Estimated time to reach target waypoint. The value will be                | Same as field type       | 
|                                 |               |                                          |          | 65535 if the time is unknown or undefined, and 0 when                     |                          | 
|                                 |               |                                          |          | loitering.                                                                |                          | 
+---------------------------------+---------------+------------------------------------------+----------+---------------------------------------------------------------------------+--------------------------+

.. _PathControlState-bitfield-flags:

.. _PathControlState-bitfield-prefix-FL:

Bitfield Flags
^^^^^^^^^^^^^^^

Path control state flags.

- Abbreviation: flags
- Prefix: FL

+-------+---------------------------+--------------+-------------------------------------------------------------+
| Value | Name                      | Abbreviation | Description                                                 | 
+=======+===========================+==============+=============================================================+
| 0x01  | Near Endpoint             | NEAR         | Set if near the target endpoint.                            | 
+-------+---------------------------+--------------+-------------------------------------------------------------+
| 0x02  | Loitering                 | LOITERING    | Set if loitering.                                           | 
+-------+---------------------------+--------------+-------------------------------------------------------------+
| 0x04  | No Altitude/Depth control | NO_Z         | Altitude/depth being controlled independently.              | 
+-------+---------------------------+--------------+-------------------------------------------------------------+
| 0x08  | 3D Tracking               | 3DTRACK      | 3D-tracking is active.                                      | 
+-------+---------------------------+--------------+-------------------------------------------------------------+
| 0x10  | Counter-Clockwise loiter  | CCLOCKW      | Indicates that loitering, if active, is being done          | 
|       |                           |              | counter-clockwise. Otherwise, clockwise loitering should be | 
|       |                           |              | assumed.                                                    | 
+-------+---------------------------+--------------+-------------------------------------------------------------+

.. _AllocatedControlTorques:

Allocated Control Torques
--------------------------

Control torques allocated to the actuators.

- Abbreviation: AllocatedControlTorques
- Identification Number: 411
- Payload Size: 24 bytes
- Message Size: 46 bytes

+-------------------------+--------------+------+--------+--------------------------------------+--------------------+
| Name                    | Abbreviation | Unit | Type   | Description                          | Range              | 
+=========================+==============+======+========+======================================+====================+
| Torque about the x axis | k            | *Nm* | fp64_t | Torque K about the vehicle's x axis. | Same as field type | 
+-------------------------+--------------+------+--------+--------------------------------------+--------------------+
| Torque about the y axis | m            | *Nm* | fp64_t | Torque M about the vehicle's y axis. | Same as field type | 
+-------------------------+--------------+------+--------+--------------------------------------+--------------------+
| Torque about the x axis | n            | *Nm* | fp64_t | Torque N about the vehicle's z axis. | Same as field type | 
+-------------------------+--------------+------+--------+--------------------------------------+--------------------+

.. _ControlParcel:

Control Parcel
---------------

Report of PID control parcels.

- Abbreviation: ControlParcel
- Identification Number: 412
- Payload Size: 16 bytes
- Message Size: 38 bytes

+---------------------+--------------+------+--------+----------------------------+--------------------+
| Name                | Abbreviation | Unit | Type   | Description                | Range              | 
+=====================+==============+======+========+============================+====================+
| Proportional Parcel | p            | *-*  | fp32_t | Proportional parcel value. | Same as field type | 
+---------------------+--------------+------+--------+----------------------------+--------------------+
| Integrative Parcel  | i            | *-*  | fp32_t | Integral parcel value.     | Same as field type | 
+---------------------+--------------+------+--------+----------------------------+--------------------+
| Derivative Parcel   | d            | *-*  | fp32_t | Derivative parcel value.   | Same as field type | 
+---------------------+--------------+------+--------+----------------------------+--------------------+
| Anti-Windup Parcel  | a            | *-*  | fp32_t | Anti-windup parcel value.  | Same as field type | 
+---------------------+--------------+------+--------+----------------------------+--------------------+

.. _Brake:

Brake
------

Brake the vehicle in some way, i. e., reduce forward speed.

- Abbreviation: Brake
- Identification Number: 413
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-----------+--------------+------------------------+---------+------------------+--------------------+
| Name      | Abbreviation | Unit                   | Type    | Description      | Range              | 
+===========+==============+========================+=========+==================+====================+
| Operation | op           | *Enumerated*           | uint8_t | Brake operation. | Same as field type | 
|           |              | (:ref:`Brake-enum-op`) |         |                  |                    | 
+-----------+--------------+------------------------+---------+------------------+--------------------+

.. _Brake-enum-op:

.. _Brake-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

Brake operation.

- Abbreviation: op
- Prefix: OP

+-------+------------------+--------------+---------------------------+
| Value | Name             | Abbreviation | Description               | 
+=======+==================+==============+===========================+
| 0     | Stop Braking     | STOP         | Stop braking procedures.  | 
+-------+------------------+--------------+---------------------------+
| 1     | Start Braking    | START        | Start braking procedures. | 
+-------+------------------+--------------+---------------------------+
| 2     | Revert Actuation | REVERT       | Revert Actuation.         | 
+-------+------------------+--------------+---------------------------+

.. _DesiredLinearState:

Desired Linear State
---------------------

Position, velocity and acceleration setpoints in NED

- Abbreviation: DesiredLinearState
- Identification Number: 414
- Payload Size: 74 bytes
- Message Size: 96 bytes

+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Name                              | Abbreviation | Unit                                       | Type     | Description                            | Range              | 
+===================================+==============+============================================+==========+========================================+====================+
| Desired pos in xx                 | x            | *m*                                        | fp64_t   | Desired pos in x.                      | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired pos in yy                 | y            | *m*                                        | fp64_t   | Desired pos in y.                      | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired pos in zz                 | z            | *m*                                        | fp64_t   | Desired pos in z.                      | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired Linear Speed in xx        | vx           | *m/s*                                      | fp64_t   | Desired speed along NED x axis.        | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired Linear Speed in yy        | vy           | *m/s*                                      | fp64_t   | Desired speed along NED y axis.        | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired Linear Speed in zz        | vz           | *m/s*                                      | fp64_t   | Desired speed along NED z axis.        | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired Linear Acceleration in xx | ax           | *m/s/s*                                    | fp64_t   | Desired acceleration along NED x axis. | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired Linear Acceleration in yy | ay           | *m/s/s*                                    | fp64_t   | Desired acceleration along NED y axis. | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Desired Linear Acceleration in zz | az           | *m/s/s*                                    | fp64_t   | Desired acceleration along NED z axis. | Same as field type | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+
| Flags                             | flags        | *Bitfield*                                 | uint16_t | Setpoint Flags                         | Same as field type | 
|                                   |              | (:ref:`DesiredLinearState-bitfield-flags`) |          |                                        |                    | 
+-----------------------------------+--------------+--------------------------------------------+----------+----------------------------------------+--------------------+

.. _DesiredLinearState-bitfield-flags:

.. _DesiredLinearState-bitfield-prefix-FL:

Bitfield Flags
^^^^^^^^^^^^^^^

Setpoint Flags

- Abbreviation: flags
- Prefix: FL

+--------+---------------------------+--------------+--------------------------------------------------+
| Value  | Name                      | Abbreviation | Description                                      | 
+========+===========================+==============+==================================================+
| 0x0001 | Value of x is meaningful  | X            | If enabled then field x has a meaningful value.  | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0002 | Value of y is meaningful  | Y            | If enabled then field y has a meaningful value.  | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0004 | Value of z is meaningful  | Z            | If enabled then field z has a meaningful value.  | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0008 | Value of vx is meaningful | VX           | If enabled then field vx has a meaningful value. | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0010 | Value of vy is meaningful | VY           | If enabled then field vy has a meaningful value. | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0020 | Value of vz is meaningful | VZ           | If enabled then field vz has a meaningful value. | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0040 | Value of ax is meaningful | AX           | If enabled then field ax has a meaningful value. | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0080 | Value of ay is meaningful | AY           | If enabled then field ay has a meaningful value. | 
+--------+---------------------------+--------------+--------------------------------------------------+
| 0x0100 | Value of az is meaningful | AZ           | If enabled then field az has a meaningful value. | 
+--------+---------------------------+--------------+--------------------------------------------------+

.. _DesiredThrottle:

Desired Throttle
-----------------

Desired throttle e.g. for Plane in FBWA-mode.

- Abbreviation: DesiredThrottle
- Identification Number: 415
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+------+--------+------------------------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description                        | Range              | 
+=======+==============+======+========+====================================+====================+
| Value | value        | *%*  | fp64_t | The value of the desired throttle. | Same as field type | 
+-------+--------------+------+--------+------------------------------------+--------------------+

