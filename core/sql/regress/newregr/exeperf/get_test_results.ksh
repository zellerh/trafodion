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
# zero ins.dml file
echo "" > ins.dml

for t in `ls *?.QLOG`
do
  query=$(basename $t .QLOG)
  StrtTime=$(grep "Start Time" $t| \
    sed -e 's/Start Time//' -e 's/^ *//' -e 's/\//-/g' -e 's/ /:/')
  ExecTime=$(grep "Execution Time" $t|sed -e 's/Execution Time//' -e 's/^ *//g')
  echo "insert into querytimes values('$query', timestamp '$StrtTime', time '$ExecTime');" >> ins.dml
done
