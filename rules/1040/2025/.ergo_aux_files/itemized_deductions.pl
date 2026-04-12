
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
#define FLORA_THIS_FILENAME  'itemized_deductions.ergo'
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
#define FLORA_FDB_FILENAME  'itemized_deductions.fdb'
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
#define FLORA_FLM_FILENAME  'itemized_deductions.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(itemized_deductions,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'itemized_deductions.fld'
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
#define FLORA_FLS_FILENAME  'itemized_deductions.fls'
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

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(min2,__A,__B,__Min,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'itemized_deductions.ergo',25,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',26,[__Min,__A])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(min2,__A,__B,__Min,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'itemized_deductions.ergo',29,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',30,[__Min,__B])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(max2,__A,__B,__Max,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>=,'itemized_deductions.ergo',33,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',34,[__Max,__A])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(max2,__A,__B,__Max,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(<,'itemized_deductions.ergo',37,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',38,[__Max,__B])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(medical_deduction,__T,__Year,__Ded,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_expenses,__T,__Med,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_floor_pct,__Year,__Pct,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,12)),','(fllibdelayedliteral('\\is','itemized_deductions.ergo',46,[__Floor,*(__AGI,__Pct)]),','(fllibdelayedliteral('\\is','itemized_deductions.ergo',47,[__Temp,-(__Med,__Floor)]),FLORA_THIS_WORKSPACE(d^tblflapply)(max2,__Temp,0,__Ded,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,12))))))),fllibexecute_delayed_calls([__AGI,__Ded,__Floor,__Med,__Pct,__T,__Temp,__Year],[__Ded,__T,__Year])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(medical_deduction,__T,'_Year',0,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_expenses,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_income_taxes,__T,__Inc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),fllibdelayedliteral('\\is','itemized_deductions.ergo',57,[__Total,__Inc])),fllibexecute_delayed_calls([__Inc,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_sales_taxes,__T,__Sales,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),fllibdelayedliteral('\\is','itemized_deductions.ergo',61,[__Total,__Sales])),fllibexecute_delayed_calls([__Sales,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(real_estate_taxes,__T,__RE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),fllibdelayedliteral('\\is','itemized_deductions.ergo',65,[__Total,__RE])),fllibexecute_delayed_calls([__RE,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(personal_property_taxes,__T,__PP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),fllibdelayedliteral('\\is','itemized_deductions.ergo',69,[__Total,__PP])),fllibexecute_delayed_calls([__PP,__T,__Total],[__T,__Total])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_deduction,__T,__Year,__Ded,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_income_or_zero,__T,__Inc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_sales_or_zero,__T,__Sales,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_re_or_zero,__T,__RE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_pp_or_zero,__T,__PP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,24)),','(fllibdelayedliteral('\\is','itemized_deductions.ergo',76,[__Total,+(+(+(__Inc,__Sales),__RE),__PP)]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_cap,__Year,__Cap,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,24)),FLORA_THIS_WORKSPACE(d^tblflapply)(min2,__Total,__Cap,__Ded,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,24)))))))),fllibexecute_delayed_calls([__Cap,__Ded,__Inc,__PP,__RE,__Sales,__T,__Total,__Year],[__Ded,__T,__Year])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_income_or_zero,__T,__Inc,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_income_taxes,__T,__Inc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_income_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_sales_or_zero,__T,__Sales,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_sales_taxes,__T,__Sales,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_sales_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_sales_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_re_or_zero,__T,__RE,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(real_estate_taxes,__T,__RE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_re_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(real_estate_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_pp_or_zero,__T,__PP,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(38,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(personal_property_taxes,__T,__PP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_pp_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(40,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(personal_property_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(42,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(44,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(46,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(48,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,48)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(50,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,50)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(52,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,52)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(54,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,54)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(itemized_deduction,__T,__Year,__Total,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(56,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_or_zero,__T,__Year,__Med,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_or_zero,__T,__Year,__Salt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest_or_zero,__T,__MI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash_or_zero,__T,__CC,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash_or_zero,__T,__CNC,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses_or_zero,__T,__Cas,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized_or_zero,__T,__Other,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,56)),fllibdelayedliteral('\\is','itemized_deductions.ergo',131,[__Total,+(+(+(+(+(+(__Med,__Salt),__MI),__CC),__CNC),__Cas),__Other)])))))))),fllibexecute_delayed_calls([__CC,__CNC,__Cas,__MI,__Med,__Other,__Salt,__T,__Total,__Year],[__T,__Total,__Year])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(medical_or_zero,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(58,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,58)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(medical_or_zero,__T,'_Year',0,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(60,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,'_Year','_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,60))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_or_zero,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(62,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,62)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(salt_or_zero,__T,'_Year',0,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(64,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,'_Year','_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,64))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(mortgage_interest_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(66,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,66)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(mortgage_interest_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(68,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,68))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(charitable_cash_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(70,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,70)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(charitable_cash_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(72,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,72))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(charitable_noncash_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(74,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(charitable_noncash_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(76,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(casualty_losses_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(78,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(casualty_losses_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(80,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_itemized_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(82,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(other_itemized_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(84,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84))))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,5,FLORA_THIS_WORKSPACE(d^tblflapply)(min2,__A,__B,__Min,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(fllibdelayedliteral(=<,'itemized_deductions.ergo',25,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',26,[__Min,__A])),null,'_$_$_ergo''rule_enabled'(4,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^tblflapply)(min2,__A,__B,__Min,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(fllibdelayedliteral(>,'itemized_deductions.ergo',29,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',30,[__Min,__B])),null,'_$_$_ergo''rule_enabled'(6,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^tblflapply)(max2,__A,__B,__Max,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(fllibdelayedliteral(>=,'itemized_deductions.ergo',33,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',34,[__Max,__A])),null,'_$_$_ergo''rule_enabled'(8,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(max2,__A,__B,__Max,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(fllibdelayedliteral(<,'itemized_deductions.ergo',37,[__A,__B]),fllibdelayedliteral('\\is','itemized_deductions.ergo',38,[__Max,__B])),null,'_$_$_ergo''rule_enabled'(10,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,__Year,__Ded,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_expenses,__T,__Med,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_floor_pct,__Year,__Pct,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,12)),','(fllibdelayedliteral('\\is','itemized_deductions.ergo',46,[__Floor,*(__AGI,__Pct)]),','(fllibdelayedliteral('\\is','itemized_deductions.ergo',47,[__Temp,-(__Med,__Floor)]),FLORA_THIS_WORKSPACE(d^tblflapply)(max2,__Temp,0,__Ded,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,12))))))),null,'_$_$_ergo''rule_enabled'(12,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__AGI,__Ded,__Floor,__Med,__Pct,__T,__Temp,__Year],[__Ded,__T,__Year]),true)).
?-(fllibinsrulesig(14,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,'_Year',0,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_expenses,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14))),null,'_$_$_ergo''rule_enabled'(14,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(16,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_income_taxes,__T,__Inc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),fllibdelayedliteral('\\is','itemized_deductions.ergo',57,[__Total,__Inc])),null,'_$_$_ergo''rule_enabled'(16,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Inc,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(18,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_sales_taxes,__T,__Sales,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),fllibdelayedliteral('\\is','itemized_deductions.ergo',61,[__Total,__Sales])),null,'_$_$_ergo''rule_enabled'(18,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Sales,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(20,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(real_estate_taxes,__T,__RE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),fllibdelayedliteral('\\is','itemized_deductions.ergo',65,[__Total,__RE])),null,'_$_$_ergo''rule_enabled'(20,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__RE,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(22,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,14,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_total,__T,__Total,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(personal_property_taxes,__T,__PP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),fllibdelayedliteral('\\is','itemized_deductions.ergo',69,[__Total,__PP])),null,'_$_$_ergo''rule_enabled'(22,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__PP,__T,__Total],[__T,__Total]),true)).
?-(fllibinsrulesig(24,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,15,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,__Year,__Ded,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_income_or_zero,__T,__Inc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_sales_or_zero,__T,__Sales,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_re_or_zero,__T,__RE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,24)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_pp_or_zero,__T,__PP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,24)),','(fllibdelayedliteral('\\is','itemized_deductions.ergo',76,[__Total,+(+(+(__Inc,__Sales),__RE),__PP)]),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_cap,__Year,__Cap,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,24)),FLORA_THIS_WORKSPACE(d^tblflapply)(min2,__Total,__Cap,__Ded,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,24)))))))),null,'_$_$_ergo''rule_enabled'(24,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Cap,__Ded,__Inc,__PP,__RE,__Sales,__T,__Total,__Year],[__Ded,__T,__Year]),true)).
?-(fllibinsrulesig(26,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,16,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_income_or_zero,__T,__Inc,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_income_taxes,__T,__Inc,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),null,'_$_$_ergo''rule_enabled'(26,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(28,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_income_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_income_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28))),null,'_$_$_ergo''rule_enabled'(28,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(30,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_sales_or_zero,__T,__Sales,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_sales_taxes,__T,__Sales,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),null,'_$_$_ergo''rule_enabled'(30,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(32,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_sales_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(state_local_sales_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32))),null,'_$_$_ergo''rule_enabled'(32,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(34,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_re_or_zero,__T,__RE,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(real_estate_taxes,__T,__RE,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),null,'_$_$_ergo''rule_enabled'(34,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(36,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_re_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(real_estate_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36))),null,'_$_$_ergo''rule_enabled'(36,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(38,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_pp_or_zero,__T,__PP,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(personal_property_taxes,__T,__PP,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,38)),null,'_$_$_ergo''rule_enabled'(38,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(40,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_pp_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(personal_property_taxes,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,40))),null,'_$_$_ergo''rule_enabled'(40,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(42,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,42)),null,'_$_$_ergo''rule_enabled'(42,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(44,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,25,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),null,'_$_$_ergo''rule_enabled'(44,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(46,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,26,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,46)),null,'_$_$_ergo''rule_enabled'(46,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(48,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,48)),null,'_$_$_ergo''rule_enabled'(48,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(50,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,28,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,50)),null,'_$_$_ergo''rule_enabled'(50,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(52,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,29,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,52)),null,'_$_$_ergo''rule_enabled'(52,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(54,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_component,__T,'_Year',__Amt,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,54)),null,'_$_$_ergo''rule_enabled'(54,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(56,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,31,FLORA_THIS_WORKSPACE(d^tblflapply)(itemized_deduction,__T,__Year,__Total,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_or_zero,__T,__Year,__Med,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_or_zero,__T,__Year,__Salt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest_or_zero,__T,__MI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash_or_zero,__T,__CC,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash_or_zero,__T,__CNC,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses_or_zero,__T,__Cas,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,56)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized_or_zero,__T,__Other,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar8,56)),fllibdelayedliteral('\\is','itemized_deductions.ergo',131,[__Total,+(+(+(+(+(+(__Med,__Salt),__MI),__CC),__CNC),__Cas),__Other)])))))))),null,'_$_$_ergo''rule_enabled'(56,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__CC,__CNC,__Cas,__MI,__Med,__Other,__Salt,__T,__Total,__Year],[__T,__Total,__Year]),true)).
?-(fllibinsrulesig(58,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,32,FLORA_THIS_WORKSPACE(d^tblflapply)(medical_or_zero,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,58)),null,'_$_$_ergo''rule_enabled'(58,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(60,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,33,FLORA_THIS_WORKSPACE(d^tblflapply)(medical_or_zero,__T,'_Year',0,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(medical_deduction,__T,'_Year','_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,60))),null,'_$_$_ergo''rule_enabled'(60,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(62,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,34,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_or_zero,__T,__Year,__Amt,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,__Year,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,62)),null,'_$_$_ergo''rule_enabled'(62,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(64,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,35,FLORA_THIS_WORKSPACE(d^tblflapply)(salt_or_zero,__T,'_Year',0,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(salt_deduction,__T,'_Year','_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,64))),null,'_$_$_ergo''rule_enabled'(64,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(66,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,36,FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,66)),null,'_$_$_ergo''rule_enabled'(66,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(68,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,37,FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(mortgage_interest,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,68))),null,'_$_$_ergo''rule_enabled'(68,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(70,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,38,FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,70)),null,'_$_$_ergo''rule_enabled'(70,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(72,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,39,FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_cash,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,72))),null,'_$_$_ergo''rule_enabled'(72,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(74,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,40,FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74)),null,'_$_$_ergo''rule_enabled'(74,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(76,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,41,FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(charitable_noncash,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76))),null,'_$_$_ergo''rule_enabled'(76,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(78,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,42,FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78)),null,'_$_$_ergo''rule_enabled'(78,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(80,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,43,FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(casualty_losses,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80))),null,'_$_$_ergo''rule_enabled'(80,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(82,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,44,FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized_or_zero,__T,__Amt,'_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized,__T,__Amt,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82)),null,'_$_$_ergo''rule_enabled'(82,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(84,'itemized_deductions.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,45,FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized_or_zero,__T,0,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),\+(FLORA_THIS_WORKSPACE(d^tblflapply)(other_itemized,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84))),null,'_$_$_ergo''rule_enabled'(84,'itemized_deductions.ergo',FLORA_THIS_MODULE_NAME),null,true)).


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
#define FLORA_FLS2_FILENAME  'itemized_deductions.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('itemized_deductions.ergo',FLORA_THIS_MODULE_NAME))).

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

