#!/bin/bash

apt update

if [ $? -ne 0 ]; then
	echo "fail"
	exit $?
fi

apt -y install wget libcppunit-dev libsasl2-dev libxml2-dev libkrb5-dev libdb-dev libnetfilter-conntrack-dev libexpat1-dev libcap2-dev libldap2-dev libpam0g-dev libgnutls28-dev libssl-dev libdbi-perl libecap3 libecap3-dev libsystemd-dev php php-mysql

if [ $? -ne 0 ]; then
	echo "fail"
	exit $?
fi

wget wget https://ae-rt.oss-cn-beijing.aliyuncs.com/ops/squid-4.13.tar.gz

if [ $? -ne 0 ]; then
	echo "fail"
	exit $?
fi

tar zxvf squid-4.13.tar.gz

if [ $? -ne 0 ]; then
	echo "fail"
	exit $?
fi

cd squid-4.13

if [ $? -ne 0 ]; then
	echo "fail"
	exit $?
fi

./configure  --prefix=/usr --includedir=/usr/include --mandir=/usr/share/man --infodir=/usr/share/info --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/squid --srcdir=. --disable-maintainer-mode --disable-dependency-tracking --disable-silent-rules  --datadir=/usr/share/squid --sysconfdir=/etc/squid --libexecdir=/usr/lib/squid --mandir=/usr/share/man --enable-inline --disable-arch-native --enable-async-io=8 --enable-storeio=ufs,aufs,diskd,rock --enable-removal-policies=lru,heap --enable-delay-pools --enable-cache-digests --enable-icap-client --enable-follow-x-forwarded-for --enable-auth-basic=DB,fake,getpwnam,LDAP,NCSA,NIS,PAM,POP3,RADIUS,SASL,SMB --enable-auth-digest=file,LDAP --enable-auth-negotiate=kerberos,wrapper --enable-auth-ntlm=fake --enable-external-acl-helpers=file_userip,kerberos_ldap_group,LDAP_group,session,SQL_session,unix_group,wbinfo_group --enable-url-rewrite-helpers=fake --enable-eui --enable-esi --enable-icmp --enable-zph-qos --enable-ecap --disable-translation --with-swapdir=/var/spool/squid --with-logdir=/var/log/squid --with-pidfile=/var/run/squid.pid --with-filedescriptors=65536 --with-large-files --with-default-user=proxy --enable-linux-netfilte --enable-basic-auth-helpers=DB

if [ $? -ne 0 ]; then
	echo "fail"
	exit $?
fi

make && make install

squid -v



