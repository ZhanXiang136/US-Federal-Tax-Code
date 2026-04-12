
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

#define FLORA_COMPILATION_ID 2

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
#define FLORA_THIS_FILENAME  'summary_and_explanations.ergo'
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

 
#if !defined(FLORA_FLM_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLM_FILENAME  'summary_and_explanations.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(summary_and_explanations,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'summary_and_explanations.fld'
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
#define FLORA_FLS_FILENAME  'summary_and_explanations.fls'
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

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_summary,__T,__Year,__Status,__AGI,__SD,__TI,__Tax,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,__Year,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,__Year,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,___T,tax_year,__Year,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,___T,tax_year,'Tax year is currently configured globally in rules/1040/config.ergo.','_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,filing_status,__Status,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,filing_status,'Filing status is taken from the taxpayer''s declared filing_status fact.','_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,agi,__AGI,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,agi,'Adjusted Gross Income (AGI) is currently computed as the sum of income sources (no adjustments yet).','_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,total_income,__Total,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Total,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,total_income,'Total income aggregates wage income, interest, dividends, capital gains, business income, unemployment compensation, and other income (if provided).','_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(income_total,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,adjustments_total,__Adj,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Adj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,adjustments_total,'Adjustments total aggregates deductible adjustments from Schedule 1 inputs (if provided).','_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_total,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,standard_deduction,__SD,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,__Year,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26))),fllibexecute_delayed_calls([__SD,__T,__Year],[__SD,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,standard_deduction,'The standard deduction equals the basic amount for the filing status plus any additional amount for age 65+ and/or blindness (traditional additional standard deduction only).','_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,__Year,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28))),fllibexecute_delayed_calls([__T,__Year],[__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,taxable_income,__TI,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30))),fllibexecute_delayed_calls([__T,__TI,__Year],[__T,__TI])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,taxable_income,'Taxable income is AGI minus the standard deduction, floored at 0 if the deduction is larger than AGI.','_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32))),fllibexecute_delayed_calls([__T,__Year],[__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,tax_liability,__Tax,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,__Year,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,34))))),fllibexecute_delayed_calls([__Status,__T,__TI,__Tax,__Year],[__T,__Tax])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,tax_liability,'Tax liability is computed using the progressive tax brackets for the taxpayer''s filing status.','_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,36)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,36)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,__Year,__Status,__TI,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,36))))),fllibexecute_delayed_calls([__Status,__T,__TI,__Year],[__T])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,3,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_summary,__T,__Year,__Status,__AGI,__SD,__TI,__Tax,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,__Year,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,4)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,4)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,__Year,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar7,4))))))),null,'_$_$_ergo''rule_enabled'(4,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,4,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,___T,tax_year,__Year,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),null,'_$_$_ergo''rule_enabled'(6,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,5,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,___T,tax_year,'Tax year is currently configured globally in rules/1040/config.ergo.','_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),null,'_$_$_ergo''rule_enabled'(8,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,filing_status,__Status,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),null,'_$_$_ergo''rule_enabled'(10,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,filing_status,'Filing status is taken from the taxpayer''s declared filing_status fact.','_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),null,'_$_$_ergo''rule_enabled'(12,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,agi,__AGI,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),null,'_$_$_ergo''rule_enabled'(14,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(16,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,agi,'Adjusted Gross Income (AGI) is currently computed as the sum of income sources (no adjustments yet).','_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,16)),null,'_$_$_ergo''rule_enabled'(16,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(18,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,total_income,__Total,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(income_sum,__T,__Total,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,18)),null,'_$_$_ergo''rule_enabled'(18,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(20,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,total_income,'Total income aggregates wage income, interest, dividends, capital gains, business income, unemployment compensation, and other income (if provided).','_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(income_total,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,20)),null,'_$_$_ergo''rule_enabled'(20,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(22,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,adjustments_total,__Adj,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_sum,__T,__Adj,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,22)),null,'_$_$_ergo''rule_enabled'(22,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(24,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,adjustments_total,'Adjustments total aggregates deductible adjustments from Schedule 1 inputs (if provided).','_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(adjustment_total,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,24)),null,'_$_$_ergo''rule_enabled'(24,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(26,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,14,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,standard_deduction,__SD,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,26)),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,__Year,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,26))),null,'_$_$_ergo''rule_enabled'(26,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__SD,__T,__Year],[__SD,__T]),true)).
?-(fllibinsrulesig(28,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,15,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,standard_deduction,'The standard deduction equals the basic amount for the filing status plus any additional amount for age 65+ and/or blindness (traditional additional standard deduction only).','_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,28)),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,__Year,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,28))),null,'_$_$_ergo''rule_enabled'(28,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__T,__Year],[__T]),true)).
?-(fllibinsrulesig(30,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,16,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,taxable_income,__TI,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,30)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,30))),null,'_$_$_ergo''rule_enabled'(30,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__T,__TI,__Year],[__T,__TI]),true)).
?-(fllibinsrulesig(32,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,taxable_income,'Taxable income is AGI minus the standard deduction, floored at 0 if the deduction is larger than AGI.','_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,32))),null,'_$_$_ergo''rule_enabled'(32,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__T,__Year],[__T]),true)).
?-(fllibinsrulesig(34,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,tax_liability,__Tax,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,34)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,34)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,__Year,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,34))))),null,'_$_$_ergo''rule_enabled'(34,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Status,__T,__TI,__Tax,__Year],[__T,__Tax]),true)).
?-(fllibinsrulesig(36,'summary_and_explanations.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,tax_liability,'Tax liability is computed using the progressive tax brackets for the taxpayer''s filing status.','_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(tax_year,__Year,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,36)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,36)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__Year,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,36)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,__Year,__Status,__TI,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,36))))),null,'_$_$_ergo''rule_enabled'(36,'summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Status,__T,__TI,__Year],[__T]),true)).


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
#define FLORA_FLS2_FILENAME  'summary_and_explanations.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('summary_and_explanations.ergo',FLORA_THIS_MODULE_NAME))).

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

