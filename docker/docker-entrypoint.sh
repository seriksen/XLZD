#!/bin/bash
#

sudo -u root /map_user ${HOST_UID} ${HOST_GID}
if [ -x /sbin/init ] ; then
    exec /bin/bash
else
    exec /usr/sbin/init
fi
