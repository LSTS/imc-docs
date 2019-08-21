Storage Messages
=================

.. _StorageUsage:

Storage Usage
--------------

Report of storage usage.

- Abbreviation: StorageUsage
- Identification Number: 100
- Payload Size: 5 bytes
- Message Size: 27 bytes
- Flags: periodic

+-----------+--------------+-------+----------+---------------------------------------------------------+--------------------+
| Name      | Abbreviation | Unit  | Type     | Description                                             | Range              | 
+===========+==============+=======+==========+=========================================================+====================+
| Available | available    | *MiB* | uint32_t | The available storage of the reporting device.          | Same as field type | 
+-----------+--------------+-------+----------+---------------------------------------------------------+--------------------+
| Usage     | value        | *%*   | uint8_t  | The percentage of storage used by the reporting device. | max=100            | 
+-----------+--------------+-------+----------+---------------------------------------------------------+--------------------+

.. _CacheControl:

Cache Control
--------------

Control caching of messages to persistent storage.

- Abbreviation: CacheControl
- Identification Number: 101
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+----------------------+--------------+-------------------------------+-----------+------------------------------------------+--------------------+
| Name                 | Abbreviation | Unit                          | Type      | Description                              | Range              | 
+======================+==============+===============================+===========+==========================================+====================+
| Control Operation    | op           | *Enumerated*                  | uint8_t   | Operation to perform.                    | Same as field type | 
|                      |              | (:ref:`CacheControl-enum-op`) |           |                                          |                    | 
+----------------------+--------------+-------------------------------+-----------+------------------------------------------+--------------------+
| Snapshot destination | snapshot     | *-*                           | plaintext | Destination for the cache snapshot file. | Same as field type | 
+----------------------+--------------+-------------------------------+-----------+------------------------------------------+--------------------+
| Message              | message      | *-*                           | message   | Message to store.                        | Same as field type | 
+----------------------+--------------+-------------------------------+-----------+------------------------------------------+--------------------+

.. _CacheControl-enum-op:

.. _CacheControl-enum-prefix-COP:

Enum Control Operation
^^^^^^^^^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: COP

+-------+------------------------+---------------+-------------+
| Value | Name                   | Abbreviation  | Description | 
+=======+========================+===============+=============+
| 0     | Store                  | STORE         | *-*         | 
+-------+------------------------+---------------+-------------+
| 1     | Load                   | LOAD          | *-*         | 
+-------+------------------------+---------------+-------------+
| 2     | Clear                  | CLEAR         | *-*         | 
+-------+------------------------+---------------+-------------+
| 3     | Copy Snapshot          | COPY          | *-*         | 
+-------+------------------------+---------------+-------------+
| 4     | Snapshot Copy Complete | COPY_COMPLETE | *-*         | 
+-------+------------------------+---------------+-------------+

.. _LoggingControl:

Logging Control
----------------

Control logging of messages to persistent storage.

- Abbreviation: LoggingControl
- Identification Number: 102
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-------------------+--------------+---------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Name              | Abbreviation | Unit                            | Type      | Description                                               | Range              | 
+===================+==============+=================================+===========+===========================================================+====================+
| Control Operation | op           | *Enumerated*                    | uint8_t   | Operation to perform.                                     | Same as field type | 
|                   |              | (:ref:`LoggingControl-enum-op`) |           |                                                           |                    | 
+-------------------+--------------+---------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Log Label / Path  | name         | *-*                             | plaintext | The meaning of this field depends on the operation and is | Same as field type | 
|                   |              |                                 |           | explained in the operation's description.                 |                    | 
+-------------------+--------------+---------------------------------+-----------+-----------------------------------------------------------+--------------------+

.. _LoggingControl-enum-op:

.. _LoggingControl-enum-prefix-COP:

Enum Control Operation
^^^^^^^^^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: COP

+-------+--------------------------+----------------------+--------------------------------------------------------------+
| Value | Name                     | Abbreviation         | Description                                                  | 
+=======+==========================+======================+==============================================================+
| 0     | Request Start of Logging | REQUEST_START        | Request the logging manager to start logging. The logging    | 
|       |                          |                      | manager will reply with a STARTED operation. If logging is   | 
|       |                          |                      | already in progress the current log will be closed and a new | 
|       |                          |                      | one will be opened (therefore the logging manager will send  | 
|       |                          |                      | two messages - STOPPED and STARTED). The field 'name'        | 
|       |                          |                      | represents the label that will be appended to the log path.  | 
+-------+--------------------------+----------------------+--------------------------------------------------------------+
| 1     | Logging Started          | STARTED              | The logging manager will send a message with this operation  | 
|       |                          |                      | everytime a log is successfully started. The field 'name'    | 
|       |                          |                      | contains the complete name of the log.                       | 
+-------+--------------------------+----------------------+--------------------------------------------------------------+
| 2     | Request Logging Stop     | REQUEST_STOP         | Request the logging manager to stop logging messages. The    | 
|       |                          |                      | logging manager will reply with a STOPPED operation and      | 
|       |                          |                      | logging will be suspended until a message with operation     | 
|       |                          |                      | START is received. If logging is already stoppped the        | 
|       |                          |                      | logging manager will ignore this operation and will not      | 
|       |                          |                      | reply with a STOPPED operation. The field 'name' with this   | 
|       |                          |                      | operation type has no meaning.                               | 
+-------+--------------------------+----------------------+--------------------------------------------------------------+
| 3     | Logging Stopped          | STOPPED              | The logging manager will send a message with this operation  | 
|       |                          |                      | when logging is successfully stopped. The field 'name'       | 
|       |                          |                      | contains the complete name of the log that was closed.       | 
+-------+--------------------------+----------------------+--------------------------------------------------------------+
| 4     | Request Current Log Name | REQUEST_CURRENT_NAME | This operation instructs the logging manager to send a       | 
|       |                          |                      | message with operation CURRENT_NAME containing the complete  | 
|       |                          |                      | name of the current log in the field 'name'. The field       | 
|       |                          |                      | 'name' with this operation type has no meaning.              | 
+-------+--------------------------+----------------------+--------------------------------------------------------------+
| 5     | Current Log Name         | CURRENT_NAME         | The logging manager will send a message with this operation  | 
|       |                          |                      | when asked via the REQUEST_CURRENT_NAME operation. The field | 
|       |                          |                      | 'name' contains the complete name of the log.                | 
+-------+--------------------------+----------------------+--------------------------------------------------------------+

.. _LogBookEntry:

Log Book Entry
---------------

Human readable message reporting an event of interest.

- Abbreviation: LogBookEntry
- Identification Number: 103
- Payload Size: 13+  bytes
- Message Size: 35+  bytes

+-----------+--------------+---------------------------------+-----------+-------------------------+--------------------+
| Name      | Abbreviation | Unit                            | Type      | Description             | Range              | 
+===========+==============+=================================+===========+=========================+====================+
| Type      | type         | *Enumerated*                    | uint8_t   | Type of message.        | Same as field type | 
|           |              | (:ref:`LogBookEntry-enum-type`) |           |                         |                    | 
+-----------+--------------+---------------------------------+-----------+-------------------------+--------------------+
| Timestamp | htime        | *s*                             | fp64_t    | Timestamp (Epoch time). | Same as field type | 
+-----------+--------------+---------------------------------+-----------+-------------------------+--------------------+
| Context   | context      | *-*                             | plaintext | Message context.        | Same as field type | 
+-----------+--------------+---------------------------------+-----------+-------------------------+--------------------+
| Text      | text         | *-*                             | plaintext | Message text.           | Same as field type | 
+-----------+--------------+---------------------------------+-----------+-------------------------+--------------------+

.. _LogBookEntry-enum-type:

.. _LogBookEntry-enum-prefix-LBET:

Enum Type
^^^^^^^^^^

Type of message.

- Abbreviation: type
- Prefix: LBET

+-------+-------------+--------------+-------------+
| Value | Name        | Abbreviation | Description | 
+=======+=============+==============+=============+
| 0     | Information | INFO         | *-*         | 
+-------+-------------+--------------+-------------+
| 1     | Warning     | WARNING      | *-*         | 
+-------+-------------+--------------+-------------+
| 2     | Error       | ERROR        | *-*         | 
+-------+-------------+--------------+-------------+
| 3     | Critical    | CRITICAL     | *-*         | 
+-------+-------------+--------------+-------------+
| 4     | Debug       | DEBUG        | *-*         | 
+-------+-------------+--------------+-------------+

.. _LogBookControl:

Log Book Control
-----------------

Control history log.

- Abbreviation: LogBookControl
- Identification Number: 104
- Payload Size: 11+  bytes
- Message Size: 33+  bytes

+-----------+--------------+--------------------------------------+-----------------------+--------------------------------------------+--------------------+
| Name      | Abbreviation | Unit                                 | Type                  | Description                                | Range              | 
+===========+==============+======================================+=======================+============================================+====================+
| Command   | command      | *Enumerated*                         | uint8_t               | Command to perform.                        | Same as field type | 
|           |              | (:ref:`LogBookControl-enum-command`) |                       |                                            |                    | 
+-----------+--------------+--------------------------------------+-----------------------+--------------------------------------------+--------------------+
| Timestamp | htime        | *s*                                  | fp64_t                | Timestamp for command (Epoch time).        | Same as field type | 
+-----------+--------------+--------------------------------------+-----------------------+--------------------------------------------+--------------------+
| Messages  | msg          | *-*                                  | message-list          | Argument, currently used only for 'REPLY'. | Same as field type | 
|           |              |                                      | (:ref:`LogBookEntry`) |                                            |                    | 
+-----------+--------------+--------------------------------------+-----------------------+--------------------------------------------+--------------------+

.. _LogBookControl-enum-command:

.. _LogBookControl-enum-prefix-LBC:

Enum Command
^^^^^^^^^^^^^

Command to perform.

- Abbreviation: command
- Prefix: LBC

+-------+------------+--------------+-----------------------------------------------------------+
| Value | Name       | Abbreviation | Description                                               | 
+=======+============+==============+===========================================================+
| 0     | Get        | GET          | Retrieve log book entries.                                | 
+-------+------------+--------------+-----------------------------------------------------------+
| 1     | Clear      | CLEAR        | Clear log book entries.                                   | 
+-------+------------+--------------+-----------------------------------------------------------+
| 2     | Get Errors | GET_ERR      | Retrieve log book entries corresponding to errors.        | 
+-------+------------+--------------+-----------------------------------------------------------+
| 3     | Reply      | REPLY        | Reply to a GET command. Message argument is a MessageList | 
|       |            |              | instance containing LogBookEntry messages.                | 
+-------+------------+--------------+-----------------------------------------------------------+

.. _ReplayControl:

Replay Control
---------------

Control replay of LSF logged data.

- Abbreviation: ReplayControl
- Identification Number: 105
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+----------------+--------------+--------------------------------+-----------+-----------------------------+--------------------+
| Name           | Abbreviation | Unit                           | Type      | Description                 | Range              | 
+================+==============+================================+===========+=============================+====================+
| Operation      | op           | *Enumerated*                   | uint8_t   | Operation to perform.       | Same as field type | 
|                |              | (:ref:`ReplayControl-enum-op`) |           |                             |                    | 
+----------------+--------------+--------------------------------+-----------+-----------------------------+--------------------+
| File To Replay | file         | *-*                            | plaintext | Pathname of file to replay. | Same as field type | 
+----------------+--------------+--------------------------------+-----------+-----------------------------+--------------------+

.. _ReplayControl-enum-op:

.. _ReplayControl-enum-prefix-ROP:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: ROP

+-------+--------+--------------+-------------+
| Value | Name   | Abbreviation | Description | 
+=======+========+==============+=============+
| 0     | Start  | START        | *-*         | 
+-------+--------+--------------+-------------+
| 1     | Stop   | STOP         | *-*         | 
+-------+--------+--------------+-------------+
| 2     | Pause  | PAUSE        | *-*         | 
+-------+--------+--------------+-------------+
| 3     | Resume | RESUME       | *-*         | 
+-------+--------+--------------+-------------+

.. _ClockControl:

Clock Control
--------------

Clock control.

- Abbreviation: ClockControl
- Identification Number: 106
- Payload Size: 10 bytes
- Message Size: 32 bytes

+-----------+--------------+-------------------------------+---------+---------------------------+--------------------+
| Name      | Abbreviation | Unit                          | Type    | Description               | Range              | 
+===========+==============+===============================+=========+===========================+====================+
| Operation | op           | *Enumerated*                  | uint8_t | Operation to perform.     | Same as field type | 
|           |              | (:ref:`ClockControl-enum-op`) |         |                           |                    | 
+-----------+--------------+-------------------------------+---------+---------------------------+--------------------+
| Clock     | clock        | *s*                           | fp64_t  | Clock value (Epoch time). | Same as field type | 
+-----------+--------------+-------------------------------+---------+---------------------------+--------------------+
| Timezone  | tz           | *-*                           | int8_t  | Timezone.                 | min=-23,           | 
|           |              |                               |         |                           | max=23             | 
+-----------+--------------+-------------------------------+---------+---------------------------+--------------------+

.. _ClockControl-enum-op:

.. _ClockControl-enum-prefix-COP:

Enum Operation
^^^^^^^^^^^^^^^

Operation to perform.

- Abbreviation: op
- Prefix: COP

+-------+----------------+--------------+---------------------------------------------------+
| Value | Name           | Abbreviation | Description                                       | 
+=======+================+==============+===================================================+
| 0     | Execute Sync.  | SYNC_EXEC    | Synchronize clock according to given clock value. | 
+-------+----------------+--------------+---------------------------------------------------+
| 1     | Request Sync.  | SYNC_REQUEST | Request autonomous clock synchronization.         | 
+-------+----------------+--------------+---------------------------------------------------+
| 2     | Sync. Started  | SYNC_STARTED | Synchronization start notification.               | 
+-------+----------------+--------------+---------------------------------------------------+
| 3     | Sync. done     | SYNC_DONE    | Synchronization completion notification.          | 
+-------+----------------+--------------+---------------------------------------------------+
| 4     | Set Timezone   | SET_TZ       | Set timezone.                                     | 
+-------+----------------+--------------+---------------------------------------------------+
| 5     | Timezone Setup | SET_TZ_DONE  | Notification due to timezone modification.        | 
+-------+----------------+--------------+---------------------------------------------------+

.. _HistoricCTD:

Historic CTD
-------------

This message is used to store historic (transmitted afterwards) CTD data .

- Abbreviation: HistoricCTD
- Identification Number: 107
- Payload Size: 12 bytes
- Message Size: 34 bytes

+--------------+--------------+-------+--------+-------------+--------------------+
| Name         | Abbreviation | Unit  | Type   | Description | Range              | 
+==============+==============+=======+========+=============+====================+
| Conductivity | conductivity | *S/m* | fp32_t |             | Same as field type | 
+--------------+--------------+-------+--------+-------------+--------------------+
| Temperature  | temperature  | *°C*  | fp32_t |             | Same as field type | 
+--------------+--------------+-------+--------+-------------+--------------------+
| Depth        | depth        | *m*   | fp32_t |             | Same as field type | 
+--------------+--------------+-------+--------+-------------+--------------------+

.. _HistoricTelemetry:

Historic Telemetry
-------------------

This message is used to store historic (transmitted afterwards) telemetry information.

- Abbreviation: HistoricTelemetry
- Identification Number: 108
- Payload Size: 12 bytes
- Message Size: 34 bytes

+----------+--------------+------+----------+----------------------------------+--------------------+
| Name     | Abbreviation | Unit | Type     | Description                      | Range              | 
+==========+==============+======+==========+==================================+====================+
| Altitude | altitude     | *m*  | fp32_t   |                                  | Same as field type | 
+----------+--------------+------+----------+----------------------------------+--------------------+
| Roll     | roll         | *-*  | uint16_t | Roll encoded as α.(65535/(2.π))  | Same as field type | 
+----------+--------------+------+----------+----------------------------------+--------------------+
| Pitch    | pitch        | *-*  | uint16_t | Pitch encoded as α.(65535/(2.π)) | Same as field type | 
+----------+--------------+------+----------+----------------------------------+--------------------+
| Yaw      | yaw          | *-*  | uint16_t | Yaw encoded as α.(65535/(2.π))   | Same as field type | 
+----------+--------------+------+----------+----------------------------------+--------------------+
| Speed    | speed        | *dm* | int16_t  |                                  | Same as field type | 
+----------+--------------+------+----------+----------------------------------+--------------------+

.. _HistoricSonarData:

Historic Sonar Data
--------------------

This message is used to store historic (transmitted afterwards) sonar data.

- Abbreviation: HistoricSonarData
- Identification Number: 109
- Payload Size: 21+  bytes
- Message Size: 43+  bytes

+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit                                     | Type    | Description                                                   | Range              | 
+=================+==============+==========================================+=========+===============================================================+====================+
| Altitude        | altitude     | *m*                                      | fp32_t  |                                                               | Same as field type | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Width           | width        | *m*                                      | fp32_t  |                                                               | Same as field type | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Length          | length       | *m*                                      | fp32_t  |                                                               | Same as field type | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Bearing         | bearing      | *-*                                      | fp32_t  |                                                               | Same as field type | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Pixels Per Line | pxl          | *-*                                      | int16_t | The number of pixels per line as the data in 'sonar_data' may | Same as field type | 
|                 |              |                                          |         | correspond to more than one sequential sidescan lines.        |                    | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| Encoding        | encoding     | *Enumerated*                             | uint8_t |                                                               | Same as field type | 
|                 |              | (:ref:`HistoricSonarData-enum-encoding`) |         |                                                               |                    | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+
| SonarData       | sonar_data   | *-*                                      | rawdata | Sonar data encoded as in 'encoding'.                          | Same as field type | 
+-----------------+--------------+------------------------------------------+---------+---------------------------------------------------------------+--------------------+

.. _HistoricSonarData-enum-encoding:

.. _HistoricSonarData-enum-prefix-ENC:

Enum Encoding
^^^^^^^^^^^^^^

No description

- Abbreviation: encoding
- Prefix: ENC

+-------+-----------------------+--------------------+-------------+
| Value | Name                  | Abbreviation       | Description | 
+=======+=======================+====================+=============+
| 0     | One Byte Per Pixel    | ONE_BYTE_PER_PIXEL | *-*         | 
+-------+-----------------------+--------------------+-------------+
| 1     | PNG compressed image  | PNG                | *-*         | 
+-------+-----------------------+--------------------+-------------+
| 2     | JPEG compressed image | JPEG               | *-*         | 
+-------+-----------------------+--------------------+-------------+

.. _HistoricEvent:

Historic Event
---------------

This message is used to store historic event log entries.

- Abbreviation: HistoricEvent
- Identification Number: 110
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+------------+--------------+----------------------------------+-----------+----------------+--------------------+
| Name       | Abbreviation | Unit                             | Type      | Description    | Range              | 
+============+==============+==================================+===========+================+====================+
| Event      | text         | *-*                              | plaintext |                | Same as field type | 
+------------+--------------+----------------------------------+-----------+----------------+--------------------+
| Event Type | type         | *Enumerated*                     | uint8_t   | Type of event. | Same as field type | 
|            |              | (:ref:`HistoricEvent-enum-type`) |           |                |                    | 
+------------+--------------+----------------------------------+-----------+----------------+--------------------+

.. _HistoricEvent-enum-type:

.. _HistoricEvent-enum-prefix-EVTYPE:

Enum Event Type
^^^^^^^^^^^^^^^^

Type of event.

- Abbreviation: type
- Prefix: EVTYPE

+-------+-------------+--------------+-------------+
| Value | Name        | Abbreviation | Description | 
+=======+=============+==============+=============+
| 0     | Information | INFO         | *-*         | 
+-------+-------------+--------------+-------------+
| 1     | Error       | ERROR        | *-*         | 
+-------+-------------+--------------+-------------+

.. _VerticalProfile:

Vertical Profile
-----------------

This message is used to store historic profiles for water parameters: Temperature, Salinity, Chlorophyll...

- Abbreviation: VerticalProfile
- Identification Number: 111
- Payload Size: 20+  bytes
- Message Size: 42+  bytes

+-------------------+--------------+-----------------------------------------+------------------------+---------------------------------------------------------+--------------------+
| Name              | Abbreviation | Unit                                    | Type                   | Description                                             | Range              | 
+===================+==============+=========================================+========================+=========================================================+====================+
| Parameter         | parameter    | *Enumerated*                            | uint8_t                | Water parameter used to calculate the vertical profile. | Same as field type | 
|                   |              | (:ref:`VerticalProfile-enum-parameter`) |                        |                                                         |                    | 
+-------------------+--------------+-----------------------------------------+------------------------+---------------------------------------------------------+--------------------+
| Number of Samples | numSamples   | *-*                                     | uint8_t                |                                                         | Same as field type | 
+-------------------+--------------+-----------------------------------------+------------------------+---------------------------------------------------------+--------------------+
| Samples           | samples      | *-*                                     | message-list           |                                                         | Same as field type | 
|                   |              |                                         | (:ref:`ProfileSample`) |                                                         |                    | 
+-------------------+--------------+-----------------------------------------+------------------------+---------------------------------------------------------+--------------------+
| Latitude          | lat          | *rad*                                   | fp64_t                 | Latitude where the profile was calculated.              | Same as field type | 
+-------------------+--------------+-----------------------------------------+------------------------+---------------------------------------------------------+--------------------+
| Longitude         | lon          | *rad*                                   | fp64_t                 | Longitude where the profile was calculated.             | Same as field type | 
+-------------------+--------------+-----------------------------------------+------------------------+---------------------------------------------------------+--------------------+

.. _VerticalProfile-enum-parameter:

.. _VerticalProfile-enum-prefix-PROF:

Enum Parameter
^^^^^^^^^^^^^^^

Water parameter used to calculate the vertical profile.

- Abbreviation: parameter
- Prefix: PROF

+-------+--------------+--------------+-------------+
| Value | Name         | Abbreviation | Description | 
+=======+==============+==============+=============+
| 0     | Temperature  | TEMPERATURE  | *-*         | 
+-------+--------------+--------------+-------------+
| 1     | Salinity     | SALINITY     | *-*         | 
+-------+--------------+--------------+-------------+
| 2     | Conductivity | CONDUCTIVITY | *-*         | 
+-------+--------------+--------------+-------------+
| 3     | pH           | PH           | *-*         | 
+-------+--------------+--------------+-------------+
| 4     | Redox        | REDOX        | *-*         | 
+-------+--------------+--------------+-------------+
| 5     | Chlorophyll  | CHLOROPHYLL  | *-*         | 
+-------+--------------+--------------+-------------+
| 6     | Turbidity    | TURBIDITY    | *-*         | 
+-------+--------------+--------------+-------------+

.. _ProfileSample:

Profile Sample
---------------

Samples to calculate a vertical profile.

- Abbreviation: ProfileSample
- Identification Number: 112
- Payload Size: 6 bytes
- Message Size: 28 bytes

+---------+--------------+------+----------+-------------+--------------------+
| Name    | Abbreviation | Unit | Type     | Description | Range              | 
+=========+==============+======+==========+=============+====================+
| Depth   | depth        | *dm* | uint16_t |             | Same as field type | 
+---------+--------------+------+----------+-------------+--------------------+
| Average | avg          | *-*  | fp32_t   |             | Same as field type | 
+---------+--------------+------+----------+-------------+--------------------+

