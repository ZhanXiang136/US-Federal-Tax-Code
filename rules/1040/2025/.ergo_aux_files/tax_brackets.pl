
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
#define FLORA_THIS_FILENAME  'tax_brackets.ergo'
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
#define FLORA_FLM_FILENAME  'tax_brackets.flm'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLM_FILENAME,FLORA_THIS_MODULE_NAME,'flm'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_descriptor_metafacts_canonical_and_insert(tax_brackets,_ErrNum))).
#endif

 
#if !defined(FLORA_FLD_FILENAME)
#if !defined(FLORA_LOADDYN_DATA)
#define FLORA_LOADDYN_DATA
#endif
#mode save
#mode nocomment "%"
#define FLORA_FLD_FILENAME  'tax_brackets.fld'
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
#define FLORA_FLS_FILENAME  'tax_brackets.fls'
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

:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(4,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_brackets.ergo',25,[__TI,11925]),fllibdelayedliteral('\\is','tax_brackets.ergo',26,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(6,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',29,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',29,[__TI,48475]),fllibdelayedliteral('\\is','tax_brackets.ergo',30,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(8,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',34,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',34,[__TI,103350]),fllibdelayedliteral('\\is','tax_brackets.ergo',35,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(10,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',40,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',40,[__TI,197300]),fllibdelayedliteral('\\is','tax_brackets.ergo',41,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(12,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',47,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',47,[__TI,250525]),fllibdelayedliteral('\\is','tax_brackets.ergo',48,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(14,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',55,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',55,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',56,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(16,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',64,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',65,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(626350,250525),0.34999999999999998)),*(0.37,-(__TI,626350)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(18,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_brackets.ergo',76,[__TI,23850]),fllibdelayedliteral('\\is','tax_brackets.ergo',77,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(20,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',80,[__TI,23850]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',80,[__TI,96950]),fllibdelayedliteral('\\is','tax_brackets.ergo',81,[__Tax,+(*(23850,0.10000000000000001),*(0.12,-(__TI,23850)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(22,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',85,[__TI,96950]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',85,[__TI,206700]),fllibdelayedliteral('\\is','tax_brackets.ergo',86,[__Tax,+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(0.22,-(__TI,96950)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(24,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',91,[__TI,206700]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',91,[__TI,394600]),fllibdelayedliteral('\\is','tax_brackets.ergo',92,[__Tax,+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(0.23999999999999999,-(__TI,206700)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(26,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',98,[__TI,394600]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',98,[__TI,501050]),fllibdelayedliteral('\\is','tax_brackets.ergo',99,[__Tax,+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(0.32000000000000001,-(__TI,394600)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(28,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',106,[__TI,501050]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',106,[__TI,751600]),fllibdelayedliteral('\\is','tax_brackets.ergo',107,[__Tax,+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(0.34999999999999998,-(__TI,501050)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(30,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',115,[__TI,751600]),fllibdelayedliteral('\\is','tax_brackets.ergo',116,[__Tax,+(+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(-(751600,501050),0.34999999999999998)),*(0.37,-(__TI,751600)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,qualifying_surviving_spouse,__TI,__Tax,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(32,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(34,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_brackets.ergo',132,[__TI,11925]),fllibdelayedliteral('\\is','tax_brackets.ergo',133,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(36,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',136,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',136,[__TI,48475]),fllibdelayedliteral('\\is','tax_brackets.ergo',137,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(38,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',141,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',141,[__TI,103350]),fllibdelayedliteral('\\is','tax_brackets.ergo',142,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(40,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',147,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',147,[__TI,197300]),fllibdelayedliteral('\\is','tax_brackets.ergo',148,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(42,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',154,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',154,[__TI,250525]),fllibdelayedliteral('\\is','tax_brackets.ergo',155,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(44,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',162,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',162,[__TI,375800]),fllibdelayedliteral('\\is','tax_brackets.ergo',163,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(46,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',171,[__TI,375800]),fllibdelayedliteral('\\is','tax_brackets.ergo',172,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(375800,250525),0.34999999999999998)),*(0.37,-(__TI,375800)))])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(48,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(=<,'tax_brackets.ergo',183,[__TI,17000]),fllibdelayedliteral('\\is','tax_brackets.ergo',184,[__Tax,*(0.10000000000000001,__TI)])))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(50,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',187,[__TI,17000]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',187,[__TI,64850]),fllibdelayedliteral('\\is','tax_brackets.ergo',188,[__Tax,+(*(17000,0.10000000000000001),*(0.12,-(__TI,17000)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(52,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',192,[__TI,64850]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',192,[__TI,103350]),fllibdelayedliteral('\\is','tax_brackets.ergo',193,[__Tax,+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(0.22,-(__TI,64850)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(54,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',198,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',198,[__TI,197300]),fllibdelayedliteral('\\is','tax_brackets.ergo',199,[__Tax,+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(0.23999999999999999,-(__TI,103350)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(56,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',205,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',205,[__TI,250500]),fllibdelayedliteral('\\is','tax_brackets.ergo',206,[__Tax,+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(58,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',213,[__TI,250500]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',213,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',214,[__Tax,+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250500)))]))))).
:-(FLORA_THIS_WORKSPACE(static^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','('_$_$_ergo''rule_enabled'(60,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),','(fllibdelayedliteral(>,'tax_brackets.ergo',222,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',223,[__Tax,+(+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(-(626350,250500),0.34999999999999998)),*(0.37,-(__TI,626350)))])))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Rule signatures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

?-(fllibinsrulesig(4,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,3,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,4,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_brackets.ergo',25,[__TI,11925]),fllibdelayedliteral('\\is','tax_brackets.ergo',26,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(4,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(6,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,4,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,6,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',29,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',29,[__TI,48475]),fllibdelayedliteral('\\is','tax_brackets.ergo',30,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))),null,'_$_$_ergo''rule_enabled'(6,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(8,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,5,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,8,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',34,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',34,[__TI,103350]),fllibdelayedliteral('\\is','tax_brackets.ergo',35,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))),null,'_$_$_ergo''rule_enabled'(8,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(10,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,6,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,10,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',40,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',40,[__TI,197300]),fllibdelayedliteral('\\is','tax_brackets.ergo',41,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))),null,'_$_$_ergo''rule_enabled'(10,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(12,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,7,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,12,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',47,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',47,[__TI,250525]),fllibdelayedliteral('\\is','tax_brackets.ergo',48,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))),null,'_$_$_ergo''rule_enabled'(12,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(14,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,8,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,14,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',55,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',55,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',56,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))),null,'_$_$_ergo''rule_enabled'(14,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(16,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,9,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,single,__TI,__Tax,'_$ctxt'(_CallerModuleVar,16,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',64,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',65,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(626350,250525),0.34999999999999998)),*(0.37,-(__TI,626350)))])),null,'_$_$_ergo''rule_enabled'(16,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(18,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,10,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,18,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_brackets.ergo',76,[__TI,23850]),fllibdelayedliteral('\\is','tax_brackets.ergo',77,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(18,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(20,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,11,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,20,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',80,[__TI,23850]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',80,[__TI,96950]),fllibdelayedliteral('\\is','tax_brackets.ergo',81,[__Tax,+(*(23850,0.10000000000000001),*(0.12,-(__TI,23850)))]))),null,'_$_$_ergo''rule_enabled'(20,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(22,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,12,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,22,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',85,[__TI,96950]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',85,[__TI,206700]),fllibdelayedliteral('\\is','tax_brackets.ergo',86,[__Tax,+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(0.22,-(__TI,96950)))]))),null,'_$_$_ergo''rule_enabled'(22,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(24,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,13,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,24,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',91,[__TI,206700]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',91,[__TI,394600]),fllibdelayedliteral('\\is','tax_brackets.ergo',92,[__Tax,+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(0.23999999999999999,-(__TI,206700)))]))),null,'_$_$_ergo''rule_enabled'(24,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(26,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,14,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,26,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',98,[__TI,394600]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',98,[__TI,501050]),fllibdelayedliteral('\\is','tax_brackets.ergo',99,[__Tax,+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(0.32000000000000001,-(__TI,394600)))]))),null,'_$_$_ergo''rule_enabled'(26,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(28,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,15,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,28,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',106,[__TI,501050]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',106,[__TI,751600]),fllibdelayedliteral('\\is','tax_brackets.ergo',107,[__Tax,+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(0.34999999999999998,-(__TI,501050)))]))),null,'_$_$_ergo''rule_enabled'(28,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(30,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,16,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(_CallerModuleVar,30,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',115,[__TI,751600]),fllibdelayedliteral('\\is','tax_brackets.ergo',116,[__Tax,+(+(+(+(+(+(*(23850,0.10000000000000001),*(-(96950,23850),0.12)),*(-(206700,96950),0.22)),*(-(394600,206700),0.23999999999999999)),*(-(501050,394600),0.32000000000000001)),*(-(751600,501050),0.34999999999999998)),*(0.37,-(__TI,751600)))])),null,'_$_$_ergo''rule_enabled'(30,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(32,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,17,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,qualifying_surviving_spouse,__TI,__Tax,'_$ctxt'(_CallerModuleVar,32,__newcontextvar1)),FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_jointly,__TI,__Tax,'_$ctxt'(FLORA_THIS_MODULE_NAME,__newcontextvar2,32)),null,'_$_$_ergo''rule_enabled'(32,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(34,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,18,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,34,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_brackets.ergo',132,[__TI,11925]),fllibdelayedliteral('\\is','tax_brackets.ergo',133,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(34,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(36,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,19,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,36,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',136,[__TI,11925]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',136,[__TI,48475]),fllibdelayedliteral('\\is','tax_brackets.ergo',137,[__Tax,+(*(11925,0.10000000000000001),*(0.12,-(__TI,11925)))]))),null,'_$_$_ergo''rule_enabled'(36,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(38,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,20,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,38,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',141,[__TI,48475]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',141,[__TI,103350]),fllibdelayedliteral('\\is','tax_brackets.ergo',142,[__Tax,+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(0.22,-(__TI,48475)))]))),null,'_$_$_ergo''rule_enabled'(38,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(40,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,21,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,40,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',147,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',147,[__TI,197300]),fllibdelayedliteral('\\is','tax_brackets.ergo',148,[__Tax,+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(0.23999999999999999,-(__TI,103350)))]))),null,'_$_$_ergo''rule_enabled'(40,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(42,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,22,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,42,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',154,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',154,[__TI,250525]),fllibdelayedliteral('\\is','tax_brackets.ergo',155,[__Tax,+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))),null,'_$_$_ergo''rule_enabled'(42,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(44,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,23,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,44,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',162,[__TI,250525]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',162,[__TI,375800]),fllibdelayedliteral('\\is','tax_brackets.ergo',163,[__Tax,+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250525)))]))),null,'_$_$_ergo''rule_enabled'(44,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(46,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,24,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,married_filing_separately,__TI,__Tax,'_$ctxt'(_CallerModuleVar,46,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',171,[__TI,375800]),fllibdelayedliteral('\\is','tax_brackets.ergo',172,[__Tax,+(+(+(+(+(+(*(11925,0.10000000000000001),*(-(48475,11925),0.12)),*(-(103350,48475),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250525,197300),0.32000000000000001)),*(-(375800,250525),0.34999999999999998)),*(0.37,-(__TI,375800)))])),null,'_$_$_ergo''rule_enabled'(46,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(48,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,25,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,48,__newcontextvar1)),','(fllibdelayedliteral(=<,'tax_brackets.ergo',183,[__TI,17000]),fllibdelayedliteral('\\is','tax_brackets.ergo',184,[__Tax,*(0.10000000000000001,__TI)])),null,'_$_$_ergo''rule_enabled'(48,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(50,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,26,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,50,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',187,[__TI,17000]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',187,[__TI,64850]),fllibdelayedliteral('\\is','tax_brackets.ergo',188,[__Tax,+(*(17000,0.10000000000000001),*(0.12,-(__TI,17000)))]))),null,'_$_$_ergo''rule_enabled'(50,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(52,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,27,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,52,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',192,[__TI,64850]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',192,[__TI,103350]),fllibdelayedliteral('\\is','tax_brackets.ergo',193,[__Tax,+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(0.22,-(__TI,64850)))]))),null,'_$_$_ergo''rule_enabled'(52,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(54,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,28,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,54,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',198,[__TI,103350]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',198,[__TI,197300]),fllibdelayedliteral('\\is','tax_brackets.ergo',199,[__Tax,+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(0.23999999999999999,-(__TI,103350)))]))),null,'_$_$_ergo''rule_enabled'(54,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(56,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,29,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,56,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',205,[__TI,197300]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',205,[__TI,250500]),fllibdelayedliteral('\\is','tax_brackets.ergo',206,[__Tax,+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(0.32000000000000001,-(__TI,197300)))]))),null,'_$_$_ergo''rule_enabled'(56,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(58,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,30,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,58,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',213,[__TI,250500]),','(fllibdelayedliteral(=<,'tax_brackets.ergo',213,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',214,[__Tax,+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(0.34999999999999998,-(__TI,250500)))]))),null,'_$_$_ergo''rule_enabled'(58,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).
?-(fllibinsrulesig(60,'tax_brackets.ergo','_$_$_ergo''descr_vars',FLORA_THIS_MODULE_NAME,31,FLORA_THIS_WORKSPACE(d^tblflapply)(tax_liability,2025,head_of_household,__TI,__Tax,'_$ctxt'(_CallerModuleVar,60,__newcontextvar1)),','(fllibdelayedliteral(>,'tax_brackets.ergo',222,[__TI,626350]),fllibdelayedliteral('\\is','tax_brackets.ergo',223,[__Tax,+(+(+(+(+(+(*(17000,0.10000000000000001),*(-(64850,17000),0.12)),*(-(103350,64850),0.22)),*(-(197300,103350),0.23999999999999999)),*(-(250500,197300),0.32000000000000001)),*(-(626350,250500),0.34999999999999998)),*(0.37,-(__TI,626350)))])),null,'_$_$_ergo''rule_enabled'(60,'tax_brackets.ergo',FLORA_THIS_MODULE_NAME),null,true)).


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
#define FLORA_FLS2_FILENAME  'tax_brackets.fls2'
#mode restore
?-(:(flrutils,flora_loaddyn_data(FLORA_FLS2_FILENAME,FLORA_THIS_MODULE_NAME,'fls2'))).
#else
#if !defined(FLORA_READ_CANONICAL_AND_INSERT)
#define FLORA_READ_CANONICAL_AND_INSERT
#endif
?-(:(flrutils,flora_read_symbols_canonical_and_insert(FLORA_FLS2_FILENAME,FLORA_THIS_FLS_STORAGE,_SymbolErrNum))).
#endif

?-(:(flrutils,util_load_structdb('tax_brackets.ergo',FLORA_THIS_MODULE_NAME))).

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

