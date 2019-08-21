Plan Supervision Messages
==========================

.. _Abort:

Abort
------

Stops any executing actions and put the system in a standby mode.

- Abbreviation: Abort
- Identification Number: 550
- Payload Size: 0 bytes
- Message Size: 22 bytes

This message has no fields.

.. _PlanSpecification:

Plan Specification
-------------------

Identity and description of a plan's general parameters,
associated with plan loading (i.e. load plan command in
*PlanCommand*).

A plan specification is defined by a plan identifier, a set of
maneuver specifications and a start maneuver from that set.

See the :ref:`PlanManeuver` message for details on maneuver
specification.

- Abbreviation: PlanSpecification
- Identification Number: 551
- Payload Size: 18+  bytes
- Message Size: 40+  bytes

+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Name              | Abbreviation  | Unit | Type                    | Description                                                    | Range              | 
+===================+===============+======+=========================+================================================================+====================+
| Plan ID           | plan_id       | *-*  | plaintext               | The plan's identifier.                                         | Same as field type | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Plan Description  | description   | *-*  | plaintext               | Verbose text description of plan.                              | Same as field type | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Namespace         | vnamespace    | *-*  | plaintext               | Namespace for plan variables.                                  | Same as field type | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Plan Variables    | variables     | *-*  | message-list            | Plan variables.                                                | Same as field type | 
|                   |               |      | (:ref:`PlanVariable`)   |                                                                |                    | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Starting maneuver | start_man_id  | *-*  | plaintext               | Indicates the id of the starting maneuver for this plan.       | Same as field type | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Maneuvers         | maneuvers     | *-*  | message-list            | List of maneuver specifications.                               | Same as field type | 
|                   |               |      | (:ref:`PlanManeuver`)   |                                                                |                    | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Transitions       | transitions   | *-*  | message-list            | List of maneuver specifications.                               | Same as field type | 
|                   |               |      | (:ref:`PlanTransition`) |                                                                |                    | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| Start Actions     | start_actions | *-*  | message-list            | Contains an optionally defined 'MessageList' for actions fired | Same as field type | 
|                   |               |      |                         | on plan activation.                                            |                    | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+
| End Actions       | end_actions   | *-*  | message-list            | Contains an optionally defined 'MessageList' for actions fired | Same as field type | 
|                   |               |      |                         | on plan termination.                                           |                    | 
+-------------------+---------------+------+-------------------------+----------------------------------------------------------------+--------------------+

.. _PlanManeuver:

Plan Maneuver
--------------

Named plan maneuver.

- Abbreviation: PlanManeuver
- Identification Number: 552
- Payload Size: 8+  bytes
- Message Size: 30+  bytes

+------------------------+---------------+------+-------------------+----------------------------------------------------------------+--------------------+
| Name                   | Abbreviation  | Unit | Type              | Description                                                    | Range              | 
+========================+===============+======+===================+================================================================+====================+
| Maneuver ID            | maneuver_id   | *-*  | plaintext         | The maneuver ID.                                               | Same as field type | 
+------------------------+---------------+------+-------------------+----------------------------------------------------------------+--------------------+
| Maneuver Specification | data          | *-*  | message           | The maneuver specification.                                    | Same as field type | 
|                        |               |      | (:ref:`Maneuver`) |                                                                |                    | 
+------------------------+---------------+------+-------------------+----------------------------------------------------------------+--------------------+
| Start Actions          | start_actions | *-*  | message-list      | Contains an optionally defined 'MessageList' for actions fired | Same as field type | 
|                        |               |      |                   | on plan activation.                                            |                    | 
+------------------------+---------------+------+-------------------+----------------------------------------------------------------+--------------------+
| End Actions            | end_actions   | *-*  | message-list      | Contains an optionally defined 'MessageList' for actions fired | Same as field type | 
|                        |               |      |                   | on plan termination.                                           |                    | 
+------------------------+---------------+------+-------------------+----------------------------------------------------------------+--------------------+

.. _PlanTransition:

Plan Transition
----------------

Describes a plan transition within a plan specification. A
transition states the vehicle conditions that must be met to
signal the transition, the maneuver that should be started as a
result, and an optional set of actions triggered by the
transition.

- Abbreviation: PlanTransition
- Identification Number: 553
- Payload Size: 8+  bytes
- Message Size: 30+  bytes

+---------------------------+--------------+------+--------------+----------------------------------------------------------------+--------------------+
| Name                      | Abbreviation | Unit | Type         | Description                                                    | Range              | 
+===========================+==============+======+==============+================================================================+====================+
| Source                    | source_man   | *-*  | plaintext    | Comma separated list of maneuver IDs, or the special value '.' | Same as field type | 
|                           |              |      |              | to identify a global plan transition.                          |                    | 
+---------------------------+--------------+------+--------------+----------------------------------------------------------------+--------------------+
| Destination Maneuver Name | dest_man     | *-*  | plaintext    | Target maneuver name.                                          | Same as field type | 
|                           |              |      |              | If it equals the special value '_done_' then plan should       |                    | 
|                           |              |      |              | terminate with a success status.                               |                    | 
|                           |              |      |              | If it equals the special value '_error_' then the plan should  |                    | 
|                           |              |      |              | terminate with an error status.                                |                    | 
+---------------------------+--------------+------+--------------+----------------------------------------------------------------+--------------------+
| Transition conditions     | conditions   | *-*  | plaintext    | Comma separated list of conditions for transition. Each        | Same as field type | 
|                           |              |      |              | condition identifier corresponds to a known predicate which is |                    | 
|                           |              |      |              | interpreted and tested internally by the vehicle.              |                    | 
+---------------------------+--------------+------+--------------+----------------------------------------------------------------+--------------------+
| Transition actions        | actions      | *-*  | message-list | Messages processed when the transition is triggered.           | Same as field type | 
+---------------------------+--------------+------+--------------+----------------------------------------------------------------+--------------------+

.. _EmergencyControl:

Emergency Control
------------------

No description

- Abbreviation: EmergencyControl
- Identification Number: 554
- Payload Size: 21+  bytes
- Message Size: 43+  bytes

+--------------------+--------------+----------------------------------------+----------------------------+-------------+--------------------+
| Name               | Abbreviation | Unit                                   | Type                       | Description | Range              | 
+====================+==============+========================================+============================+=============+====================+
| Command            | command      | *Enumerated*                           | uint8_t                    |             | Same as field type | 
|                    |              | (:ref:`EmergencyControl-enum-command`) |                            |             |                    | 
+--------------------+--------------+----------------------------------------+----------------------------+-------------+--------------------+
| Plan Specification | plan         | *-*                                    | message                    |             | Same as field type | 
|                    |              |                                        | (:ref:`PlanSpecification`) |             |                    | 
+--------------------+--------------+----------------------------------------+----------------------------+-------------+--------------------+

.. _EmergencyControl-enum-command:

.. _EmergencyControl-enum-prefix-ECTL:

Enum Command
^^^^^^^^^^^^^

No description

- Abbreviation: command
- Prefix: ECTL

+-------+----------+--------------+-------------+
| Value | Name     | Abbreviation | Description | 
+=======+==========+==============+=============+
| 0     | Enable   | ENABLE       | *-*         | 
+-------+----------+--------------+-------------+
| 1     | Disable  | DISABLE      | *-*         | 
+-------+----------+--------------+-------------+
| 2     | Start    | START        | *-*         | 
+-------+----------+--------------+-------------+
| 3     | Stop     | STOP         | *-*         | 
+-------+----------+--------------+-------------+
| 4     | Query    | QUERY        | *-*         | 
+-------+----------+--------------+-------------+
| 5     | Set Plan | SET_PLAN     | *-*         | 
+-------+----------+--------------+-------------+

.. _EmergencyControlState:

Emergency Control State
------------------------

No description

- Abbreviation: EmergencyControlState
- Identification Number: 555
- Payload Size: 4+  bytes
- Message Size: 26+  bytes

+----------------------+--------------+-------------------------------------------+-----------+-------------+--------------------+
| Name                 | Abbreviation | Unit                                      | Type      | Description | Range              | 
+======================+==============+===========================================+===========+=============+====================+
| State                | state        | *Enumerated*                              | uint8_t   |             | Same as field type | 
|                      |              | (:ref:`EmergencyControlState-enum-state`) |           |             |                    | 
+----------------------+--------------+-------------------------------------------+-----------+-------------+--------------------+
| Plan Id              | plan_id      | *-*                                       | plaintext |             | Same as field type | 
+----------------------+--------------+-------------------------------------------+-----------+-------------+--------------------+
| Communications Level | comm_level   | *%*                                       | uint8_t   |             | max=100            | 
+----------------------+--------------+-------------------------------------------+-----------+-------------+--------------------+

.. _EmergencyControlState-enum-state:

.. _EmergencyControlState-enum-prefix-ECS:

Enum State
^^^^^^^^^^^

No description

- Abbreviation: state
- Prefix: ECS

+-------+----------------+----------------+-------------+
| Value | Name           | Abbreviation   | Description | 
+=======+================+================+=============+
| 0     | Not Configured | NOT_CONFIGURED | *-*         | 
+-------+----------------+----------------+-------------+
| 1     | Disabled       | DISABLED       | *-*         | 
+-------+----------------+----------------+-------------+
| 2     | Enabled        | ENABLED        | *-*         | 
+-------+----------------+----------------+-------------+
| 3     | Armed          | ARMED          | *-*         | 
+-------+----------------+----------------+-------------+
| 4     | Active         | ACTIVE         | *-*         | 
+-------+----------------+----------------+-------------+
| 5     | Stopping       | STOPPING       | *-*         | 
+-------+----------------+----------------+-------------+

.. _PlanDB:

Plan DB
--------

Request/reply to plan database.

- Abbreviation: PlanDB
- Identification Number: 556
- Payload Size: 10+  bytes
- Message Size: 32+  bytes

+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+
| Name                      | Abbreviation | Unit                      | Type      | Description                                                               | Range              | 
+===========================+==============+===========================+===========+===========================================================================+====================+
| Type                      | type         | *Enumerated*              | uint8_t   | Indicates if the message is a request, or a reply to a                    | Same as field type | 
|                           |              | (:ref:`PlanDB-enum-type`) |           | previous request.                                                         |                    | 
+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+
| Operation                 | op           | *Enumerated*              | uint8_t   | Indicates the operation affecting the DB.                                 | Same as field type | 
|                           |              | (:ref:`PlanDB-enum-op`)   |           |                                                                           |                    | 
|                           |              |                           |           | The operation may relate to a single plan or the entire plan DB.          |                    | 
|                           |              |                           |           | For each request,  a plan DB may reply with any number of 'in progress'   |                    | 
|                           |              |                           |           | replies followed by a success or a failure reply.                         |                    | 
|                           |              |                           |           |                                                                           |                    | 
|                           |              |                           |           | The 'op', 'request_id' and 'plan_id' fields of a request will be echoed   |                    | 
|                           |              |                           |           | in one or more responses to that request.                                 |                    | 
|                           |              |                           |           | The operation at stake also determines a certain type of the 'arg' field, |                    | 
|                           |              |                           |           | and whether or not the 'plan_id' field needs to be set.                   |                    | 
+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+
| Request ID                | request_id   | *-*                       | uint16_t  | Request ID. This may be used by interfacing modules,                      | Same as field type | 
|                           |              |                           |           | e.g. using sequence counters, to annotate requests and                    |                    | 
|                           |              |                           |           | appropriately identify replies                                            |                    | 
+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+
| Plan ID                   | plan_id      | *-*                       | plaintext | Plan identifier for the operation, if one is required.                    | Same as field type | 
+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+
| Argument                  | arg          | *-*                       | message   | Request or reply argument.                                                | Same as field type | 
+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+
| Complementary Information | info         | *-*                       | plaintext | Human-readable complementary information. For example this                | Same as field type | 
|                           |              |                           |           | may be used to detail reasons for failure, or to report                   |                    | 
|                           |              |                           |           | in-progress information.                                                  |                    | 
+---------------------------+--------------+---------------------------+-----------+---------------------------------------------------------------------------+--------------------+

.. _PlanDB-enum-type:

.. _PlanDB-enum-prefix-DBT:

Enum Type
^^^^^^^^^^

Indicates if the message is a request, or a reply to a
previous request.

- Abbreviation: type
- Prefix: DBT

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 0     | Request              | REQUEST      | *-*         | 
+-------+----------------------+--------------+-------------+
| 1     | Reply -- Success     | SUCCESS      | *-*         | 
+-------+----------------------+--------------+-------------+
| 2     | Reply -- Failure     | FAILURE      | *-*         | 
+-------+----------------------+--------------+-------------+
| 3     | Reply -- In Progress | IN_PROGRESS  | *-*         | 
+-------+----------------------+--------------+-------------+

.. _PlanDB-enum-op:

.. _PlanDB-enum-prefix-DBOP:

Enum Operation
^^^^^^^^^^^^^^^

Indicates the operation affecting the DB.

The operation may relate to a single plan or the entire plan DB.
For each request,  a plan DB may reply with any number of 'in progress'
replies followed by a success or a failure reply.

The 'op', 'request_id' and 'plan_id' fields of a request will be echoed
in one or more responses to that request.
The operation at stake also determines a certain type of the 'arg' field,
and whether or not the 'plan_id' field needs to be set.

- Abbreviation: op
- Prefix: DBOP

+-------+-------------------------------+--------------+-------------------------------------------------------------+
| Value | Name                          | Abbreviation | Description                                                 | 
+=======+===============================+==============+=============================================================+
| 0     | Set Plan                      | SET          | Set a plan in the DB. The 'plan_id' field identifies the    | 
|       |                               |              | plan, and a pre-existing plan with the same identifier, if  | 
|       |                               |              | any will be overwritten. For requests, the 'arg' field must | 
|       |                               |              | contain a 'PlanSpecification' message.                      | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 1     | Delete Plan                   | DEL          | Delete a plan from the DB. The 'plan_id' field identifies   | 
|       |                               |              | the plan to delete.                                         | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 2     | Get Plan                      | GET          | Get a plan stored in the DB.The 'plan_id' field identifies  | 
|       |                               |              | the plan. Successful replies will yield a                   | 
|       |                               |              | 'PlanSpecification' message in the 'arg' field.             | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 3     | Get Plan Info                 | GET_INFO     | Get DB state for a stored plan. The 'plan_id' field         | 
|       |                               |              | identifies the plan. Successful replies will yield a        | 
|       |                               |              | 'PlanDBInformation' message in the 'arg' field.             | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 4     | Clear Database                | CLEAR        | Clear the entire DB.                                        | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 5     | Get Database State (Simple)   | GET_STATE    | Get state of the entire DB. Successful replies will yield a | 
|       |                               |              | 'PlanDBState' message in the 'arg' field but without        | 
|       |                               |              | individual plan information (in the 'plans_info' field of   | 
|       |                               |              | 'PlanDBState').                                             | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 6     | Get Database State (Detailed) | GET_DSTATE   | Get detailed state of the entire DB. Successful replies     | 
|       |                               |              | will yield a 'PlanDBState' message in the 'arg' field with  | 
|       |                               |              | individual plan information (in the 'plans_info' field of   | 
|       |                               |              | 'PlanDBState').                                             | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+
| 7     | Boot Notification             | BOOT         | PlanDB replies of this type are sent automatically during   | 
|       |                               |              | bootstrap.                                                  | 
+-------+-------------------------------+--------------+-------------------------------------------------------------+

.. _PlanDBState:

Plan DB State
--------------

Characterizes the state of the entire plan database.

- Abbreviation: PlanDBState
- Identification Number: 557
- Payload Size: 22+  bytes
- Message Size: 44+  bytes

+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| Name                          | Abbreviation | Unit | Type                       | Description                                                   | Range              | 
+===============================+==============+======+============================+===============================================================+====================+
| Plan -- Count                 | plan_count   | *-*  | uint16_t                   | Number of stored plans.                                       | Same as field type | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| Plan -- Size of all plans     | plan_size    | *-*  | uint32_t                   | Size of all plans.The value equals the sum of the IMC payload | Same as field type | 
|                               |              |      |                            | sizes for 'PlanSpecification' stored in the DB.               |                    | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| Last Change -- Time           | change_time  | *s*  | fp64_t                     | Time of last change (Epoch time).                             | Same as field type | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| Last Change -- Source Address | change_sid   | *-*  | uint16_t                   | IMC address for source of last DB change.                     | Same as field type | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| Last Change -- Source Name    | change_sname | *-*  | plaintext                  | IMC node name for source of last DB change.                   | Same as field type | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| MD5                           | md5          | *-*  | rawdata                    | MD5 database verification code. The MD5 hash sum is computed  | Same as field type | 
|                               |              |      |                            | over the stream formed by the MD5 of all plans, ordered by    |                    | 
|                               |              |      |                            | plan id, in compliance with RFC 1321.                         |                    | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+
| Plan info                     | plans_info   | *-*  | message-list               | Individual information for plans.                             | Same as field type | 
|                               |              |      | (:ref:`PlanDBInformation`) |                                                               |                    | 
+-------------------------------+--------------+------+----------------------------+---------------------------------------------------------------+--------------------+

.. _PlanDBInformation:

Plan DB Information
--------------------

No description

- Abbreviation: PlanDBInformation
- Identification Number: 558
- Payload Size: 18+  bytes
- Message Size: 40+  bytes

+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+
| Name                          | Abbreviation | Unit | Type      | Description                                                    | Range              | 
+===============================+==============+======+===========+================================================================+====================+
| Plan ID                       | plan_id      | *-*  | plaintext | Plan identifier.                                               | Same as field type | 
+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+
| Plan Size                     | plan_size    | *-*  | uint16_t  | Plan size. The value equals the IMC message payload of the     | Same as field type | 
|                               |              |      |           | associated 'PlanSpecification' message in bytes.               |                    | 
+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+
| Last Changed -- Time          | change_time  | *-*  | fp64_t    | Time of last change to the plan (Epoch time).                  | Same as field type | 
+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+
| Last Change -- Source Address | change_sid   | *-*  | uint16_t  | IMC address for source of last change to the plan.             | Same as field type | 
+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+
| Last Change -- Source Name    | change_sname | *-*  | plaintext | IMC node name for source of last change to the plan.           | Same as field type | 
+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+
| MD5                           | md5          | *-*  | rawdata   | MD5 plan verification code. The value is calculated over the   | Same as field type | 
|                               |              |      |           | message payload of the 'PlanSpecification', in compliance with |                    | 
|                               |              |      |           | RFC 1321.                                                      |                    | 
+-------------------------------+--------------+------+-----------+----------------------------------------------------------------+--------------------+

.. _PlanControl:

Plan Control
-------------

Plan control request/reply.

- Abbreviation: PlanControl
- Identification Number: 559
- Payload Size: 12+  bytes
- Message Size: 34+  bytes

+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Name                   | Abbreviation | Unit                                | Type      | Description                                                    | Range              | 
+========================+==============+=====================================+===========+================================================================+====================+
| Type                   | type         | *Enumerated*                        | uint8_t   | Indicates if the message is a request or a reply to a          | Same as field type | 
|                        |              | (:ref:`PlanControl-enum-type`)      |           | previous request. The *op*, *request_id* and *plan_id* fields  |                    | 
|                        |              |                                     |           | of a request will be echoed in one or more responses to that   |                    | 
|                        |              |                                     |           | request.                                                       |                    | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Operation              | op           | *Enumerated*                        | uint8_t   | Plan control operation.                                        | Same as field type | 
|                        |              | (:ref:`PlanControl-enum-op`)        |           |                                                                |                    | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Request ID             | request_id   | *-*                                 | uint16_t  | Request ID. This may be used by interfacing modules e.g. using | Same as field type | 
|                        |              |                                     |           | sequence counters.  to annotate requests and appropriately     |                    | 
|                        |              |                                     |           | identify replies.                                              |                    | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Plan Identifier        | plan_id      | *-*                                 | plaintext | The identifier for the plan to be stopped / started / loaded / | Same as field type | 
|                        |              |                                     |           | retrieved according to the command requested (*op* field).     |                    | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Flags                  | flags        | *Bitfield*                          | uint16_t  |                                                                | Same as field type | 
|                        |              | (:ref:`PlanControl-bitfield-flags`) |           |                                                                |                    | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Request/Reply Argument | arg          | *-*                                 | message   | Complementary message argument for requests/replies.           | Same as field type | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+
| Complementary Info     | info         | *-*                                 | plaintext | Complementary human-readable information. This is used         | Same as field type | 
|                        |              |                                     |           | in association to replies.                                     |                    | 
+------------------------+--------------+-------------------------------------+-----------+----------------------------------------------------------------+--------------------+

.. _PlanControl-enum-type:

.. _PlanControl-enum-prefix-PC:

Enum Type
^^^^^^^^^^

Indicates if the message is a request or a reply to a
previous request. The *op*, *request_id* and *plan_id* fields
of a request will be echoed in one or more responses to that
request.

- Abbreviation: type
- Prefix: PC

+-------+----------------------+--------------+-------------+
| Value | Name                 | Abbreviation | Description | 
+=======+======================+==============+=============+
| 0     | Request              | REQUEST      | *-*         | 
+-------+----------------------+--------------+-------------+
| 1     | Reply -- Success     | SUCCESS      | *-*         | 
+-------+----------------------+--------------+-------------+
| 2     | Reply -- Failure     | FAILURE      | *-*         | 
+-------+----------------------+--------------+-------------+
| 3     | Reply -- In Progress | IN_PROGRESS  | *-*         | 
+-------+----------------------+--------------+-------------+

.. _PlanControl-enum-op:

.. _PlanControl-enum-prefix-PC:

Enum Operation
^^^^^^^^^^^^^^^

Plan control operation.

- Abbreviation: op
- Prefix: PC

+-------+------------+--------------+----------------------------------------------------------------------+
| Value | Name       | Abbreviation | Description                                                          | 
+=======+============+==============+======================================================================+
| 0     | Start Plan | START        | Start plan identified by *plan_id* field.  The command will          | 
|       |            |              | try to load the corresponding plan if none is loaded, and in         | 
|       |            |              | that case will follow the same discipline as the *LOAD*              | 
|       |            |              | command.                                                             | 
|       |            |              |                                                                      | 
|       |            |              | If the message in *arg* is a :ref:`Maneuver`, a single-maneuver plan | 
|       |            |              | will be generated and executed.                                      | 
|       |            |              |                                                                      | 
|       |            |              | This will override any current plan being executed.                  | 
+-------+------------+--------------+----------------------------------------------------------------------+
| 1     | Stop Plan  | STOP         | Stop current plan being executed if any.                             | 
+-------+------------+--------------+----------------------------------------------------------------------+
| 2     | Load Plan  | LOAD         | Load Plan. If a :ref:`PlanSpecification` is given with the           | 
|       |            |              | request in the *data* field, then that plan is used and              | 
|       |            |              | stored in the Plan DB. Otherwise, the plan is loaded from            | 
|       |            |              | the Plan DB.                                                         | 
+-------+------------+--------------+----------------------------------------------------------------------+
| 3     | Get Plan   | GET          | Get loaded plan. For a successful reply, the *data* field            | 
|       |            |              | will contain the :ref:`PlanSpecification` message that               | 
|       |            |              | corresponds to the currently loaded plan.                            | 
+-------+------------+--------------+----------------------------------------------------------------------+

.. _PlanControl-bitfield-flags:

.. _PlanControl-bitfield-prefix-FLG:

Bitfield Flags
^^^^^^^^^^^^^^^

No description

- Abbreviation: flags
- Prefix: FLG

+--------+-------------------+---------------+-----------------------------------------------------------------------+
| Value  | Name              | Abbreviation  | Description                                                           | 
+========+===================+===============+=======================================================================+
| 0x0001 | Calibrate Vehicle | CALIBRATE     | Perform vehicle calibration.                                          | 
+--------+-------------------+---------------+-----------------------------------------------------------------------+
| 0x0002 | Ignore Errors     | IGNORE_ERRORS | Execute current plan while ignoring some errors that might be active. | 
+--------+-------------------+---------------+-----------------------------------------------------------------------+

.. _PlanControlState:

Plan Control State
-------------------

State of plan control.

- Abbreviation: PlanControlState
- Identification Number: 560
- Payload Size: 20+  bytes
- Message Size: 42+  bytes
- Flags: periodic

+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Name              | Abbreviation  | Unit                                        | Type      | Description                                                       | Range              | 
+===================+===============+=============================================+===========+===================================================================+====================+
| State             | state         | *Enumerated*                                | uint8_t   | Describes overall state.                                          | Same as field type | 
|                   |               | (:ref:`PlanControlState-enum-state`)        |           |                                                                   |                    | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Plan -- ID        | plan_id       | *-*                                         | plaintext | Identifier of plan currently loaded.                              | Same as field type | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Plan -- ETA       | plan_eta      | *s*                                         | int32_t   | Current plan estimated time to completion.                        | Same as field type | 
|                   |               |                                             |           | The value will be -1 if the time is unknown or undefined.         |                    | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Plan -- Progress  | plan_progress | *%*                                         | fp32_t    | Current plan estimated progress in percent.                       | Same as field type | 
|                   |               |                                             |           | The value will be negative if unknown or undefined.               |                    | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Maneuver -- ID    | man_id        | *-*                                         | plaintext | Current node ID, when executing a plan.                           | Same as field type | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Maneuver -- Type  | man_type      | *-*                                         | uint16_t  | Type of maneuver being executed (IMC serialization id),           | Same as field type | 
|                   |               |                                             |           | when executing a plan.                                            |                    | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Maneuver -- ETA   | man_eta       | *s*                                         | int32_t   | Current node estimated time to completion, when executing a plan. | Same as field type | 
|                   |               |                                             |           | The value will be -1 if the time is unknown or undefined.         |                    | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+
| Last Plan Outcome | last_outcome  | *Enumerated*                                | uint8_t   | Outcome of the last executed plan.                                | Same as field type | 
|                   |               | (:ref:`PlanControlState-enum-last_outcome`) |           |                                                                   |                    | 
+-------------------+---------------+---------------------------------------------+-----------+-------------------------------------------------------------------+--------------------+

.. _PlanControlState-enum-state:

.. _PlanControlState-enum-prefix-PCS:

Enum State
^^^^^^^^^^^

Describes overall state.

- Abbreviation: state
- Prefix: PCS

+-------+--------------+--------------+---------------------------------------------------------+
| Value | Name         | Abbreviation | Description                                             | 
+=======+==============+==============+=========================================================+
| 0     | Blocked      | BLOCKED      | Plan execution is blocked e.g., due to a vehicle error, | 
|       |              |              | or if no plan is loaded.                                | 
+-------+--------------+--------------+---------------------------------------------------------+
| 1     | Ready        | READY        | Ready to start plan execution.                          | 
+-------+--------------+--------------+---------------------------------------------------------+
| 2     | Initializing | INITIALIZING | Initializing plan for execution.                        | 
+-------+--------------+--------------+---------------------------------------------------------+
| 3     | Executing    | EXECUTING    | Executing plan.                                         | 
+-------+--------------+--------------+---------------------------------------------------------+

.. _PlanControlState-enum-last_outcome:

.. _PlanControlState-enum-prefix-LPO:

Enum Last Plan Outcome
^^^^^^^^^^^^^^^^^^^^^^^

Outcome of the last executed plan.

- Abbreviation: last_outcome
- Prefix: LPO

+-------+---------+--------------+-------------------------------------+
| Value | Name    | Abbreviation | Description                         | 
+=======+=========+==============+=====================================+
| 0     | None    | NONE         | Unknown or not filled.              | 
+-------+---------+--------------+-------------------------------------+
| 1     | Success | SUCCESS      | Last plan execution was successful. | 
+-------+---------+--------------+-------------------------------------+
| 2     | Failure | FAILURE      | Last plan execution was a failure.  | 
+-------+---------+--------------+-------------------------------------+

.. _PlanVariable:

Plan Variable
--------------

A plan variable.

- Abbreviation: PlanVariable
- Identification Number: 561
- Payload Size: 6+  bytes
- Message Size: 28+  bytes

+-------------+--------------+-----------------------------------+-----------+-------------+--------------------+
| Name        | Abbreviation | Unit                              | Type      | Description | Range              | 
+=============+==============+===================================+===========+=============+====================+
| Name        | name         | *-*                               | plaintext |             | Same as field type | 
+-------------+--------------+-----------------------------------+-----------+-------------+--------------------+
| Value       | value        | *-*                               | plaintext |             | Same as field type | 
+-------------+--------------+-----------------------------------+-----------+-------------+--------------------+
| Type        | type         | *Enumerated*                      | uint8_t   |             | Same as field type | 
|             |              | (:ref:`PlanVariable-enum-type`)   |           |             |                    | 
+-------------+--------------+-----------------------------------+-----------+-------------+--------------------+
| Access Type | access       | *Enumerated*                      | uint8_t   |             | Same as field type | 
|             |              | (:ref:`PlanVariable-enum-access`) |           |             |                    | 
+-------------+--------------+-----------------------------------+-----------+-------------+--------------------+

.. _PlanVariable-enum-type:

.. _PlanVariable-enum-prefix-PVT:

Enum Type
^^^^^^^^^^

No description

- Abbreviation: type
- Prefix: PVT

+-------+---------+--------------+-------------+
| Value | Name    | Abbreviation | Description | 
+=======+=========+==============+=============+
| 0     | Boolean | BOOLEAN      | *-*         | 
+-------+---------+--------------+-------------+
| 1     | Number  | NUMBER       | *-*         | 
+-------+---------+--------------+-------------+
| 2     | Text    | TEXT         | *-*         | 
+-------+---------+--------------+-------------+
| 3     | Message | MESSAGE      | *-*         | 
+-------+---------+--------------+-------------+

.. _PlanVariable-enum-access:

.. _PlanVariable-enum-prefix-PVA:

Enum Access Type
^^^^^^^^^^^^^^^^^

No description

- Abbreviation: access
- Prefix: PVA

+-------+--------+--------------+-------------+
| Value | Name   | Abbreviation | Description | 
+=======+========+==============+=============+
| 0     | Input  | INPUT        | *-*         | 
+-------+--------+--------------+-------------+
| 1     | Output | OUTPUT       | *-*         | 
+-------+--------+--------------+-------------+
| 2     | Local  | LOCAL        | *-*         | 
+-------+--------+--------------+-------------+

.. _PlanGeneration:

Plan Generation
----------------

This message is used to order the generation of plans based on
id and set of parameters.

- Abbreviation: PlanGeneration
- Identification Number: 562
- Payload Size: 6+  bytes
- Message Size: 28+  bytes

+-----------------+--------------+----------------------------------+-----------+-------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit                             | Type      | Description                                           | Range              | 
+=================+==============+==================================+===========+=======================================================+====================+
| Command         | cmd          | *Enumerated*                     | uint8_t   |                                                       | Same as field type | 
|                 |              | (:ref:`PlanGeneration-enum-cmd`) |           |                                                       |                    | 
+-----------------+--------------+----------------------------------+-----------+-------------------------------------------------------+--------------------+
| Operation       | op           | *Enumerated*                     | uint8_t   |                                                       | Same as field type | 
|                 |              | (:ref:`PlanGeneration-enum-op`)  |           |                                                       |                    | 
+-----------------+--------------+----------------------------------+-----------+-------------------------------------------------------+--------------------+
| Plan Identifier | plan_id      | *-*                              | plaintext | The name of the plan to be generated.                 | Same as field type | 
+-----------------+--------------+----------------------------------+-----------+-------------------------------------------------------+--------------------+
| Parameters      | params       | *TupleList*                      | plaintext | An optional list of parameters to be used by the plan | Same as field type | 
|                 |              |                                  |           | generation module.                                    |                    | 
+-----------------+--------------+----------------------------------+-----------+-------------------------------------------------------+--------------------+

.. _PlanGeneration-enum-cmd:

.. _PlanGeneration-enum-prefix-CMD:

Enum Command
^^^^^^^^^^^^^

No description

- Abbreviation: cmd
- Prefix: CMD

+-------+----------+--------------+-----------------------------------------------------------------+
| Value | Name     | Abbreviation | Description                                                     | 
+=======+==========+==============+=================================================================+
| 0     | Generate | GENERATE     | Generate the plan and store it in the PlanDB.                   | 
+-------+----------+--------------+-----------------------------------------------------------------+
| 1     | Execute  | EXECUTE      | Generate (storing it in the PlanDB) and execute it immediately. | 
+-------+----------+--------------+-----------------------------------------------------------------+

.. _PlanGeneration-enum-op:

.. _PlanGeneration-enum-prefix-OP:

Enum Operation
^^^^^^^^^^^^^^^

No description

- Abbreviation: op
- Prefix: OP

+-------+---------+--------------+----------------------------------------------------------+
| Value | Name    | Abbreviation | Description                                              | 
+=======+=========+==============+==========================================================+
| 0     | Request | REQUEST      | Request the execution of this command.                   | 
+-------+---------+--------------+----------------------------------------------------------+
| 1     | Error   | ERROR        | Some error has occurred while executing the command. The | 
|       |         |              | error can be found in the 'params' tuplelist (under the  | 
|       |         |              | key 'error').                                            | 
+-------+---------+--------------+----------------------------------------------------------+
| 2     | Success | SUCCESS      | The requested command was executed successfully.         | 
+-------+---------+--------------+----------------------------------------------------------+

.. _LeaderState:

Leader State
-------------

This message defines the formation leader state.

LeaderState is a complete description of the leader state
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

- Abbreviation: LeaderState
- Identification Number: 563
- Payload Size: 83+  bytes
- Message Size: 105+  bytes
- Flags: periodic

+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Name                       | Abbreviation | Unit                         | Type      | Description                                                   | Range                    | 
+============================+==============+==============================+===========+===============================================================+==========================+
| Group Name                 | group_name   | *-*                          | plaintext | Name for the formation group.                                 | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Action on the leader state | op           | *Enumerated*                 | uint8_t   | Action on the formation leader state variables                | Same as field type       | 
|                            |              | (:ref:`LeaderState-enum-op`) |           |                                                               |                          | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Latitude (WGS-84)          | lat          | *rad*                        | fp64_t    | WGS-84 Latitude.                                              | min=-1.5707963267948966, | 
|                            |              |                              |           |                                                               | max=1.5707963267948966   | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Longitude (WGS-84)         | lon          | *rad*                        | fp64_t    | WGS-84 Longitude.                                             | min=-3.141592653589793,  | 
|                            |              |                              |           |                                                               | max=3.141592653589793    | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Height (WGS-84)            | height       | *m*                          | fp32_t    | Height above the WGS-84 ellipsoid.                            | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Offset north               | x            | *m*                          | fp32_t    | The North offset of the North/East/Down field with respect to | Same as field type       | 
|                            |              |                              |           | LLH.                                                          |                          | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Offset east                | y            | *m*                          | fp32_t    | The East offset of the North/East/Down field with respect to  | Same as field type       | 
|                            |              |                              |           | LLH.                                                          |                          | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Offset down                | z            | *m*                          | fp32_t    | The Down offset of the North/East/Down field with respect to  | Same as field type       | 
|                            |              |                              |           | LLH.                                                          |                          | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Rotation over x axis       | phi          | *rad*                        | fp32_t    | The phi Euler angle from the vehicle's attitude.              | min=-3.141592653589793,  | 
|                            |              |                              |           |                                                               | max=3.141592653589793    | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Rotation over y axis       | theta        | *rad*                        | fp32_t    | The theta Euler angle from the vehicle's attitude.            | min=-1.57079632679490,   | 
|                            |              |                              |           |                                                               | max=1.57079632679490     | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Rotation over z axis       | psi          | *rad*                        | fp32_t    | The psi Euler angle from the vehicle's attitude.              | min=-3.141592653589793,  | 
|                            |              |                              |           |                                                               | max=3.141592653589793    | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Ground Velocity X (North)  | vx           | *m/s*                        | fp32_t    | Ground Velocity xx axis velocity component.                   | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Ground Velocity Y (East)   | vy           | *m/s*                        | fp32_t    | Ground Velocity yy axis velocity component.                   | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Ground Velocity Z (Down)   | vz           | *m/s*                        | fp32_t    | Ground Velocity zz axis velocity component.                   | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Angular Velocity in x      | p            | *rad/s*                      | fp32_t    | The angular velocity over body-fixed xx axis (roll).          | min=-3.141592653589793,  | 
|                            |              |                              |           |                                                               | max=3.141592653589793    | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Angular Velocity in y      | q            | *rad/s*                      | fp32_t    | The angular velocity over body-fixed yy axis (pitch).         | min=-3.141592653589793,  | 
|                            |              |                              |           |                                                               | max=3.141592653589793    | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Angular Velocity in z      | r            | *rad/s*                      | fp32_t    | The angular velocity over body-fixed zz axis (yaw).           | min=-3.141592653589793,  | 
|                            |              |                              |           |                                                               | max=3.141592653589793    | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Stream Velocity X (North)  | svx          | *m/s*                        | fp32_t    | Stream Velocity xx axis velocity component.                   | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Stream Velocity Y (East)   | svy          | *m/s*                        | fp32_t    | Stream Velocity yy axis velocity component.                   | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+
| Stream Velocity Z (Down)   | svz          | *m/s*                        | fp32_t    | Stream Velocity zz axis velocity component.                   | Same as field type       | 
+----------------------------+--------------+------------------------------+-----------+---------------------------------------------------------------+--------------------------+

.. _LeaderState-enum-op:

.. _LeaderState-enum-prefix-OP:

Enum Action on the leader state
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Action on the formation leader state variables

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

.. _PlanStatistics:

Plan Statistics
----------------

No description

- Abbreviation: PlanStatistics
- Identification Number: 564
- Payload Size: 12+  bytes
- Message Size: 34+  bytes

+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Name            | Abbreviation | Unit                                        | Type      | Description                                                                                                                      | Range              | 
+=================+==============+=============================================+===========+==================================================================================================================================+====================+
| Plan Identifier | plan_id      | *-*                                         | plaintext | The name of the plan to be generated.                                                                                            | Same as field type | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Type            | type         | *Enumerated*                                | uint8_t   | Type of plan statistics, if they are launched before, during or after the plan execution.                                        | Same as field type | 
|                 |              | (:ref:`PlanStatistics-enum-type`)           |           |                                                                                                                                  |                    | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Properties      | properties   | *Bitfield*                                  | uint8_t   |                                                                                                                                  | Same as field type | 
|                 |              | (:ref:`PlanStatistics-bitfield-properties`) |           |                                                                                                                                  |                    | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Durations       | durations    | *TupleList*                                 | plaintext | Maneuver and plan duration statistics in seconds, for example: “Total=1000,Goto1=20,Rows=980”                                    | Same as field type | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Distances       | distances    | *TupleList*                                 | plaintext | Distances travelled in meters in each maneuver and/or total: “Total=2000,Rows=1800,Elevator=200”                                 | Same as field type | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Actions         | actions      | *TupleList*                                 | plaintext | List of components active by plan actions during the plan and time active in seconds: “Sidescan=100,Camera Module=150”           | Same as field type | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+
| Fuel            | fuel         | *TupleList*                                 | plaintext | Amount of fuel spent, in battery percentage, by different parcels (if applicable): “Total=35,Hotel=5,Payload=10,Motion=20,IMU=0” | Same as field type | 
+-----------------+--------------+---------------------------------------------+-----------+----------------------------------------------------------------------------------------------------------------------------------+--------------------+

.. _PlanStatistics-enum-type:

.. _PlanStatistics-enum-prefix-TP:

Enum Type
^^^^^^^^^^

Type of plan statistics, if they are launched before, during or after the plan execution.

- Abbreviation: type
- Prefix: TP

+-------+-------------+--------------+-------------+
| Value | Name        | Abbreviation | Description | 
+=======+=============+==============+=============+
| 0     | Before Plan | PREPLAN      | *-*         | 
+-------+-------------+--------------+-------------+
| 1     | During Plan | INPLAN       | *-*         | 
+-------+-------------+--------------+-------------+
| 2     | After Plan  | POSTPLAN     | *-*         | 
+-------+-------------+--------------+-------------+

.. _PlanStatistics-bitfield-properties:

.. _PlanStatistics-bitfield-prefix-PRP:

Bitfield Properties
^^^^^^^^^^^^^^^^^^^^

No description

- Abbreviation: properties
- Prefix: PRP

+-------+------------+--------------+---------------------------------------------------------+
| Value | Name       | Abbreviation | Description                                             | 
+=======+============+==============+=========================================================+
| 0x00  | Basic Plan | BASIC        | Basic plan, meaning it is Linear, Finite and Noncyclic. | 
+-------+------------+--------------+---------------------------------------------------------+
| 0x01  | Nonlinear  | NONLINEAR    | Plan is nonlinear.                                      | 
+-------+------------+--------------+---------------------------------------------------------+
| 0x02  | Infinite   | INFINITE     | Plan is infinite in duration.                           | 
+-------+------------+--------------+---------------------------------------------------------+
| 0x04  | Cyclical   | CYCLICAL     | Plan is cyclical.                                       | 
+-------+------------+--------------+---------------------------------------------------------+
| 0x07  | All        | ALL          | All properties checked.                                 | 
+-------+------------+--------------+---------------------------------------------------------+

