#! /bin/bash
MINION_HOME=/opt/minion

echo "MINION HOME: ${MINION_HOME}"

echo "broker-url=tcp://${OPENNMS_PORT_61616_TCP_ADDR}:${OPENNMS_PORT_61616_TCP_PORT}" > $MINION_HOME/etc/org.opennms.minion.activemq
echo "username=admin" >> $MINION_HOME/etc/org.opennms.minion.activemq
echo "password=admin" >> $MINION_HOME/etc/org.opennms.minion.activemq

echo "id=0000-00001" > $MINION_HOME/etc/org.opennms.minion.controller
echo "location=TEST" >> $MINION_HOME/etc/org.opennms.minion.controller

$MINION_HOME/bin/karaf clean server
