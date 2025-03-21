using System;
using System.Interop;

namespace amoeba;

public static class amoeba
{
	typealias size_t = uint;

    public const c_int AM_OK               = 0;
    public const c_int AM_FAILED           = -1;
    public const c_int AM_UNSATISFIED      = -2;
    public const c_int AM_UNBOUND          = -3;

    public const c_int AM_LESSEQUAL        = 1;
    public const c_int AM_EQUAL            = 2;
    public const c_int AM_GREATEQUAL       = 3;

    public const am_Num AM_REQUIRED        = 1000000000;
    public const am_Num AM_STRONG          = 1000000;
    public const am_Num AM_MEDIUM          = 1000;
    public const am_Num AM_WEAK            = 1;

#if AM_USE_FLOAT
	typealias am_Num = float  ;
#else
	typealias am_Num = double;
#endif

	public struct am_Solver;
	public struct am_Var;
	public struct am_Constraint;

	public function void* am_Allocf(void* ud, void* ptr, size_t nsize, size_t osize);

	[CLink] public static extern am_Solver* am_newsolver  (am_Allocf* allocf, void* ud);
	[CLink] public static extern void am_resetsolver(am_Solver* solver, int clear_constraints);
	[CLink] public static extern void am_delsolver(am_Solver* solver);

	[CLink] public static extern void am_updatevars(am_Solver* solver);
	[CLink] public static extern void am_autoupdate(am_Solver* solver, int auto_update);

	[CLink] public static extern int am_hasedit(am_Var* variable);
	[CLink] public static extern int am_hasconstraint(am_Constraint* cons);

	[CLink] public static extern int am_add(am_Constraint* cons);
	[CLink] public static extern void am_remove(am_Constraint* cons);

	[CLink] public static extern int am_addedit(am_Var* variable, am_Num strength);
	[CLink] public static extern void am_suggest(am_Var* variable, am_Num value);
	[CLink] public static extern void am_deledit(am_Var* variable);

	[CLink] public static extern am_Var* am_newvariable(am_Solver* solver);
	[CLink] public static extern void am_usevariable(am_Var* variable);
	[CLink] public static extern void am_delvariable(am_Var* variable);
	[CLink] public static extern int am_variableid(am_Var* variable);
	[CLink] public static extern am_Num am_value(am_Var* variable);

	[CLink] public static extern am_Constraint* am_newconstraint(am_Solver* solver, am_Num strength);
	[CLink] public static extern am_Constraint* am_cloneconstraint(am_Constraint* other, am_Num strength);

	[CLink] public static extern void am_resetconstraint(am_Constraint* cons);
	[CLink] public static extern void am_delconstraint(am_Constraint* cons);

	[CLink] public static extern int am_addterm(am_Constraint* cons, am_Var* variable, am_Num multiplier);
	[CLink] public static extern int am_setrelation(am_Constraint* cons, int relation);
	[CLink] public static extern int am_addconstant(am_Constraint* cons, am_Num constant);
	[CLink] public static extern int am_setstrength(am_Constraint* cons, am_Num strength);

	[CLink] public static extern int am_mergeconstraint(am_Constraint* cons, am_Constraint* other, am_Num multiplier);
}