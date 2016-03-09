#! /bin/bash
OPENNMS_HOME=/opt/opennms

echo "OPENNMS HOME: "${OPENNMS_HOME}

# Point PostgreSQL to the linked container
sed -i 's|url=.*opennms.*|url="jdbc:postgresql://'"${POSTGRES_PORT_5432_TCP_ADDR}:${POSTGRES_PORT_5432_TCP_PORT}/opennms"'"|g' "${OPENNMS_HOME}/etc/opennms-datasources.xml"
sed -i 's|url=.*template1.*|url="jdbc:postgresql://'"${POSTGRES_PORT_5432_TCP_ADDR}:${POSTGRES_PORT_5432_TCP_PORT}/template1"'"|g' "${OPENNMS_HOME}/etc/opennms-datasources.xml"

# Expose the Karaf shell
sed -i s/sshHost.*/sshHost=0.0.0.0/g "${OPENNMS_HOME}/etc/org.apache.karaf.shell.cfg"

# Expose ActiveMQ
sed -i s/127.0.0.1:61616/0.0.0.0:61616/g "${OPENNMS_HOME}/etc/opennms-activemq.xml"

# Start OpenNMS
rm -rf ${OPENNMS_HOME}/data
${OPENNMS_HOME}/bin/runjava -s
${OPENNMS_HOME}/bin/install -dis
"${OPENNMS_HOME}/bin/opennms" -f start

sleep 60000
