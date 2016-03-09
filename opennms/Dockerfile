FROM centos:7
MAINTAINER jesse@opennms.org

RUN yum install -y openssh-clients java-1.8.0-openjdk-devel which

# OpenNMS dependencies
RUN rpm --import http://yum.opennms.org/OPENNMS-GPG-KEY && \
    rpm -Uvh http://yum.opennms.org/stable/rhel7/jicmp/jicmp-1.4.5-2.x86_64.rpm && \
    rpm -Uvh http://yum.opennms.org/stable/rhel7/jicmp6/jicmp6-1.2.4-1.x86_64.rpm && \
    yum install -y postgresql-server

ADD /rpms/* /
RUN rpm -i /opennms.noarch.rpm /opennms-core.noarch.rpm /opennms-webapp-jetty.noarch.rpm
COPY scripts/bootstrap.sh /opt/opennms/bin
 
# Ports
# 8101 - Karaf SSH
# 8980 - OpenNMS WebUI
# 61616 - ActiveMQ
EXPOSE 8101 8980 61616

WORKDIR /opt/opennms
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
CMD ["/opt/opennms/bin/bootstrap.sh"]
