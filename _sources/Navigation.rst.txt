Navigation Messages
====================

.. _EstimatedState:

Estimated State
----------------

This message presents the estimated state of the vehicle.

EstimatedState is a complete description of the system
in terms of parameters such as position, orientation and
velocities at a particular moment in time.

The system position is given by a North-East-Down (NED)
local tangent plane displacement (x, y, z) relative to
an absolute WGS-84 coordinate (latitude, longitude,
height above ellipsoid).

The symbols for position and attitude as well as linear and
angular velocities were chosen according to SNAME's notation (1950).
The body-fixed reference frame and Euler angles are depicted
next:

.. figure:: ../images/euler-lauv.png
   :align:  center

Euler angles

- Abbreviation: EstimatedState
- Identification Number: 350
- Payload Size: 88 bytes
- Message Size: 110 bytes
- Flags: periodic

+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Name                      | Abbreviation | Unit    | Type   | Description                                                    | Range                    | 
+===========================+==============+=========+========+================================================================+==========================+
| Latitude (WGS-84)         | lat          | *rad*   | fp64_t | WGS-84 Latitude.                                               | min=-1.5707963267948966, | 
|                           |              |         |        |                                                                | max=1.5707963267948966   | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Longitude (WGS-84)        | lon          | *rad*   | fp64_t | WGS-84 Longitude.                                              | min=-3.141592653589793,  | 
|                           |              |         |        |                                                                | max=3.141592653589793    | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Height (WGS-84)           | height       | *m*     | fp32_t | Height above the WGS-84 ellipsoid.                             | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Offset north              | x            | *m*     | fp32_t | The North offset of the North/East/Down field with respect to  | Same as field type       | 
|                           |              |         |        | LLH.                                                           |                          | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Offset east               | y            | *m*     | fp32_t | The East offset of the North/East/Down field with respect to   | Same as field type       | 
|                           |              |         |        | LLH.                                                           |                          | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Offset down               | z            | *m*     | fp32_t | The Down offset of the North/East/Down field with respect to   | Same as field type       | 
|                           |              |         |        | LLH.                                                           |                          | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Rotation over x axis      | phi          | *rad*   | fp32_t | The phi Euler angle from the vehicle's attitude.               | min=-3.141592653589793,  | 
|                           |              |         |        |                                                                | max=3.141592653589793    | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Rotation over y axis      | theta        | *rad*   | fp32_t | The theta Euler angle from the vehicle's attitude.             | min=-1.57079632679490,   | 
|                           |              |         |        |                                                                | max=1.57079632679490     | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Rotation over z axis      | psi          | *rad*   | fp32_t | The psi Euler angle from the vehicle's attitude.               | min=-3.141592653589793,  | 
|                           |              |         |        |                                                                | max=3.141592653589793    | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Body-Fixed xx Velocity    | u            | *m/s*   | fp32_t | Body-fixed frame xx axis velocity component.                   | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Body-Fixed yy Velocity    | v            | *m/s*   | fp32_t | Body-fixed frame yy axis velocity component.                   | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Body-Fixed zz Velocity    | w            | *m/s*   | fp32_t | Body-fixed frame zz axis velocity component.                   | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Ground Velocity X (North) | vx           | *m/s*   | fp32_t | Ground Velocity xx axis velocity component.                    | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Ground Velocity Y (East)  | vy           | *m/s*   | fp32_t | Ground Velocity yy axis velocity component.                    | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Ground Velocity Z (Down)  | vz           | *m/s*   | fp32_t | Ground Velocity zz axis velocity component.                    | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Angular Velocity in x     | p            | *rad/s* | fp32_t | The angular velocity over body-fixed xx axis (roll).           | min=-3.141592653589793,  | 
|                           |              |         |        |                                                                | max=3.141592653589793    | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Angular Velocity in y     | q            | *rad/s* | fp32_t | The angular velocity over body-fixed yy axis (pitch).          | min=-3.141592653589793,  | 
|                           |              |         |        |                                                                | max=3.141592653589793    | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Angular Velocity in z     | r            | *rad/s* | fp32_t | The angular velocity over body-fixed zz axis (yaw).            | min=-3.141592653589793,  | 
|                           |              |         |        |                                                                | max=3.141592653589793    | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Depth                     | depth        | *m*     | fp32_t | Depth, in meters. To be used by underwater vehicles. Negative  | Same as field type       | 
|                           |              |         |        | values denote invalid estimates.                               |                          | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+
| Altitude                  | alt          | *m*     | fp32_t | Altitude, in meters. Negative values denote invalid estimates. | Same as field type       | 
+---------------------------+--------------+---------+--------+----------------------------------------------------------------+--------------------------+

.. _EstimatedStreamVelocity:

Estimated Stream Velocity
--------------------------

The estimated stream velocity, typically for water or air
streams.

- Abbreviation: EstimatedStreamVelocity
- Identification Number: 351
- Payload Size: 24 bytes
- Message Size: 46 bytes
- Flags: periodic

+---------------------+--------------+-------+--------+----------------------+--------------------+
| Name                | Abbreviation | Unit  | Type   | Description          | Range              | 
+=====================+==============+=======+========+======================+====================+
| X component (North) | x            | *m/s* | fp64_t | X component (North). | Same as field type | 
+---------------------+--------------+-------+--------+----------------------+--------------------+
| Y component (East)  | y            | *m/s* | fp64_t | Y component (East).  | Same as field type | 
+---------------------+--------------+-------+--------+----------------------+--------------------+
| Z component (Down)  | z            | *m/s* | fp64_t | Z component (Down).  | Same as field type | 
+---------------------+--------------+-------+--------+----------------------+--------------------+

.. _IndicatedSpeed:

Indicated Speed
----------------

Speed measured by the navigation filter.

- Abbreviation: IndicatedSpeed
- Identification Number: 352
- Payload Size: 8 bytes
- Message Size: 30 bytes

+----------------+--------------+-------+--------+-------------+--------------------+
| Name           | Abbreviation | Unit  | Type   | Description | Range              | 
+================+==============+=======+========+=============+====================+
| Measured speed | value        | *m/s* | fp64_t |             | Same as field type | 
+----------------+--------------+-------+--------+-------------+--------------------+

.. _TrueSpeed:

True Speed
-----------

Ground true speed.

- Abbreviation: TrueSpeed
- Identification Number: 353
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-----------------+--------------+-------+--------+-------------+--------------------+
| Name            | Abbreviation | Unit  | Type   | Description | Range              | 
+=================+==============+=======+========+=============+====================+
| Estimated value | value        | *m/s* | fp64_t |             | Same as field type | 
+-----------------+--------------+-------+--------+-------------+--------------------+

.. _NavigationUncertainty:

Navigation Uncertainty
-----------------------

Report of navigation uncertainty.
This is usually given by the output of the state
covariance matrix of an Extended Kalman Filter.

- Abbreviation: NavigationUncertainty
- Identification Number: 354
- Payload Size: 56 bytes
- Message Size: 78 bytes

+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Name                              | Abbreviation | Unit    | Type   | Description                                                             | Range              | 
+===================================+==============+=========+========+=========================================================================+====================+
| Variance - x Position             | x            | *m*     | fp32_t | The North offset variance of the North/East/Down                        | Same as field type | 
|                                   |              |         |        |       field with respect to LLH.                                        |                    | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - y Position             | y            | *m*     | fp32_t | The East offset variance of the North/East/Down                         | Same as field type | 
|                                   |              |         |        |       field with respect to LLH.                                        |                    | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - z Position             | z            | *m*     | fp32_t | The Down offset variance of the North/East/Down                         | Same as field type | 
|                                   |              |         |        |       field with respect to LLH.                                        |                    | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Roll                   | phi          | *rad*   | fp32_t | The phi Euler angle variance from the vehicle's attitude.               | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Pitch                  | theta        | *rad*   | fp32_t | The theta Euler angle variance from the vehicle's attitude.             | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Yaw                    | psi          | *rad*   | fp32_t | The psi Euler angle variance from the vehicle's attitude.               | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Gyro. Roll Rate        | p            | *rad/s* | fp32_t | The angular velocity variance over body-fixed xx axis (roll).           | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Gyro. Pitch Rate       | q            | *rad/s* | fp32_t | The angular velocity variance over body-fixed yy axis (pitch).          | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Gyro. Yaw Rate         | r            | *rad/s* | fp32_t | The angular velocity variance over body-fixed zz axis (yaw).            | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Body-Fixed xx Velocity | u            | *m/s*   | fp32_t | Body-fixed frame xx axis velocity variance component.                   | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Body-Fixed yy Velocity | v            | *m/s*   | fp32_t | Body-fixed frame yy axis velocity variance component.                   | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Body-Fixed ww Velocity | w            | *m/s*   | fp32_t | Body-fixed frame zz axis velocity variance component.                   | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Yaw Bias               | bias_psi     | *rad*   | fp32_t | The psi Euler angle bias variance from the vehicle's sensed attitude.   | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+
| Variance - Gyro. Yaw Rate Bias    | bias_r       | *rad/s* | fp32_t | The angular velocity over body-fixed zz axis bias variance from sensor. | Same as field type | 
+-----------------------------------+--------------+---------+--------+-------------------------------------------------------------------------+--------------------+

.. _NavigationData:

Navigation Data
----------------

Report of navigation data.
This is constituted by data which is not
part of the vehicle estimated state but
that the user may refer for more information.

- Abbreviation: NavigationData
- Identification Number: 355
- Payload Size: 36 bytes
- Message Size: 58 bytes

+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Name                         | Abbreviation  | Unit    | Type   | Description                                                    | Range              | 
+==============================+===============+=========+========+================================================================+====================+
| Yaw Bias                     | bias_psi      | *rad*   | fp32_t | The psi Euler angle bias from the vehicle's sensed attitude.   | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Gyro. Yaw Rate Bias          | bias_r        | *rad/s* | fp32_t | The angular velocity over body-fixed zz axis bias from sensor. | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Course Over Ground           | cog           | *rad*   | fp32_t | Course over ground given by NED ground velocity vectors.       | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Continuous Yaw               | cyaw          | *rad*   | fp32_t | Continuous psi Euler angle (without normalizations).           | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| GPS Rejection Filter Level   | lbl_rej_level | *-*     | fp32_t | GPS rejection filter level.                                    | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| LBL Rejection Filter Level   | gps_rej_level | *-*     | fp32_t | LBL rejection filter level.                                    | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Variance - Custom Variable X | custom_x      | *-*     | fp32_t | Custom variable.                                               | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Variance - Custom Variable Y | custom_y      | *-*     | fp32_t | Custom variable.                                               | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+
| Variance - Custom Variable Z | custom_z      | *-*     | fp32_t | Custom variable.                                               | Same as field type | 
+------------------------------+---------------+---------+--------+----------------------------------------------------------------+--------------------+

.. _GpsFixRejection:

GPS Fix Rejection
------------------

No description

- Abbreviation: GpsFixRejection
- Identification Number: 356
- Payload Size: 5 bytes
- Message Size: 27 bytes

+-----------------+--------------+--------------------------------------+---------+------------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit                                 | Type    | Description                                                | Range              | 
+=================+==============+======================================+=========+============================================================+====================+
| UTC Time of Fix | utc_time     | *s*                                  | fp32_t  | UTC time of the rejected GPS fix measured in seconds since | Same as field type | 
|                 |              |                                      |         | 00:00:00 (midnight).                                       |                    | 
+-----------------+--------------+--------------------------------------+---------+------------------------------------------------------------+--------------------+
| Reason          | reason       | *Enumerated*                         | uint8_t | Reason for rejection.                                      | Same as field type | 
|                 |              | (:ref:`GpsFixRejection-enum-reason`) |         |                                                            |                    | 
+-----------------+--------------+--------------------------------------+---------+------------------------------------------------------------+--------------------+

.. _GpsFixRejection-enum-reason:

.. _GpsFixRejection-enum-prefix-RR:

Enum Reason
^^^^^^^^^^^^

Reason for rejection.

- Abbreviation: reason
- Prefix: RR

+-------+--------------------+-----------------+--------------------------------------------------------------+
| Value | Name               | Abbreviation    | Description                                                  | 
+=======+====================+=================+==============================================================+
| 0     | Above Threshold    | ABOVE_THRESHOLD | New GPS Fix position is above a computed threshold.          | 
+-------+--------------------+-----------------+--------------------------------------------------------------+
| 1     | Invalid Fix        | INVALID         | Invalid measurement.                                         | 
+-------+--------------------+-----------------+--------------------------------------------------------------+
| 2     | Above Maximum HDOP | ABOVE_MAX_HDOP  | Above maximum horizontal dilution of precision.              | 
+-------+--------------------+-----------------+--------------------------------------------------------------+
| 3     | Above Maximum HACC | ABOVE_MAX_HACC  | Above maximum horizontal accuracy index.                     | 
+-------+--------------------+-----------------+--------------------------------------------------------------+
| 4     | Lost Validity Bit  | LOST_VAL_BIT    | Lost one of the validity bits between consecutive GPS fixes. | 
+-------+--------------------+-----------------+--------------------------------------------------------------+

.. _LblRangeAcceptance:

LBL Range Acceptance
---------------------

When the vehicle uses Long Base Line navigation, this message
notifies that a new range was received from one of the acoustics
transponders. The message fields are used to identify the range
value and the transponder name. Also, this message has an
acceptance field that indicates whether a LBL range was accepted
or rejected, and if rejected, the reason why.

- Abbreviation: LblRangeAcceptance
- Identification Number: 357
- Payload Size: 6 bytes
- Message Size: 28 bytes

+------------------------------+--------------+---------------------------------------------+---------+--------------------------------------------------------------+--------------------+
| Name                         | Abbreviation | Unit                                        | Type    | Description                                                  | Range              | 
+==============================+==============+=============================================+=========+==============================================================+====================+
| Beacon Identification Number | id           | *-*                                         | uint8_t | Identification number of the acoustic transponder from which | Same as field type | 
|                              |              |                                             |         | the range information was received.                          |                    | 
+------------------------------+--------------+---------------------------------------------+---------+--------------------------------------------------------------+--------------------+
| Range                        | range        | *m*                                         | fp32_t  | Distance to the acoustic transponder.                        | Same as field type | 
+------------------------------+--------------+---------------------------------------------+---------+--------------------------------------------------------------+--------------------+
| Acceptance                   | acceptance   | *Enumerated*                                | uint8_t | Reason for acceptance/rejection.                             | Same as field type | 
|                              |              | (:ref:`LblRangeAcceptance-enum-acceptance`) |         |                                                              |                    | 
+------------------------------+--------------+---------------------------------------------+---------+--------------------------------------------------------------+--------------------+

.. _LblRangeAcceptance-enum-acceptance:

.. _LblRangeAcceptance-enum-prefix-RR:

Enum Acceptance
^^^^^^^^^^^^^^^^

Reason for acceptance/rejection.

- Abbreviation: acceptance
- Prefix: RR

+-------+-----------------------------------+-----------------+----------------------------------------------------------------------+
| Value | Name                              | Abbreviation    | Description                                                          | 
+=======+===================================+=================+======================================================================+
| 0     | Accepted                          | ACCEPTED        | This LBL range is accepted by the navigation filter.                 | 
+-------+-----------------------------------+-----------------+----------------------------------------------------------------------+
| 1     | Rejected - Above Threshold        | ABOVE_THRESHOLD | New LBL Range is above a computed threshold.                         | 
+-------+-----------------------------------+-----------------+----------------------------------------------------------------------+
| 2     | Rejected - Singular Point         | SINGULAR        | Singular point.                                                      | 
+-------+-----------------------------------+-----------------+----------------------------------------------------------------------+
| 3     | Rejected - Not Enough Information | NO_INFO         | The filter lacks information to properly use the received LBL range. | 
+-------+-----------------------------------+-----------------+----------------------------------------------------------------------+
| 4     | Rejected - Vehicle At Surface     | AT_SURFACE      | Vehicle is using only GPS fix when it is at surface.                 | 
+-------+-----------------------------------+-----------------+----------------------------------------------------------------------+

.. _DvlRejection:

DVL Rejection
--------------

When the vehicle uses Doppler Velocity Log sensor, this message
notifies that a new measurement was locally rejected by the
navigation filter.

- Abbreviation: DvlRejection
- Identification Number: 358
- Payload Size: 10 bytes
- Message Size: 32 bytes

+------------------+--------------+-------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Name             | Abbreviation | Unit                                | Type    | Description                                                   | Range              | 
+==================+==============+=====================================+=========+===============================================================+====================+
| Type of velocity | type         | *Bitfield*                          | uint8_t | This field represents the type of the rejected velocity.      | Same as field type | 
|                  |              | (:ref:`DvlRejection-bitfield-type`) |         |                                                               |                    | 
+------------------+--------------+-------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Reason           | reason       | *Enumerated*                        | uint8_t | Reason for rejection. There are two types of DVL measurement  | Same as field type | 
|                  |              | (:ref:`DvlRejection-enum-reason`)   |         | filters. An Innovation filter checks the innovation between   |                    | 
|                  |              |                                     |         | the current measurement and the previous measurement within a |                    | 
|                  |              |                                     |         | certain amount of time and an Absolute filter compares the    |                    | 
|                  |              |                                     |         | measurement with an absolute threshold value. Those filters   |                    | 
|                  |              |                                     |         | are tested using horizontal speed measurements, i.e.,         |                    | 
|                  |              |                                     |         | measurements in the x-axis and in the y-axis.                 |                    | 
+------------------+--------------+-------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Value            | value        | *m/s*                               | fp32_t  | Value of the rejection.                                       | Same as field type | 
|                  |              |                                     |         | If it is an innovation rejection the value is                 |                    | 
|                  |              |                                     |         | the absolute difference between the previous                  |                    | 
|                  |              |                                     |         | accepted DVL measurement and the current one.                 |                    | 
|                  |              |                                     |         | If it is an absolute rejection the value is                   |                    | 
|                  |              |                                     |         | the current DVL measurement.                                  |                    | 
+------------------+--------------+-------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Timestep         | timestep     | *s*                                 | fp32_t  | Timestep of the rejection.                                    | Same as field type | 
|                  |              |                                     |         | The timestep is 0 for an absolute rejection                   |                    | 
|                  |              |                                     |         | since it is an instantaneous reading. For                     |                    | 
|                  |              |                                     |         | innovation rejection it is the time difference                |                    | 
|                  |              |                                     |         | between the previous accepted DVL measurement                 |                    | 
|                  |              |                                     |         | and the current one.                                          |                    | 
+------------------+--------------+-------------------------------------+---------+---------------------------------------------------------------+--------------------+

.. _DvlRejection-bitfield-type:

.. _DvlRejection-bitfield-prefix-TYPE:

Bitfield Type of velocity
^^^^^^^^^^^^^^^^^^^^^^^^^^

This field represents the type of the rejected velocity.

- Abbreviation: type
- Prefix: TYPE

+-------+-----------------+--------------+-------------+
| Value | Name            | Abbreviation | Description | 
+=======+=================+==============+=============+
| 0x01  | Ground velocity | GV           | *-*         | 
+-------+-----------------+--------------+-------------+
| 0x02  | Water velocity  | WV           | *-*         | 
+-------+-----------------+--------------+-------------+

.. _DvlRejection-enum-reason:

.. _DvlRejection-enum-prefix-RR:

Enum Reason
^^^^^^^^^^^^

Reason for rejection. There are two types of DVL measurement
filters. An Innovation filter checks the innovation between
the current measurement and the previous measurement within a
certain amount of time and an Absolute filter compares the
measurement with an absolute threshold value. Those filters
are tested using horizontal speed measurements, i.e.,
measurements in the x-axis and in the y-axis.

- Abbreviation: reason
- Prefix: RR

+-------+--------------------------+-------------------+--------------------------------------------------+
| Value | Name                     | Abbreviation      | Description                                      | 
+=======+==========================+===================+==================================================+
| 0     | Innovation Threshold - X | INNOV_THRESHOLD_X | The current DVL x-axis measurement is discarded  | 
|       |                          |                   | because the absolute difference between the      | 
|       |                          |                   | value and the previous accepted DVL measurement  | 
|       |                          |                   | with a given time window is above a configurable | 
|       |                          |                   | threshold.                                       | 
+-------+--------------------------+-------------------+--------------------------------------------------+
| 1     | Innovation Threshold - Y | INNOV_THRESHOLD_Y | The current DVL y-axis measurement is discarded  | 
|       |                          |                   | because the absolute difference between the      | 
|       |                          |                   | value and the previous accepted DVL measurement  | 
|       |                          |                   | with a given time window is above a configurable | 
|       |                          |                   | threshold.                                       | 
+-------+--------------------------+-------------------+--------------------------------------------------+
| 2     | Absolute Threshold - X   | ABS_THRESHOLD_X   | The current DVL x-axis measurement is discarded  | 
|       |                          |                   | because the the absolute value is above a        | 
|       |                          |                   | configurable threshold.                          | 
+-------+--------------------------+-------------------+--------------------------------------------------+
| 3     | Absolute Threshold - Y   | ABS_THRESHOLD_Y   | The current DVL y-axis measurement is discarded  | 
|       |                          |                   | because the the absolute value is above a        | 
|       |                          |                   | configurable threshold.                          | 
+-------+--------------------------+-------------------+--------------------------------------------------+

.. _LblEstimate:

LBL Beacon Position Estimate
-----------------------------

LBL Beacon position estimate.

- Abbreviation: LblEstimate
- Identification Number: 360
- Payload Size: 47+  bytes
- Message Size: 69+  bytes

+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+
| Name                     | Abbreviation | Unit | Type               | Description                                                         | Range              | 
+==========================+==============+======+====================+=====================================================================+====================+
| LBL Beacon Configuration | beacon       | *-*  | message            | LBL Beacon configuration estimate.                                  | Same as field type | 
|                          |              |      | (:ref:`LblBeacon`) |                                                                     |                    | 
+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+
| North position           | x            | *m*  | fp32_t             | The North position offset of the NED field with respect to origin.  | Same as field type | 
+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+
| East position            | y            | *m*  | fp32_t             | The East position offset of the NED field with respect to origin.   | Same as field type | 
+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+
| North position variance  | var_x        | *m*  | fp32_t             | The North offset variance of the North/East/Down                    | Same as field type | 
|                          |              |      |                    | field with respect to LLH.                                          |                    | 
+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+
| East position variance   | var_y        | *m*  | fp32_t             | The East offset variance of the North/East/Down                     | Same as field type | 
|                          |              |      |                    | field with respect to LLH.                                          |                    | 
+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+
| Distance                 | distance     | *m*  | fp32_t             | Distance between current LBL Beacon position and filter estimation. | Same as field type | 
+--------------------------+--------------+------+--------------------+---------------------------------------------------------------------+--------------------+

.. _AlignmentState:

Alignment State
----------------

This message notifies the vehicle is ready for dead-reckoning missions.

- Abbreviation: AlignmentState
- Identification Number: 361
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-------+--------------+------------------------------------+---------+------------------+--------------------+
| Name  | Abbreviation | Unit                               | Type    | Description      | Range              | 
+=======+==============+====================================+=========+==================+====================+
| State | state        | *Enumerated*                       | uint8_t | Alignment State. | Same as field type | 
|       |              | (:ref:`AlignmentState-enum-state`) |         |                  |                    | 
+-------+--------------+------------------------------------+---------+------------------+--------------------+

.. _AlignmentState-enum-state:

.. _AlignmentState-enum-prefix-AS:

Enum State
^^^^^^^^^^^

Alignment State.

- Abbreviation: state
- Prefix: AS

+-------+---------------+---------------+-------------+
| Value | Name          | Abbreviation  | Description | 
+=======+===============+===============+=============+
| 0     | Not Aligned   | NOT_ALIGNED   | *-*         | 
+-------+---------------+---------------+-------------+
| 1     | Aligned       | ALIGNED       | *-*         | 
+-------+---------------+---------------+-------------+
| 2     | Not Supported | NOT_SUPPORTED | *-*         | 
+-------+---------------+---------------+-------------+
| 3     | Aligning      | ALIGNING      | *-*         | 
+-------+---------------+---------------+-------------+
| 4     | Wrong Medium  | WRONG_MEDIUM  | *-*         | 
+-------+---------------+---------------+-------------+

.. _GroupStreamVelocity:

GroupStreamVelocity
--------------------

The stream velocity estimated by a group of systems.
Typically for water or air streams.

- Abbreviation: GroupStreamVelocity
- Identification Number: 362
- Payload Size: 24 bytes
- Message Size: 46 bytes
- Flags: periodic

+---------------------+--------------+-------+--------+----------------------+--------------------+
| Name                | Abbreviation | Unit  | Type   | Description          | Range              | 
+=====================+==============+=======+========+======================+====================+
| X component (North) | x            | *m/s* | fp64_t | X component (North). | Same as field type | 
+---------------------+--------------+-------+--------+----------------------+--------------------+
| Y component (East)  | y            | *m/s* | fp64_t | Y component (East).  | Same as field type | 
+---------------------+--------------+-------+--------+----------------------+--------------------+
| Z component (Down)  | z            | *m/s* | fp64_t | Z component (Down).  | Same as field type | 
+---------------------+--------------+-------+--------+----------------------+--------------------+

.. _Airflow:

Airflow
--------

Airspeed along with airflow angles.

- Abbreviation: Airflow
- Identification Number: 363
- Payload Size: 12 bytes
- Message Size: 34 bytes

+-----------------+--------------+-------+--------+------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit  | Type   | Description                                    | Range              | 
+=================+==============+=======+========+================================================+====================+
| Airspeed        | va           | *m/s* | fp32_t | Airspeed, the 2-norm of the relative velocity. | Same as field type | 
+-----------------+--------------+-------+--------+------------------------------------------------+--------------------+
| Angle of attack | aoa          | *rad* | fp32_t | Angle of attack.                               | Same as field type | 
+-----------------+--------------+-------+--------+------------------------------------------------+--------------------+
| Sideslip angle  | ssa          | *rad* | fp32_t | Sideslip angle.                                | Same as field type | 
+-----------------+--------------+-------+--------+------------------------------------------------+--------------------+

