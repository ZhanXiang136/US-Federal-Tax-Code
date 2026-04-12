
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
#define FLORA_THIS_FILENAME  'tax_1040_2024.ergo'
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
#define FLORA_FDB_FILENAME  'tax_1040_2024.fdb'
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
#define FLORA_FLM_FILENAME  'tax_1040_2024.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(tax_1040_2024,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'tax_1040_2024.fld'
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
#define FLORA_FLS_FILENAME  'tax_1040_2024.fls'
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

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(agi,__T,__AGI,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,__Wages,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',40,[__AGI,__Wages])),fllibexecute_delayed_calls([__AGI,__T,__Wages],[__AGI,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(qualifier_count,__T,__Count,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(age_65_or_over_flag,__T,__SelfAge,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(blind_flag,__T,__SelfBlind,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(spouse_age_65_or_over_flag,__T,__SpouseAge,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(spouse_blind_flag,__T,__SpouseBlind,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,6)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',80,[__Count,+(+(+(__SelfAge,__SelfBlind),__SpouseAge),__SpouseBlind)]))))),fllibexecute_delayed_calls([__Count,__SelfAge,__SelfBlind,__SpouseAge,__SpouseBlind,__T],[__Count,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(additional_standard_deduction,__T,2025,__Extra,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(per_qualifier_additional_amount,2025,__Status,__PerQual,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(qualifier_count,__T,__Count,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,8)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',88,[__Extra,*(__PerQual,__Count)])))),fllibexecute_delayed_calls([__Count,__Extra,__PerQual,__Status,__T],[__Extra,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(standard_deduction,__T,2025,__Amount,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(base_standard_deduction,2025,__Status,__Base,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(additional_standard_deduction,__T,2025,__Extra,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,10)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',96,[__Amount,+(__Base,__Extra)])))),fllibexecute_delayed_calls([__Amount,__Base,__Extra,__Status,__T],[__Amount,__T])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',105,[__AGI,__SD]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',106,[__TI,0])))),fllibexecute_delayed_calls([__AGI,__SD,__T,__TI],[__T,__TI])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',111,[__AGI,__SD]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',112,[__TI,-(__AGI,__SD)])))),fllibexecute_delayed_calls([__AGI,__SD,__T,__TI],[__T,__TI])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',141,[__TI,11925]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',142,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',145,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',145,[__TI,48475]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',146,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',150,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',150,[__TI,103350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',151,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',156,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',156,[__TI,197300]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',157,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',163,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',163,[__TI,250525]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',164,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',171,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',171,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',172,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',180,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',181,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(626350,250525),0.34999999999999998)),*(0.37,-(__TI,626350)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',192,[__TI,23850]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',193,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',196,[__TI,23850]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',196,[__TI,96950]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',197,[__Tax,+(*(23850,0.10000000000000001),*(0.12,-(__TI,23850)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',201,[__TI,96950]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',201,[__TI,206700]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',202,[__Tax,+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(0.22,-(__TI,96950)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',207,[__TI,206700]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',207,[__TI,394600]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',208,[__Tax,+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(0.23999999999999999,-(__TI,206700)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(38,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',214,[__TI,394600]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',214,[__TI,501050]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',215,[__Tax,+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(0.32000000000000001,-(__TI,394600)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(40,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',222,[__TI,501050]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',222,[__TI,751600]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',223,[__Tax,+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(0.34999999999999998,-(__TI,501050)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(42,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',231,[__TI,751600]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',232,[__Tax,+(+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(-(751600,501050),0.34999999999999998)),*(0.37,-(__TI,751600)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,qualifying_surviving_spouse,__TI,__Tax,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(44,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(46,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',250,[__TI,11925]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',251,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(48,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',254,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',254,[__TI,48475]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',255,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(50,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',259,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',259,[__TI,103350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',260,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(52,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',265,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',265,[__TI,197300]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',266,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(54,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',272,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',272,[__TI,250525]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',273,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(56,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',280,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',280,[__TI,375800]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',281,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(58,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',289,[__TI,375800]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',290,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(375800,250525),0.34999999999999998)),*(0.37,-(__TI,375800)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(60,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',301,[__TI,17000]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',302,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(62,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',305,[__TI,17000]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',305,[__TI,64850]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',306,[__Tax,+(*(17000,0.10000000000000001),*(0.12,-(__TI,17000)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(64,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',310,[__TI,64850]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',310,[__TI,103350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',311,[__Tax,+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(0.22,-(__TI,64850)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(66,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',316,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',316,[__TI,197300]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',317,[__Tax,+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(0.23999999999999999,-(__TI,103350)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(68,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',323,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',323,[__TI,250500]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',324,[__Tax,+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(70,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',331,[__TI,250500]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',331,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',332,[__Tax,+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250500)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(72,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',340,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',341,[__Tax,+(+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(-(626350,250500),0.34999999999999998)),*(0.37,-(__TI,626350)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_summary,__T,__Status,__AGI,__SD,__TI,__Tax,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(74,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,74)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,74)))))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,filing_status,__Status,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(76,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,filing_status,'Filing status is taken from the taxpayer''s declared filing_status fact.','_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(78,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,agi,__AGI,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(80,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,agi,'Adjusted Gross Income (AGI) is currently computed as total wage income only (prototype).','_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(82,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,standard_deduction,__SD,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(84,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,standard_deduction,'The standard deduction equals the 2025 basic amount for the filing status plus any additional amount for age 65+ and/or blindness (traditional additional standard deduction only).','_$ctxt'(_CallerModuleVar,86,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(86,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,86)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,taxable_income,__TI,'_$ctxt'(_CallerModuleVar,88,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(88,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,88)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,taxable_income,'Taxable income is AGI minus the standard deduction, floored at 0 if the deduction is larger than AGI.','_$ctxt'(_CallerModuleVar,90,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(90,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,90)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_value,__T,tax_liability,__Tax,'_$ctxt'(_CallerModuleVar,92,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(92,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,92)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,92)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,92)))),fllibexecute_delayed_calls([__Status,__T,__TI,__Tax],[__T,__Tax])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(line_explanation,__T,tax_liability,'Tax liability is computed using the progressive 2025 tax brackets for the taxpayer''s filing status.','_$ctxt'(_CallerModuleVar,94,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(94,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),','(','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,94)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,94)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,__Status,__TI,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,94)))),fllibexecute_delayed_calls([__Status,__T,__TI],[__T])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,3,FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(wage_income,__T,__Wages,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,4)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',40,[__AGI,__Wages])),null,'_$_$_ergo''rule_enabled'(4,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__AGI,__T,__Wages],[__AGI,__T]),true)).
?-(fllibinsrulesig(6,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,14,FLORA_THIS_WORKSPACE(d^tblflapply)(qualifier_count,__T,__Count,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(age_65_or_over_flag,__T,__SelfAge,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(blind_flag,__T,__SelfBlind,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(spouse_age_65_or_over_flag,__T,__SpouseAge,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,6)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(spouse_blind_flag,__T,__SpouseBlind,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,6)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',80,[__Count,+(+(+(__SelfAge,__SelfBlind),__SpouseAge),__SpouseBlind)]))))),null,'_$_$_ergo''rule_enabled'(6,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Count,__SelfAge,__SelfBlind,__SpouseAge,__SpouseBlind,__T],[__Count,__T]),true)).
?-(fllibinsrulesig(8,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,15,FLORA_THIS_WORKSPACE(d^tblflapply)(additional_standard_deduction,__T,2025,__Extra,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,8)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(per_qualifier_additional_amount,2025,__Status,__PerQual,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,8)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(qualifier_count,__T,__Count,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,8)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',88,[__Extra,*(__PerQual,__Count)])))),null,'_$_$_ergo''rule_enabled'(8,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Count,__Extra,__PerQual,__Status,__T],[__Extra,__T]),true)).
?-(fllibinsrulesig(10,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,16,FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__Amount,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(base_standard_deduction,2025,__Status,__Base,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,10)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(additional_standard_deduction,__T,2025,__Extra,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,10)),fllibdelayedliteral('\\is','tax_1040_2024.ergo',96,[__Amount,+(__Base,__Extra)])))),null,'_$_$_ergo''rule_enabled'(10,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Amount,__Base,__Extra,__Status,__T],[__Amount,__T]),true)).
?-(fllibinsrulesig(12,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,12)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,12)),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',105,[__AGI,__SD]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',106,[__TI,0])))),null,'_$_$_ergo''rule_enabled'(12,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__AGI,__SD,__T,__TI],[__T,__TI]),true)).
?-(fllibinsrulesig(14,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,14)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,14)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',111,[__AGI,__SD]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',112,[__TI,-(__AGI,__SD)])))),null,'_$_$_ergo''rule_enabled'(14,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__AGI,__SD,__T,__TI],[__T,__TI]),true)).
?-(fllibinsrulesig(16,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',141,[__TI,11925]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',142,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(16,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(18,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',145,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',145,[__TI,48475]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',146,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))),null,'_$_$_ergo''rule_enabled'(18,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(20,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',150,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',150,[__TI,103350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',151,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))),null,'_$_$_ergo''rule_enabled'(20,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(22,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',156,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',156,[__TI,197300]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',157,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))),null,'_$_$_ergo''rule_enabled'(22,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(24,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',163,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',163,[__TI,250525]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',164,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))),null,'_$_$_ergo''rule_enabled'(24,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(26,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',171,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',171,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',172,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))),null,'_$_$_ergo''rule_enabled'(26,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(28,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,25,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',180,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',181,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(626350,250525),0.34999999999999998)),*(0.37,-(__TI,626350)))])),null,'_$_$_ergo''rule_enabled'(28,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(30,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,26,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',192,[__TI,23850]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',193,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(30,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(32,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',196,[__TI,23850]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',196,[__TI,96950]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',197,[__Tax,+(*(23850,0.10000000000000001),*(0.12,-(__TI,23850)))]))),null,'_$_$_ergo''rule_enabled'(32,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(34,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,28,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',201,[__TI,96950]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',201,[__TI,206700]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',202,[__Tax,+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(0.22,-(__TI,96950)))]))),null,'_$_$_ergo''rule_enabled'(34,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(36,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,29,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',207,[__TI,206700]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',207,[__TI,394600]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',208,[__Tax,+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(0.23999999999999999,-(__TI,206700)))]))),null,'_$_$_ergo''rule_enabled'(36,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(38,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',214,[__TI,394600]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',214,[__TI,501050]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',215,[__Tax,+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(0.32000000000000001,-(__TI,394600)))]))),null,'_$_$_ergo''rule_enabled'(38,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(40,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,31,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',222,[__TI,501050]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',222,[__TI,751600]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',223,[__Tax,+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(0.34999999999999998,-(__TI,501050)))]))),null,'_$_$_ergo''rule_enabled'(40,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(42,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,32,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',231,[__TI,751600]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',232,[__Tax,+(+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(-(751600,501050),0.34999999999999998)),*(0.37,-(__TI,751600)))])),null,'_$_$_ergo''rule_enabled'(42,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(44,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,33,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,qualifying_surviving_spouse,__TI,__Tax,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,44)),null,'_$_$_ergo''rule_enabled'(44,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(46,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,34,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',250,[__TI,11925]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',251,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(46,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(48,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,35,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',254,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',254,[__TI,48475]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',255,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))),null,'_$_$_ergo''rule_enabled'(48,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(50,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,36,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',259,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',259,[__TI,103350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',260,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))),null,'_$_$_ergo''rule_enabled'(50,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(52,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,37,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',265,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',265,[__TI,197300]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',266,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))),null,'_$_$_ergo''rule_enabled'(52,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(54,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,38,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',272,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',272,[__TI,250525]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',273,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))),null,'_$_$_ergo''rule_enabled'(54,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(56,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,39,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',280,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',280,[__TI,375800]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',281,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))),null,'_$_$_ergo''rule_enabled'(56,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(58,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,40,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',289,[__TI,375800]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',290,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(375800,250525),0.34999999999999998)),*(0.37,-(__TI,375800)))])),null,'_$_$_ergo''rule_enabled'(58,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(60,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,41,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',301,[__TI,17000]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',302,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(60,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(62,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,42,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,62,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',305,[__TI,17000]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',305,[__TI,64850]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',306,[__Tax,+(*(17000,0.10000000000000001),*(0.12,-(__TI,17000)))]))),null,'_$_$_ergo''rule_enabled'(62,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(64,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,43,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,64,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',310,[__TI,64850]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',310,[__TI,103350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',311,[__Tax,+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(0.22,-(__TI,64850)))]))),null,'_$_$_ergo''rule_enabled'(64,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(66,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,44,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,66,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',316,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',316,[__TI,197300]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',317,[__Tax,+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(0.23999999999999999,-(__TI,103350)))]))),null,'_$_$_ergo''rule_enabled'(66,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(68,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,45,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,68,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',323,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',323,[__TI,250500]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',324,[__Tax,+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))),null,'_$_$_ergo''rule_enabled'(68,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(70,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,46,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,70,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',331,[__TI,250500]),','(fllibdelayedliteral(=<,'tax_1040_2024.ergo',331,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',332,[__Tax,+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250500)))]))),null,'_$_$_ergo''rule_enabled'(70,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(72,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,47,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,72,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_1040_2024.ergo',340,[__TI,626350]),fllibdelayedliteral('\\is','tax_1040_2024.ergo',341,[__Tax,+(+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(-(626350,250500),0.34999999999999998)),*(0.37,-(__TI,626350)))])),null,'_$_$_ergo''rule_enabled'(72,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(74,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,48,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_summary,__T,__Status,__AGI,__SD,__TI,__Tax,'_$ctxt'(_CallerModuleVar,74,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,74)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar5,74)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar6,74)))))),null,'_$_$_ergo''rule_enabled'(74,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(76,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,49,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,filing_status,__Status,'_$ctxt'(_CallerModuleVar,76,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,76)),null,'_$_$_ergo''rule_enabled'(76,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(78,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,50,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,filing_status,'Filing status is taken from the taxpayer''s declared filing_status fact.','_$ctxt'(_CallerModuleVar,78,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,78)),null,'_$_$_ergo''rule_enabled'(78,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(80,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,51,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,agi,__AGI,'_$ctxt'(_CallerModuleVar,80,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,__AGI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,80)),null,'_$_$_ergo''rule_enabled'(80,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(82,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,52,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,agi,'Adjusted Gross Income (AGI) is currently computed as total wage income only (prototype).','_$ctxt'(_CallerModuleVar,82,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(agi,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,82)),null,'_$_$_ergo''rule_enabled'(82,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(84,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,53,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,standard_deduction,__SD,'_$ctxt'(_CallerModuleVar,84,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,__SD,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,84)),null,'_$_$_ergo''rule_enabled'(84,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(86,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,54,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,standard_deduction,'The standard deduction equals the 2025 basic amount for the filing status plus any additional amount for age 65+ and/or blindness (traditional additional standard deduction only).','_$ctxt'(_CallerModuleVar,86,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(standard_deduction,__T,2025,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,86)),null,'_$_$_ergo''rule_enabled'(86,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(88,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,55,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,taxable_income,__TI,'_$ctxt'(_CallerModuleVar,88,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,88)),null,'_$_$_ergo''rule_enabled'(88,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(90,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,56,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,taxable_income,'Taxable income is AGI minus the standard deduction, floored at 0 if the deduction is larger than AGI.','_$ctxt'(_CallerModuleVar,90,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,90)),null,'_$_$_ergo''rule_enabled'(90,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(92,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,57,FLORA_THIS_WORKSPACE(d^tblflapply)(line_value,__T,tax_liability,__Tax,'_$ctxt'(_CallerModuleVar,92,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,92)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,92)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,__Status,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,92)))),null,'_$_$_ergo''rule_enabled'(92,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Status,__T,__TI,__Tax],[__T,__Tax]),true)).
?-(fllibinsrulesig(94,'tax_1040_2024.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,58,FLORA_THIS_WORKSPACE(d^tblflapply)(line_explanation,__T,tax_liability,'Tax liability is computed using the progressive 2025 tax brackets for the taxpayer''s filing status.','_$ctxt'(_CallerModuleVar,94,__newcontextvar1)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(filing_status,__T,__Status,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,94)),','(FLORA_THIS_WORKSPACE(d^tblflapply)(taxable_income,__T,__TI,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar3,94)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,__Status,__TI,'_','_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar4,94)))),null,'_$_$_ergo''rule_enabled'(94,'tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME),fllibexecute_delayed_calls([__Status,__T,__TI],[__T]),true)).


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
#define FLORA_FLS2_FILENAME  'tax_1040_2024.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('tax_1040_2024.ergo',FLORA_THIS_MODULE_NAME))).

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

