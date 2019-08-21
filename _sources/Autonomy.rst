Autonomy Messages
==================

.. _VehicleLinks:

Vehicle Links
--------------

This message is sent by the TREX task which gives further information to a TREX instance about connected IMC nodes

- Abbreviation: VehicleLinks
- Identification Number: 650
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+--------------+--------------+------+-------------------+-------------------------------------------------------+--------------------+
| Name         | Abbreviation | Unit | Type              | Description                                           | Range              | 
+==============+==============+======+===================+=======================================================+====================+
| Local Name   | localname    | *-*  | plaintext         | The name of the vehicle being controlled              | Same as field type | 
+--------------+--------------+------+-------------------+-------------------------------------------------------+--------------------+
| Active Links | links        | *-*  | message-list      | A list of Announce messages with last announces heard | Same as field type | 
|              |              |      | (:ref:`Announce`) |                                                       |                    | 
+--------------+--------------+------+-------------------+-------------------------------------------------------+--------------------+

.. _TrexObservation:

TREX Observation
-----------------

This message is sent to TREX to post timeline observations

- Abbreviation: TrexObservation
- Identification Number: 651
- Payload Size: 6+  bytes
- Message Size: 28+  bytes
- Flags: deprecated

+------------+--------------+-------------+-----------+-------------+--------------------+
| Name       | Abbreviation | Unit        | Type      | Description | Range              | 
+============+==============+=============+===========+=============+====================+
| Timeline   | timeline     | *-*         | plaintext |             | Same as field type | 
+------------+--------------+-------------+-----------+-------------+--------------------+
| Predicate  | predicate    | *-*         | plaintext |             | Same as field type | 
+------------+--------------+-------------+-----------+-------------+--------------------+
| Attributes | attributes   | *TupleList* | plaintext |             | Same as field type | 
+------------+--------------+-------------+-----------+-------------+--------------------+

.. _TrexCommand:

TREX Command
-------------

This message is used to control TREX execution

- Abbreviation: TrexCommand
- Identification Number: 652
- Payload Size: 5+  bytes
- Message Size: 27+  bytes
- Flags: deprecated

+----------+--------------+-----------------------------------+-----------+--------------------------------------------------------------------------+--------------------+
| Name     | Abbreviation | Unit                              | Type      | Description                                                              | Range              | 
+==========+==============+===================================+===========+==========================================================================+====================+
| Command  | command      | *Enumerated*                      | uint8_t   |                                                                          | Same as field type | 
|          |              | (:ref:`TrexCommand-enum-command`) |           |                                                                          |                    | 
+----------+--------------+-----------------------------------+-----------+--------------------------------------------------------------------------+--------------------+
| Goal Id  | goal_id      | *-*                               | plaintext | The id of the goal, if applicable (OP == POST_GOAL || OP == RECALL_GOAL) | Same as field type | 
+----------+--------------+-----------------------------------+-----------+--------------------------------------------------------------------------+--------------------+
| Goal XML | goal_xml     | *-*                               | plaintext | The goal encoded as XML, if applicable (OP == POST_GOAL)                 | Same as field type | 
+----------+--------------+-----------------------------------+-----------+--------------------------------------------------------------------------+--------------------+

.. _TrexCommand-enum-command:

.. _TrexCommand-enum-prefix-OP:

Enum Command
^^^^^^^^^^^^^

No description

- Abbreviation: command
- Prefix: OP

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 0     | Disable TREX         | DISABLE      | *-*         | 
+-------+----------------------+--------------+-------------+
| 1     | Enable TREX          | ENABLE       | *-*         | 
+-------+----------------------+--------------+-------------+
| 2     | Post Goal            | POST_GOAL    | *-*         | 
+-------+----------------------+--------------+-------------+
| 3     | Recall Goal          | RECALL_GOAL  | *-*         | 
+-------+----------------------+--------------+-------------+
| 4     | Request current plan | REQUEST_PLAN | *-*         | 
+-------+----------------------+--------------+-------------+
| 5     | Report current plan  | REPORT_PLAN  | *-*         | 
+-------+----------------------+--------------+-------------+

.. _TrexOperation:

TREX Operation
---------------

This message is used to control TREX execution

- Abbreviation: TrexOperation
- Identification Number: 655
- Payload Size: 11+  bytes
- Message Size: 33+  bytes

+-----------+--------------+--------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Name      | Abbreviation | Unit                           | Type               | Description                                                                     | Range              | 
+===========+==============+================================+====================+=================================================================================+====================+
| Operation | op           | *Enumerated*                   | uint8_t            |                                                                                 | Same as field type | 
|           |              | (:ref:`TrexOperation-enum-op`) |                    |                                                                                 |                    | 
+-----------+--------------+--------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Goal Id   | goal_id      | *-*                            | plaintext          | The id of the goal, if applicable (OP == POST_GOAL || OP == RECALL_GOAL)        | Same as field type | 
+-----------+--------------+--------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+
| Token     | token        | *-*                            | message            | Goal / observation to post, if applicable (OP == POST_GOAL || OP == POST_TOKEN) | Same as field type | 
|           |              |                                | (:ref:`TrexToken`) |                                                                                 |                    | 
+-----------+--------------+--------------------------------+--------------------+---------------------------------------------------------------------------------+--------------------+

.. _TrexOperation-enum-op:

.. _TrexOperation-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

No description

- Abbreviation: op
- Prefix: OP

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 1     | Post Token           | POST_TOKEN   | *-*         | 
+-------+----------------------+--------------+-------------+
| 2     | Post Goal            | POST_GOAL    | *-*         | 
+-------+----------------------+--------------+-------------+
| 3     | Recall Goal          | RECALL_GOAL  | *-*         | 
+-------+----------------------+--------------+-------------+
| 4     | Request current plan | REQUEST_PLAN | *-*         | 
+-------+----------------------+--------------+-------------+
| 5     | Report current plan  | REPORT_PLAN  | *-*         | 
+-------+----------------------+--------------+-------------+

.. _TrexAttribute:

TREX Attribute
---------------

No description

- Abbreviation: TrexAttribute
- Identification Number: 656
- Payload Size: 7+  bytes
- Message Size: 29+  bytes

+----------------+--------------+---------------------------------------+-----------+----------------------------------------------------------+--------------------+
| Name           | Abbreviation | Unit                                  | Type      | Description                                              | Range              | 
+================+==============+=======================================+===========+==========================================================+====================+
| Attribute Name | name         | *-*                                   | plaintext | Name of this attribute.                                  | Same as field type | 
+----------------+--------------+---------------------------------------+-----------+----------------------------------------------------------+--------------------+
| Attribute type | attr_type    | *Enumerated*                          | uint8_t   |                                                          | Same as field type | 
|                |              | (:ref:`TrexAttribute-enum-attr_type`) |           |                                                          |                    | 
+----------------+--------------+---------------------------------------+-----------+----------------------------------------------------------+--------------------+
| Minimum        | min          | *-*                                   | plaintext | Lower bound of this interval. Empty text means no bound. | Same as field type | 
+----------------+--------------+---------------------------------------+-----------+----------------------------------------------------------+--------------------+
| Maximum        | max          | *-*                                   | plaintext | Upper bound of this interval. Empty text means no bound. | Same as field type | 
+----------------+--------------+---------------------------------------+-----------+----------------------------------------------------------+--------------------+

.. _TrexAttribute-enum-attr_type:

.. _TrexAttribute-enum-prefix-TYPE:

Enum Attribute type
^^^^^^^^^^^^^^^^^^^^

No description

- Abbreviation: attr_type
- Prefix: TYPE

+-------+-------------------+--------------+-------------+
| Value | Name              | Abbreviation | Description | 
+=======+===================+==============+=============+
| 1     | Boolean Domain    | BOOL         | *-*         | 
+-------+-------------------+--------------+-------------+
| 2     | Integer Domain    | INT          | *-*         | 
+-------+-------------------+--------------+-------------+
| 3     | Float Domain      | FLOAT        | *-*         | 
+-------+-------------------+--------------+-------------+
| 4     | String Domain     | STRING       | *-*         | 
+-------+-------------------+--------------+-------------+
| 5     | Enumerated Domain | ENUM         | *-*         | 
+-------+-------------------+--------------+-------------+

.. _TrexToken:

TREX Token
-----------

No description

- Abbreviation: TrexToken
- Identification Number: 657
- Payload Size: 6+  bytes
- Message Size: 28+  bytes

+------------+--------------+------+------------------------+-------------+--------------------+
| Name       | Abbreviation | Unit | Type                   | Description | Range              | 
+============+==============+======+========================+=============+====================+
| Timeline   | timeline     | *-*  | plaintext              |             | Same as field type | 
+------------+--------------+------+------------------------+-------------+--------------------+
| Predicate  | predicate    | *-*  | plaintext              |             | Same as field type | 
+------------+--------------+------+------------------------+-------------+--------------------+
| Attributes | attributes   | *-*  | message-list           |             | Same as field type | 
|            |              |      | (:ref:`TrexAttribute`) |             |                    | 
+------------+--------------+------+------------------------+-------------+--------------------+

.. _TrexPlan:

TREX Plan
----------

No description

- Abbreviation: TrexPlan
- Identification Number: 658
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+--------------+--------------+------+--------------------+-------------+--------------------+
| Name         | Abbreviation | Unit | Type               | Description | Range              | 
+==============+==============+======+====================+=============+====================+
| Reactor name | reactor      | *-*  | plaintext          |             | Same as field type | 
+--------------+--------------+------+--------------------+-------------+--------------------+
| Tokens       | tokens       | *-*  | message-list       |             | Same as field type | 
|              |              |      | (:ref:`TrexToken`) |             |                    | 
+--------------+--------------+------+--------------------+-------------+--------------------+

.. _Event:

Event
------

This message is used for signaling asynchronous events between different (sub) systems.

- Abbreviation: Event
- Identification Number: 660
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+-------+--------------+-------------+-----------+------------------------------------------+--------------------+
| Name  | Abbreviation | Unit        | Type      | Description                              | Range              | 
+=======+==============+=============+===========+==========================================+====================+
| Topic | topic        | *-*         | plaintext | The name or type of this event           | Same as field type | 
+-------+--------------+-------------+-----------+------------------------------------------+--------------------+
| Data  | data         | *TupleList* | plaintext | A map with additional event information. | Same as field type | 
+-------+--------------+-------------+-----------+------------------------------------------+--------------------+

