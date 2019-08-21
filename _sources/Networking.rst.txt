Networking Messages
====================

.. _Heartbeat:

Heartbeat
----------

The Heartbeat message is used to inform other modules that the
sending entity's system is running normally and communications
are alive.

- Abbreviation: Heartbeat
- Identification Number: 150
- Payload Size: 0 bytes
- Message Size: 22 bytes
- Flags: periodic

This message has no fields.

.. _Announce:

Announce
---------

A system description that is to be broadcasted to other systems.

- Abbreviation: Announce
- Identification Number: 151
- Payload Size: 27+  bytes
- Message Size: 49+  bytes

+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Name             | Abbreviation | Unit                     | Type      | Description                                                           | Range                    | 
+==================+==============+==========================+===========+=======================================================================+==========================+
| System Name      | sys_name     | *-*                      | plaintext | System name.                                                          | Same as field type       | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| System Type      | sys_type     | *Enumerated*             | uint8_t   | System type.                                                          | Same as field type       | 
|                  |              | (:ref:`enum-SystemType`) |           |                                                                       |                          | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Control Owner    | owner        | *-*                      | uint16_t  | The owner IMC system ID.                                              | Same as field type       | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Latitude WGS-84  | lat          | *rad*                    | fp64_t    | WGS-84 Latitude. If lat=0 and lon=0 means location value is unknown.  | min=-1.5707963267948966, | 
|                  |              |                          |           |                                                                       | max=1.5707963267948966   | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Longitude WGS-84 | lon          | *rad*                    | fp64_t    | WGS-84 Longitude. If lat=0 and lon=0 means location value is unknown. | min=-3.141592653589793,  | 
|                  |              |                          |           |                                                                       | max=3.141592653589793    | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Height WGS-84    | height       | *m*                      | fp32_t    | Height above WGS-84 ellipsoid.                                        | Same as field type       | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+
| Services         | services     | *-*                      | plaintext | Semicolon separated list of URLs. Examples of such URLs are:          | Same as field type       | 
|                  |              |                          |           |                                                                       |                          | 
|                  |              |                          |           | - *imc+udp://192.168.106.34:6002/*                                    |                          | 
|                  |              |                          |           | - *dune://0.0.0.0/uid/1294925553839635/*                              |                          | 
|                  |              |                          |           | - *http://192.168.106.34/dune/*.                                      |                          | 
+------------------+--------------+--------------------------+-----------+-----------------------------------------------------------------------+--------------------------+

.. _AnnounceService:

Announce Service
-----------------

Announcement about the existence of a service.

- Abbreviation: AnnounceService
- Identification Number: 152
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+-------------+--------------+------------------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| Name        | Abbreviation | Unit                                           | Type      | Description                                                   | Range              | 
+=============+==============+================================================+===========+===============================================================+====================+
| Service     | service      | *-*                                            | plaintext | Semicolon separated list of URLs (see :ref:`Announce`).       | Same as field type | 
+-------------+--------------+------------------------------------------------+-----------+---------------------------------------------------------------+--------------------+
| ServiceType | service_type | *Bitfield*                                     | uint8_t   | Informs about the availability of the service on internal and | Same as field type | 
|             |              | (:ref:`AnnounceService-bitfield-service_type`) |           | external networks.                                            |                    | 
+-------------+--------------+------------------------------------------------+-----------+---------------------------------------------------------------+--------------------+

.. _AnnounceService-bitfield-service_type:

.. _AnnounceService-bitfield-prefix-SRV_TYPE:

Bitfield ServiceType
^^^^^^^^^^^^^^^^^^^^^

Informs about the availability of the service on internal and
external networks.

- Abbreviation: service_type
- Prefix: SRV_TYPE

+-------+----------+--------------+-------------+
| Value | Name     | Abbreviation | Description | 
+=======+==========+==============+=============+
| 0x01  | External | EXTERNAL     | *-*         | 
+-------+----------+--------------+-------------+
| 0x02  | Local    | LOCAL        | *-*         | 
+-------+----------+--------------+-------------+

.. _RSSI:

Receive Signal Strength Information
------------------------------------

Measure of the RSSI by a networking device.
Indicates the gain or loss in the signal strength due to the transmission and reception equipment and the transmission medium and distance.

- Abbreviation: RSSI
- Identification Number: 153
- Payload Size: 4 bytes
- Message Size: 26 bytes

+-------+--------------+------+--------+-------------------+---------+
| Name  | Abbreviation | Unit | Type   | Description       | Range   | 
+=======+==============+======+========+===================+=========+
| Value | value        | *%*  | fp32_t | RSSI measurement. | max=100 | 
+-------+--------------+------+--------+-------------------+---------+

.. _VSWR:

Voltage Standing Wave Ratio
----------------------------

Measure of the VSWR by a networking device.

- Abbreviation: VSWR
- Identification Number: 154
- Payload Size: 4 bytes
- Message Size: 26 bytes

+-------+--------------+------+--------+-------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description       | Range              | 
+=======+==============+======+========+===================+====================+
| Value | value        | *-*  | fp32_t | VSWR measurement. | Same as field type | 
+-------+--------------+------+--------+-------------------+--------------------+

.. _LinkLevel:

Link Level
-----------

Measurement of link level quality. For instance, this may
correspond to the acknowledgment ratio of a link. But,
generally, the measure is link-dependent.

- Abbreviation: LinkLevel
- Identification Number: 155
- Payload Size: 4 bytes
- Message Size: 26 bytes

+-------+--------------+------+--------+-------------------+--------------------+
| Name  | Abbreviation | Unit | Type   | Description       | Range              | 
+=======+==============+======+========+===================+====================+
| Value | value        | *-*  | fp32_t | Link level value. | Same as field type | 
+-------+--------------+------+--------+-------------------+--------------------+

.. _Sms:

SMS
----

Send a SMS message.

- Abbreviation: Sms
- Identification Number: 156
- Payload Size: 6+  bytes
- Message Size: 28+  bytes
- Flags: deprecated

+----------+--------------+------+-----------+------------------------------+--------------------+
| Name     | Abbreviation | Unit | Type      | Description                  | Range              | 
+==========+==============+======+===========+==============================+====================+
| Number   | number       | *-*  | plaintext | Target mobile device number. | Same as field type | 
+----------+--------------+------+-----------+------------------------------+--------------------+
| Timeout  | timeout      | *-*  | uint16_t  | Timeout for sending message. | Same as field type | 
+----------+--------------+------+-----------+------------------------------+--------------------+
| Contents | contents     | *-*  | plaintext | Message contents.            | Same as field type | 
+----------+--------------+------+-----------+------------------------------+--------------------+

.. _SmsTx:

SMS Transmit
-------------

Request to send SMS.

- Abbreviation: SmsTx
- Identification Number: 157
- Payload Size: 10+  bytes
- Message Size: 32+  bytes

+-----------------+--------------+------+-----------+----------------------------------+--------------------+
| Name            | Abbreviation | Unit | Type      | Description                      | Range              | 
+=================+==============+======+===========+==================================+====================+
| Sequence Number | seq          | *-*  | uint32_t  | Sequence number.                 | Same as field type | 
+-----------------+--------------+------+-----------+----------------------------------+--------------------+
| Destination     | destination  | *-*  | plaintext | Number or name of the recipient. | Same as field type | 
+-----------------+--------------+------+-----------+----------------------------------+--------------------+
| Timeout         | timeout      | *s*  | uint16_t  | Timeout for sending message.     | Same as field type | 
+-----------------+--------------+------+-----------+----------------------------------+--------------------+
| Data            | data         | *-*  | rawdata   | Message data.                    | Same as field type | 
+-----------------+--------------+------+-----------+----------------------------------+--------------------+

.. _SmsRx:

SMS Receive
------------

Received SMS data.

- Abbreviation: SmsRx
- Identification Number: 158
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+--------+--------------+------+-----------+-------------------------------+--------------------+
| Name   | Abbreviation | Unit | Type      | Description                   | Range              | 
+========+==============+======+===========+===============================+====================+
| Source | source       | *-*  | plaintext | Number of name of the sender. | Same as field type | 
+--------+--------------+------+-----------+-------------------------------+--------------------+
| Data   | data         | *-*  | rawdata   | Message data.                 | Same as field type | 
+--------+--------------+------+-----------+-------------------------------+--------------------+

.. _SmsState:

SMS State
----------

No description

- Abbreviation: SmsState
- Identification Number: 159
- Payload Size: 7+  bytes
- Message Size: 29+  bytes

+-----------------+--------------+------------------------------+-----------+--------------------------------------+--------------------+
| Name            | Abbreviation | Unit                         | Type      | Description                          | Range              | 
+=================+==============+==============================+===========+======================================+====================+
| Sequence Number | seq          | *-*                          | uint32_t  | Sequence number.                     | Same as field type | 
+-----------------+--------------+------------------------------+-----------+--------------------------------------+--------------------+
| State           | state        | *Enumerated*                 | uint8_t   | Current state of an SMS transaction. | Same as field type | 
|                 |              | (:ref:`SmsState-enum-state`) |           |                                      |                    | 
+-----------------+--------------+------------------------------+-----------+--------------------------------------+--------------------+
| Error Message   | error        | *-*                          | plaintext |                                      | Same as field type | 
+-----------------+--------------+------------------------------+-----------+--------------------------------------+--------------------+

.. _SmsState-enum-state:

.. _SmsState-enum-prefix-SMS:

Enum State
^^^^^^^^^^^

Current state of an SMS transaction.

- Abbreviation: state
- Prefix: SMS

+-------+--------------+--------------+-------------+
| Value | Name         | Abbreviation | Description | 
+=======+==============+==============+=============+
| 0     | Accepted     | ACCEPTED     | *-*         | 
+-------+--------------+--------------+-------------+
| 1     | Rejected     | REJECTED     | *-*         | 
+-------+--------------+--------------+-------------+
| 2     | Interrupted  | INTERRUPTED  | *-*         | 
+-------+--------------+--------------+-------------+
| 3     | Completed    | COMPLETED    | *-*         | 
+-------+--------------+--------------+-------------+
| 4     | Idle         | IDLE         | *-*         | 
+-------+--------------+--------------+-------------+
| 5     | Transmitting | TRANSMITTING | *-*         | 
+-------+--------------+--------------+-------------+
| 6     | Receiving    | RECEIVING    | *-*         | 
+-------+--------------+--------------+-------------+

.. _TextMessage:

Text Message
-------------

A text message has been received.

- Abbreviation: TextMessage
- Identification Number: 160
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+--------+--------------+------+-----------+----------------------------+--------------------+
| Name   | Abbreviation | Unit | Type      | Description                | Range              | 
+========+==============+======+===========+============================+====================+
| Origin | origin       | *-*  | plaintext | Message origin (if known). | Same as field type | 
+--------+--------------+------+-----------+----------------------------+--------------------+
| Text   | text         | *-*  | plaintext | Message contents.          | Same as field type | 
+--------+--------------+------+-----------+----------------------------+--------------------+

.. _IridiumMsgRx:

Received Iridium Message
-------------------------

No description

- Abbreviation: IridiumMsgRx
- Identification Number: 170
- Payload Size: 28+  bytes
- Message Size: 50+  bytes

+---------------------+--------------+-------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Name                | Abbreviation | Unit  | Type      | Description                                                                          | Range              | 
+=====================+==============+=======+===========+======================================================================================+====================+
| Origin Identifier   | origin       | *-*   | plaintext | The unique identifier of this message's origin device (e.g. lauv-xtreme-2, manta-0). | Same as field type | 
+---------------------+--------------+-------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Timestamp           | htime        | *s*   | fp64_t    | Timestamp (Epoch time).                                                              | Same as field type | 
+---------------------+--------------+-------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Latitude Reference  | lat          | *rad* | fp64_t    |                                                                                      | Same as field type | 
+---------------------+--------------+-------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Longitude Reference | lon          | *rad* | fp64_t    |                                                                                      | Same as field type | 
+---------------------+--------------+-------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Data                | data         | *-*   | rawdata   | Message data.                                                                        | Same as field type | 
+---------------------+--------------+-------+-----------+--------------------------------------------------------------------------------------+--------------------+

.. _IridiumMsgTx:

Transmit Iridium Message
-------------------------

No description

- Abbreviation: IridiumMsgTx
- Identification Number: 171
- Payload Size: 8+  bytes
- Message Size: 30+  bytes

+------------------------+--------------+------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Name                   | Abbreviation | Unit | Type      | Description                                                                          | Range              | 
+========================+==============+======+===========+======================================================================================+====================+
| Request Identifier     | req_id       | *-*  | uint16_t  | The request identifier used to receive transmission updates.                         | Same as field type | 
+------------------------+--------------+------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Time to live           | ttl          | *s*  | uint16_t  | Time, in seconds, after which there will be no more atempts to transmit the message. | Same as field type | 
+------------------------+--------------+------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Destination Identifier | destination  | *-*  | plaintext | The unique identifier of this message's destination (e.g. lauv-xtreme-2, manta-0).   | Same as field type | 
+------------------------+--------------+------+-----------+--------------------------------------------------------------------------------------+--------------------+
| Data                   | data         | *-*  | rawdata   | Message data.                                                                        | Same as field type | 
+------------------------+--------------+------+-----------+--------------------------------------------------------------------------------------+--------------------+

.. _IridiumTxStatus:

Iridium Transmission Status
----------------------------

No description

- Abbreviation: IridiumTxStatus
- Identification Number: 172
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+--------------------+--------------+--------------------------------------+-----------+-------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit                                 | Type      | Description                                                 | Range              | 
+====================+==============+======================================+===========+=============================================================+====================+
| Request Identifier | req_id       | *-*                                  | uint16_t  | The request identifier used to receive transmission updates | Same as field type | 
+--------------------+--------------+--------------------------------------+-----------+-------------------------------------------------------------+--------------------+
| Status Code        | status       | *Enumerated*                         | uint8_t   |                                                             | Same as field type | 
|                    |              | (:ref:`IridiumTxStatus-enum-status`) |           |                                                             |                    | 
+--------------------+--------------+--------------------------------------+-----------+-------------------------------------------------------------+--------------------+
| Status Text        | text         | *-*                                  | plaintext |                                                             | Same as field type | 
+--------------------+--------------+--------------------------------------+-----------+-------------------------------------------------------------+--------------------+

.. _IridiumTxStatus-enum-status:

.. _IridiumTxStatus-enum-prefix-TXSTATUS:

Enum Status Code
^^^^^^^^^^^^^^^^^

No description

- Abbreviation: status
- Prefix: TXSTATUS

+-------+---------------------------------------------------+--------------+-------------+
| Value | Name                                              | Abbreviation | Description | 
+=======+===================================================+==============+=============+
| 1     | Successfull transmission                          | OK           | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 2     | Error while trying to transmit message            | ERROR        | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 3     | Message has been queued for transmission          | QUEUED       | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 4     | Message is currently being transmitted            | TRANSMIT     | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 5     | Message's TTL has expired. Transmition cancelled. | EXPIRED      | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+
| 6     | No more messages to be transmitted or received.   | EMPTY        | *-*         | 
+-------+---------------------------------------------------+--------------+-------------+

.. _GroupMembershipState:

Group Membership State
-----------------------

Group communication link assertion.

- Abbreviation: GroupMembershipState
- Identification Number: 180
- Payload Size: 6+  bytes
- Message Size: 28+  bytes
- Flags: periodic

+-------------------------------+--------------+------+-----------+---------------------------------------------------------+--------------------+
| Name                          | Abbreviation | Unit | Type      | Description                                             | Range              | 
+===============================+==============+======+===========+=========================================================+====================+
| Group Name                    | group_name   | *-*  | plaintext | Name of the group of systems.                           | Same as field type | 
+-------------------------------+--------------+------+-----------+---------------------------------------------------------+--------------------+
| Communication Links Assertion | links        | *-*  | uint32_t  | Communication link assertion for each group member.     | Same as field type | 
|                               |              |      |           | One bit to assert each system communication link state. |                    | 
+-------------------------------+--------------+------+-----------+---------------------------------------------------------+--------------------+

.. _SystemGroup:

System Group
-------------

Group of systems configuration.

- Abbreviation: SystemGroup
- Identification Number: 181
- Payload Size: 5+  bytes
- Message Size: 27+  bytes

+-------------------+--------------+----------------------------------+-----------+------------------------------------------------------------+--------------------+
| Name              | Abbreviation | Unit                             | Type      | Description                                                | Range              | 
+===================+==============+==================================+===========+============================================================+====================+
| Group Name        | GroupName    | *-*                              | plaintext | Name of the group of systems.                              | Same as field type | 
+-------------------+--------------+----------------------------------+-----------+------------------------------------------------------------+--------------------+
| Group List Action | Action       | *Enumerated*                     | uint8_t   | Actions on the group list.                                 | Same as field type | 
|                   |              | (:ref:`SystemGroup-enum-Action`) |           |                                                            |                    | 
+-------------------+--------------+----------------------------------+-----------+------------------------------------------------------------+--------------------+
| Systems Name List | GroupList    | *-*                              | plaintext | List of names of system in the group, separated by commas. | Same as field type | 
+-------------------+--------------+----------------------------------+-----------+------------------------------------------------------------+--------------------+

.. _SystemGroup-enum-Action:

.. _SystemGroup-enum-prefix-OP:

Enum Group List Action
^^^^^^^^^^^^^^^^^^^^^^^

Actions on the group list.

- Abbreviation: Action
- Prefix: OP

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Disband | Dis          | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Set     | Set          | *-*         | 
+-------+---------+--------------+-------------+
| 2     | Request | Req          | *-*         | 
+-------+---------+--------------+-------------+
| 3     | Change  | Chg          | *-*         | 
+-------+---------+--------------+-------------+
| 4     | Report  | Rep          | *-*         | 
+-------+---------+--------------+-------------+
| 5     | Force   | Frc          | *-*         | 
+-------+---------+--------------+-------------+

.. _LinkLatency:

Link Latency
-------------

Communications latency between two systems.

- Abbreviation: LinkLatency
- Identification Number: 182
- Payload Size: 6 bytes
- Message Size: 28 bytes

+---------------------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Name                            | Abbreviation | Unit | Type     | Description                                                    | Range              | 
+=================================+==============+======+==========+================================================================+====================+
| Value                           | value        | *s*  | fp32_t   | Time taken between the communications package/message is sent  | min=0              | 
|                                 |              |      |          | from the source until it arrives to the destination.           |                    | 
+---------------------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+
| Communications Source System ID | sys_src      | *-*  | uint16_t | ID of system that was the source of the communication package. | Same as field type | 
+---------------------------------+--------------+------+----------+----------------------------------------------------------------+--------------------+

.. _ExtendedRSSI:

Extended Receive Signal Strength Information
---------------------------------------------

Measure of the RSSI by a networking device.
Indicates the gain or loss in the signal strenght due to the transmission
and reception equipment and the transmission medium and distance.

- Abbreviation: ExtendedRSSI
- Identification Number: 183
- Payload Size: 5 bytes
- Message Size: 27 bytes

+------------+--------------+-------------------------+---------+----------------------------------------------+--------------------+
| Name       | Abbreviation | Unit                    | Type    | Description                                  | Range              | 
+============+==============+=========================+=========+==============================================+====================+
| Value      | value        | *-*                     | fp32_t  | RSSI measurement.                            | Same as field type | 
+------------+--------------+-------------------------+---------+----------------------------------------------+--------------------+
| RSSI Units | units        | *Enumerated*            | uint8_t | Indicates the units used for the RSSI value. | Same as field type | 
|            |              | (:ref:`enum-RSSIUnits`) |         |                                              |                    | 
+------------+--------------+-------------------------+---------+----------------------------------------------+--------------------+

.. _HistoricData:

Historic Data Series
---------------------

This message holds a list of inline data samples produced by one or more vehicles in the past.
It is used to transfer data over disruption tolerant networks.

- Abbreviation: HistoricData
- Identification Number: 184
- Payload Size: 14+  bytes
- Message Size: 36+  bytes

+----------------+--------------+------+---------------------+---------------------------------------------------------------------------------+--------------------+
| Name           | Abbreviation | Unit | Type                | Description                                                                     | Range              | 
+================+==============+======+=====================+=================================================================================+====================+
| Base Latitude  | base_lat     | *°*  | fp32_t              | All data sent inside this message will have offsets relative to this latitude.  | Same as field type | 
+----------------+--------------+------+---------------------+---------------------------------------------------------------------------------+--------------------+
| Base Longitude | base_lon     | *°*  | fp32_t              | All data sent inside this message will have offsets relative to this longitude. | Same as field type | 
+----------------+--------------+------+---------------------+---------------------------------------------------------------------------------+--------------------+
| Base Timestamp | base_time    | *s*  | fp32_t              | All data sent inside this message will use this time as the origin (0).         | Same as field type | 
+----------------+--------------+------+---------------------+---------------------------------------------------------------------------------+--------------------+
| Data           | data         | *-*  | message-list        |                                                                                 | Same as field type | 
|                |              |      | (:ref:`RemoteData`) |                                                                                 |                    | 
+----------------+--------------+------+---------------------+---------------------------------------------------------------------------------+--------------------+

.. _CompressedHistory:

Compressed Historic Data Series
--------------------------------

This message holds a list of inline data samples produced by one or more vehicles in the past.
It is used to transfer data over disruption tolerant networks.

- Abbreviation: CompressedHistory
- Identification Number: 185
- Payload Size: 14+  bytes
- Message Size: 36+  bytes

+----------------+--------------+------+---------+---------------------------------------------------------------------------------+--------------------+
| Name           | Abbreviation | Unit | Type    | Description                                                                     | Range              | 
+================+==============+======+=========+=================================================================================+====================+
| Base Latitude  | base_lat     | *°*  | fp32_t  | All data sent inside this message will have offsets relative to this latitude.  | Same as field type | 
+----------------+--------------+------+---------+---------------------------------------------------------------------------------+--------------------+
| Base Longitude | base_lon     | *°*  | fp32_t  | All data sent inside this message will have offsets relative to this longitude. | Same as field type | 
+----------------+--------------+------+---------+---------------------------------------------------------------------------------+--------------------+
| Base Timestamp | base_time    | *s*  | fp32_t  | All data sent inside this message will use this time as the origin (0).         | Same as field type | 
+----------------+--------------+------+---------+---------------------------------------------------------------------------------+--------------------+
| Data           | data         | *-*  | rawdata | A message-list of HistoricSample messages compressed with GZip algorithm.       | Same as field type | 
+----------------+--------------+------+---------+---------------------------------------------------------------------------------+--------------------+

.. _HistoricSample:

Historic Data Sample
---------------------

No description

- Abbreviation: HistoricSample
- Identification Number: 186
- Payload Size: 13+  bytes
- Message Size: 35+  bytes

+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| Name               | Abbreviation | Unit | Type     | Description                                                                                               | Range              | 
+====================+==============+======+==========+===========================================================================================================+====================+
| Original System Id | sys_id       | *-*  | uint16_t | The IMC identifier of the system that produced this sample.                                               | Same as field type | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| Priority           | priority     | *-*  | int8_t   | The priority for this data sample. Default priority is 0. Samples with                                    | Same as field type | 
|                    |              |      |          | higher priorities will *always* be transmitted before samples with lower                                  |                    | 
|                    |              |      |          | priorities. Samples with -127 priority will not be transmitted but just                                   |                    | 
|                    |              |      |          | logged to disk locally.                                                                                   |                    | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| X offset           | x            | *m*  | int16_t  | Northing offsets relative to base latitude / longitude expressed in the enclosing `HistoricData` message. | Same as field type | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| Y offset           | y            | *m*  | int16_t  | Easting offsets relative to base latitude / longitude expressed in the enclosing `HistoricData` message.  | Same as field type | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| Z offset           | z            | *dm* | int16_t  | Altitude / depth offsets relative to sea level expressed in decimeters.                                   | Same as field type | 
|                    |              |      |          | Negative values mean depth and positive values mean altitude.                                             |                    | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| Time offset        | t            | *s*  | int16_t  | Time offset in seconds relative to the base time expressed in the enclosing `HistoricData` message.       | Same as field type | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+
| Data Sample        | sample       | *-*  | message  |                                                                                                           | Same as field type | 
+--------------------+--------------+------+----------+-----------------------------------------------------------------------------------------------------------+--------------------+

.. _HistoricDataQuery:

Historic Data Query
--------------------

No description

- Abbreviation: HistoricDataQuery
- Identification Number: 187
- Payload Size: 21+  bytes
- Message Size: 43+  bytes

+--------------+--------------+--------------------------------------+-----------------------+-------------+--------------------+
| Name         | Abbreviation | Unit                                 | Type                  | Description | Range              | 
+==============+==============+======================================+=======================+=============+====================+
| Request Id   | req_id       | *-*                                  | uint16_t              |             | Same as field type | 
+--------------+--------------+--------------------------------------+-----------------------+-------------+--------------------+
| Request Type | type         | *Enumerated*                         | uint8_t               |             | Same as field type | 
|              |              | (:ref:`HistoricDataQuery-enum-type`) |                       |             |                    | 
+--------------+--------------+--------------------------------------+-----------------------+-------------+--------------------+
| Maximum Size | max_size     | *-*                                  | uint16_t              |             | Same as field type | 
+--------------+--------------+--------------------------------------+-----------------------+-------------+--------------------+
| Data         | data         | *-*                                  | message               |             | Same as field type | 
|              |              |                                      | (:ref:`HistoricData`) |             |                    | 
+--------------+--------------+--------------------------------------+-----------------------+-------------+--------------------+

.. _HistoricDataQuery-enum-type:

.. _HistoricDataQuery-enum-prefix-HRTYPE:

Enum Request Type
^^^^^^^^^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: HRTYPE

+-------+-------+--------------+----------------------------------------------------+
| Value | Name  | Abbreviation | Description                                        | 
+=======+=======+==============+====================================================+
| 1     | Query | QUERY        | Request data from the Data Store                   | 
+-------+-------+--------------+----------------------------------------------------+
| 2     | Reply | REPLY        | Data Store response with Data (using field 'data') | 
+-------+-------+--------------+----------------------------------------------------+
| 3     | Clear | CLEAR        | Clear 'data' from the Data Store                   | 
+-------+-------+--------------+----------------------------------------------------+

.. _RemoteCommand:

Remote Command
---------------

Command to remote system. If a system receives a RemoteCommand and it isn't the intended recipient, then it should
resend it.

- Abbreviation: RemoteCommand
- Identification Number: 188
- Payload Size: 14+  bytes
- Message Size: 36+  bytes

+-----------------+-----------------+------+----------+-----------------------------------------------------------------------------------------------------------------------+--------------------+
| Name            | Abbreviation    | Unit | Type     | Description                                                                                                           | Range              | 
+=================+=================+======+==========+=======================================================================================================================+====================+
| Original Source | original_source | *-*  | uint16_t | IMC id of the original sender.                                                                                        | Same as field type | 
+-----------------+-----------------+------+----------+-----------------------------------------------------------------------------------------------------------------------+--------------------+
| Destination     | destination     | *-*  | uint16_t | IMC id of the recipient.                                                                                              | Same as field type | 
+-----------------+-----------------+------+----------+-----------------------------------------------------------------------------------------------------------------------+--------------------+
| Timeout         | timeout         | *s*  | fp64_t   | Expiration time of the message (Epoch Time), in seconds. If the message doesn't reach the destination within timeout, | Same as field type | 
|                 |                 |      |          | the validity of the message expires and there will be no more attempts to transmit the message.                       |                    | 
+-----------------+-----------------+------+----------+-----------------------------------------------------------------------------------------------------------------------+--------------------+
| Command         | cmd             | *-*  | message  | Command to be unpacked by the recipient.                                                                              | Same as field type | 
+-----------------+-----------------+------+----------+-----------------------------------------------------------------------------------------------------------------------+--------------------+

.. _CommSystemsQuery:

Communication Systems Query
----------------------------

Presence of Communication Interfaces query. 

- Abbreviation: CommSystemsQuery
- Identification Number: 189
- Payload Size: 7+  bytes
- Message Size: 29+  bytes

+-------------------------+----------------+---------------------------------------------------+-----------+---------------------------------------------------+--------------------+
| Name                    | Abbreviation   | Unit                                              | Type      | Description                                       | Range              | 
+=========================+================+===================================================+===========+===================================================+====================+
| Type                    | type           | *Bitfield*                                        | uint8_t   |                                                   | Same as field type | 
|                         |                | (:ref:`CommSystemsQuery-bitfield-type`)           |           |                                                   |                    | 
+-------------------------+----------------+---------------------------------------------------+-----------+---------------------------------------------------+--------------------+
| Communication Interface | comm_interface | *Bitfield*                                        | uint16_t  | Communication interface to be used for reports.   | Same as field type | 
|                         |                | (:ref:`CommSystemsQuery-bitfield-comm_interface`) |           |                                                   |                    | 
+-------------------------+----------------+---------------------------------------------------+-----------+---------------------------------------------------+--------------------+
| Model                   | model          | *Enumerated*                                      | uint16_t  |                                                   | Same as field type | 
|                         |                | (:ref:`CommSystemsQuery-enum-model`)              |           |                                                   |                    | 
+-------------------------+----------------+---------------------------------------------------+-----------+---------------------------------------------------+--------------------+
| System List             | list           | *List*                                            | plaintext | Comma separated list of known Radio system names. | Same as field type | 
+-------------------------+----------------+---------------------------------------------------+-----------+---------------------------------------------------+--------------------+

.. _CommSystemsQuery-bitfield-type:

.. _CommSystemsQuery-bitfield-prefix-CIQ:

Bitfield Type
^^^^^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: CIQ

+-------+---------------+--------------+----------------------------------------------+
| Value | Name          | Abbreviation | Description                                  | 
+=======+===============+==============+==============================================+
| 0x01  | Query Systems | QUERY        | Query systems about communication capability | 
+-------+---------------+--------------+----------------------------------------------+
| 0x02  | Reply         | REPLY        | Reply systems about communication capability | 
+-------+---------------+--------------+----------------------------------------------+

.. _CommSystemsQuery-bitfield-comm_interface:

.. _CommSystemsQuery-bitfield-prefix-CIQ:

Bitfield Communication Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Communication interface to be used for reports.

- Abbreviation: comm_interface
- Prefix: CIQ

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

.. _CommSystemsQuery-enum-model:

.. _CommSystemsQuery-enum-prefix-CIQ:

Enum Model
^^^^^^^^^^^

No description

- Abbreviation: model
- Prefix: CIQ

+-------+------------+--------------+------------------------------------+
| Value | Name       | Abbreviation | Description                        | 
+=======+============+==============+====================================+
| 0x00  | unknown    | UNKNOWN      | Model is not defined               | 
+-------+------------+--------------+------------------------------------+
| 0x01  | 3DR        | M3DR         | Radio Model 3DR                    | 
+-------+------------+--------------+------------------------------------+
| 0x02  | RDFXXXxPtP | RDFXXXXPTP   | Radio Model RDFXXXx point to point | 
+-------+------------+--------------+------------------------------------+

.. _TelemetryMsg:

Telemetry Message
------------------

Message to handle telemetry transmissions.

- Abbreviation: TelemetryMsg
- Identification Number: 190
- Payload Size: 16+  bytes
- Message Size: 38+  bytes

+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Name                   | Abbreviation | Unit                                       | Type      | Description                                                                        | Range              | 
+========================+==============+============================================+===========+====================================================================================+====================+
| Type                   | type         | *Enumerated*                               | uint8_t   | Type of telemetry transmissions.                                                   | Same as field type | 
|                        |              | (:ref:`TelemetryMsg-enum-type`)            |           |                                                                                    |                    | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Request Identifier     | req_id       | *-*                                        | uint32_t  | The request identifier used to receive transmission updates.                       | Same as field type | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Time to live           | ttl          | *s*                                        | uint16_t  | Time, in seconds, which will be considered a non-transmitted message.              | Same as field type | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Code                   | code         | *Enumerated*                               | uint8_t   | Type of telemetry transmissions.                                                   | Same as field type | 
|                        |              | (:ref:`TelemetryMsg-enum-code`)            |           |                                                                                    |                    | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Destination Identifier | destination  | *-*                                        | plaintext | The unique identifier of this message's destination (e.g. lauv-xtreme-2, manta-0). | Same as field type | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Source Identifier      | Source       | *-*                                        | plaintext | The unique identifier of this message's destination (e.g. lauv-xtreme-2, manta-0). | Same as field type | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Acknowledge            | acknowledge  | *Bitfield*                                 | uint8_t   | Type of telemetry transmissions.                                                   | Same as field type | 
|                        |              | (:ref:`TelemetryMsg-bitfield-acknowledge`) |           |                                                                                    |                    | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Status                 | status       | *Enumerated*                               | uint8_t   | State of the transmitted message.                                                  | Same as field type | 
|                        |              | (:ref:`TelemetryMsg-enum-status`)          |           |                                                                                    |                    | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+
| Data                   | data         | *-*                                        | rawdata   |                                                                                    | Same as field type | 
+------------------------+--------------+--------------------------------------------+-----------+------------------------------------------------------------------------------------+--------------------+

.. _TelemetryMsg-enum-type:

.. _TelemetryMsg-enum-prefix-TM:

Enum Type
^^^^^^^^^^

Type of telemetry transmissions.

- Abbreviation: type
- Prefix: TM

+-------+----------+--------------+-----------------------------+
| Value | Name     | Abbreviation | Description                 | 
+=======+==========+==============+=============================+
| 0x01  | Tx       | TX           | Send telemetry data.        | 
+-------+----------+--------------+-----------------------------+
| 0x02  | Rx       | RX           | Received telemetry data.    | 
+-------+----------+--------------+-----------------------------+
| 0x03  | TxStatus | TXSTATUS     | Status of transmitted data. | 
+-------+----------+--------------+-----------------------------+

.. _TelemetryMsg-enum-code:

.. _TelemetryMsg-enum-prefix-TM:

Enum Code
^^^^^^^^^^

Type of telemetry transmissions.

- Abbreviation: code
- Prefix: TM

+-------+--------------+--------------+--------------------------------------------------------+
| Value | Name         | Abbreviation | Description                                            | 
+=======+==============+==============+========================================================+
| 0x00  | Code unknown | CODE_UNK     | Unknown code type                                      | 
+-------+--------------+--------------+--------------------------------------------------------+
| 0x01  | Code Report  | CODE_REPORT  | Concise representation of entire system state message. | 
|       |              |              | Payload message is a MessageList.                      | 
+-------+--------------+--------------+--------------------------------------------------------+
| 0x02  | Code IMC     | CODE_IMC     | Payload message is INLINEMSG                           | 
+-------+--------------+--------------+--------------------------------------------------------+
| 0x03  | Code raw     | CODE_RAW     | Payload message is in raw                              | 
+-------+--------------+--------------+--------------------------------------------------------+

.. _TelemetryMsg-bitfield-acknowledge:

.. _TelemetryMsg-bitfield-prefix-TM:

Bitfield Acknowledge
^^^^^^^^^^^^^^^^^^^^^

Type of telemetry transmissions.

- Abbreviation: acknowledge
- Prefix: TM

+-------+-----------------+--------------+-------------------------------------------------------------+
| Value | Name            | Abbreviation | Description                                                 | 
+=======+=================+==============+=============================================================+
| 0x00  | Not acknowledge | NAK          | Message transmitted without acknowledged reception response | 
+-------+-----------------+--------------+-------------------------------------------------------------+
| 0x01  | acknowledge     | AK           | Message transmitted with acknowledged reception response    | 
+-------+-----------------+--------------+-------------------------------------------------------------+

.. _TelemetryMsg-enum-status:

.. _TelemetryMsg-enum-prefix-TM:

Enum Status
^^^^^^^^^^^^

State of the transmitted message.

- Abbreviation: status
- Prefix: TM

+-------+--------------------------------------------------+--------------+-------------+
| Value | Name                                             | Abbreviation | Description | 
+=======+==================================================+==============+=============+
| 0x00  | Does not apply                                   | NONE         | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 1     | Successfull transmission                         | DONE         | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 2     | Error while trying to transmit message           | FAILED       | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 3     | Message has been queued for transmission         | QUEUED       | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 4     | Message is currently being transmitted           | TRANSMIT     | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 5     | Message's TTL has expired. Transmition cancelled | EXPIRED      | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 6     | No more messages to be transmitted or received   | EMPTY        | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 7     | Invalid address                                  | INV_ADDR     | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+
| 8     | Invalid transmission size                        | INV_SIZE     | *-*         | 
+-------+--------------------------------------------------+--------------+-------------+

