#!/bin/bash -e
MINION_HOME=/opt/minion

echo "MINION HOME: ${MINION_HOME}"

echo "location = MINION" > $MINION_HOME/etc/org.opennms.minion.controller.cfg
echo "id = 00000000-0000-0000-0000-000000ddba11" >> $MINION_HOME/etc/org.opennms.minion.controller.cfg
echo "broker-url = tcp://${OPENNMS_PORT_61616_TCP_ADDR}:${OPENNMS_PORT_61616_TCP_PORT}" >> $MINION_HOME/etc/org.opennms.minion.controller.cfg
echo "username = admin" >> $MINION_HOME/etc/org.opennms.minion.controller.cfg
echo "password = admin" >> $MINION_HOME/etc/org.opennms.minion.controller.cfg

rm -rf $MINION_HOME/data
$MINION_HOME/bin/karaf clean server
