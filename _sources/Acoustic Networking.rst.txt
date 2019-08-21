Acoustic Networking Messages
=============================

.. _LblRange:

LBL Range
----------

When the vehicle uses Long Base Line navigation, this message
notifies that a new range was received from one of the acoustics
transponders. The message fields are used to identify the range
value and the transponder name.

- Abbreviation: LblRange
- Identification Number: 200
- Payload Size: 5 bytes
- Message Size: 27 bytes
- Flags: periodic

+------------------------------+--------------+------+---------+--------------------------------------------------------------+--------------------+
| Name                         | Abbreviation | Unit | Type    | Description                                                  | Range              | 
+==============================+==============+======+=========+==============================================================+====================+
| Beacon Identification Number | id           | *-*  | uint8_t | Identification number of the acoustic transponder from which | Same as field type | 
|                              |              |      |         | the range information was received.                          |                    | 
+------------------------------+--------------+------+---------+--------------------------------------------------------------+--------------------+
| Range                        | range        | *m*  | fp32_t  | Distance to the acoustic transponder.                        | Same as field type | 
+------------------------------+--------------+------+---------+--------------------------------------------------------------+--------------------+

.. _LblBeacon:

LBL Beacon Configuration
-------------------------

Position and configuration of an LBL transponder (beacon).

- Abbreviation: LblBeacon
- Identification Number: 202
- Payload Size: 25+  bytes
- Message Size: 47+  bytes

+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Name                  | Abbreviation      | Unit  | Type      | Description                             | Range                    | 
+=======================+===================+=======+===========+=========================================+==========================+
| Beacon Name           | beacon            | *-*   | plaintext | Name/Label of the acoustic transponder. | Same as field type       | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Latitude WGS-84       | lat               | *rad* | fp64_t    | WGS-84 Latitude coordinate.             | min=-1.5707963267948966, | 
|                       |                   |       |           |                                         | max=1.5707963267948966   | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Longitude WGS-84      | lon               | *rad* | fp64_t    | WGS-84 Longitude coordinate.            | min=-3.141592653589793,  | 
|                       |                   |       |           |                                         | max=3.141592653589793    | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Depth                 | depth             | *m*   | fp32_t    | The beacon's depth.                     | Same as field type       | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Interrogation channel | query_channel     | *-*   | uint8_t   | Interrogation channel.                  | Same as field type       | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Reply channel         | reply_channel     | *-*   | uint8_t   | Reply channel.                          | Same as field type       | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+
| Transponder delay     | transponder_delay | *ms*  | uint8_t   | Transponder delay.                      | Same as field type       | 
+-----------------------+-------------------+-------+-----------+-----------------------------------------+--------------------------+

.. _LblConfig:

LBL Configuration
------------------

Long Base Line configuration.

- Abbreviation: LblConfig
- Identification Number: 203
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-----------+--------------+----------------------------+--------------------+--------------------------------------------------------------+--------------------+
| Name      | Abbreviation | Unit                       | Type               | Description                                                  | Range              | 
+===========+==============+============================+====================+==============================================================+====================+
| Operation | op           | *Enumerated*               | uint8_t            | Used to define the type of the operation this message holds. | Same as field type | 
|           |              | (:ref:`LblConfig-enum-op`) |                    |                                                              |                    | 
+-----------+--------------+----------------------------+--------------------+--------------------------------------------------------------+--------------------+
| Beacons   | beacons      | *-*                        | message-list       | A list of LBL beacon configuration messages.                 | Same as field type | 
|           |              |                            | (:ref:`LblBeacon`) |                                                              |                    | 
+-----------+--------------+----------------------------+--------------------+--------------------------------------------------------------+--------------------+

.. _LblConfig-enum-op:

.. _LblConfig-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

Used to define the type of the operation this message holds.

- Abbreviation: op
- Prefix: OP

+-------+----------------------------+--------------+----------------------------------------------------------------+
| Value | Name                       | Abbreviation | Description                                                    | 
+=======+============================+==============+================================================================+
| 0     | Set LBL Configuration      | SET_CFG      | Set the beacons configuration aboard the vehicle.              | 
+-------+----------------------------+--------------+----------------------------------------------------------------+
| 1     | Retrieve LBL Configuration | GET_CFG      | Request the vehicle to send its current beacons configuration. | 
+-------+----------------------------+--------------+----------------------------------------------------------------+
| 2     | Reply to a GET command     | CUR_CFG      | *-*                                                            | 
+-------+----------------------------+--------------+----------------------------------------------------------------+

.. _AcousticMessage:

Acoustic Message
-----------------

Send an acoustic message.

- Abbreviation: AcousticMessage
- Identification Number: 206
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+-----------------+--------------+------+---------+------------------+--------------------+
| Name            | Abbreviation | Unit | Type    | Description      | Range              | 
+=================+==============+======+=========+==================+====================+
| Message to send | message      | *-*  | message | Message to send. | Same as field type | 
+-----------------+--------------+------+---------+------------------+--------------------+

.. _AcousticOperation:

Acoustic Operation
-------------------

Acoustic operation.

- Abbreviation: AcousticOperation
- Identification Number: 211
- Payload Size: 9+  bytes
- Message Size: 31+  bytes

+-----------------+--------------+------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit                               | Type      | Description                                               | Range              | 
+=================+==============+====================================+===========+===========================================================+====================+
| Operation       | op           | *Enumerated*                       | uint8_t   | Operation type.                                           | Same as field type | 
|                 |              | (:ref:`AcousticOperation-enum-op`) |           |                                                           |                    | 
+-----------------+--------------+------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| System          | system       | *-*                                | plaintext | The meaning of this field depends on the operation and is | Same as field type | 
|                 |              |                                    |           | explained in the operation's description.                 |                    | 
+-----------------+--------------+------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Range           | range        | *m*                                | fp32_t    | The meaning of this field depends on the operation and is | Same as field type | 
|                 |              |                                    |           | explained in the operation's description.                 |                    | 
+-----------------+--------------+------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Message To Send | msg          | *-*                                | message   | Argument for message send ('MSG') requests.               | Same as field type | 
+-----------------+--------------+------------------------------------+-----------+-----------------------------------------------------------+--------------------+

.. _AcousticOperation-enum-op:

.. _AcousticOperation-enum-prefix-AOP:

Enum Operation
^^^^^^^^^^^^^^^

Operation type.

- Abbreviation: op
- Prefix: AOP

+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| Value | Name                        | Abbreviation  | Description                                                            | 
+=======+=============================+===============+========================================================================+
| 0     | Abort                       | ABORT         | Send an abort through the acoustic channel to the system               | 
|       |                             |               | specified in the field 'system'.                                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 1     | Abort in Progress           | ABORT_IP      | The latest abort request to the system specified in the                | 
|       |                             |               | field 'system' is in progress.                                         | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 2     | Abort Timeout               | ABORT_TIMEOUT | The latest abort operation expired without acknowledgment              | 
|       |                             |               | from the system specified in the field 'system'.                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 3     | Abort Acknowledged          | ABORT_ACKED   | The latest abort operation was acknowledged by the system              | 
|       |                             |               | specified in the field 'system'.                                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 4     | Range Request               | RANGE         | Request a range through the acoustic channel to the system             | 
|       |                             |               | specified in the field 'system'.                                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 5     | Range in Progress           | RANGE_IP      | The latest range request to the system specified in the                | 
|       |                             |               | field 'system' is in progress.                                         | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 6     | Range Timeout               | RANGE_TIMEOUT | The latest range request operation expired without reply               | 
|       |                             |               | from the system specified in the field 'system'.                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 7     | Range Received              | RANGE_RECVED  | The latest range request operation to the system specified             | 
|       |                             |               | in the field 'system' was successful and the range is                  | 
|       |                             |               | specified in the field 'range'.                                        | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 8     | Modem is Busy               | BUSY          | The acoustic modem is busy and cannot execute the requested            | 
|       |                             |               | operation.                                                             | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 9     | Unsupported operation       | UNSUPPORTED   | The latest requested operation is not supported.                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 10    | Transducer Not Detected     | NO_TXD        | The transducer was not detected.                                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 11    | Send Message                | MSG           | Request message over acoustic channel. The message to send             | 
|       |                             |               | is specified by the 'msg' field.                                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 12    | Message Send -- Queued      | MSG_QUEUED    | Message send request has been queued.                                  | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 13    | Message Send -- In progress | MSG_IP        | Message send request is in progress.                                   | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 14    | Message Send -- Done        | MSG_DONE      | Message send request has been fulfilled.                               | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 15    | Message Send -- Failure     | MSG_FAILURE   | Message send request could not be fulfilled.                           | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 16    | Send Short Message          | MSG_SHORT     | Request message over acoustic channel. The message to send             | 
|       |                             |               | is specified by the 'msg' field.                                       | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+
| 17    | Initiate Reverse Range      | REVERSE_RANGE | Request sending updated position to remote system so it can be ranged. | 
+-------+-----------------------------+---------------+------------------------------------------------------------------------+

.. _AcousticSystemsQuery:

Acoustic Systems Query
-----------------------

Request a list of known underwater acoustic systems. The
recipient of this message shall reply with an AcousticSystems
message.

- Abbreviation: AcousticSystemsQuery
- Identification Number: 212
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _AcousticSystems:

Acoustic Systems
-----------------

This message is sent in reply to an AcousticSystemsQuery message
and lists all known underwater acoustic systems (modems, narrow
band transponders, etc).

- Abbreviation: AcousticSystems
- Identification Number: 213
- Payload Size: 2+  bytes
- Message Size: 24+  bytes

+-------------+--------------+--------+-----------+------------------------------------------------------+--------------------+
| Name        | Abbreviation | Unit   | Type      | Description                                          | Range              | 
+=============+==============+========+===========+======================================================+====================+
| System List | list         | *List* | plaintext | Comma separated list of known acoustic system names. | Same as field type | 
+-------------+--------------+--------+-----------+------------------------------------------------------+--------------------+

.. _AcousticLink:

Acoustic Link Quality
----------------------

This message is used to report the perceived link quality to other
acoustic peers.

- Abbreviation: AcousticLink
- Identification Number: 214
- Payload Size: 8+  bytes
- Message Size: 30+  bytes

+------------------------------------+--------------+------+-----------+--------------------------------------------------------------------------+--------------------+
| Name                               | Abbreviation | Unit | Type      | Description                                                              | Range              | 
+====================================+==============+======+===========+==========================================================================+====================+
| Peer Name                          | peer         | *-*  | plaintext | The name of the peer on the other side of this link.                     | Same as field type | 
+------------------------------------+--------------+------+-----------+--------------------------------------------------------------------------+--------------------+
| Received Signal Strength Indicator | rssi         | *dB* | fp32_t    | RSSI is a signed floating point number. Higher RSSI values correspond to | Same as field type | 
|                                    |              |      |           | stronger signals.                                                        |                    | 
|                                    |              |      |           | The signal strength is acceptable when measured RSSI values lie between  |                    | 
|                                    |              |      |           | -20 dB and -85 dB.                                                       |                    | 
+------------------------------------+--------------+------+-----------+--------------------------------------------------------------------------+--------------------+
| Signal Integrity Level             | integrity    | *-*  | uint16_t  | Signal Integrity value illustrates distortion of the last received       | Same as field type | 
|                                    |              |      |           | acoustic signal. It is calculated based on cross-correlation             |                    | 
|                                    |              |      |           | measurements.                                                            |                    | 
|                                    |              |      |           | Higher *Signal Integrity Level* values correspond to less distorted      |                    | 
|                                    |              |      |           | signals. An acoustic link is considered weak if the *Signal Integrity    |                    | 
|                                    |              |      |           | Level* value is less than 100.                                           |                    | 
+------------------------------------+--------------+------+-----------+--------------------------------------------------------------------------+--------------------+

.. _AcousticRequest:

Acoustic Transmission Request
------------------------------

Request Acoustic sending.

- Abbreviation: AcousticRequest
- Identification Number: 215
- Payload Size: 19+  bytes
- Message Size: 41+  bytes

+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit                               | Type      | Description                                                                                           | Range              | 
+====================+==============+====================================+===========+=======================================================================================================+====================+
| Request Identifier | req_id       | *-*                                | uint16_t  |                                                                                                       | Same as field type | 
+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+
| Destination System | destination  | *-*                                | plaintext | The name of the system where to send this message.                                                    | Same as field type | 
+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+
| Timeout            | timeout      | *s*                                | fp64_t    | Period of time to send message (in seconds).                                                          | Same as field type | 
+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+
| Range              | range        | *m*                                | fp32_t    | The meaning of this field depends on the operation and is                                             | Same as field type | 
|                    |              |                                    |           | explained in the operation's description.                                                             |                    | 
+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+
| Type               | type         | *Enumerated*                       | uint8_t   |                                                                                                       | Same as field type | 
|                    |              | (:ref:`AcousticRequest-enum-type`) |           |                                                                                                       |                    | 
+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+
| Message To Send    | msg          | *-*                                | message   | Argument for message send ('MSG') or ('RAW') but in this case expects DevDataBinary message requests. | Same as field type | 
+--------------------+--------------+------------------------------------+-----------+-------------------------------------------------------------------------------------------------------+--------------------+

.. _AcousticRequest-enum-type:

.. _AcousticRequest-enum-prefix-TYPE:

Enum Type
^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: TYPE

+-------+---------------+---------------+-------------+
| Value | Name          | Abbreviation  | Description | 
+=======+===============+===============+=============+
| 0     | Abort         | ABORT         | *-*         | 
+-------+---------------+---------------+-------------+
| 1     | Range         | RANGE         | *-*         | 
+-------+---------------+---------------+-------------+
| 2     | Reverse Range | REVERSE_RANGE | *-*         | 
+-------+---------------+---------------+-------------+
| 3     | Message       | MSG           | *-*         | 
+-------+---------------+---------------+-------------+
| 4     | Raw           | RAW           | *-*         | 
+-------+---------------+---------------+-------------+

.. _AcousticStatus:

Acoustic Transmission Status
-----------------------------

Reply sent in response to a Acoustic Text sending request.

- Abbreviation: AcousticStatus
- Identification Number: 216
- Payload Size: 10+  bytes
- Message Size: 32+  bytes

+--------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit                                | Type      | Description                                               | Range              | 
+====================+==============+=====================================+===========+===========================================================+====================+
| Request Identifier | req_id       | *-*                                 | uint16_t  |                                                           | Same as field type | 
+--------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Type               | type         | *Enumerated*                        | uint8_t   |                                                           | Same as field type | 
|                    |              | (:ref:`AcousticStatus-enum-type`)   |           |                                                           |                    | 
+--------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Status             | status       | *Enumerated*                        | uint8_t   |                                                           | Same as field type | 
|                    |              | (:ref:`AcousticStatus-enum-status`) |           |                                                           |                    | 
+--------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Information        | info         | *-*                                 | plaintext | Status description.                                       | Same as field type | 
+--------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+
| Range              | range        | *m*                                 | fp32_t    | The meaning of this field depends on the operation and is | Same as field type | 
|                    |              |                                     |           | explained in the operation's description.                 |                    | 
+--------------------+--------------+-------------------------------------+-----------+-----------------------------------------------------------+--------------------+

.. _AcousticStatus-enum-type:

.. _AcousticStatus-enum-prefix-TYPE:

Enum Type
^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: TYPE

+-------+---------------+---------------+-------------+
| Value | Name          | Abbreviation  | Description | 
+=======+===============+===============+=============+
| 0     | Abort         | ABORT         | *-*         | 
+-------+---------------+---------------+-------------+
| 1     | Range         | RANGE         | *-*         | 
+-------+---------------+---------------+-------------+
| 2     | Reverse Range | REVERSE_RANGE | *-*         | 
+-------+---------------+---------------+-------------+
| 3     | Message       | MSG           | *-*         | 
+-------+---------------+---------------+-------------+
| 4     | Raw           | RAW           | *-*         | 
+-------+---------------+---------------+-------------+

.. _AcousticStatus-enum-status:

.. _AcousticStatus-enum-prefix-STATUS:

Enum Status
^^^^^^^^^^^^

No description

- Abbreviation: status
- Prefix: STATUS

+-------+-----------------------------------------------+----------------+-------------+
| Value | Name                                          | Abbreviation   | Description | 
+=======+===============================================+================+=============+
| 0     | Queued                                        | QUEUED         | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 1     | In Progress                                   | IN_PROGRESS    | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 2     | Sent                                          | SENT           | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 3     | Range Received                                | RANGE_RECEIVED | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 100   | Busy                                          | BUSY           | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 101   | Input Error                                   | INPUT_FAILURE  | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 102   | Error trying to send acoustic text            | ERROR          | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+
| 666   | Message Type is not defined or is unsupported | UNSUPPORTED    | *-*         | 
+-------+-----------------------------------------------+----------------+-------------+

