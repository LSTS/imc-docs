IMC v5.4.11-unknown
====================


This document describes the communications protocol associated
with the LSTS software framework. Concepts such as *message*,
*field* and *packet* are explained in detail in the subsequent
chapters.

Inter module communication is achieved by the exchange of messages
that can be recognized and interpreted by all participating
modules. A message is a self-contained collection of data fields
conveying relevant information about a given subject. The mean by
which the messages are exchanged is not described in this
document, but the reader can assume that at least the UDP Internet
protocol is available at all ends of the communications channel.

The Neptus Command and Control Unit (CCU), currently being used at
LSTS, supports mission planning and control, using the described
messaging API. This software entity can be used to define a plan
before execution and monitor the plan's execution by presenting an
operating console. For further details on this software contact
the LSTS.

A CCU exercises authority over a vehicle (real or
simulated). Usually this term is applied to software in the class
of LSTS Neptus, but can also be applied to software modules
extending the vehicle core control software.

The LSTS reserves itself the right to use message identification
numbers up to 999. Thus if a third party needs to extend this API
it must use identification numbers starting at 1000. The
identification number 65535 has a special meaning and must not be
used to extend the IMC protocol.


.. toctree::
   :maxdepth: 2

   Message Format.rst
   Core.rst
   Simulation.rst
   Storage.rst
   Networking.rst
   Acoustic Networking.rst
   Sensors.rst
   Actuation.rst
   Navigation.rst
   Guidance.rst
   Maneuvering.rst
   Vehicle Supervision.rst
   Plan Supervision.rst
   CCU.rst
   Autonomy.rst
   Vision.rst
   External.rst
   Development.rst
   Custom.rst
