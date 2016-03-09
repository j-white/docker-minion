FROM centos:7
MAINTAINER jesse@opennms.org

RUN yum install -y openssh-clients java-1.8.0-openjdk-devel which

ADD /rpms/opennms-minion-container.noarch.rpm /opennms-minion-container.noarch.rpm
ADD /rpms/opennms-minion-features.noarch.rpm /opennms-minion-features.noarch.rpm
RUN rpm -i /opennms-minion-container.noarch.rpm /opennms-minion-features.noarch.rpm

COPY scripts/bootstrap.sh /opt/minion/bin

# Ports
# 1099 - RMI Registry
# 8101 - Karaf SSH
# 44444 - RMI Server
EXPOSE 1099 8101 44444

WORKDIR /opt/minion
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
CMD ["/opt/minion/bin/bootstrap.sh"]
