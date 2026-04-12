
:-(compiler_options([xpp_on,canonical])).

/********** Tabling and Trailer Control Variables ************/

#define EQUALITYnone
#define INHERITANCEflogic
#define TABLINGreactive
#define TABLINGvariant
#define CUSTOMnone

#define FLORA_INCREMENTAL_TABLING 

/************************************************************************
  file: headerinc/flrheader_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader.flh"
#include "flora_porting.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrheader_prog_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).
#mode standard Prolog

#include "flrheader_prog.flh"

/***********************************************************************/

#define FLORA_COMPILATION_ID 1

/************************************************************************
  file: headerinc/flrheader2_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
  It has files that must be included in the header and typically
  contain some Prolog statements. Such files cannot appear
  in flrheader.flh because flrheader.flh is included in various restricted
  contexts where Prolog statements are not allowed.

  NOT included in ADDED files (compiled for addition) -- only in LOADED
  ones and in trailers/patch
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

%% flora_tabling_methods is included here to affect preprocessing of
%% flrtable/flrhilogtable.flh dynamically
#include "flora_tabling_methods.flh"

/* note: inside flrtable.flh there are checks for FLORA_NONTABLED_DATA_MODULE
   that exclude tabling non-signature molecules
*/
#ifndef FLORA_NONTABLED_MODULE
#include "flrtable.flh"
#endif

/* if normal tabled module, then table hilog */
#if !defined(FLORA_NONTABLED_DATA_MODULE) && !defined(FLORA_NONTABLED_MODULE)
#include "flrhilogtable.flh"
#endif

#include "flrtable_always.flh"

#include "flrauxtables.flh"

%% include list of tabled predicates
#mode save
#mode nocomment "%"
#if defined(FLORA_FLT_FILENAME)
#include FLORA_FLT_FILENAME
#endif
#mode restore

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdyna_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#define TABLING_CONNECTIVE  :-

#include "flrdyndeclare.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrindex_P_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrindex_P.flh"

/***********************************************************************/

#mode save
#mode nocomment "%"
#define FLORA_THIS_FILENAME  'agi.ergo'
#mode restore
/************************************************************************
  file: headerinc/flrdefinition_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrdefinition.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrtrailerregistry_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailerregistry.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrrefreshtable_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrrefreshtable.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrdynamic_connectors_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrdynamic_connectors.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrimportedcalls_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

%% Loads the file with all the import statements for predicates
%% that must be known everywhere

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBIMPORTEDCALLS))).

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpatch_inc.flh

  Author(s): Guizhen Yang

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrexportcheck.flh"
#include "flrpatch.flh"
/***********************************************************************/

/************************************************************************
  file: headerinc/flropposes_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flropposes.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrhead_dispatch_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrhead_dispatch.flh"

/***********************************************************************/

/************************************************************************
  file: syslibinc/flrclause_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the FLORA-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#mode standard Prolog

#if !defined(FLORA_TERMS_FLH)
#define FLORA_TERMS_FLH
#include "flora_terms.flh"
#endif

?-(:(flrlibman,flora_load_library(FLLIBCLAUSE))).

/***********************************************************************/

 
#if !defined(FLORA_FDB_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FDB_FILENAME  'agi.fdb'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FDB_FILENAME,FLORA_THIS_MODULE_NAME,'fdb'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FDB_FILENAME,FLORA_THIS_FDB_STORAGE))).
#endif

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'agi.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(agi,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'agi.fld'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLD_FILENAME,FLORA_THIS_MODULE_NAME,'fld'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_canonical_and_insert(FLORA_FLD_FILENAME,FLORA_THIS_FLD_STORAGE))).
#endif

 
#if !defined(FLORA_FLS_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS_FILENAME  'agi.fls'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS_FILENAME,FLORA_THIS_MODULE_NAME,'fls'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rules %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),fllibdelayedliteral('\\is','agi.ergo',27,[__Total,__W])),fllibexecute_delayed_calls([__T,__Total,__W],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_income,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),fllibdelayedliteral('\\is','agi.ergo',31,[__Total,__I])),fllibexecute_delayed_calls([__I,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends,__T,__D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),fllibdelayedliteral('\\is','agi.ergo',35,[__Total,__D])),fllibexecute_delayed_calls([__D,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends,__T,__QD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),fllibdelayedliteral('\\is','agi.ergo',39,[__Total,__QD])),fllibexecute_delayed_calls([__QD,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains,__T,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),fllibdelayedliteral('\\is','agi.ergo',43,[__Total,__G])),fllibexecute_delayed_calls([__G,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(business_income,__T,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),fllibdelayedliteral('\\is','agi.ergo',47,[__Total,__B])),fllibexecute_delayed_calls([__B,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),fllibdelayedliteral('\\is','agi.ergo',51,[__Total,__R])),fllibexecute_delayed_calls([__R,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),fllibdelayedliteral('\\is','agi.ergo',55,[__Total,__R])),fllibexecute_delayed_calls([__R,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income,__T,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),fllibdelayedliteral('\\is','agi.ergo',59,[__Total,__F])),fllibexecute_delayed_calls([__F,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds,__T,__TR,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),fllibdelayedliteral('\\is','agi.ergo',63,[__Total,__TR])),fllibexecute_delayed_calls([__T,__TR,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),fllibdelayedliteral('\\is','agi.ergo',67,[__Total,__A])),fllibexecute_delayed_calls([__A,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable,__T,__SS,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),fllibdelayedliteral('\\is','agi.ergo',71,[__Total,__SS])),fllibexecute_delayed_calls([__SS,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp,__T,__U,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),fllibdelayedliteral('\\is','agi.ergo',75,[__Total,__U])),fllibexecute_delayed_calls([__T,__Total,__U],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_income,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),fllibdelayedliteral('\\is','agi.ergo',79,[__Total,__O])),fllibexecute_delayed_calls([__O,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_total,__T,__Total,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(income_sum,__T,__Total,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income_or_zero,__T,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_or_zero,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends_or_zero,__T,__D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends_or_zero,__T,__QD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains_or_zero,__T,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(business_income_or_zero,__T,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income_or_zero,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income_or_zero,__T,__Ry,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income_or_zero,__T,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds_or_zero,__T,__TR,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019_or_zero,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable_or_zero,__T,__SS,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp_or_zero,__T,__U,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_income_or_zero,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,34)),fllibdelayedliteral('\\is','agi.ergo',101,[__Total,+(+(+(+(+(+(+(+(+(+(+(+(+(__W,__I),__D),__QD),__G),__B),__R),__Ry),__F),__TR),__A),__SS),__U),__O)]))))))))))))))),fllibexecute_delayed_calls([__A,__B,__D,__F,__G,__I,__O,__QD,__R,__Ry,__SS,__T,__TR,__Total,__U,__W],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(wage_income_or_zero,__T,__W,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(wage_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(38,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(taxable_interest_or_zero,__T,__I,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(40,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_income,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(taxable_interest_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(42,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ordinary_dividends_or_zero,__T,__D,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(44,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends,__T,__D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ordinary_dividends_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(46,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(qualified_dividends_or_zero,__T,__QD,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(48,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends,__T,__QD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,48)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(qualified_dividends_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(50,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,50))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(capital_gains_or_zero,__T,__G,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(52,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains,__T,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,52)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(capital_gains_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(54,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,54))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(business_income_or_zero,__T,__B,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(56,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(business_income,__T,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,56)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(business_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(58,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(business_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,58))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(rental_income_or_zero,__T,__R,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(60,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,60)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(rental_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(62,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,62))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(royalty_income_or_zero,__T,__Ry,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(64,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income,__T,__Ry,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,64)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(royalty_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(66,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,66))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(farm_income_or_zero,__T,__F,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(68,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income,__T,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,68)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(farm_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(70,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,70))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(taxable_refunds_or_zero,__T,__TR,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(72,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds,__T,__TR,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,72)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(taxable_refunds_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(74,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alimony_received_pre2019_or_zero,__T,__A,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(76,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alimony_received_pre2019_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(78,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(social_security_taxable_or_zero,__T,__SS,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(80,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable,__T,__SS,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(social_security_taxable_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(82,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(unemployment_comp_or_zero,__T,__U,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(84,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp,__T,__U,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(unemployment_comp_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,86,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(86,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,86))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_income_or_zero,__T,__O,'_$ctxt'(_CallerModuleVar,88,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(88,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(other_income,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,88)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,90,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(90,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(other_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,90))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,92,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(92,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses,__T,__E,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,92)),fllibdelayedliteral('\\is','agi.ergo',192,[__Total,__E])),fllibexecute_delayed_calls([__E,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,94,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(94,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,94)),fllibdelayedliteral('\\is','agi.ergo',196,[__Total,__I])),fllibexecute_delayed_calls([__I,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,96,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(96,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest,__T,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,96)),fllibdelayedliteral('\\is','agi.ergo',200,[__Total,__S])),fllibexecute_delayed_calls([__S,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,98,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(98,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction,__T,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,98)),fllibdelayedliteral('\\is','agi.ergo',204,[__Total,__H])),fllibexecute_delayed_calls([__H,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,100,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(100,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction,__T,__SE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,100)),fllibdelayedliteral('\\is','agi.ergo',208,[__Total,__SE])),fllibexecute_delayed_calls([__SE,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,102,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(102,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance,__T,__HI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,102)),fllibdelayedliteral('\\is','agi.ergo',212,[__Total,__HI])),fllibexecute_delayed_calls([__HI,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,104,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(104,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal,__T,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,104)),fllibdelayedliteral('\\is','agi.ergo',216,[__Total,__P])),fllibexecute_delayed_calls([__P,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,106,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(106,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans,__T,__SEP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,106)),fllibdelayedliteral('\\is','agi.ergo',220,[__Total,__SEP])),fllibexecute_delayed_calls([__SEP,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,108,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(108,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement,__T,__SER,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,108)),fllibdelayedliteral('\\is','agi.ergo',224,[__Total,__SER])),fllibexecute_delayed_calls([__SER,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,110,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(110,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty,__T,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,110)),fllibdelayedliteral('\\is','agi.ergo',228,[__Total,__M])),fllibexecute_delayed_calls([__M,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,112,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(112,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,112)),fllibdelayedliteral('\\is','agi.ergo',232,[__Total,__A])),fllibexecute_delayed_calls([__A,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,114,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(114,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,114)),fllibdelayedliteral('\\is','agi.ergo',236,[__Total,__O])),fllibexecute_delayed_calls([__O,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_total,__T,__Total,'_$ctxt'(_CallerModuleVar,116,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(116,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,116)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(adjustment_sum,__T,__Total,'_$ctxt'(_CallerModuleVar,118,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(118,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses_or_zero,__T,__E,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction_or_zero,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest_or_zero,__T,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction_or_zero,__T,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction_or_zero,__T,__SE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance_or_zero,__T,__HI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal_or_zero,__T,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans_or_zero,__T,__SEP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement_or_zero,__T,__SER,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty_or_zero,__T,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019_or_zero,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments_or_zero,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,118)),fllibdelayedliteral('\\is','agi.ergo',254,[__Total,+(+(+(+(+(+(+(+(+(+(+(__E,__I),__S),__H),__SE),__HI),__P),__SEP),__SER),__M),__A),__O)]))))))))))))),fllibexecute_delayed_calls([__A,__E,__H,__HI,__I,__M,__O,__P,__S,__SE,__SEP,__SER,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(educator_expenses_or_zero,__T,__E,'_$ctxt'(_CallerModuleVar,120,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(120,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses,__T,__E,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,120)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(educator_expenses_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,122,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(122,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,122))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ira_deduction_or_zero,__T,__I,'_$ctxt'(_CallerModuleVar,124,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(124,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,124)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(ira_deduction_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,126,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(126,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,126))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(student_loan_interest_or_zero,__T,__S,'_$ctxt'(_CallerModuleVar,128,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(128,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest,__T,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,128)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(student_loan_interest_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,130,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(130,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,130))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(hsa_deduction_or_zero,__T,__H,'_$ctxt'(_CallerModuleVar,132,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(132,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction,__T,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,132)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(hsa_deduction_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,134,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(134,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,134))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(self_employment_tax_deduction_or_zero,__T,__SE,'_$ctxt'(_CallerModuleVar,136,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(136,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction,__T,__SE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,136)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(self_employment_tax_deduction_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,138,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(138,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,138))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(self_employed_health_insurance_or_zero,__T,__HI,'_$ctxt'(_CallerModuleVar,140,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(140,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance,__T,__HI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,140)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(self_employed_health_insurance_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,142,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(142,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,142))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(penalty_on_early_withdrawal_or_zero,__T,__P,'_$ctxt'(_CallerModuleVar,144,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(144,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal,__T,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,144)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(penalty_on_early_withdrawal_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,146,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(146,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,146))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(sep_simple_qualified_plans_or_zero,__T,__SEP,'_$ctxt'(_CallerModuleVar,148,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(148,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans,__T,__SEP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,148)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(sep_simple_qualified_plans_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,150,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(150,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,150))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(self_employed_retirement_or_zero,__T,__SER,'_$ctxt'(_CallerModuleVar,152,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(152,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement,__T,__SER,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,152)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(self_employed_retirement_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,154,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(154,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,154))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(moving_expenses_active_duty_or_zero,__T,__M,'_$ctxt'(_CallerModuleVar,156,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(156,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty,__T,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,156)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(moving_expenses_active_duty_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,158,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(158,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,158))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alimony_paid_pre2019_or_zero,__T,__A,'_$ctxt'(_CallerModuleVar,160,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(160,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,160)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(alimony_paid_pre2019_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,162,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(162,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,162))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_adjustments_or_zero,__T,__O,'_$ctxt'(_CallerModuleVar,164,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(164,'agi.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,164)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_adjustments_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,166,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(166,'agi.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,166))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(agi,__T,__AGI,'_$ctxt'(_CallerModuleVar,168,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(168,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,168)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Adj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,168)),','(fllibdelayedliteral('\\is','agi.ergo',320,[__Temp,-(__Income,__Adj)]),','(fllibdelayedliteral(=<,'agi.ergo',321,[__Temp,0]),fllibdelayedliteral('\\is','agi.ergo',322,[__AGI,0]))))),fllibexecute_delayed_calls([__AGI,__Adj,__Income,__T,__Temp],[__AGI,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(agi,__T,__AGI,'_$ctxt'(_CallerModuleVar,170,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(170,'agi.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,170)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Adj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,170)),','(fllibdelayedliteral('\\is','agi.ergo',327,[__Temp,-(__Income,__Adj)]),','(fllibdelayedliteral(>,'agi.ergo',328,[__Temp,0]),fllibdelayedliteral('\\is','agi.ergo',329,[__AGI,__Temp]))))),fllibexecute_delayed_calls([__AGI,__Adj,__Income,__T,__Temp],[__AGI,__T])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,4,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),fllibdelayedliteral('\\is','agi.ergo',27,[__Total,__W])),null,'_$_$_ergo''rule_enabled'(4,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__T,__Total,__W],[__T,__Total]),true)).
?-(fllibinsrulesig(6,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,5,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_income,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),fllibdelayedliteral('\\is','agi.ergo',31,[__Total,__I])),null,'_$_$_ergo''rule_enabled'(6,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__I,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(8,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends,__T,__D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),fllibdelayedliteral('\\is','agi.ergo',35,[__Total,__D])),null,'_$_$_ergo''rule_enabled'(8,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__D,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(10,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends,__T,__QD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),fllibdelayedliteral('\\is','agi.ergo',39,[__Total,__QD])),null,'_$_$_ergo''rule_enabled'(10,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__QD,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(12,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains,__T,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),fllibdelayedliteral('\\is','agi.ergo',43,[__Total,__G])),null,'_$_$_ergo''rule_enabled'(12,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__G,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(14,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(business_income,__T,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),fllibdelayedliteral('\\is','agi.ergo',47,[__Total,__B])),null,'_$_$_ergo''rule_enabled'(14,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__B,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(16,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),fllibdelayedliteral('\\is','agi.ergo',51,[__Total,__R])),null,'_$_$_ergo''rule_enabled'(16,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__R,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(18,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),fllibdelayedliteral('\\is','agi.ergo',55,[__Total,__R])),null,'_$_$_ergo''rule_enabled'(18,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__R,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(20,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income,__T,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),fllibdelayedliteral('\\is','agi.ergo',59,[__Total,__F])),null,'_$_$_ergo''rule_enabled'(20,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__F,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(22,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds,__T,__TR,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),fllibdelayedliteral('\\is','agi.ergo',63,[__Total,__TR])),null,'_$_$_ergo''rule_enabled'(22,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__T,__TR,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(24,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,14,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),fllibdelayedliteral('\\is','agi.ergo',67,[__Total,__A])),null,'_$_$_ergo''rule_enabled'(24,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__A,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(26,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,15,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable,__T,__SS,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),fllibdelayedliteral('\\is','agi.ergo',71,[__Total,__SS])),null,'_$_$_ergo''rule_enabled'(26,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__SS,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(28,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,16,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp,__T,__U,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),fllibdelayedliteral('\\is','agi.ergo',75,[__Total,__U])),null,'_$_$_ergo''rule_enabled'(28,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__T,__Total,__U],[__T,__Total]),true)).
?-(fllibinsrulesig(30,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_income,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),fllibdelayedliteral('\\is','agi.ergo',79,[__Total,__O])),null,'_$_$_ergo''rule_enabled'(30,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__O,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(32,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(income_total,__T,__Total,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(income_item,__T,__Total,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),null,'_$_$_ergo''rule_enabled'(32,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(34,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Total,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income_or_zero,__T,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_or_zero,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends_or_zero,__T,__D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends_or_zero,__T,__QD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains_or_zero,__T,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(business_income_or_zero,__T,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income_or_zero,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income_or_zero,__T,__Ry,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income_or_zero,__T,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds_or_zero,__T,__TR,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019_or_zero,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable_or_zero,__T,__SS,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp_or_zero,__T,__U,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar14,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_income_or_zero,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar15,34)),fllibdelayedliteral('\\is','agi.ergo',101,[__Total,+(+(+(+(+(+(+(+(+(+(+(+(+(__W,__I),__D),__QD),__G),__B),__R),__Ry),__F),__TR),__A),__SS),__U),__O)]))))))))))))))),null,'_$_$_ergo''rule_enabled'(34,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__A,__B,__D,__F,__G,__I,__O,__QD,__R,__Ry,__SS,__T,__TR,__Total,__U,__W],[__T,__Total]),true)).
?-(fllibinsrulesig(36,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income_or_zero,__T,__W,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,__W,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)),null,'_$_$_ergo''rule_enabled'(36,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(38,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38))),null,'_$_$_ergo''rule_enabled'(38,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(40,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_or_zero,__T,__I,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_income,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40)),null,'_$_$_ergo''rule_enabled'(40,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(42,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_interest_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42))),null,'_$_$_ergo''rule_enabled'(42,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(44,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends_or_zero,__T,__D,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends,__T,__D,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),null,'_$_$_ergo''rule_enabled'(44,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(46,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,25,FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(ordinary_dividends,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46))),null,'_$_$_ergo''rule_enabled'(46,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(48,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,26,FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends_or_zero,__T,__QD,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends,__T,__QD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,48)),null,'_$_$_ergo''rule_enabled'(48,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(50,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(qualified_dividends,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,50))),null,'_$_$_ergo''rule_enabled'(50,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(52,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,28,FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains_or_zero,__T,__G,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains,__T,__G,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,52)),null,'_$_$_ergo''rule_enabled'(52,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(54,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,29,FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(capital_gains,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,54))),null,'_$_$_ergo''rule_enabled'(54,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(56,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^tblflapply)(business_income_or_zero,__T,__B,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(business_income,__T,__B,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,56)),null,'_$_$_ergo''rule_enabled'(56,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(58,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,31,FLORA_THIS_WORKSPACE(d^tblflapply)(business_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(business_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,58))),null,'_$_$_ergo''rule_enabled'(58,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(60,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,32,FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income_or_zero,__T,__R,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income,__T,__R,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,60)),null,'_$_$_ergo''rule_enabled'(60,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(62,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,33,FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(rental_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,62))),null,'_$_$_ergo''rule_enabled'(62,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(64,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,34,FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income_or_zero,__T,__Ry,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income,__T,__Ry,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,64)),null,'_$_$_ergo''rule_enabled'(64,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(66,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,35,FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(royalty_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,66))),null,'_$_$_ergo''rule_enabled'(66,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(68,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,36,FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income_or_zero,__T,__F,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income,__T,__F,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,68)),null,'_$_$_ergo''rule_enabled'(68,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(70,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,37,FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(farm_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,70))),null,'_$_$_ergo''rule_enabled'(70,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(72,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,38,FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds_or_zero,__T,__TR,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds,__T,__TR,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,72)),null,'_$_$_ergo''rule_enabled'(72,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(74,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,39,FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_refunds,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74))),null,'_$_$_ergo''rule_enabled'(74,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(76,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,40,FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019_or_zero,__T,__A,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76)),null,'_$_$_ergo''rule_enabled'(76,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(78,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,41,FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_received_pre2019,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78))),null,'_$_$_ergo''rule_enabled'(78,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(80,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,42,FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable_or_zero,__T,__SS,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable,__T,__SS,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80)),null,'_$_$_ergo''rule_enabled'(80,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(82,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,43,FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(social_security_taxable,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82))),null,'_$_$_ergo''rule_enabled'(82,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(84,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,44,FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp_or_zero,__T,__U,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp,__T,__U,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84)),null,'_$_$_ergo''rule_enabled'(84,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(86,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,45,FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,86,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(unemployment_comp,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,86))),null,'_$_$_ergo''rule_enabled'(86,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(88,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,46,FLORA_THIS_WORKSPACE(d^tblflapply)(other_income_or_zero,__T,__O,'_$ctxt'(_CallerModuleVar,88,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(other_income,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,88)),null,'_$_$_ergo''rule_enabled'(88,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(90,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,47,FLORA_THIS_WORKSPACE(d^tblflapply)(other_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,90,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(other_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,90))),null,'_$_$_ergo''rule_enabled'(90,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(92,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,48,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,92,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses,__T,__E,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,92)),fllibdelayedliteral('\\is','agi.ergo',192,[__Total,__E])),null,'_$_$_ergo''rule_enabled'(92,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__E,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(94,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,49,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,94,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,94)),fllibdelayedliteral('\\is','agi.ergo',196,[__Total,__I])),null,'_$_$_ergo''rule_enabled'(94,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__I,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(96,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,50,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,96,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest,__T,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,96)),fllibdelayedliteral('\\is','agi.ergo',200,[__Total,__S])),null,'_$_$_ergo''rule_enabled'(96,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__S,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(98,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,51,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,98,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction,__T,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,98)),fllibdelayedliteral('\\is','agi.ergo',204,[__Total,__H])),null,'_$_$_ergo''rule_enabled'(98,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__H,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(100,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,52,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,100,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction,__T,__SE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,100)),fllibdelayedliteral('\\is','agi.ergo',208,[__Total,__SE])),null,'_$_$_ergo''rule_enabled'(100,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__SE,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(102,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,53,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,102,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance,__T,__HI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,102)),fllibdelayedliteral('\\is','agi.ergo',212,[__Total,__HI])),null,'_$_$_ergo''rule_enabled'(102,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__HI,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(104,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,54,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,104,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal,__T,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,104)),fllibdelayedliteral('\\is','agi.ergo',216,[__Total,__P])),null,'_$_$_ergo''rule_enabled'(104,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__P,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(106,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,55,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,106,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans,__T,__SEP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,106)),fllibdelayedliteral('\\is','agi.ergo',220,[__Total,__SEP])),null,'_$_$_ergo''rule_enabled'(106,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__SEP,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(108,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,56,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,108,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement,__T,__SER,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,108)),fllibdelayedliteral('\\is','agi.ergo',224,[__Total,__SER])),null,'_$_$_ergo''rule_enabled'(108,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__SER,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(110,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,57,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,110,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty,__T,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,110)),fllibdelayedliteral('\\is','agi.ergo',228,[__Total,__M])),null,'_$_$_ergo''rule_enabled'(110,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__M,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(112,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,58,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,112,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,112)),fllibdelayedliteral('\\is','agi.ergo',232,[__Total,__A])),null,'_$_$_ergo''rule_enabled'(112,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__A,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(114,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,59,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(_CallerModuleVar,114,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,114)),fllibdelayedliteral('\\is','agi.ergo',236,[__Total,__O])),null,'_$_$_ergo''rule_enabled'(114,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__O,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(116,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,60,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_total,__T,__Total,'_$ctxt'(_CallerModuleVar,116,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_item,__T,__Total,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,116)),null,'_$_$_ergo''rule_enabled'(116,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(118,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,61,FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Total,'_$ctxt'(_CallerModuleVar,118,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses_or_zero,__T,__E,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction_or_zero,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest_or_zero,__T,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction_or_zero,__T,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction_or_zero,__T,__SE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance_or_zero,__T,__HI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal_or_zero,__T,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans_or_zero,__T,__SEP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar9,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement_or_zero,__T,__SER,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar10,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty_or_zero,__T,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar11,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019_or_zero,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar12,118)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments_or_zero,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar13,118)),fllibdelayedliteral('\\is','agi.ergo',254,[__Total,+(+(+(+(+(+(+(+(+(+(+(__E,__I),__S),__H),__SE),__HI),__P),__SEP),__SER),__M),__A),__O)]))))))))))))),null,'_$_$_ergo''rule_enabled'(118,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__A,__E,__H,__HI,__I,__M,__O,__P,__S,__SE,__SEP,__SER,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(120,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,62,FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses_or_zero,__T,__E,'_$ctxt'(_CallerModuleVar,120,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses,__T,__E,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,120)),null,'_$_$_ergo''rule_enabled'(120,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(122,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,63,FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,122,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(educator_expenses,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,122))),null,'_$_$_ergo''rule_enabled'(122,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(124,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,64,FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction_or_zero,__T,__I,'_$ctxt'(_CallerModuleVar,124,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction,__T,__I,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,124)),null,'_$_$_ergo''rule_enabled'(124,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(126,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,65,FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,126,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(ira_deduction,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,126))),null,'_$_$_ergo''rule_enabled'(126,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(128,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,66,FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest_or_zero,__T,__S,'_$ctxt'(_CallerModuleVar,128,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest,__T,__S,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,128)),null,'_$_$_ergo''rule_enabled'(128,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(130,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,67,FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,130,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(student_loan_interest,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,130))),null,'_$_$_ergo''rule_enabled'(130,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(132,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,68,FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction_or_zero,__T,__H,'_$ctxt'(_CallerModuleVar,132,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction,__T,__H,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,132)),null,'_$_$_ergo''rule_enabled'(132,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(134,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,69,FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,134,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(hsa_deduction,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,134))),null,'_$_$_ergo''rule_enabled'(134,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(136,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,70,FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction_or_zero,__T,__SE,'_$ctxt'(_CallerModuleVar,136,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction,__T,__SE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,136)),null,'_$_$_ergo''rule_enabled'(136,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(138,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,71,FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,138,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employment_tax_deduction,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,138))),null,'_$_$_ergo''rule_enabled'(138,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(140,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,72,FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance_or_zero,__T,__HI,'_$ctxt'(_CallerModuleVar,140,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance,__T,__HI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,140)),null,'_$_$_ergo''rule_enabled'(140,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(142,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,73,FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,142,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_health_insurance,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,142))),null,'_$_$_ergo''rule_enabled'(142,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(144,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,74,FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal_or_zero,__T,__P,'_$ctxt'(_CallerModuleVar,144,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal,__T,__P,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,144)),null,'_$_$_ergo''rule_enabled'(144,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(146,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,75,FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,146,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(penalty_on_early_withdrawal,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,146))),null,'_$_$_ergo''rule_enabled'(146,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(148,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,76,FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans_or_zero,__T,__SEP,'_$ctxt'(_CallerModuleVar,148,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans,__T,__SEP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,148)),null,'_$_$_ergo''rule_enabled'(148,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(150,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,77,FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,150,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(sep_simple_qualified_plans,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,150))),null,'_$_$_ergo''rule_enabled'(150,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(152,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,78,FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement_or_zero,__T,__SER,'_$ctxt'(_CallerModuleVar,152,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement,__T,__SER,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,152)),null,'_$_$_ergo''rule_enabled'(152,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(154,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,79,FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,154,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(self_employed_retirement,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,154))),null,'_$_$_ergo''rule_enabled'(154,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(156,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,80,FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty_or_zero,__T,__M,'_$ctxt'(_CallerModuleVar,156,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty,__T,__M,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,156)),null,'_$_$_ergo''rule_enabled'(156,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(158,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,81,FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,158,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(moving_expenses_active_duty,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,158))),null,'_$_$_ergo''rule_enabled'(158,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(160,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,82,FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019_or_zero,__T,__A,'_$ctxt'(_CallerModuleVar,160,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019,__T,__A,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,160)),null,'_$_$_ergo''rule_enabled'(160,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(162,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,83,FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,162,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(alimony_paid_pre2019,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,162))),null,'_$_$_ergo''rule_enabled'(162,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(164,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,84,FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments_or_zero,__T,__O,'_$ctxt'(_CallerModuleVar,164,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments,__T,__O,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,164)),null,'_$_$_ergo''rule_enabled'(164,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(166,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,85,FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,166,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(other_adjustments,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,166))),null,'_$_$_ergo''rule_enabled'(166,'agi.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(168,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,86,FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(_CallerModuleVar,168,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,168)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Adj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,168)),','(fllibdelayedliteral('\\is','agi.ergo',320,[__Temp,-(__Income,__Adj)]),','(fllibdelayedliteral(=<,'agi.ergo',321,[__Temp,0]),fllibdelayedliteral('\\is','agi.ergo',322,[__AGI,0]))))),null,'_$_$_ergo''rule_enabled'(168,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__AGI,__Adj,__Income,__T,__Temp],[__AGI,__T]),true)).
?-(fllibinsrulesig(170,'agi.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,87,FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(_CallerModuleVar,170,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Income,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,170)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Adj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,170)),','(fllibdelayedliteral('\\is','agi.ergo',327,[__Temp,-(__Income,__Adj)]),','(fllibdelayedliteral(>,'agi.ergo',328,[__Temp,0]),fllibdelayedliteral('\\is','agi.ergo',329,[__AGI,__Temp]))))),null,'_$_$_ergo''rule_enabled'(170,'agi.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__AGI,__Adj,__Income,__T,__Temp],[__AGI,__T]),true)).


%%%%%%%%%%%%%%%%%%%%%%%%% Signatures for latent queries %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%% Queries found in the source file %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 
#if !defined(FLORA_FLS2_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLS2_FILENAME  'agi.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('agi.ergo',FLORA_THIS_MODULE_NAME))).

/************************************************************************
  file: headerinc/flrtrailer_inc.flh

  Author(s): Michael Kifer

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

#include "flrtrailer.flh"

/***********************************************************************/

/************************************************************************
  file: headerinc/flrpreddef_inc.flh

  Author(s): Chang Zhao

  This file is automatically included by the Flora-2 compiler.
************************************************************************/

:-(compiler_options([xpp_on])).

#include "flrpreddef.flh"

/***********************************************************************/

