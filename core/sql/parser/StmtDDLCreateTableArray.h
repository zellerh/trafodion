#ifndef STMTDDLCREATETABLEARRAY_H
#define STMTDDLCREATETABLEARRAY_H
/* -*-C++-*-
 *****************************************************************************
 *
 * File:         StmtDDLCreateTableArray.h
 * Description:  class for an array of pointers pointing to instances of
 *               class StmtDDLCreateTable
 *               
 *               
 * Created:      5/26/95
 * Language:     C++
 *
 *
// @@@ START COPYRIGHT @@@
//
// (C) Copyright 1995-2014 Hewlett-Packard Development Company, L.P.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
// @@@ END COPYRIGHT @@@
 *
 *
 *****************************************************************************
 */


#include "Collections.h"
#include "StmtDDLCreateTable.h"
#ifndef   SQLPARSERGLOBALS_CONTEXT_AND_DIAGS
#define   SQLPARSERGLOBALS_CONTEXT_AND_DIAGS
#endif
#include "SqlParserGlobals.h"

// -----------------------------------------------------------------------
// contents of this file
// -----------------------------------------------------------------------
class StmtDDLCreateTableArray;

// -----------------------------------------------------------------------
// forward references
// -----------------------------------------------------------------------
// None.

// -----------------------------------------------------------------------
// Definition of class StmtDDLCreateTableArray
// -----------------------------------------------------------------------
class StmtDDLCreateTableArray : public LIST(StmtDDLCreateTable *)
{

public:

  // constructor
  StmtDDLCreateTableArray(CollHeap *heap = PARSERHEAP())
    : LIST(StmtDDLCreateTable *)(heap)
  {
  }

  // virtual destructor
  virtual ~StmtDDLCreateTableArray();

private:

}; // class StmtDDLCreateTableArray

#endif /* STMTDDLCREATETABLEARRAY_H */
