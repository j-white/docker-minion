FROM centos:7
MAINTAINER jesse@opennms.org

RUN yum install -y openssh-clients java-1.8.0-openjdk-devel which

ADD /rpms/*.rpm /
RUN yum localinstall -y /*.rpm && rm -rf /*.rpm

COPY scripts/bootstrap.sh /opt/minion/bin

# Ports
# 1299 - RMI Registry
# 1514 - Syslog
# 8201 - Karaf SSH
# 45444 - RMI Server
EXPOSE 1299 1514 5150 8201 45444

WORKDIR /opt/minion
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
CMD ["/opt/minion/bin/bootstrap.sh"]
