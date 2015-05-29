#/**
# *(C) Copyright 2013 Hewlett-Packard Development Company, L.P.
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */
#
#/**
# * Copyright 2007 The Apache Software Foundation
# *
# * Licensed to the Apache Software Foundation (ASF) under one
# * or more contributor license agreements.  See the NOTICE file
# * distributed with this work for additional information
# * regarding copyright ownership.  The ASF licenses this file
# * to you under the Apache License, Version 2.0 (the
# * "License"); you may not use this file except in compliance
# * with the License.  You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */

#
# should not be executable directly
# also should not be passed any arguments, since we need original $*

# resolve links - "${BASH_SOURCE-$0}" may be a softlink

this="${BASH_SOURCE-$0}"
while [ -h "$this" ]; do
  ls=`ls -ld "$this"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    this="$link"
  else
    this=`dirname "$this"`/"$link"
  fi
done

# convert relative path to absolute path
bin=`dirname "$this"`
script=`basename "$this"`
bin=`cd "$bin">/dev/null; pwd`
this="$bin/$script"

# the root of the hbase installation
if [ -z "$WMS_HOME" ]; then
  export WMS_HOME=`dirname "$this"`/..
fi

#check to see if the conf dir or wms home are given as an optional arguments
while [ $# -gt 1 ]
do
  if [ "--config" = "$1" ]
  then
    shift
    confdir=$1
    shift
    WMS_CONF_DIR=$confdir
  elif [ "--hosts" = "$1" ]
  then
    shift
    hosts=$1
    shift
    WMS_SERVERS=$hosts
  else
    # Presume we are at end of options and break
    break
  fi
done
 
# Allow alternate WMS conf dir location.
WMS_CONF_DIR="${WMS_CONF_DIR:-$WMS_HOME/conf}"
# List of WMS servers.
WMS_SERVERS="${WMS_SERVERS:-$WMS_CONF_DIR/servers}"

# Source the wms-env.sh.  Will have JAVA_HOME defined.
if [ -f "${WMS_CONF_DIR}/wms-env.sh" ]; then
  . "${WMS_CONF_DIR}/wms-env.sh"
fi

# Newer versions of glibc use an arena memory allocator that causes virtual
# memory usage to explode. Tune the variable down to prevent vmem explosion.
export MALLOC_ARENA_MAX=${MALLOC_ARENA_MAX:-4}

if [ -z "$JAVA_HOME" ]; then
  for candidate in \
    /usr/lib/jvm/java-6-sun \
    /usr/lib/jvm/java-1.6.0-sun-1.6.0.*/jre \
    /usr/lib/jvm/java-1.6.0-sun-1.6.0.* \
    /usr/lib/j2sdk1.6-sun \
    /usr/java/jdk1.6* \
    /usr/java/jre1.6* \
    /Library/Java/Home ; do
    if [ -e $candidate/bin/java ]; then
      export JAVA_HOME=$candidate
      break
    fi
  done
  # if we didn't set it
  if [ -z "$JAVA_HOME" ]; then
    cat 1>&2 <<EOF
+======================================================================+
|      Error: JAVA_HOME is not set and Java could not be found         |
+----------------------------------------------------------------------+
| Please download the latest Sun JDK from the Sun Java web site        |
|       > http://java.sun.com/javase/downloads/ <                      |
|                                                                      |
| HBase requires Java 1.6 or later.                                    |
| NOTE: This script will find Sun Java whether you install using the   |
|       binary or the RPM based installer.                             |
+======================================================================+
EOF
    exit 1
  fi
fi
