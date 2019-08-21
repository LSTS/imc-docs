Sensors Messages
=================

.. _Rpm:

Revolutions Per Minute
-----------------------

Number of revolutions per minute.

- Abbreviation: Rpm
- Identification Number: 250
- Payload Size: 2 bytes
- Message Size: 24 bytes

+-------+--------------+-------+---------+-----------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type    | Description                       | Range              | 
+=======+==============+=======+=========+===================================+====================+
| Value | value        | *rpm* | int16_t | Number of revolutions per minute. | Same as field type | 
+-------+--------------+-------+---------+-----------------------------------+--------------------+

.. _Voltage:

Voltage
--------

Report of electrical voltage.

- Abbreviation: Voltage
- Identification Number: 251
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+------------------------+--------------+------+--------+-------------------------------------------------------------+--------------------+
| Name                   | Abbreviation | Unit | Type   | Description                                                 | Range              | 
+========================+==============+======+========+=============================================================+====================+
| Measured Voltage Value | value        | *V*  | fp32_t | The value of the internal electrical voltage as measured by | Same as field type | 
|                        |              |      |        | the sensor.                                                 |                    | 
+------------------------+--------------+------+--------+-------------------------------------------------------------+--------------------+

.. _Current:

Current
--------

Report of electrical current.

- Abbreviation: Current
- Identification Number: 252
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+------------------------+--------------+------+--------+-------------------------------------------------------------+--------------------+
| Name                   | Abbreviation | Unit | Type   | Description                                                 | Range              | 
+========================+==============+======+========+=============================================================+====================+
| Measured Current Value | value        | *A*  | fp32_t | The value of the internal electrical current as measured by | Same as field type | 
|                        |              |      |        | the sensor.                                                 |                    | 
+------------------------+--------------+------+--------+-------------------------------------------------------------+--------------------+

.. _GpsFix:

GPS Fix
--------

Report of a GPS fix.

- Abbreviation: GpsFix
- Identification Number: 253
- Payload Size: 56 bytes
- Message Size: 78 bytes
- Flags: periodic

+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Name                             | Abbreviation | Unit                              | Type     | Description                                                            | Range                    | 
+==================================+==============+===================================+==========+========================================================================+==========================+
| Validity                         | validity     | *Bitfield*                        | uint16_t | Validity of fields.                                                    | Same as field type       | 
|                                  |              | (:ref:`GpsFix-bitfield-validity`) |          |                                                                        |                          | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Type                             | type         | *Enumerated*                      | uint8_t  | Type of fix.                                                           | Same as field type       | 
|                                  |              | (:ref:`GpsFix-enum-type`)         |          |                                                                        |                          | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| UTC Year                         | utc_year     | *-*                               | uint16_t | UTC year.                                                              | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| UTC Month                        | utc_month    | *-*                               | uint8_t  | UTC month.                                                             | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| UTC Day                          | utc_day      | *-*                               | uint8_t  | UTC day.                                                               | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| UTC Time of Fix                  | utc_time     | *s*                               | fp32_t   | UTC time of the GPS fix measured in seconds since 00:00:00 (midnight). | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Latitude WGS-84                  | lat          | *rad*                             | fp64_t   | WGS-84 Latitude coordinate.                                            | min=-1.5707963267948966, | 
|                                  |              |                                   |          |                                                                        | max=1.5707963267948966   | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Longitude WGS-84                 | lon          | *rad*                             | fp64_t   | WGS-84 Longitude coordinate.                                           | min=-3.141592653589793,  | 
|                                  |              |                                   |          |                                                                        | max=3.141592653589793    | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Height above WGS-84 ellipsoid    | height       | *m*                               | fp32_t   | Height above WGS-84 ellipsoid.                                         | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Number of Satellites             | satellites   | *-*                               | uint8_t  | Number of satellites used by the GPS device to compute the             | Same as field type       | 
|                                  |              |                                   |          | solution.                                                              |                          | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Course Over Ground               | cog          | *rad*                             | fp32_t   | Course Over Ground (true).                                             | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Speed Over Ground                | sog          | *m/s*                             | fp32_t   | Speed Over Ground.                                                     | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Horizontal Dilution of Precision | hdop         | *-*                               | fp32_t   | Horizontal dilution of precision.                                      | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Vertical Dilution of Precision   | vdop         | *-*                               | fp32_t   | Vertical dilution of precision.                                        | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Horizontal Accuracy Estimate     | hacc         | *m*                               | fp32_t   | Horizontal Accuracy Estimate.                                          | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+
| Vertical Accuracy Estimate       | vacc         | *m*                               | fp32_t   | Vertical Accuracy Estimate.                                            | Same as field type       | 
+----------------------------------+--------------+-----------------------------------+----------+------------------------------------------------------------------------+--------------------------+

.. _GpsFix-bitfield-validity:

.. _GpsFix-bitfield-prefix-GFV:

Bitfield Validity
^^^^^^^^^^^^^^^^^^

Validity of fields.

- Abbreviation: validity
- Prefix: GFV

+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| Value  | Name                                   | Abbreviation | Description                                                 | 
+========+========================================+==============+=============================================================+
| 0x0001 | Valid Date                             | VALID_DATE   | Fields 'utc_year', 'utc_month' and 'utc_day' are valid.     | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0002 | Valid Time                             | VALID_TIME   | Field 'utc_time' is valid.                                  | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0004 | Valid Position                         | VALID_POS    | Fields 'lat', 'lon', 'altitude' and 'satellites' are valid. | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0008 | Valid Course Over Ground               | VALID_COG    | Field 'cog' is valid.                                       | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0010 | Valid Speed Over Ground                | VALID_SOG    | Field 'sog' is valid.                                       | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0020 | Valid Horizontal Accuracy Estimate     | VALID_HACC   | Field 'hacc' is valid.                                      | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0040 | Valid Vertical Accuracy Estimate       | VALID_VACC   | Field 'vacc' is valid.                                      | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0080 | Valid Horizontal Dilution of Precision | VALID_HDOP   | Field 'hdop' is valid.                                      | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+
| 0x0100 | Valid Vertical Dilution of Precision   | VALID_VDOP   | Field 'vdop' is valid.                                      | 
+--------+----------------------------------------+--------------+-------------------------------------------------------------+

.. _GpsFix-enum-type:

.. _GpsFix-enum-prefix-GFT:

Enum Type
^^^^^^^^^^

Type of fix.

- Abbreviation: type
- Prefix: GFT

+-------+----------------+----------------+--------------------------+
| Value | Name           | Abbreviation   | Description              | 
+=======+================+================+==========================+
| 0x00  | Stand Alone    | STANDALONE     | Stand alone solution.    | 
+-------+----------------+----------------+--------------------------+
| 0x01  | Differential   | DIFFERENTIAL   | Differential solution.   | 
+-------+----------------+----------------+--------------------------+
| 0x02  | Dead Reckoning | DEAD_RECKONING | Dead reckoning solution. | 
+-------+----------------+----------------+--------------------------+
| 0x03  | Manual Input   | MANUAL_INPUT   | Manual solution.         | 
+-------+----------------+----------------+--------------------------+
| 0x04  | Simulation     | SIMULATION     | Simulated solution.      | 
+-------+----------------+----------------+--------------------------+

.. _EulerAngles:

Euler Angles
-------------

Report of spatial orientation according to SNAME's notation
(1950).

- Abbreviation: EulerAngles
- Identification Number: 254
- Payload Size: 40 bytes
- Message Size: 62 bytes
- Flags: periodic

+----------------------+--------------+-------+--------+----------------------------------------------------------------+-------------------------+
| Name                 | Abbreviation | Unit  | Type   | Description                                                    | Range                   | 
+======================+==============+=======+========+================================================================+=========================+
| Device Time          | time         | *s*   | fp64_t | The device time.                                               | Same as field type      | 
+----------------------+--------------+-------+--------+----------------------------------------------------------------+-------------------------+
| Roll Angle           | phi          | *rad* | fp64_t | Rotation around the vehicle longitudinal axis.                 | min=-3.141592653589793, | 
|                      |              |       |        |                                                                | max=3.141592653589793   | 
+----------------------+--------------+-------+--------+----------------------------------------------------------------+-------------------------+
| Pitch Angle          | theta        | *rad* | fp64_t | Rotation around the vehicle lateral or transverse axis.        | min=-1.57079632679490,  | 
|                      |              |       |        |                                                                | max=1.57079632679490    | 
+----------------------+--------------+-------+--------+----------------------------------------------------------------+-------------------------+
| Yaw Angle (True)     | psi          | *rad* | fp64_t | Rotation around the vehicle vertical axis. A value of 0 means  | min=-3.141592653589793, | 
|                      |              |       |        | the vehicle is oriented towards true north. In cases where the | max=3.141592653589793   | 
|                      |              |       |        | sensor cannot measure the true heading, this field will have   |                         | 
|                      |              |       |        | the same value as Yaw (Magnetic).                              |                         | 
+----------------------+--------------+-------+--------+----------------------------------------------------------------+-------------------------+
| Yaw Angle (Magnetic) | psi_magnetic | *rad* | fp64_t | Rotation around the vehicle vertical axis. A value of 0 means  | min=-3.141592653589793, | 
|                      |              |       |        | the vehicle is oriented towards magnetic north. In cases where | max=3.141592653589793   | 
|                      |              |       |        | the sensor cannot measure the magnetic heading, this field     |                         | 
|                      |              |       |        | will have the same value as Yaw (True).                        |                         | 
+----------------------+--------------+-------+--------+----------------------------------------------------------------+-------------------------+

.. _EulerAnglesDelta:

Euler Angles Delta
-------------------

Component of incremetal orientation vector over a period of time.

- Abbreviation: EulerAnglesDelta
- Identification Number: 255
- Payload Size: 36 bytes
- Message Size: 58 bytes
- Flags: periodic

+-------------+--------------+-------+--------+------------------------------------------------------+--------------------+
| Name        | Abbreviation | Unit  | Type   | Description                                          | Range              | 
+=============+==============+=======+========+======================================================+====================+
| Device Time | time         | *s*   | fp64_t | The device time.                                     | Same as field type | 
+-------------+--------------+-------+--------+------------------------------------------------------+--------------------+
| X           | x            | *rad* | fp64_t | X component.                                         | Same as field type | 
+-------------+--------------+-------+--------+------------------------------------------------------+--------------------+
| Y           | y            | *rad* | fp64_t | Y component.                                         | Same as field type | 
+-------------+--------------+-------+--------+------------------------------------------------------+--------------------+
| Z           | z            | *rad* | fp64_t | Z component.                                         | Same as field type | 
+-------------+--------------+-------+--------+------------------------------------------------------+--------------------+
| Timestep    | timestep     | *s*   | fp32_t | Period of time of the orientation vector increments. | Same as field type | 
+-------------+--------------+-------+--------+------------------------------------------------------+--------------------+

.. _AngularVelocity:

Angular Velocity
-----------------

Vector quantifying the direction and magnitude of the measured
angular velocity that a device is exposed to.

- Abbreviation: AngularVelocity
- Identification Number: 256
- Payload Size: 32 bytes
- Message Size: 54 bytes
- Flags: periodic

+-------------+--------------+---------+--------+------------------+--------------------+
| Name        | Abbreviation | Unit    | Type   | Description      | Range              | 
+=============+==============+=========+========+==================+====================+
| Device Time | time         | *s*     | fp64_t | The device time. | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+
| X           | x            | *rad/s* | fp64_t | X component.     | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+
| Y           | y            | *rad/s* | fp64_t | Y component.     | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+
| Z           | z            | *rad/s* | fp64_t | Z component.     | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+

.. _Acceleration:

Acceleration
-------------

Vector quantifying the direction and magnitude of the measured
acceleration that a device is exposed to.

- Abbreviation: Acceleration
- Identification Number: 257
- Payload Size: 32 bytes
- Message Size: 54 bytes
- Flags: periodic

+-------------+--------------+---------+--------+------------------+--------------------+
| Name        | Abbreviation | Unit    | Type   | Description      | Range              | 
+=============+==============+=========+========+==================+====================+
| Device Time | time         | *s*     | fp64_t | The device time. | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+
| X           | x            | *m/s/s* | fp64_t | X component.     | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+
| Y           | y            | *m/s/s* | fp64_t | Y component.     | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+
| Z           | z            | *m/s/s* | fp64_t | Z component.     | Same as field type | 
+-------------+--------------+---------+--------+------------------+--------------------+

.. _MagneticField:

Magnetic Field
---------------

Vector quantifying the direction and magnitude of the measured
magnetic field that a device is exposed to.

- Abbreviation: MagneticField
- Identification Number: 258
- Payload Size: 32 bytes
- Message Size: 54 bytes
- Flags: periodic

+-------------+--------------+------+--------+------------------+--------------------+
| Name        | Abbreviation | Unit | Type   | Description      | Range              | 
+=============+==============+======+========+==================+====================+
| Device Time | time         | *s*  | fp64_t | The device time. | Same as field type | 
+-------------+--------------+------+--------+------------------+--------------------+
| X           | x            | *G*  | fp64_t | X component.     | Same as field type | 
+-------------+--------------+------+--------+------------------+--------------------+
| Y           | y            | *G*  | fp64_t | Y component.     | Same as field type | 
+-------------+--------------+------+--------+------------------+--------------------+
| Z           | z            | *G*  | fp64_t | Z component.     | Same as field type | 
+-------------+--------------+------+--------+------------------+--------------------+

.. _GroundVelocity:

Ground Velocity
----------------

Vector quantifying the direction and magnitude of the measured
velocity relative to the ground that a device is exposed to.

- Abbreviation: GroundVelocity
- Identification Number: 259
- Payload Size: 25 bytes
- Message Size: 47 bytes
- Flags: periodic

+----------+--------------+-------------------------------------------+---------+-------------------------------------------------------+--------------------+
| Name     | Abbreviation | Unit                                      | Type    | Description                                           | Range              | 
+==========+==============+===========================================+=========+=======================================================+====================+
| Validity | validity     | *Bitfield*                                | uint8_t | Each bit of this field represents if a given velocity | Same as field type | 
|          |              | (:ref:`GroundVelocity-bitfield-validity`) |         | component is valid.                                   |                    | 
+----------+--------------+-------------------------------------------+---------+-------------------------------------------------------+--------------------+
| X        | x            | *m/s*                                     | fp64_t  | X component.                                          | Same as field type | 
+----------+--------------+-------------------------------------------+---------+-------------------------------------------------------+--------------------+
| Y        | y            | *m/s*                                     | fp64_t  | Y component.                                          | Same as field type | 
+----------+--------------+-------------------------------------------+---------+-------------------------------------------------------+--------------------+
| Z        | z            | *m/s*                                     | fp64_t  | Z component.                                          | Same as field type | 
+----------+--------------+-------------------------------------------+---------+-------------------------------------------------------+--------------------+

.. _GroundVelocity-bitfield-validity:

.. _GroundVelocity-bitfield-prefix-VAL:

Bitfield Validity
^^^^^^^^^^^^^^^^^^

Each bit of this field represents if a given velocity
component is valid.

- Abbreviation: validity
- Prefix: VAL

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 0x01  | X component is valid | VEL_X        | *-*         | 
+-------+----------------------+--------------+-------------+
| 0x02  | Y component is valid | VEL_Y        | *-*         | 
+-------+----------------------+--------------+-------------+
| 0x04  | Z component is valid | VEL_Z        | *-*         | 
+-------+----------------------+--------------+-------------+

.. _WaterVelocity:

Water Velocity
---------------

Vector quantifying the direction and magnitude of the measured
velocity relative to the water that a device is exposed to.

- Abbreviation: WaterVelocity
- Identification Number: 260
- Payload Size: 25 bytes
- Message Size: 47 bytes
- Flags: periodic

+----------+--------------+------------------------------------------+---------+-------------------------------------------------------+--------------------+
| Name     | Abbreviation | Unit                                     | Type    | Description                                           | Range              | 
+==========+==============+==========================================+=========+=======================================================+====================+
| Validity | validity     | *Bitfield*                               | uint8_t | Each bit of this field represents if a given velocity | Same as field type | 
|          |              | (:ref:`WaterVelocity-bitfield-validity`) |         | component is valid.                                   |                    | 
+----------+--------------+------------------------------------------+---------+-------------------------------------------------------+--------------------+
| X        | x            | *m/s*                                    | fp64_t  | X component.                                          | Same as field type | 
+----------+--------------+------------------------------------------+---------+-------------------------------------------------------+--------------------+
| Y        | y            | *m/s*                                    | fp64_t  | Y component.                                          | Same as field type | 
+----------+--------------+------------------------------------------+---------+-------------------------------------------------------+--------------------+
| Z        | z            | *m/s*                                    | fp64_t  | Z component.                                          | Same as field type | 
+----------+--------------+------------------------------------------+---------+-------------------------------------------------------+--------------------+

.. _WaterVelocity-bitfield-validity:

.. _WaterVelocity-bitfield-prefix-VAL:

Bitfield Validity
^^^^^^^^^^^^^^^^^^

Each bit of this field represents if a given velocity
component is valid.

- Abbreviation: validity
- Prefix: VAL

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 0x01  | X component is valid | VEL_X        | *-*         | 
+-------+----------------------+--------------+-------------+
| 0x02  | Y component is valid | VEL_Y        | *-*         | 
+-------+----------------------+--------------+-------------+
| 0x04  | Z component is valid | VEL_Z        | *-*         | 
+-------+----------------------+--------------+-------------+

.. _VelocityDelta:

Velocity Delta
---------------

Component of incremetal velocity vector.

- Abbreviation: VelocityDelta
- Identification Number: 261
- Payload Size: 32 bytes
- Message Size: 54 bytes
- Flags: periodic

+-------------+--------------+-------+--------+------------------+--------------------+
| Name        | Abbreviation | Unit  | Type   | Description      | Range              | 
+=============+==============+=======+========+==================+====================+
| Device Time | time         | *s*   | fp64_t | The device time. | Same as field type | 
+-------------+--------------+-------+--------+------------------+--------------------+
| X           | x            | *m/s* | fp64_t | X component.     | Same as field type | 
+-------------+--------------+-------+--------+------------------+--------------------+
| Y           | y            | *m/s* | fp64_t | Y component.     | Same as field type | 
+-------------+--------------+-------+--------+------------------+--------------------+
| Z           | z            | *m/s* | fp64_t | Z component.     | Same as field type | 
+-------------+--------------+-------+--------+------------------+--------------------+

.. _Distance:

Distance
---------

Distance measurement detected by the device.

- Abbreviation: Distance
- Identification Number: 262
- Payload Size: 9+  bytes
- Message Size: 31+  bytes
- Flags: periodic

+--------------------+--------------+---------------------------------+----------------------+-----------------------------------+--------------------+
| Name               | Abbreviation | Unit                            | Type                 | Description                       | Range              | 
+====================+==============+=================================+======================+===================================+====================+
| Validity           | validity     | *Enumerated*                    | uint8_t              | Validity of the measurement.      | Same as field type | 
|                    |              | (:ref:`Distance-enum-validity`) |                      |                                   |                    | 
+--------------------+--------------+---------------------------------+----------------------+-----------------------------------+--------------------+
| Location           | location     | *-*                             | message-list         | Device Location in the system.    | Same as field type | 
|                    |              |                                 | (:ref:`DeviceState`) |                                   |                    | 
+--------------------+--------------+---------------------------------+----------------------+-----------------------------------+--------------------+
| Beam Configuration | beam_config  | *-*                             | message-list         | Beam configuration of the device. | Same as field type | 
|                    |              |                                 | (:ref:`BeamConfig`)  |                                   |                    | 
+--------------------+--------------+---------------------------------+----------------------+-----------------------------------+--------------------+
| Measured Distance  | value        | *m*                             | fp32_t               | Measured distance.                | Same as field type | 
+--------------------+--------------+---------------------------------+----------------------+-----------------------------------+--------------------+

.. _Distance-enum-validity:

.. _Distance-enum-prefix-DV:

Enum Validity
^^^^^^^^^^^^^^

Validity of the measurement.

- Abbreviation: validity
- Prefix: DV

+-------+---------+--------------+-------------------------+
| Value | Name    | Abbreviation | Description             | 
+=======+=========+==============+=========================+
| 0     | Invalid | INVALID      | Measurement is invalid. | 
+-------+---------+--------------+-------------------------+
| 1     | Valid   | VALID        | Measurement is valid.   | 
+-------+---------+--------------+-------------------------+

.. _Temperature:

Temperature
------------

Report of temperature.

- Abbreviation: Temperature
- Identification Number: 263
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+----------------------+--------------+------+--------+---------------------------------------------------------+--------------------+
| Name                 | Abbreviation | Unit | Type   | Description                                             | Range              | 
+======================+==============+======+========+=========================================================+====================+
| Measured Temperature | value        | *°C* | fp32_t | The value of the temperature as measured by the sensor. | Same as field type | 
+----------------------+--------------+------+--------+---------------------------------------------------------+--------------------+

.. _Pressure:

Pressure
---------

Report of external pressure.

- Abbreviation: Pressure
- Identification Number: 264
- Payload Size: 8 bytes
- Message Size: 30 bytes
- Flags: periodic

+-------------------+--------------+-------+--------+------------------------------------------------------+--------------------+
| Name              | Abbreviation | Unit  | Type   | Description                                          | Range              | 
+===================+==============+=======+========+======================================================+====================+
| Measured Pressure | value        | *hPa* | fp64_t | The value of the pressure as measured by the sensor. | Same as field type | 
+-------------------+--------------+-------+--------+------------------------------------------------------+--------------------+

.. _Depth:

Depth
------

Depth report.

- Abbreviation: Depth
- Identification Number: 265
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+----------------+--------------+------+--------+-----------------------------------+--------------------+
| Name           | Abbreviation | Unit | Type   | Description                       | Range              | 
+================+==============+======+========+===================================+====================+
| Measured Depth | value        | *m*  | fp32_t | Depth value measured by a sensor. | Same as field type | 
+----------------+--------------+------+--------+-----------------------------------+--------------------+

.. _DepthOffset:

Depth Offset
-------------

Report of Depth Offset.

- Abbreviation: DepthOffset
- Identification Number: 266
- Payload Size: 4 bytes
- Message Size: 26 bytes

+-----------------+--------------+------+--------+---------------+--------------------+
| Name            | Abbreviation | Unit | Type   | Description   | Range              | 
+=================+==============+======+========+===============+====================+
| Measured Offset | value        | *m*  | fp32_t | Depth offset. | Same as field type | 
+-----------------+--------------+------+--------+---------------+--------------------+

.. _SoundSpeed:

Sound Speed
------------

Sound Speed report.

- Abbreviation: SoundSpeed
- Identification Number: 267
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+----------------------+--------------+-------+--------+------------------------------------------------------------------+--------------------+
| Name                 | Abbreviation | Unit  | Type   | Description                                                      | Range              | 
+======================+==============+=======+========+==================================================================+====================+
| Computed Sound Speed | value        | *m/s* | fp32_t | Estimated sound speed. Negative values denote invalid estimates. | Same as field type | 
+----------------------+--------------+-------+--------+------------------------------------------------------------------+--------------------+

.. _WaterDensity:

Water Density
--------------

Water Density report.

- Abbreviation: WaterDensity
- Identification Number: 268
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+------------------------+--------------+------------+--------+-------------------------+--------------------+
| Name                   | Abbreviation | Unit       | Type   | Description             | Range              | 
+========================+==============+============+========+=========================+====================+
| Computed Water Density | value        | *kg/m/m/m* | fp32_t | Computed Water Density. | Same as field type | 
+------------------------+--------------+------------+--------+-------------------------+--------------------+

.. _Conductivity:

Conductivity
-------------

Report of conductivity.

- Abbreviation: Conductivity
- Identification Number: 269
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-----------------------+--------------+-------+--------+----------------------------------------------------------+--------------------+
| Name                  | Abbreviation | Unit  | Type   | Description                                              | Range              | 
+=======================+==============+=======+========+==========================================================+====================+
| Measured Conductivity | value        | *S/m* | fp32_t | The value of the conductivity as measured by the sensor. | Same as field type | 
+-----------------------+--------------+-------+--------+----------------------------------------------------------+--------------------+

.. _Salinity:

Salinity
---------

Report of salinity.

- Abbreviation: Salinity
- Identification Number: 270
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------------------+--------------+------+--------+------------------------------------------------------+--------------------+
| Name              | Abbreviation | Unit | Type   | Description                                          | Range              | 
+===================+==============+======+========+======================================================+====================+
| Measured Salinity | value        | *-*  | fp32_t | The value of the salinity as measured by the sensor. | Same as field type | 
+-------------------+--------------+------+--------+------------------------------------------------------+--------------------+

.. _WindSpeed:

Wind Speed
-----------

Measurement of wind speed.

- Abbreviation: WindSpeed
- Identification Number: 271
- Payload Size: 12 bytes
- Message Size: 34 bytes
- Flags: periodic

+------------+--------------+-------+--------+--------------------------------------------------------+--------------------+
| Name       | Abbreviation | Unit  | Type   | Description                                            | Range              | 
+============+==============+=======+========+========================================================+====================+
| Direction  | direction    | *rad* | fp32_t | Direction of the measured wind speed.                  | Same as field type | 
+------------+--------------+-------+--------+--------------------------------------------------------+--------------------+
| Speed      | speed        | *m/s* | fp32_t | The value of the wind speed as measured by the sensor. | Same as field type | 
+------------+--------------+-------+--------+--------------------------------------------------------+--------------------+
| Turbulence | turbulence   | *m/s* | fp32_t | Wind turbulence intensity.                             | Same as field type | 
+------------+--------------+-------+--------+--------------------------------------------------------+--------------------+

.. _RelativeHumidity:

Relative Humidity
------------------

Measurement of relative humidity.

- Abbreviation: RelativeHumidity
- Identification Number: 272
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------------------------+--------------+------+--------+-----------------------------+---------+
| Name                    | Abbreviation | Unit | Type   | Description                 | Range   | 
+=========================+==============+======+========+=============================+=========+
| Relative Humidity Value | value        | *-*  | fp32_t | Value of relative humidity. | min=0,  | 
|                         |              |      |        |                             | max=100 | 
+-------------------------+--------------+------+--------+-----------------------------+---------+

.. _DevDataText:

Device Data (Text)
-------------------

Verbatim representation of device data in plain text format.

- Abbreviation: DevDataText
- Identification Number: 273
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+-------+--------------+------+-----------+--------------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit | Type      | Description                                            | Range              | 
+=======+==============+======+===========+========================================================+====================+
| Value | value        | *-*  | plaintext | Plain text data as extracted directly from the device. | Same as field type | 
+-------+--------------+------+-----------+--------------------------------------------------------+--------------------+

.. _DevDataBinary:

Device Data (Binary)
---------------------

Verbatim representation of device data in binary format.

- Abbreviation: DevDataBinary
- Identification Number: 274
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+-------+--------------+------+---------+--------------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit | Type    | Description                                            | Range              | 
+=======+==============+======+=========+========================================================+====================+
| Value | value        | *-*  | rawdata | Raw binary data as extracted directly from the device. | Same as field type | 
+-------+--------------+------+---------+--------------------------------------------------------+--------------------+

.. _Force:

Force
------

Force measurement.

- Abbreviation: Force
- Identification Number: 275
- Payload Size: 4 bytes
- Message Size: 26 bytes

+----------------+--------------+------+--------+------------------+--------------------+
| Name           | Abbreviation | Unit | Type   | Description      | Range              | 
+================+==============+======+========+==================+====================+
| Measured Force | value        | *N*  | fp32_t | Force magnitude. | Same as field type | 
+----------------+--------------+------+--------+------------------+--------------------+

.. _SonarData:

Sonar Data
-----------

This message contains the data acquired by a single sonar
measurement. The following describes the format used to
fill the data field used in this message. (Byte order is
little endian.)

**Sidescan:**

+------+-------------------+-----------+
| Data | Name              | Type      |
+======+===================+===========+
| A    | Ranges data       |   uintX_t |
+------+-------------------+-----------+

.. figure:: ../images/imc_sidescan.png

* The type *uintX_t* will depend on the number of bits per unit, and it should be a multiple of 8.
* Furthermore, for now, 32 bits is the highest value of bits per unit supported.

**Multibeam:**

+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| Index| Section| Name                    | Type    | Comments                                                             |
+======+========+=========================+=========+======================================================================+
| 1    | H1     | Number of points        | uint16_t| Number of data points                                                |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 2    | H2     | Start angle             | fp32_t  | In radians                                                           |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 3    | H3     | Flags                   | uint8_t | Refer to next table                                                  |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 4    | H4 ?   | Angle scale factor      | fp32_t  | Used for angle steps in radians                                      |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 5    | H5 ?   | Intensities scale factor| fp32_t  |                                                                      |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 6    | D1 ?   | Angle steps[H1]         | uint16_t| Values in radians                                                    |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 7    | D2     | Ranges[H1]              | uintX_t | Ranges data points (scale factor from common field "Scaling Factor") |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+
| 8    | D3 ?   | Intensities[H1]         | uintX_t | Intensities data points                                              |
+------+--------+-------------------------+---------+----------------------------------------------------------------------+

+--------+------------------+-----+
| Section| Flag Label       | Bit |
+========+==================+=====+
| H4.1   | Intensities flag | 0   |
+--------+------------------+-----+
| H4.2   | Angle step flag  | 1   |
+--------+------------------+-----+

.. figure:: ../images/imc_multibeam.png

*Notes:*

* Each angle at step *i* can be calculated is defined by:

.. code-block:: python

   angle[i] = H2_start_angle + (32-bit sum of D1_angle_step[0] through D1_angle_step[i]) * H4_scaling_factor

* If bit H4.1 is not set then sections H5 and D3 won't exist.
* If bit H4.2 is not set then sections H4 and D1 won't exist. In case this bit is set, then the angle steps is read from field "Beam Width" from "Beam Configuration".
* The type *uintX_t* will depend on the number of bits per unit, and it should be a multiple of 8.
* Furthermore, for now, 32 bits is the highest value of bits per unit supported.

*How to write ranges and intensities data:*

.. code-block:: python
   :linenos:


   data_unit = (Integer) (data_value / scale_factor);
   bytes_per_unit = bits_per_unit / 8;
   LOOP: i = 0, until i = bytes_per_unit
       byte[i] = (data_unit >> 8 * i) & 0xFF);

   write(byte);

**Common:**


- Abbreviation: SonarData
- Identification Number: 276
- Payload Size: 18+  bytes
- Message Size: 40+  bytes
- Flags: periodic

+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Name                | Abbreviation   | Unit                         | Type                | Description                                                   | Range              | 
+=====================+================+==============================+=====================+===============================================================+====================+
| Type                | type           | *Enumerated*                 | uint8_t             | Type of sonar.                                                | Same as field type | 
|                     |                | (:ref:`SonarData-enum-type`) |                     |                                                               |                    | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Frequency           | frequency      | *Hz*                         | uint32_t            | Operating frequency.                                          | Same as field type | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Minimum Range       | min_range      | *m*                          | uint16_t            | Minimum range.                                                | Same as field type | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Maximum Range       | max_range      | *m*                          | uint16_t            | Maximum range.                                                | Same as field type | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Bits Per Data Point | bits_per_point | *bit*                        | uint8_t             | Size of the data unit. (Should be multiple of 8)              | Same as field type | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Scaling Factor      | scale_factor   | *-*                          | fp32_t              | Scaling factor used to multiply each data unit to restore the | Same as field type | 
|                     |                |                              |                     | original floating point value.                                |                    | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Beam Configuration  | beam_config    | *-*                          | message-list        | Beam configuration of the device.                             | Same as field type | 
|                     |                |                              | (:ref:`BeamConfig`) |                                                               |                    | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+
| Data                | data           | *-*                          | rawdata             | Data acquired by the measurement.                             | Same as field type | 
+---------------------+----------------+------------------------------+---------------------+---------------------------------------------------------------+--------------------+

.. _SonarData-enum-type:

.. _SonarData-enum-prefix-ST:

Enum Type
^^^^^^^^^^

Type of sonar.

- Abbreviation: type
- Prefix: ST

+-------+--------------+--------------+-------------+
| Value | Name         | Abbreviation | Description | 
+=======+==============+==============+=============+
| 0     | Sidescan     | SIDESCAN     | *-*         | 
+-------+--------------+--------------+-------------+
| 1     | Echo Sounder | ECHOSOUNDER  | *-*         | 
+-------+--------------+--------------+-------------+
| 2     | Multibeam    | MULTIBEAM    | *-*         | 
+-------+--------------+--------------+-------------+

.. _Pulse:

Pulse
------

Hardware pulse detection.

- Abbreviation: Pulse
- Identification Number: 277
- Payload Size: 0 bytes
- Message Size: 22 bytes
- Flags: periodic

This message has no fields.

.. _PulseDetectionControl:

Pulse Detection Control
------------------------

Control of hardware pulse detection.

- Abbreviation: PulseDetectionControl
- Identification Number: 278
- Payload Size: 1 bytes
- Message Size: 23 bytes

+-----------+--------------+----------------------------------------+---------+--------------------------------------------------+--------------------+
| Name      | Abbreviation | Unit                                   | Type    | Description                                      | Range              | 
+===========+==============+========================================+=========+==================================================+====================+
| Operation | op           | *Enumerated*                           | uint8_t | Activate or deactivate hardware pulse detection. | Same as field type | 
|           |              | (:ref:`PulseDetectionControl-enum-op`) |         |                                                  |                    | 
+-----------+--------------+----------------------------------------+---------+--------------------------------------------------+--------------------+

.. _PulseDetectionControl-enum-op:

.. _PulseDetectionControl-enum-prefix-POP:

Enum Operation
^^^^^^^^^^^^^^^

Activate or deactivate hardware pulse detection.

- Abbreviation: op
- Prefix: POP

+-------+---------------------+--------------+-------------+
| Value | Name                | Abbreviation | Description | 
+=======+=====================+==============+=============+
| 0     | Pulse Detection OFF | OFF          | *-*         | 
+-------+---------------------+--------------+-------------+
| 1     | Pulse Detection ON  | ON           | *-*         | 
+-------+---------------------+--------------+-------------+

.. _FuelLevel:

Fuel Level
-----------

Report of fuel level.

- Abbreviation: FuelLevel
- Identification Number: 279
- Payload Size: 10+  bytes
- Message Size: 32+  bytes
- Flags: periodic

+------------------+--------------+-------------+-----------+----------------------------------------------------------------+--------------------+
| Name             | Abbreviation | Unit        | Type      | Description                                                    | Range              | 
+==================+==============+=============+===========+================================================================+====================+
| Value            | value        | *%*         | fp32_t    | Fuel level percentage of the system.                           | min=0,             | 
|                  |              |             |           |                                                                | max=100            | 
+------------------+--------------+-------------+-----------+----------------------------------------------------------------+--------------------+
| Confidence Level | confidence   | *%*         | fp32_t    | Percentage level of confidence in the estimation of the amount | min=0,             | 
|                  |              |             |           | of energy in the batteries.                                    | max=100            | 
+------------------+--------------+-------------+-----------+----------------------------------------------------------------+--------------------+
| Operation Modes  | opmodes      | *TupleList* | plaintext | Operation mode name and the estimated time available in that   | Same as field type | 
|                  |              |             |           | mode in hours. Example: "Motion=1.5"                           |                    | 
+------------------+--------------+-------------+-----------+----------------------------------------------------------------+--------------------+

.. _GpsNavData:

GPS Navigation Data
--------------------

Report of GPS navigation data.

- Abbreviation: GpsNavData
- Identification Number: 280
- Payload Size: 68 bytes
- Message Size: 90 bytes

+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Name                               | Abbreviation | Unit  | Type     | Description                         | Range              | 
+====================================+==============+=======+==========+=====================================+====================+
| GPS Millisecond Time of Week       | itow         | *ms*  | uint32_t | GPS Millisecond Time of Week.       | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Latitude                           | lat          | *rad* | fp64_t   | Latitude.                           | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Longitude                          | lon          | *rad* | fp64_t   | Longitude.                          | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Height above ellipsoid             | height_ell   | *m*   | fp32_t   | Height Above Ellipsoid.             | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Height above sea level             | height_sea   | *m*   | fp32_t   | Height Above Sea Level.             | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Horizontal Accuracy Estimate       | hacc         | *m*   | fp32_t   | Horizontal Accuracy Estimate.       | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Vertical Accuracy Estimate         | vacc         | *m*   | fp32_t   | Vertical Accuracy Estimate.         | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| NED North Velocity                 | vel_n        | *m/s* | fp32_t   | NED North Velocity.                 | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| NED East Velocity                  | vel_e        | *m/s* | fp32_t   | NED East Velocity.                  | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| NED Down Velocity                  | vel_d        | *m/s* | fp32_t   | NED Down Velocity.                  | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Speed (3D)                         | speed        | *m/s* | fp32_t   | NED Down Velocity.                  | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Ground Speed (2D)                  | gspeed       | *m/s* | fp32_t   | NED Down Velocity.                  | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Heading (2D)                       | heading      | *rad* | fp32_t   | NED Down Velocity.                  | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Speed Accuracy Estimate            | sacc         | *m/s* | fp32_t   | NED Down Velocity.                  | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+
| Course / Heading Accuracy Estimate | cacc         | *rad* | fp32_t   | Course / Heading Accuracy Estimate. | Same as field type | 
+------------------------------------+--------------+-------+----------+-------------------------------------+--------------------+

.. _ServoPosition:

Servo Position
---------------

Actual position of a servo.

- Abbreviation: ServoPosition
- Identification Number: 281
- Payload Size: 5 bytes
- Message Size: 27 bytes

+------------+--------------+-------+---------+------------------------------+--------------------------+
| Name       | Abbreviation | Unit  | Type    | Description                  | Range                    | 
+============+==============+=======+=========+==============================+==========================+
| Identifier | id           | *-*   | uint8_t | Servo identifier.            | Same as field type       | 
+------------+--------------+-------+---------+------------------------------+--------------------------+
| Position   | value        | *rad* | fp32_t  | Value of the servo position. | min=-1.5707963267948966, | 
|            |              |       |         |                              | max=1.5707963267948966   | 
+------------+--------------+-------+---------+------------------------------+--------------------------+

.. _DeviceState:

Device State
-------------

Location of a specific device in the system infrastructure.

- Abbreviation: DeviceState
- Identification Number: 282
- Payload Size: 24 bytes
- Message Size: 46 bytes

+---------------------+--------------+-------+--------+------------------------------------+--------------------+
| Name                | Abbreviation | Unit  | Type   | Description                        | Range              | 
+=====================+==============+=======+========+====================================+====================+
| Device Position - X | x            | *m*   | fp32_t | Device's position over the X axis. | Same as field type | 
+---------------------+--------------+-------+--------+------------------------------------+--------------------+
| Device Position - Y | y            | *m*   | fp32_t | Device's position over the Y axis. | Same as field type | 
+---------------------+--------------+-------+--------+------------------------------------+--------------------+
| Device Position - Z | z            | *m*   | fp32_t | Device's position over the Z axis. | Same as field type | 
+---------------------+--------------+-------+--------+------------------------------------+--------------------+
| Device Rotation - X | phi          | *rad* | fp32_t | Device's rotation over the X axis. | Same as field type | 
+---------------------+--------------+-------+--------+------------------------------------+--------------------+
| Device Rotation - Y | theta        | *rad* | fp32_t | Device's rotation over the Y axis. | Same as field type | 
+---------------------+--------------+-------+--------+------------------------------------+--------------------+
| Device Rotation - Z | psi          | *rad* | fp32_t | Device's rotation over the Z axis. | Same as field type | 
+---------------------+--------------+-------+--------+------------------------------------+--------------------+

.. _BeamConfig:

Beam Configuration
-------------------

Beam configuration of the device.

- Abbreviation: BeamConfig
- Identification Number: 283
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------------+--------------+-------+--------+---------------------------------------------------------------+-----------------------+
| Name        | Abbreviation | Unit  | Type   | Description                                                   | Range                 | 
+=============+==============+=======+========+===============================================================+=======================+
| Beam Width  | beam_width   | *rad* | fp32_t | Beam width of the instrument. A negative number denotes that  | min=0,                | 
|             |              |       |        | this information is not available or is not applicable.       | max=3.141592653589793 | 
+-------------+--------------+-------+--------+---------------------------------------------------------------+-----------------------+
| Beam Height | beam_height  | *rad* | fp32_t | Beam height of the instrument. A negative number denotes that | min=0,                | 
|             |              |       |        | this information is not available or is not applicable.       | max=3.141592653589793 | 
+-------------+--------------+-------+--------+---------------------------------------------------------------+-----------------------+

.. _DataSanity:

Data Sanity
------------

Report sanity or lack of it in the data output by a sensor.

- Abbreviation: DataSanity
- Identification Number: 284
- Payload Size: 1 bytes
- Message Size: 23 bytes

+--------+--------------+-------------------------------+---------+---------------------------------------+--------------------+
| Name   | Abbreviation | Unit                          | Type    | Description                           | Range              | 
+========+==============+===============================+=========+=======================================+====================+
| Sanity | sane         | *Enumerated*                  | uint8_t | Whether the data is sane or not sane. | Same as field type | 
|        |              | (:ref:`DataSanity-enum-sane`) |         |                                       |                    | 
+--------+--------------+-------------------------------+---------+---------------------------------------+--------------------+

.. _DataSanity-enum-sane:

.. _DataSanity-enum-prefix-DS:

Enum Sanity
^^^^^^^^^^^^

Whether the data is sane or not sane.

- Abbreviation: sane
- Prefix: DS

+-------+----------+--------------+-------------------+
| Value | Name     | Abbreviation | Description       | 
+=======+==========+==============+===================+
| 0     | Sane     | SANE         | Data is sane.     | 
+-------+----------+--------------+-------------------+
| 1     | Not Sane | NOT_SANE     | Data is not sane. | 
+-------+----------+--------------+-------------------+

.. _RhodamineDye:

Rhodamine Dye
--------------

Rhodamine Dye measurement.

- Abbreviation: RhodamineDye
- Identification Number: 285
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+-----------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                       | Range              | 
+=======+==============+=======+========+===================================+====================+
| Value | value        | *PPB* | fp32_t | Amount of rhodamine dye detected. | Same as field type | 
+-------+--------------+-------+--------+-----------------------------------+--------------------+

.. _CrudeOil:

Crude Oil
----------

Crude oil measurement.

- Abbreviation: CrudeOil
- Identification Number: 286
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+-------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                   | Range              | 
+=======+==============+=======+========+===============================+====================+
| Value | value        | *PPB* | fp32_t | Amount of crude oil detected. | Same as field type | 
+-------+--------------+-------+--------+-------------------------------+--------------------+

.. _FineOil:

Fine Oil
---------

Fine oil measurement.

- Abbreviation: FineOil
- Identification Number: 287
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+------------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description                  | Range              | 
+=======+==============+=======+========+==============================+====================+
| Value | value        | *PPB* | fp32_t | Amount of fine oil detected. | Same as field type | 
+-------+--------------+-------+--------+------------------------------+--------------------+

.. _Turbidity:

Turbidity
----------

Turbidity measurement.

- Abbreviation: Turbidity
- Identification Number: 288
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+--------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description        | Range              | 
+=======+==============+=======+========+====================+====================+
| Value | value        | *NTU* | fp32_t | Turbidity reading. | Same as field type | 
+-------+--------------+-------+--------+--------------------+--------------------+

.. _Chlorophyll:

Chlorophyll
------------

Chlorophyll measurement.

- Abbreviation: Chlorophyll
- Identification Number: 289
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+--------+--------+----------------------+--------------------+
| Name  | Abbreviation | Unit   | Type   | Description          | Range              | 
+=======+==============+========+========+======================+====================+
| Value | value        | *µg/L* | fp32_t | Chlorophyll reading. | Same as field type | 
+-------+--------------+--------+--------+----------------------+--------------------+

.. _Fluorescein:

Fluorescein
------------

Fluorescein measurement.

- Abbreviation: Fluorescein
- Identification Number: 290
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+----------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description          | Range              | 
+=======+==============+=======+========+======================+====================+
| Value | value        | *PPB* | fp32_t | Fluorescein reading. | Same as field type | 
+-------+--------------+-------+--------+----------------------+--------------------+

.. _Phycocyanin:

Phycocyanin
------------

Phycocyanin measurement.

- Abbreviation: Phycocyanin
- Identification Number: 291
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+----------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description          | Range              | 
+=======+==============+=======+========+======================+====================+
| Value | value        | *PPB* | fp32_t | Phycocyanin reading. | Same as field type | 
+-------+--------------+-------+--------+----------------------+--------------------+

.. _Phycoerythrin:

Phycoerythrin
--------------

Phycoerythrin measurement.

- Abbreviation: Phycoerythrin
- Identification Number: 292
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+-------+--------+------------------------+--------------------+
| Name  | Abbreviation | Unit  | Type   | Description            | Range              | 
+=======+==============+=======+========+========================+====================+
| Value | value        | *PPB* | fp32_t | Phycoerythrin reading. | Same as field type | 
+-------+--------------+-------+--------+------------------------+--------------------+

.. _GpsFixRtk:

GPS Fix RTK
------------

Report of an RTK-GPS fix.

- Abbreviation: GpsFixRtk
- Identification Number: 293
- Payload Size: 58 bytes
- Message Size: 80 bytes
- Flags: periodic

+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Name                               | Abbreviation | Unit                                 | Type     | Description                                                                   | Range                    | 
+====================================+==============+======================================+==========+===============================================================================+==========================+
| Validity                           | validity     | *Bitfield*                           | uint16_t | Validity of fields.                                                           | Same as field type       | 
|                                    |              | (:ref:`GpsFixRtk-bitfield-validity`) |          |                                                                               |                          | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Type                               | type         | *Enumerated*                         | uint8_t  | Type of fix.                                                                  | Same as field type       | 
|                                    |              | (:ref:`GpsFixRtk-enum-type`)         |          |                                                                               |                          | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| GPS Time of Week                   | tow          | *-*                                  | uint32_t | GPS Time of Week.                                                             | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Base Latitude WGS-84               | base_lat     | *rad*                                | fp64_t   | WGS-84 Latitude coordinate of the base.                                       | min=-1.5707963267948966, | 
|                                    |              |                                      |          |                                                                               | max=1.5707963267948966   | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Base Longitude WGS-84              | base_lon     | *rad*                                | fp64_t   | WGS-84 Longitude coordinate of the base.                                      | min=-3.141592653589793,  | 
|                                    |              |                                      |          |                                                                               | max=3.141592653589793    | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Base Height above WGS-84 ellipsoid | base_height  | *m*                                  | fp32_t   | Height above WGS-84 ellipsoid of the base.                                    | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Position North                     | n            | *m*                                  | fp32_t   | Baseline North coordinate.                                                    | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Position East                      | e            | *m*                                  | fp32_t   | Baseline East coordinate.                                                     | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Position Down                      | d            | *m*                                  | fp32_t   | Baseline Down coordinate.                                                     | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Velocity North                     | v_n          | *m/s*                                | fp32_t   | Velocity North coordinate.                                                    | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Velocity East                      | v_e          | *m/s*                                | fp32_t   | Velocity East coordinate.                                                     | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Velocity Down                      | v_d          | *m/s*                                | fp32_t   | Velocity Down coordinate.                                                     | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| Number of Satellites               | satellites   | *-*                                  | uint8_t  | Number of satellites used in solution.                                        | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| IAR Hypotheses                     | iar_hyp      | *-*                                  | uint16_t | Number of hypotheses in the Integer Ambiguity Resolution (smaller is better). | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+
| IAR Ratio                          | iar_ratio    | *-*                                  | fp32_t   | Quality ratio of Integer Ambiguity Resolution (bigger is better).             | Same as field type       | 
+------------------------------------+--------------+--------------------------------------+----------+-------------------------------------------------------------------------------+--------------------------+

.. _GpsFixRtk-bitfield-validity:

.. _GpsFixRtk-bitfield-prefix-RFV:

Bitfield Validity
^^^^^^^^^^^^^^^^^^

Validity of fields.

- Abbreviation: validity
- Prefix: RFV

+--------+----------------+--------------+------------------------------------------------------------+
| Value  | Name           | Abbreviation | Description                                                | 
+========+================+==============+============================================================+
| 0x0001 | Valid Time     | VALID_TIME   | Field 'tow' is valid.                                      | 
+--------+----------------+--------------+------------------------------------------------------------+
| 0x0002 | Valid Base LLH | VALID_BASE   | Fields 'base_lat', 'base_lon' and 'base_height' are valid. | 
+--------+----------------+--------------+------------------------------------------------------------+
| 0x0004 | Valid Position | VALID_POS    | Fields 'n', 'e', 'd' are valid.                            | 
+--------+----------------+--------------+------------------------------------------------------------+
| 0x0008 | Valid Velocity | VALID_VEL    | Fields 'v_n', 'v_e', 'v_d' are valid.                      | 
+--------+----------------+--------------+------------------------------------------------------------+

.. _GpsFixRtk-enum-type:

.. _GpsFixRtk-enum-prefix-RTK:

Enum Type
^^^^^^^^^^

Type of fix.

- Abbreviation: type
- Prefix: RTK

+-------+-------+--------------+------------------------------------------+
| Value | Name  | Abbreviation | Description                              | 
+=======+=======+==============+==========================================+
| 0x00  | None  | NONE         | No solution, but RTK task is running.    | 
+-------+-------+--------------+------------------------------------------+
| 0x01  | Obs   | OBS          | No solution, but receiving observations. | 
+-------+-------+--------------+------------------------------------------+
| 0x02  | Float | FLOAT        | Floating point solution of IAR.          | 
+-------+-------+--------------+------------------------------------------+
| 0x03  | Fixed | FIXED        | Fixed (single) solution of IAR.          | 
+-------+-------+--------------+------------------------------------------+

.. _ExternalNavData:

External Navigation Data
-------------------------

This message is a representation of the state of the vehicle,
as seen by an external navigation computer.

An example usage is when DUNE is used with ardupilot. The
data gathered from the autopilot is a complete navigation
solution.

ExternalNavData contains an inline Estimated State, which
is a complete description of the system
in terms of parameters such as position, orientation and
velocities at a particular moment in time.

The Type field selects wether the navigation data is a
full state estimation, or only concerns attitude or
position/velocity.


- Abbreviation: ExternalNavData
- Identification Number: 294
- Payload Size: 91 bytes
- Message Size: 113 bytes
- Flags: periodic

+-----------------+--------------+------------------------------------+-------------------------+--------------------------------------+--------------------+
| Name            | Abbreviation | Unit                               | Type                    | Description                          | Range              | 
+=================+==============+====================================+=========================+======================================+====================+
| Estimated State | state        | *-*                                | message                 | External Navigation Data.            | Same as field type | 
|                 |              |                                    | (:ref:`EstimatedState`) |                                      |                    | 
+-----------------+--------------+------------------------------------+-------------------------+--------------------------------------+--------------------+
| Nav Data Type   | type         | *Enumerated*                       | uint8_t                 | The type of external navigation data | Same as field type | 
|                 |              | (:ref:`ExternalNavData-enum-type`) |                         |                                      |                    | 
+-----------------+--------------+------------------------------------+-------------------------+--------------------------------------+--------------------+

.. _ExternalNavData-enum-type:

.. _ExternalNavData-enum-prefix-EXTNAV:

Enum Nav Data Type
^^^^^^^^^^^^^^^^^^^

The type of external navigation data

- Abbreviation: type
- Prefix: EXTNAV

+-------+----------------------------------------+--------------+-------------+
| Value | Name                                   | Abbreviation | Description | 
+=======+========================================+==============+=============+
| 0     | Full State                             | FULL         | *-*         | 
+-------+----------------------------------------+--------------+-------------+
| 1     | Attitude Heading Reference System Only | AHRS         | *-*         | 
+-------+----------------------------------------+--------------+-------------+
| 2     | Position Reference System only         | POSREF       | *-*         | 
+-------+----------------------------------------+--------------+-------------+

.. _DissolvedOxygen:

Dissolved Oxygen
-----------------

Dissolved Oxygen measurement.

- Abbreviation: DissolvedOxygen
- Identification Number: 295
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+------+--------+---------------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description               | Range              | 
+=======+==============+======+========+===========================+====================+
| Value | value        | *µM* | fp32_t | Dissolved Oxygen reading. | Same as field type | 
+-------+--------------+------+--------+---------------------------+--------------------+

.. _AirSaturation:

Air Saturation
---------------

Air Saturation measurement.

- Abbreviation: AirSaturation
- Identification Number: 296
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+------+--------+-------------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description             | Range              | 
+=======+==============+======+========+=========================+====================+
| Value | value        | *%*  | fp32_t | Air Saturation reading. | Same as field type | 
+-------+--------------+------+--------+-------------------------+--------------------+

.. _Throttle:

Throttle
---------

Throttle e.g. for Plane/Copter .

- Abbreviation: Throttle
- Identification Number: 297
- Payload Size: 8 bytes
- Message Size: 30 bytes

+-------+--------------+------+--------+------------------------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description                        | Range              | 
+=======+==============+======+========+====================================+====================+
| Value | value        | *%*  | fp64_t | The value of the desired throttle. | Same as field type | 
+-------+--------------+------+--------+------------------------------------+--------------------+

.. _PH:

pH
---

Report of pH.

- Abbreviation: PH
- Identification Number: 298
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+------+--------+------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description                                    | Range              | 
+=======+==============+======+========+================================================+====================+
| Value | value        | *-*  | fp32_t | The value of the pH as measured by the sensor. | Same as field type | 
+-------+--------------+------+--------+------------------------------------------------+--------------------+

.. _Redox:

Redox Potential
----------------

Report of Redox Potential.

- Abbreviation: Redox
- Identification Number: 299
- Payload Size: 4 bytes
- Message Size: 26 bytes
- Flags: periodic

+-------+--------------+------+--------+---------------------------------------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description                                       | Range              | 
+=======+==============+======+========+===================================================+====================+
| Value | value        | *V*  | fp32_t | The value of the Redox as measured by the sensor. | Same as field type | 
+-------+--------------+------+--------+---------------------------------------------------+--------------------+

