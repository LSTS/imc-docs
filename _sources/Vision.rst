Vision Messages
================

.. _CompressedImage:

Compressed Image
-----------------

No description

- Abbreviation: CompressedImage
- Identification Number: 702
- Payload Size: 3+  bytes
- Message Size: 25+  bytes

+----------+--------------+------+---------+-------------+--------------------+
| Name     | Abbreviation | Unit | Type    | Description | Range              | 
+==========+==============+======+=========+=============+====================+
| Frame Id | frameid      | *-*  | uint8_t |             | Same as field type | 
+----------+--------------+------+---------+-------------+--------------------+
| Data     | data         | *-*  | rawdata |             | Same as field type | 
+----------+--------------+------+---------+-------------+--------------------+

.. _ImageTxSettings:

Image Transmission Settings
----------------------------

No description

- Abbreviation: ImageTxSettings
- Identification Number: 703
- Payload Size: 4 bytes
- Message Size: 26 bytes

+-------------------+--------------+------+---------+-------------+--------------------+
| Name              | Abbreviation | Unit | Type    | Description | Range              | 
+===================+==============+======+=========+=============+====================+
| Frames Per Second | fps          | *-*  | uint8_t |             | Same as field type | 
+-------------------+--------------+------+---------+-------------+--------------------+
| Quality           | quality      | *-*  | uint8_t |             | Same as field type | 
+-------------------+--------------+------+---------+-------------+--------------------+
| Repetitions       | reps         | *-*  | uint8_t |             | Same as field type | 
+-------------------+--------------+------+---------+-------------+--------------------+
| Target Size       | tsize        | *-*  | uint8_t |             | Same as field type | 
+-------------------+--------------+------+---------+-------------+--------------------+

