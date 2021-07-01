# dockerfile to build image for JBoss EAP 6.4

# start from rhel 7.2


# file author / maintainer


# update OS
yum -y update && \
yum -y install sudo openssh-clients telnet unzip java-1.8.0-openjdk-devel && \
yum clean all

# enabling sudo group
# enabling sudo over ssh
 echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
sed -i 's/.*requiretty$/Defaults !requiretty/' /etc/sudoers

# add a user for the application, with sudo permissions
useradd -m jboss ; echo jboss: | chpasswd ; usermod -a -G wheel jboss

# create workdir at path /opt/rh


# install JBoss EAP 6.4.0 


# set environment
JBOSS_HOME /opt/rh/jboss-eap-6.4

# create JBoss console user
$JBOSS_HOME/bin/add-user.sh admin admin@2016 --silent
# configure JBoss
echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> $JBOSS_HOME/bin/standalone.conf

# set permission folder
chown -R jboss:jboss /opt/rh

# JBoss ports - 8080 9990 9999


# start JBoss
$JBOSS_HOME/bin/standalone.sh -c standalone-full-ha.xml

# deploy app - place myapp.war to this path - $JBOSS_HOME/standalone/deployments/

#Set user to "jboss"

#Start bash shell
