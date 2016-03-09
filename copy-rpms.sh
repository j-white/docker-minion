#!/bin/sh -e
if [ -z $OPENNMS_BUILD ]; then
  OPENNMS_BUILD="$HOME/git/opennms"
fi

RPM_ROOT="$OPENNMS_BUILD/target/rpm/RPMS/noarch"
test -e $RPM_ROOT || (echo "Cannot find RPMs in '$RPM_ROOT'. Try running ./makerpm.sh from '$OPENNMS_BUILD'." && exit 1)

pushd $OPENNMS_BUILD
RELEASE=`python -c "import xml.etree.ElementTree as ET; print(ET.parse(open('pom.xml')).getroot().find( '{http://maven.apache.org/POM/4.0.0}version').text)";`
RELEASE=$(echo $RELEASE | awk -F '-' '{ print $1; }')
popd

mkdir -p opennms/rpms
rm -rf opennms/rpms/*.rpm
cp $RPM_ROOT/opennms-webapp-jetty-$RELEASE*.noarch.rpm opennms/rpms/opennms-webapp-jetty.noarch.rpm
cp $RPM_ROOT/opennms-core-$RELEASE*.noarch.rpm opennms/rpms/opennms-core.noarch.rpm
cp $RPM_ROOT/opennms-$RELEASE*.noarch.rpm opennms/rpms/opennms.noarch.rpm

mkdir -p minion/rpms
rm -rf minion/rpms/*.rpm
cp $RPM_ROOT/opennms-minion-features-$RELEASE*.noarch.rpm minion/rpms/opennms-minion-features.noarch.rpm
cp $RPM_ROOT/opennms-minion-container-$RELEASE*.noarch.rpm minion/rpms/opennms-minion-container.noarch.rpm
