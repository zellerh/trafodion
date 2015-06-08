-- @@@ START COPYRIGHT @@@
--
-- (C) Copyright 2014-2015 Hewlett-Packard Development Company, L.P.
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
--
-- @@@ END COPYRIGHT @@@
#######################################################################
# @@@ START COPYRIGHT @@@
#
#        HP CONFIDENTIAL: NEED TO KNOW ONLY
#
#        Copyright 2002
#        Hewlett-Packard Development Company, L.P.
#        Protected as an unpublished work.
#
#  The computer program listings, specifications and documentation 
#  herein are the property of Hewlett-Packard Development Company,
#  L.P., or a third party supplier and shall not be reproduced, 
#  copied, disclosed, or used in whole or in part for any reason 
#  without the prior express written permission of Hewlett-Packard 
#  Development Company, L.P.
#
# @@@ END COPYRIGHT @@@
# +++ Copyright added on 2003/12/3
# +++ Code modified on 2002/8/21
#######################################################################
# Parameters: 
# 1. Number of rows to insert
# 2. Max value

rm exec_fillup_t2
prim_index=1
rows_num=$1
while [ ! $prim_index -gt $rows_num ];
do
	$sec_val=`expr $prim_index '*' 2`
	echo 'insert into T2 values ('$prim_index','$sec_val',0,0,"aaa");' >> exec_fillup_t2
	prim_index=`expr $prim_index +1`
done
prim_index=$2
$sec_val=`expr $prim_index '*' 2`
echo 'insert into T2 values ('$prim_index','$sec_val',0,0,"aaa");' >> exec_fillup_t2