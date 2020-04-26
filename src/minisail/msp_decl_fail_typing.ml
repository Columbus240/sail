open Msp_ast
module Satis : sig
  val upto : Arith.nat -> Arith.nat list
  val wf_g_aux :
    (SyntaxVCT.xp * Contexts.g_entry) list ->
      (SyntaxVCT.xp * Contexts.g_entry) list -> bool
  val wf_g : ('a, 'b) Contexts.gamma_ext -> bool
  val z3eq : Z3.z3_expr -> Z3.z3_expr -> Z3.z3_bool_expr
  val convert_x : SyntaxVCT.xp -> string
  val convert_l : SyntaxVCT.lit -> Z3.z3_expr
  val convert_v : SyntaxVCT.vp -> Z3.z3_expr
  val convert_ce : SyntaxVCT.cep -> Z3.z3_expr
  val z3and : Z3.z3_bool_expr list -> Z3.z3_bool_expr
  val convert_c : SyntaxVCT.cp -> Z3.z3_bool_expr
  val type_app : SyntaxVCT.bp -> SyntaxVCT.bp -> (string * SyntaxVCT.bp) list
  val type_app_lists :
    SyntaxVCT.bp list -> SyntaxVCT.bp list -> (string * SyntaxVCT.bp) list
  val type_app_tlists :
    (string * SyntaxVCT.tau) list ->
      (string * SyntaxVCT.tau) list -> (string * SyntaxVCT.bp) list
  val type_app_t :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.bp -> (string * SyntaxVCT.bp) list
  val convert_b :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp -> SyntaxVCT.bp -> Z3.z3_type * Z3.z3_bool_expr
  val convert_blist :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp ->
        SyntaxVCT.bp list -> Z3.z3_type list * Z3.z3_bool_expr list
  val convert_xbc :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.xp ->
        SyntaxVCT.bp -> SyntaxVCT.cp -> Z3.z3_decl list * Z3.z3_bool_expr
  val subst_c_z : SyntaxVCT.xp -> SyntaxVCT.cp -> SyntaxVCT.cp
  val convert_g_aux :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxVCT.xp * Contexts.g_entry) list ->
        Z3.z3_decl list * Z3.z3_bool_expr list
  val convert_smt_problem_valid :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext ->
        (SyntaxVCT.xp * Contexts.g_entry) list ->
          SyntaxVCT.cp ->
            (SyntaxVCT.xp * Contexts.g_entry) list *
              (Z3.z3_decl list * (Z3.z3_decl list * Z3.z3_bool_expr))
  val pp_z3_expr : Z3.z3_expr -> string
  val pp_z3_bool_expr : Z3.z3_bool_expr -> string
  val lin_ze :
    Arith.nat ->
      Z3.z3_expr -> Arith.nat * (Z3.z3_expr * (Z3.z3_expr * Z3.z3_expr) list)
  val lin_ze_pair :
    Arith.nat ->
      Z3.z3_expr ->
        Z3.z3_expr ->
          (Z3.z3_expr -> Z3.z3_expr -> Z3.z3_expr) ->
            Arith.nat * (Z3.z3_expr * (Z3.z3_expr * Z3.z3_expr) list)
  val lin_zb :
    Arith.nat ->
      Z3.z3_bool_expr ->
        Arith.nat * (Z3.z3_bool_expr * (Z3.z3_expr * Z3.z3_expr) list)
  val rewrite_passes :
    'a -> 'b -> Z3.z3_decl list ->
                  Z3.z3_bool_expr -> Z3.z3_decl list * Z3.z3_bool_expr
  val z3_vector_sort : string
  val pp_bv_concats : Arith.int -> string list
  val t_t_vars : SyntaxVCT.tau -> string list
  val b_t_vars : SyntaxVCT.bp -> string list
  val pp_sort_decl :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext -> string list
  val bv_consts_v : SyntaxVCT.vp -> SyntaxVCT.lit list
  val bv_consts_ce : SyntaxVCT.cep -> SyntaxVCT.lit list
  val bv_consts_c : SyntaxVCT.cp -> SyntaxVCT.lit list
  val c_of_e : Contexts.g_entry -> SyntaxVCT.cp
  val bv_consts_aux :
    (SyntaxVCT.xp * Contexts.g_entry) list -> SyntaxVCT.lit list
  val z3_vector_lookup : string
  val convert_bitvec : SyntaxVCT.lit list -> string
  val pp_bitvec : SyntaxVCT.lit -> string list
  val pp_bv_consts :
    ('a, unit) Contexts.gamma_ext ->
      (SyntaxVCT.xp * Contexts.g_entry) list -> SyntaxVCT.cp -> string list
  val pp_z3_vector_funs : string
  val pp_z3_exp_pred : Arith.nat -> string
  val pp_z3_type : Z3.z3_type -> string
  val pp_z3_type_var : Z3.z3_type_var -> string
  val pp_z3_fields : (string * Z3.z3_type_var) list -> string
  val pp_z3_ty_constr : Z3.z3_constr -> string
  val pp_z3_decl : Z3.z3_decl -> string
  val z3_declare_tuple : Arith.int -> Z3.z3_decl
  val pp_tuples : Arith.int -> string list
  val pp_builtins : Arith.int -> string list
  val freshen_type : Z3.z3_type -> Z3.z3_type
  val freshen_type_var : Z3.z3_type_var -> Z3.z3_type_var
  val freshen_constr : Z3.z3_constr -> Z3.z3_constr
  val freshen_decl : Z3.z3_decl -> Z3.z3_decl
  val convert_t :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.vp -> SyntaxVCT.tau -> Z3.z3_type * Z3.z3_bool_expr
  val convert_typedef :
    unit ContextsPiDelta.theta_ext ->
      SyntaxVCT.xp * SyntaxVCT.tau -> Z3.z3_decl option
  val pp_typedef :
    unit ContextsPiDelta.theta_ext -> SyntaxVCT.xp * SyntaxVCT.tau -> string
  val max_tuples : Arith.int
  val convert_smt_problem_final :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext ->
        (SyntaxVCT.xp * Contexts.g_entry) list ->
          SyntaxVCT.cp ->
            (SyntaxVCT.xp * Contexts.g_entry) list ->
              Z3.z3_decl list -> 'b list -> Z3.z3_bool_expr -> string list
  val pp_smt_problem_valid :
    unit ContextsPiDelta.theta_ext ->
      ('a, unit) Contexts.gamma_ext ->
        (SyntaxVCT.xp * Contexts.g_entry) list -> SyntaxVCT.cp -> string list
  val has_no_t_var_b : SyntaxVCT.bp -> bool
  val b_of_e : Contexts.g_entry -> SyntaxVCT.bp
  val has_no_t_var_g : ('a, unit) Contexts.gamma_ext -> bool
  val has_t_var :
    ('a, unit) Contexts.gamma_ext ->
      (SyntaxVCT.xp * Contexts.g_entry) list -> bool
  val valid :
    string ->
      Location.loc ->
        unit ContextsPiDelta.theta_ext ->
          ('a, unit) Contexts.gamma_ext ->
            (SyntaxVCT.xp * Contexts.g_entry) list -> SyntaxVCT.cp -> bool
end = struct

let rec upto
  i = (if Arith.equal_nat i Arith.zero_nat then [Arith.zero_nat]
        else Arith.suc (Arith.minus_nat i Arith.one_nat) ::
               upto (Arith.minus_nat i Arith.one_nat));;

let rec wf_g_aux
  x0 g = match x0, g with [], g -> true
    | (xp, Contexts.GEPair (bp, cp)) :: ga, g ->
        (if Set.less_eq_set SyntaxVCT.equal_xp (Set.Set (SyntaxPED.fvs_cp cp))
              (Set.image Product_Type.fst (Set.Set g))
          then wf_g_aux ga g
          else (let _ = Debug.trace ("wf_g fails in " ^ Contexts.pp_cp cp) in
                 false));;

let rec wf_g g = wf_g_aux (Contexts.gamma_x g) (Contexts.gamma_x g);;

let rec z3eq
  e1 e2 = match e1, e2 with
    Z3.Z3E_true, Z3.Z3E_eq (e1, e2) -> Z3.Z3BE_eq (e1, e2)
    | Z3.Z3E_true, Z3.Z3E_leq (e1, e2) -> Z3.Z3BE_leq (e1, e2)
    | Z3.Z3E_num v, e2 -> Z3.Z3BE_eq (Z3.Z3E_num v, e2)
    | Z3.Z3E_var v, e2 -> Z3.Z3BE_eq (Z3.Z3E_var v, e2)
    | Z3.Z3E_false, e2 -> Z3.Z3BE_eq (Z3.Z3E_false, e2)
    | Z3.Z3E_unit, e2 -> Z3.Z3BE_eq (Z3.Z3E_unit, e2)
    | Z3.Z3E_bitone, e2 -> Z3.Z3BE_eq (Z3.Z3E_bitone, e2)
    | Z3.Z3E_bitzero, e2 -> Z3.Z3BE_eq (Z3.Z3E_bitzero, e2)
    | Z3.Z3E_len v, e2 -> Z3.Z3BE_eq (Z3.Z3E_len v, e2)
    | Z3.Z3E_leq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_leq (v, va), e2)
    | Z3.Z3E_geq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_geq (v, va), e2)
    | Z3.Z3E_plus (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_plus (v, va), e2)
    | Z3.Z3E_times (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_times (v, va), e2)
    | Z3.Z3E_div (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_div (v, va), e2)
    | Z3.Z3E_mod (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_mod (v, va), e2)
    | Z3.Z3E_minus (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_minus (v, va), e2)
    | Z3.Z3E_eq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_eq (v, va), e2)
    | Z3.Z3E_not v, e2 -> Z3.Z3BE_eq (Z3.Z3E_not v, e2)
    | Z3.Z3E_exp v, e2 -> Z3.Z3BE_eq (Z3.Z3E_exp v, e2)
    | Z3.Z3E_abs v, e2 -> Z3.Z3BE_eq (Z3.Z3E_abs v, e2)
    | Z3.Z3E_and (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_and (v, va), e2)
    | Z3.Z3E_or (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_or (v, va), e2)
    | Z3.Z3E_neq (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_neq (v, va), e2)
    | Z3.Z3E_bitvec v, e2 -> Z3.Z3BE_eq (Z3.Z3E_bitvec v, e2)
    | Z3.Z3E_constr (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_constr (v, va), e2)
    | Z3.Z3E_concat v, e2 -> Z3.Z3BE_eq (Z3.Z3E_concat v, e2)
    | Z3.Z3E_proj (v, va), e2 -> Z3.Z3BE_eq (Z3.Z3E_proj (v, va), e2)
    | Z3.Z3E_string v, e2 -> Z3.Z3BE_eq (Z3.Z3E_string v, e2)
    | e1, Z3.Z3E_num v -> Z3.Z3BE_eq (e1, Z3.Z3E_num v)
    | e1, Z3.Z3E_var v -> Z3.Z3BE_eq (e1, Z3.Z3E_var v)
    | e1, Z3.Z3E_true -> Z3.Z3BE_eq (e1, Z3.Z3E_true)
    | e1, Z3.Z3E_false -> Z3.Z3BE_eq (e1, Z3.Z3E_false)
    | e1, Z3.Z3E_unit -> Z3.Z3BE_eq (e1, Z3.Z3E_unit)
    | e1, Z3.Z3E_bitone -> Z3.Z3BE_eq (e1, Z3.Z3E_bitone)
    | e1, Z3.Z3E_bitzero -> Z3.Z3BE_eq (e1, Z3.Z3E_bitzero)
    | e1, Z3.Z3E_len v -> Z3.Z3BE_eq (e1, Z3.Z3E_len v)
    | e1, Z3.Z3E_geq (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_geq (v, va))
    | e1, Z3.Z3E_plus (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_plus (v, va))
    | e1, Z3.Z3E_times (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_times (v, va))
    | e1, Z3.Z3E_div (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_div (v, va))
    | e1, Z3.Z3E_mod (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_mod (v, va))
    | e1, Z3.Z3E_minus (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_minus (v, va))
    | e1, Z3.Z3E_not v -> Z3.Z3BE_eq (e1, Z3.Z3E_not v)
    | e1, Z3.Z3E_exp v -> Z3.Z3BE_eq (e1, Z3.Z3E_exp v)
    | e1, Z3.Z3E_abs v -> Z3.Z3BE_eq (e1, Z3.Z3E_abs v)
    | e1, Z3.Z3E_and (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_and (v, va))
    | e1, Z3.Z3E_or (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_or (v, va))
    | e1, Z3.Z3E_neq (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_neq (v, va))
    | e1, Z3.Z3E_bitvec v -> Z3.Z3BE_eq (e1, Z3.Z3E_bitvec v)
    | e1, Z3.Z3E_constr (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_constr (v, va))
    | e1, Z3.Z3E_concat v -> Z3.Z3BE_eq (e1, Z3.Z3E_concat v)
    | e1, Z3.Z3E_proj (v, va) -> Z3.Z3BE_eq (e1, Z3.Z3E_proj (v, va))
    | e1, Z3.Z3E_string v -> Z3.Z3BE_eq (e1, Z3.Z3E_string v);;

let rec convert_x = function SyntaxVCT.VNamed x -> Contexts.remove_tick x
                    | SyntaxVCT.VIndex -> "#0";;

let rec convert_l
  = function SyntaxVCT.L_num n -> Z3.Z3E_num n
    | SyntaxVCT.L_true -> Z3.Z3E_true
    | SyntaxVCT.L_false -> Z3.Z3E_false
    | SyntaxVCT.L_zero -> Z3.Z3E_bitzero
    | SyntaxVCT.L_one -> Z3.Z3E_bitone
    | SyntaxVCT.L_unit -> Z3.Z3E_unit
    | SyntaxVCT.L_bitvec va ->
        Z3.Z3E_bitvec
          (Stringa.implode
            (Lista.maps
              (fun b ->
                (if SyntaxVCT.equal_lita b SyntaxVCT.L_zero
                  then [Stringa.Chara
                          (false, false, false, false, true, true, false,
                            false)]
                  else [Stringa.Chara
                          (true, false, false, false, true, true, false,
                            false)]))
              va))
    | SyntaxVCT.L_real s -> Z3.Z3E_string s
    | SyntaxVCT.L_string s -> Z3.Z3E_string s
    | SyntaxVCT.L_undef -> Z3.Z3E_constr ("unexpected undef", []);;

let rec convert_v
  = function
    SyntaxVCT.V_var (SyntaxVCT.VNamed x) -> Z3.Z3E_var (Contexts.remove_tick x)
    | SyntaxVCT.V_var SyntaxVCT.VIndex -> Z3.Z3E_var "unexpected z variable"
    | SyntaxVCT.V_lit lit -> convert_l lit
    | SyntaxVCT.V_constr (v, va) -> Z3.Z3E_constr (v, [convert_v va])
    | SyntaxVCT.V_record v -> Z3.Z3E_constr ("record", [])
    | SyntaxVCT.V_tuple vs ->
        Z3.Z3E_constr
          ("mk-tuple" ^
             Utils.string_lit_of_int (Arith.int_of_nat (Lista.size_list vs)),
            Lista.map convert_v vs)
    | SyntaxVCT.V_proj (s, v) -> Z3.Z3E_proj (s, convert_v v)
    | SyntaxVCT.V_list vs ->
        Lista.fold (fun v tl -> Z3.Z3E_constr ("insert", [convert_v v; tl])) vs
          (Z3.Z3E_constr ("nil", []))
    | SyntaxVCT.V_cons (v, vs) ->
        Z3.Z3E_constr ("insert", [convert_v v; convert_v vs]);;

let rec convert_ce
  = function SyntaxVCT.CE_val v -> convert_v v
    | SyntaxVCT.CE_bop (SyntaxVCT.Plus, e1, e2) ->
        Z3.Z3E_plus (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.LEq, e1, e2) ->
        Z3.Z3E_leq (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Times, e1, e2) ->
        Z3.Z3E_times (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Minus, e1, e2) ->
        Z3.Z3E_minus (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Div, e1, e2) ->
        Z3.Z3E_div (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Mod, e1, e2) ->
        Z3.Z3E_mod (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Eq, e1, e2) ->
        Z3.Z3E_eq (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.NEq, e1, e2) ->
        Z3.Z3E_not (Z3.Z3E_eq (convert_ce e1, convert_ce e2))
    | SyntaxVCT.CE_bop (SyntaxVCT.LT, e1, e2) ->
        Z3.Z3E_leq
          (Z3.Z3E_plus (convert_ce e1, Z3.Z3E_num (Z.of_int 1)), convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.And, e1, e2) ->
        Z3.Z3E_and (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.Or, e1, e2) ->
        Z3.Z3E_or (convert_ce e1, convert_ce e2)
    | SyntaxVCT.CE_bop (SyntaxVCT.GEq, e1, e2) ->
        Z3.Z3E_not
          (Z3.Z3E_leq
            (Z3.Z3E_plus (convert_ce e1, Z3.Z3E_num (Z.of_int 1)),
              convert_ce e2))
    | SyntaxVCT.CE_bop (SyntaxVCT.GT, e1, e2) ->
        Z3.Z3E_not (Z3.Z3E_leq (convert_ce e1, convert_ce e2))
    | SyntaxVCT.CE_uop (SyntaxVCT.Len, e) -> Z3.Z3E_len (convert_ce e)
    | SyntaxVCT.CE_uop (SyntaxVCT.Nott, e) -> Z3.Z3E_not (convert_ce e)
    | SyntaxVCT.CE_uop (SyntaxVCT.Abs, e) -> Z3.Z3E_abs (convert_ce e)
    | SyntaxVCT.CE_many_plus v -> failwith "undefined"
    | SyntaxVCT.CE_uop (SyntaxVCT.Exp, va) -> Z3.Z3E_exp (convert_ce va)
    | SyntaxVCT.CE_uop (SyntaxVCT.Neg, va) ->
        Z3.Z3E_minus (Z3.Z3E_num Z.zero, convert_ce va)
    | SyntaxVCT.CE_proj (v, va) -> Z3.Z3E_proj (v, convert_ce va)
    | SyntaxVCT.CE_field_access (vp, field) ->
        Z3.Z3E_proj (field, convert_v vp);;

let rec z3and
  es = (let esa =
          Lista.filter (fun e -> not (Z3.equal_z3_bool_expra e Z3.Z3BE_true)) es
          in
         (match esa with [] -> Z3.Z3BE_true | [e] -> e
           | _ :: _ :: _ -> Z3.Z3BE_and esa));;

let rec convert_c
  = function SyntaxVCT.C_true -> Z3.Z3BE_true
    | SyntaxVCT.C_false -> Z3.Z3BE_false
    | SyntaxVCT.C_conj (c1, c2) -> z3and [convert_c c1; convert_c c2]
    | SyntaxVCT.C_disj (c1, c2) -> Z3.Z3BE_or [convert_c c1; convert_c c2]
    | SyntaxVCT.C_not c -> Z3.Z3BE_not (convert_c c)
    | SyntaxVCT.C_imp (c1, c2) -> Z3.Z3BE_implies (convert_c c1, convert_c c2)
    | SyntaxVCT.C_eq (e1, e2) -> z3eq (convert_ce e1) (convert_ce e2)
    | SyntaxVCT.C_leq (e1, e2) -> Z3.Z3BE_leq (convert_ce e1, convert_ce e2)
    | SyntaxVCT.C_conj_many cs -> z3and (Lista.map convert_c cs);;

let rec type_app
  x0 b = match x0, b with SyntaxVCT.B_var v, b -> [(v, b)]
    | SyntaxVCT.B_tuple bs1, SyntaxVCT.B_tuple bs2 -> type_app_lists bs1 bs2
    | SyntaxVCT.B_vec (uu, b1), SyntaxVCT.B_vec (uv, b2) -> type_app b1 b2
    | SyntaxVCT.B_union (uw, branches1), SyntaxVCT.B_union (ux, branches2) ->
        type_app_tlists branches1 branches2
    | SyntaxVCT.B_tid v, uz -> []
    | SyntaxVCT.B_int, uz -> []
    | SyntaxVCT.B_bool, uz -> []
    | SyntaxVCT.B_bit, uz -> []
    | SyntaxVCT.B_unit, uz -> []
    | SyntaxVCT.B_real, uz -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_var vb -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_tid vb -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_int -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_bool -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_bit -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_unit -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_real -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_list vb -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_tuple vb -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_union (vb, vc) -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_record vb -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_undef -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_reg vb -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_string -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_exception -> []
    | SyntaxVCT.B_vec (v, va), SyntaxVCT.B_finite_set vb -> []
    | SyntaxVCT.B_list v, uz -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_var va -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_tid va -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_int -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_bool -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_bit -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_unit -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_real -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_vec (va, vb) -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_list va -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_union (va, vb) -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_record va -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_undef -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_reg va -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_string -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_exception -> []
    | SyntaxVCT.B_tuple v, SyntaxVCT.B_finite_set va -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_var vb -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_tid vb -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_int -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_bool -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_bit -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_unit -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_real -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_vec (vb, vc) -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_list vb -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_tuple vb -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_record vb -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_undef -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_reg vb -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_string -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_exception -> []
    | SyntaxVCT.B_union (v, va), SyntaxVCT.B_finite_set vb -> []
    | SyntaxVCT.B_record v, uz -> []
    | SyntaxVCT.B_undef, uz -> []
    | SyntaxVCT.B_reg v, uz -> []
    | SyntaxVCT.B_string, uz -> []
    | SyntaxVCT.B_exception, uz -> []
    | SyntaxVCT.B_finite_set v, uz -> []
and type_app_lists
  va vb = match va, vb with
    b1 :: bs1, b2 :: bs2 -> type_app b1 b2 @ type_app_lists bs1 bs2
    | [], vb -> []
    | va, [] -> []
and type_app_tlists
  ve vf = match ve, vf with
    (vc, t1) :: ts1, (vd, t2) :: ts2 ->
      type_app (SyntaxUtils.b_of t1) (SyntaxUtils.b_of t2) @
        type_app_tlists ts1 ts2
    | [], vf -> []
    | ve, [] -> [];;

let rec type_app_t
  pi (SyntaxVCT.B_union (s, cs)) =
    (match
      Contexts.lookup SyntaxVCT.equal_xp (ContextsPiDelta.theta_T pi)
        (SyntaxVCT.VNamed s)
      with None -> []
      | Some tdef ->
        type_app (SyntaxUtils.b_of tdef) (SyntaxVCT.B_union (s, cs)));;

let rec convert_b
  uu uv x2 = match uu, uv, x2 with
    uu, uv, SyntaxVCT.B_int -> (Z3.Z3T_int, Z3.Z3BE_true)
    | uw, ux, SyntaxVCT.B_bool -> (Z3.Z3T_bool, Z3.Z3BE_true)
    | p, v, SyntaxVCT.B_tuple blist ->
        (let (blist2, clist) = convert_blist p v blist in
          (Z3.Z3T_dt
             ("Tuple" ^ Utils.string_lit_of_nat (Lista.size_list blist),
               blist2),
            z3and clist))
    | p, uy, SyntaxVCT.B_record ((fid, uz) :: xs) ->
        (match ContextsPiDelta.lookup_record_name p fid
          with None -> (Z3.Z3T_dt ("unknownrecord", []), Z3.Z3BE_true)
          | Some s -> (Z3.Z3T_dt (s, []), Z3.Z3BE_true))
    | p, va, SyntaxVCT.B_record [] ->
        (Z3.Z3T_dt ("unknownrecord", []), Z3.Z3BE_true)
    | vb, vc, SyntaxVCT.B_bit -> (Z3.Z3T_bool, Z3.Z3BE_true)
    | p, v, SyntaxVCT.B_vec (vd, b) ->
        (let (t, _) = convert_b p v b in
          (Z3.Z3T_array (Z3.Z3T_int, t), Z3.Z3BE_true))
    | p, ve, SyntaxVCT.B_string -> (Z3.Z3T_string, Z3.Z3BE_true)
    | p, vf, SyntaxVCT.B_unit -> (Z3.Z3T_dt ("Unit", []), Z3.Z3BE_true)
    | p, v, SyntaxVCT.B_union (s, cs) ->
        (Z3.Z3T_dt
           (s, Lista.map (fun b -> Product_Type.fst (convert_b p v b))
                 (Lista.map Product_Type.snd
                   (type_app_t p (SyntaxVCT.B_union (s, cs))))),
          Z3.Z3BE_true)
    | vg, vh, SyntaxVCT.B_reg vi -> (Z3.Z3T_dt ("reg", []), Z3.Z3BE_true)
    | vj, vk, SyntaxVCT.B_var v -> (Z3.Z3T_sort v, Z3.Z3BE_true)
    | vl, vm, SyntaxVCT.B_tid v -> (Z3.Z3T_dt (v, []), Z3.Z3BE_true)
    | p, v, SyntaxVCT.B_list b ->
        (Z3.Z3T_dt ("List", [Product_Type.fst (convert_b p v b)]), Z3.Z3BE_true)
    | vn, b, SyntaxVCT.B_real -> (Z3.Z3T_string, Z3.Z3BE_true)
and convert_blist p v blist = Contexts.unzip (Lista.map (convert_b p v) blist);;

let rec convert_xbc
  p x b c =
    (let (t1, c1) = convert_b p (SyntaxVCT.V_var x) b in
      ([Z3.Z3D_decl_const (convert_x x, t1)], z3and [c1; convert_c c]));;

let rec subst_c_z
  x c = SyntaxPED.subst_cp (SyntaxVCT.V_var x) SyntaxVCT.VIndex c;;

let rec convert_g_aux
  p x1 = match p, x1 with p, [] -> ([], [])
    | p, (x, Contexts.GEPair (b, c)) :: gamma ->
        (let (ds, es) = convert_g_aux p gamma in
         let (d, e) = convert_xbc p x b c in
          (d @ ds, e :: es))
    | p, (x, Contexts.GETyp t) :: gamma ->
        (let (ds, es) = convert_g_aux p gamma in
         let (d, e) =
           convert_xbc p x (SyntaxUtils.b_of t)
             (subst_c_z x (SyntaxUtils.c_of t))
           in
          (d @ ds, e :: es));;

let rec convert_smt_problem_valid
  p g ev c =
    (let ga = Contexts.gamma_x g @ Contexts.gamma_u g in
     let (d1, e1) = convert_g_aux p ga in
     let (d2, e2) = convert_g_aux p ev in
     let ca = convert_c c in
      (ga, (d1, (d2, z3and (e1 @ [Z3.Z3BE_not (z3and (ca :: e2))])))));;

let rec pp_z3_expr
  = function Z3.Z3E_var s -> s
    | Z3.Z3E_true -> "true"
    | Z3.Z3E_false -> "false"
    | Z3.Z3E_num n -> Utils.string_lit_of_integer n
    | Z3.Z3E_plus (e1, e2) ->
        ((("(+ " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_leq (e1, e2) ->
        ((("(<= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_geq (e1, e2) ->
        ((("(>= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_times (e1, e2) ->
        ((("(* " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_div (e1, e2) ->
        ((("(div " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_mod (e1, e2) ->
        ((("(mod " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_minus (e1, e2) ->
        ((("(- " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_eq (e1, e2) ->
        ((("(= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_neq (e1, e2) ->
        (((("not (" ^ "(= ") ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ "))"
    | Z3.Z3E_and (e1, e2) ->
        ((("(and " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_or (e1, e2) ->
        ((("(or " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3E_constr (s, vs) ->
        (if ((s : string) = "nil") then "nil"
          else ((("( " ^ s) ^ " ") ^
                 Lista.foldr (fun t -> (fun a -> (pp_z3_expr t ^ " ") ^ a)) vs
                   " ") ^
                 " ) ")
    | Z3.Z3E_concat es ->
        ((("( concat" ^
            Utils.string_lit_of_int (Arith.int_of_nat (Lista.size_list es))) ^
           " ") ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_expr t ^ " ") ^ a)) es " ") ^
          " ) "
    | Z3.Z3E_bitone -> "true"
    | Z3.Z3E_bitzero -> "false"
    | Z3.Z3E_unit -> "unit"
    | Z3.Z3E_bitvec s -> "bitvec" ^ s
    | Z3.Z3E_proj (s, v) -> ((("(proj" ^ s) ^ " ") ^ pp_z3_expr v) ^ ")"
    | Z3.Z3E_len e -> ("(llen " ^ pp_z3_expr e) ^ " )"
    | Z3.Z3E_not e -> ("(not " ^ pp_z3_expr e) ^ " )"
    | Z3.Z3E_exp e -> ("(^ 2 " ^ pp_z3_expr e) ^ " )"
    | Z3.Z3E_string s -> ("\034" ^ s) ^ "\034";;

let rec pp_z3_bool_expr
  = function Z3.Z3BE_true -> "true"
    | Z3.Z3BE_false -> "false"
    | Z3.Z3BE_not e -> ("( not " ^ pp_z3_bool_expr e) ^ ")"
    | Z3.Z3BE_and elist ->
        ("(and " ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_bool_expr t ^ " ") ^ a)) elist
            " ") ^
          ")"
    | Z3.Z3BE_or elist ->
        ("(or " ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_bool_expr t ^ " ") ^ a)) elist
            " ") ^
          ")"
    | Z3.Z3BE_eq (e1, e2) ->
        ((("(= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3BE_leq (e1, e2) ->
        ((("(<= " ^ pp_z3_expr e1) ^ " ") ^ pp_z3_expr e2) ^ ")"
    | Z3.Z3BE_implies (c1, c2) ->
        ((("( => " ^ pp_z3_bool_expr c1) ^ " ") ^ pp_z3_bool_expr c2) ^ ")"
    | Z3.Z3BE_pred (s, elist) ->
        ((("( " ^ s) ^ " ") ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_expr t ^ " ") ^ a)) elist
            " ") ^
          ")";;

let rec lin_ze
  i x1 = match i, x1 with
    i, Z3.Z3E_exp e ->
      (let new_var = "exp_" ^ Stringa.implode (Utils.string_of_nat i) in
        (Arith.plus_nat i Arith.one_nat,
          (Z3.Z3E_var new_var, [(Z3.Z3E_var new_var, e)])))
    | i, Z3.Z3E_var s -> (i, (Z3.Z3E_var s, []))
    | i, Z3.Z3E_len e ->
        (let (ia, (ea, b)) = lin_ze i e in (ia, (Z3.Z3E_len ea, b)))
    | i, Z3.Z3E_num n -> (i, (Z3.Z3E_num n, []))
    | i, Z3.Z3E_true -> (i, (Z3.Z3E_true, []))
    | i, Z3.Z3E_false -> (i, (Z3.Z3E_false, []))
    | i, Z3.Z3E_bitone -> (i, (Z3.Z3E_bitone, []))
    | i, Z3.Z3E_bitzero -> (i, (Z3.Z3E_bitzero, []))
    | i, Z3.Z3E_unit -> (i, (Z3.Z3E_unit, []))
    | i, Z3.Z3E_plus (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_plus (a, b))
    | i, Z3.Z3E_leq (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_leq (a, b))
    | i, Z3.Z3E_geq (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_geq (a, b))
    | i, Z3.Z3E_times (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_times (a, b))
    | i, Z3.Z3E_div (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_div (a, b))
    | i, Z3.Z3E_mod (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_mod (a, b))
    | i, Z3.Z3E_minus (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_minus (a, b))
    | i, Z3.Z3E_eq (e1, e2) -> lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_eq (a, b))
    | i, Z3.Z3E_bitvec s -> (i, (Z3.Z3E_bitvec s, []))
    | i, Z3.Z3E_proj (s, e) ->
        (let (ia, (ea, b)) = lin_ze i e in (ia, (Z3.Z3E_proj (s, ea), b)))
    | i, Z3.Z3E_not e ->
        (let (ia, (ea, b)) = lin_ze i e in (ia, (Z3.Z3E_not ea, b)))
    | i, Z3.Z3E_and (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_and (a, b))
    | i, Z3.Z3E_or (e1, e2) -> lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_or (a, b))
    | i, Z3.Z3E_constr (s, elist) ->
        (let (ia, (elista, bs)) =
           Lista.foldr
             (fun sa (ia, (es, bs)) ->
               (let (ib, (e, b)) = lin_ze ia sa in (ib, (e :: es, b @ bs))))
             elist (i, ([], []))
           in
          (ia, (Z3.Z3E_constr (s, elista), bs)))
    | i, Z3.Z3E_neq (e1, e2) ->
        lin_ze_pair i e1 e2 (fun a b -> Z3.Z3E_neq (a, b))
    | i, Z3.Z3E_abs e ->
        (let (ia, (ea, b)) = lin_ze i e in (ia, (Z3.Z3E_abs ea, b)))
    | i, Z3.Z3E_concat elist ->
        (let (ia, (elista, bs)) =
           Lista.foldr
             (fun s (ia, (es, bs)) ->
               (let (ib, (e, b)) = lin_ze ia s in (ib, (e :: es, b @ bs))))
             elist (i, ([], []))
           in
          (ia, (Z3.Z3E_concat elista, bs)))
    | i, Z3.Z3E_string v -> (i, (Z3.Z3E_string v, []))
and lin_ze_pair
  i e1 e2 ctor =
    (let (i1, (e1a, bs1)) = lin_ze i e1 in
     let (i2, (e2a, bs2)) = lin_ze i1 e2 in
      (i2, (ctor e1a e2a, bs1 @ bs2)));;

let rec lin_zb
  i x1 = match i, x1 with
    i, Z3.Z3BE_eq (e1, e2) ->
      (let (i1, (e1a, bs1)) = lin_ze i e1 in
       let (i2, (e2a, bs2)) = lin_ze i1 e2 in
        (i2, (Z3.Z3BE_eq (e1a, e2a), bs1 @ bs2)))
    | i, Z3.Z3BE_leq (e1, e2) ->
        (let (i1, (e1a, bs1)) = lin_ze i e1 in
         let (i2, (e2a, bs2)) = lin_ze i1 e2 in
          (i2, (Z3.Z3BE_leq (e1a, e2a), bs1 @ bs2)))
    | i, Z3.Z3BE_true -> (i, (Z3.Z3BE_true, []))
    | i, Z3.Z3BE_false -> (i, (Z3.Z3BE_false, []))
    | i, Z3.Z3BE_and elist ->
        (let (ia, (elista, bs)) =
           Lista.foldr
             (fun s (ia, (es, bs)) ->
               (let (ib, (e, b)) = lin_zb ia s in (ib, (e :: es, b @ bs))))
             elist (i, ([], []))
           in
          (ia, (Z3.Z3BE_and elista, bs)))
    | i, Z3.Z3BE_or elist ->
        (let (ia, (elista, bs)) =
           Lista.foldr
             (fun s (ia, (es, bs)) ->
               (let (ib, (e, b)) = lin_zb ia s in (ib, (e :: es, b @ bs))))
             elist (i, ([], []))
           in
          (ia, (Z3.Z3BE_or elista, bs)))
    | i, Z3.Z3BE_implies (e1, e2) ->
        (let (i1, (e1a, bs1)) = lin_zb i e1 in
         let (i2, (e2a, bs2)) = lin_zb i1 e2 in
          (i2, (Z3.Z3BE_implies (e1a, e2a), bs1 @ bs2)))
    | i, Z3.Z3BE_not e1 ->
        (let (i1, (e1a, bs1)) = lin_zb i e1 in (i1, (Z3.Z3BE_not e1a, bs1)))
    | i, Z3.Z3BE_pred (s, elist) ->
        (let (ia, (elista, bs)) =
           Lista.foldr
             (fun sa (ia, (es, bs)) ->
               (let (ib, (e, b)) = lin_ze ia sa in (ib, (e :: es, b @ bs))))
             elist (i, ([], []))
           in
          (ia, (Z3.Z3BE_pred (s, elista), bs)));;

let rec rewrite_passes
  p g d1 e1 =
    (let x = lin_zb Arith.zero_nat e1 in
     let (i, (e1a, bs)) = (let (xa, a) = x in (Arith.int_of_nat xa, a)) in
     let var_decls =
       Lista.map
         (fun ia ->
           Z3.Z3D_decl_const
             ("exp_" ^ Stringa.implode (Utils.string_of_int ia), Z3.Z3T_int))
         (Lista.upto Arith.zero_int i)
       in
     let exp_eqs =
       Lista.map (fun (e1b, e2) -> Z3.Z3BE_pred ("exp_constraint", [e1b; e2]))
         bs
       in
      (d1 @ var_decls, Z3.Z3BE_and (e1a :: exp_eqs)));;

let z3_vector_sort : string = "(Array Int Bool)";;

let rec pp_bv_concats
  n = Lista.maps
        (fun i ->
          [((((("(declare-fun concat" ^ Utils.string_lit_of_int i) ^ " (") ^
               Utils.string_lit_map " " (fun _ -> z3_vector_sort)
                 (Lista.upto Arith.one_inta i)) ^
              ") ") ^
             z3_vector_sort) ^
             ")"])
        (Lista.upto Arith.one_inta n);;

let rec t_t_vars (SyntaxVCT.T_refined_type (vIndex0, b, c)) = b_t_vars b
and b_t_vars
  = function SyntaxVCT.B_var s -> [s]
    | SyntaxVCT.B_tuple bs ->
        Lista.remdups Stringa.equal_literal (Lista.maps b_t_vars bs)
    | SyntaxVCT.B_union (uu, ts) ->
        Lista.remdups Stringa.equal_literal
          (Lista.maps (fun (_, a) -> t_t_vars a) ts)
    | SyntaxVCT.B_record ts ->
        Lista.remdups Stringa.equal_literal
          (Lista.maps (fun (_, a) -> b_t_vars a) ts)
    | SyntaxVCT.B_vec (uv, b) -> b_t_vars b
    | SyntaxVCT.B_list b -> b_t_vars b
    | SyntaxVCT.B_tid v -> []
    | SyntaxVCT.B_int -> []
    | SyntaxVCT.B_bool -> []
    | SyntaxVCT.B_bit -> []
    | SyntaxVCT.B_unit -> []
    | SyntaxVCT.B_real -> []
    | SyntaxVCT.B_undef -> []
    | SyntaxVCT.B_reg v -> []
    | SyntaxVCT.B_string -> []
    | SyntaxVCT.B_exception -> []
    | SyntaxVCT.B_finite_set v -> [];;

let rec pp_sort_decl
  p g = Lista.remdups Stringa.equal_literal
          (Lista.maps
            (fun (_, t) ->
              Lista.map
                (fun s -> ("(declare-sort " ^ Contexts.remove_tick s) ^ ")")
                (Lista.remdups Stringa.equal_literal (t_t_vars t)))
            (ContextsPiDelta.theta_T p));;

let rec bv_consts_v
  = function SyntaxVCT.V_lit (SyntaxVCT.L_bitvec l) -> [SyntaxVCT.L_bitvec l]
    | SyntaxVCT.V_tuple vs -> Lista.maps bv_consts_v vs
    | SyntaxVCT.V_lit SyntaxVCT.L_unit -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_zero -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_one -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_true -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_false -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_num va) -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_string va) -> []
    | SyntaxVCT.V_lit SyntaxVCT.L_undef -> []
    | SyntaxVCT.V_lit (SyntaxVCT.L_real va) -> []
    | SyntaxVCT.V_var v -> []
    | SyntaxVCT.V_vec v -> []
    | SyntaxVCT.V_list v -> []
    | SyntaxVCT.V_cons (v, va) -> []
    | SyntaxVCT.V_constr (v, va) -> []
    | SyntaxVCT.V_record v -> []
    | SyntaxVCT.V_proj (v, va) -> [];;

let rec bv_consts_ce
  = function SyntaxVCT.CE_val v -> bv_consts_v v
    | SyntaxVCT.CE_bop (opp, v1, v2) -> bv_consts_ce v1 @ bv_consts_ce v2
    | SyntaxVCT.CE_uop (opp, v) -> bv_consts_ce v
    | SyntaxVCT.CE_many_plus v -> Lista.maps bv_consts_ce v
    | SyntaxVCT.CE_proj (v, va) -> bv_consts_ce va
    | SyntaxVCT.CE_field_access (v, va) -> [];;

let rec bv_consts_c
  = function SyntaxVCT.C_eq (e1, e2) -> bv_consts_ce e1 @ bv_consts_ce e2
    | SyntaxVCT.C_conj (e1, e2) -> bv_consts_c e1 @ bv_consts_c e2
    | SyntaxVCT.C_disj (e1, e2) -> bv_consts_c e1 @ bv_consts_c e2
    | SyntaxVCT.C_imp (e1, e2) -> bv_consts_c e1 @ bv_consts_c e2
    | SyntaxVCT.C_not e1 -> bv_consts_c e1
    | SyntaxVCT.C_true -> []
    | SyntaxVCT.C_false -> []
    | SyntaxVCT.C_conj_many v -> []
    | SyntaxVCT.C_leq (v, va) -> [];;

let rec c_of_e = function Contexts.GEPair (uu, c) -> c
                 | Contexts.GETyp t -> SyntaxUtils.c_of t;;

let rec bv_consts_aux
  xbc = Lista.maps (fun (_, e) -> bv_consts_c (c_of_e e)) xbc;;

let z3_vector_lookup : string = " select ";;

let rec convert_bitvec = function [] -> ""
                         | SyntaxVCT.L_one :: bv -> "1" ^ convert_bitvec bv
                         | SyntaxVCT.L_zero :: bv -> "0" ^ convert_bitvec bv;;

let rec pp_bitvec
  = function
    SyntaxVCT.L_bitvec s ->
      [((("(declare-const bitvec" ^ convert_bitvec s) ^ " ") ^ z3_vector_sort) ^
         " )";
        (((((("(assert (and " ^ "( = (llen bitvec") ^ convert_bitvec s) ^
             ") ") ^
            Utils.string_lit_of_nat (Lista.size_list s)) ^
           " ) ") ^
          Utils.string_lit_concat
            (Lista.map
              (fun (i, x) ->
                ((((((("( = ( " ^ z3_vector_lookup) ^ "  bitvec") ^
                      convert_bitvec s) ^
                     " ") ^
                    Utils.string_lit_of_nat i) ^
                   ") ") ^
                  (match x with SyntaxVCT.L_zero -> " false "
                    | SyntaxVCT.L_one -> " true ")) ^
                  " ) ")
              (Lista.enumerate Arith.zero_nat s))) ^
          " )) "]
    | SyntaxVCT.L_unit -> []
    | SyntaxVCT.L_zero -> []
    | SyntaxVCT.L_one -> []
    | SyntaxVCT.L_true -> []
    | SyntaxVCT.L_false -> []
    | SyntaxVCT.L_num v -> []
    | SyntaxVCT.L_string v -> []
    | SyntaxVCT.L_undef -> []
    | SyntaxVCT.L_real v -> [];;

let rec pp_bv_consts
  g ev c =
    (let bvs =
       bv_consts_aux (Contexts.gamma_x g) @ bv_consts_aux ev @ bv_consts_c c in
      Lista.maps pp_bitvec (Lista.remdups SyntaxVCT.equal_lit bvs));;

let pp_z3_vector_funs : string = "";;

let rec pp_z3_exp_pred
  maxx =
    ("(define-fun exp_constraint ((x Int ) (y Int )) Bool (or " ^
      Utils.string_lit_map " "
        (fun i ->
          ((((("( and " ^ " ( = x ") ^
               Stringa.implode
                 (Utils.string_of_int
                   (Arith.power Arith.power_int
                     (Arith.Int_of_integer (Z.of_int 2)) i))) ^
              " ) ") ^
             "( = y ") ^
            Stringa.implode (Utils.string_of_int (Arith.int_of_nat i))) ^
            " ))")
        (upto maxx)) ^
      ")) ";;

let rec pp_z3_type
  = function Z3.Z3T_int -> "Int"
    | Z3.Z3T_bool -> "Bool"
    | Z3.Z3T_unit -> "Unit"
    | Z3.Z3T_array (t1, t2) ->
        ((("(Array " ^ pp_z3_type t1) ^ " ") ^ pp_z3_type t2) ^ " )"
    | Z3.Z3T_dt (s, tlist) ->
        ((("( " ^ s) ^ " ") ^
          Lista.foldr (fun t -> (fun a -> (pp_z3_type t ^ " ") ^ a)) tlist
            " ") ^
          ") "
    | Z3.Z3T_sort s -> Contexts.remove_tick s
    | Z3.Z3T_string -> "String";;

let rec pp_z3_type_var
  = function Z3.Z3TV_tv_type t -> pp_z3_type t
    | Z3.Z3TV_tv_var n -> "T" ^ Utils.string_lit_of_integer n;;

let rec pp_z3_fields
  fs = Lista.foldr
         (fun (c, t) ->
           (fun a -> ((((" ( " ^ c) ^ " ") ^ pp_z3_type_var t) ^ " ) ") ^ a))
         fs "";;

let rec pp_z3_ty_constr
  (Z3.Z3C_ty_constr (c, x)) = (((" ( " ^ c) ^ " ") ^ pp_z3_fields x) ^ ")";;

let rec pp_z3_decl
  = function
    Z3.Z3D_decl_const (s, t) ->
      ((("(declare-const " ^ s) ^ " ") ^ pp_z3_type t) ^ ")"
    | Z3.Z3D_decl_fun -> "Unknown"
    | Z3.Z3D_decl_datatype (s, tvs, dt_list) ->
        (((((((("(declare-datatypes " ^ " (( ") ^ s) ^ " ") ^
              Utils.string_lit_of_nat (Lista.size_list tvs)) ^
             ")) (( par ( ") ^
            Utils.string_lit_map " " pp_z3_type_var tvs) ^
           " ) ( ") ^
          Lista.foldr (fun tc -> (fun a -> pp_z3_ty_constr tc ^ a)) dt_list
            "") ^
          "))))";;

let rec z3_declare_tuple
  n = Z3.Z3D_decl_datatype
        ("Tuple" ^ Utils.string_lit_of_int n,
          Lista.map (fun i -> Z3.Z3TV_tv_var (Arith.integer_of_int i))
            (Lista.upto Arith.one_inta n),
          [Z3.Z3C_ty_constr
             ("mk-tuple" ^ Utils.string_lit_of_int n,
               Lista.map
                 (fun i ->
                   ((("proj" ^ Utils.string_lit_of_int n) ^ "X") ^
                      Utils.string_lit_of_int i,
                     Z3.Z3TV_tv_var (Arith.integer_of_int i)))
                 (Lista.upto Arith.one_inta n))]);;

let rec pp_tuples
  n = Lista.map (fun i -> pp_z3_decl (z3_declare_tuple i))
        (Lista.upto Arith.one_inta n);;

let rec pp_builtins
  n = pp_z3_exp_pred (Arith.nat_of_integer (Z.of_int 16)) ::
        pp_z3_vector_funs ::
          (("(declare-fun llen (" ^ z3_vector_sort) ^ ") Int)") ::
            pp_z3_decl
              (Z3.Z3D_decl_datatype
                ("Unit", [], [Z3.Z3C_ty_constr ("unit", [])])) ::
              pp_tuples n;;

let rec freshen_type
  = function Z3.Z3T_int -> Z3.Z3T_int
    | Z3.Z3T_bool -> Z3.Z3T_bool
    | Z3.Z3T_unit -> Z3.Z3T_unit
    | Z3.Z3T_array (t1, t2) -> Z3.Z3T_array (freshen_type t1, freshen_type t2)
    | Z3.Z3T_dt (s, zts) -> Z3.Z3T_dt (s, Lista.map freshen_type zts)
    | Z3.Z3T_sort s -> Z3.Z3T_sort (s ^ "T")
    | Z3.Z3T_string -> Z3.Z3T_string;;

let rec freshen_type_var
  = function Z3.Z3TV_tv_type t -> Z3.Z3TV_tv_type (freshen_type t)
    | Z3.Z3TV_tv_var i -> Z3.Z3TV_tv_var i;;

let rec freshen_constr
  (Z3.Z3C_ty_constr (s, stvs)) =
    Z3.Z3C_ty_constr
      (s, Lista.map (fun (sa, t) -> (sa, freshen_type_var t)) stvs);;

let rec freshen_decl
  = function Z3.Z3D_decl_fun -> Z3.Z3D_decl_fun
    | Z3.Z3D_decl_const (s, t) -> Z3.Z3D_decl_const (s, freshen_type t)
    | Z3.Z3D_decl_datatype (s, vs, cs) ->
        Z3.Z3D_decl_datatype
          (s, Lista.map freshen_type_var vs, Lista.map freshen_constr cs);;

let rec convert_t
  p v (SyntaxVCT.T_refined_type (vIndex0, b, c)) =
    (let (t, e) = convert_b p v b in
      (t, z3and [e; convert_c (SyntaxPED.subst_cp v SyntaxVCT.VIndex c)]));;

let rec convert_typedef
  p x1 = match p, x1 with
    p, (SyntaxVCT.VNamed x,
         SyntaxVCT.T_refined_type (uu, SyntaxVCT.B_union (s, clist), uv))
      -> (let decl =
            Z3.Z3D_decl_datatype
              (x, Lista.map (fun v -> Z3.Z3TV_tv_type (Z3.Z3T_sort v))
                    (Lista.maps (fun (_, a) -> t_t_vars a) clist),
                Lista.map
                  (fun (sa, t) ->
                    (let (zt, _) =
                       convert_t p (SyntaxVCT.V_var SyntaxVCT.VIndex) t in
                      Z3.Z3C_ty_constr
                        (sa, [((("proj" ^ x) ^ "x") ^ sa,
                                Z3.Z3TV_tv_type zt)])))
                  clist)
            in
           Some (freshen_decl decl))
    | p, (SyntaxVCT.VNamed x,
           SyntaxVCT.T_refined_type (uw, SyntaxVCT.B_record clist, ux))
        -> (let decl =
              Z3.Z3D_decl_datatype
                (x, Lista.map (fun v -> Z3.Z3TV_tv_type (Z3.Z3T_sort v))
                      (Lista.maps (fun (_, a) -> b_t_vars a) clist),
                  [Z3.Z3C_ty_constr
                     ("mk-" ^ x,
                       Lista.map
                         (fun (s, t) ->
                           (let (zt, _) =
                              convert_b p (SyntaxVCT.V_var SyntaxVCT.VIndex) t
                              in
                             ("proj" ^ s, Z3.Z3TV_tv_type zt)))
                         clist)])
              in
             Some (freshen_decl decl))
    | uy, (SyntaxVCT.VIndex, va) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_var ve, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_tid ve, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_int, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_bool, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_bit, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_unit, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_real, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_vec (ve, vf), vd)) ->
        None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_list ve, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_tuple ve, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_undef, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_reg ve, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_string, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_exception, vd)) -> None
    | uy, (v, SyntaxVCT.T_refined_type (vb, SyntaxVCT.B_finite_set ve, vd)) ->
        None;;

let rec pp_typedef
  p td = (match convert_typedef p td with None -> "" | Some a -> pp_z3_decl a);;

let max_tuples : Arith.int = Arith.Int_of_integer (Z.of_int 10);;

let rec convert_smt_problem_final
  p ga ev c g d1 d2 e1 =
    (let (d1a, e1a) = rewrite_passes p ga d1 e1 in
      pp_bv_concats (Arith.Int_of_integer (Z.of_int 3)) @
        pp_builtins max_tuples @
          pp_bv_consts ga ev c @
            pp_sort_decl p ga @
              Lista.map (pp_typedef p) (ContextsPiDelta.minimise_td p g) @
                Lista.map pp_z3_decl d1a @
                  [("(define-fun constraint () Bool " ^ pp_z3_bool_expr e1a) ^
                     (if Arith.equal_nat (Lista.size_list d2) Arith.zero_nat
                       then ")" else "))")] @
                    ["(assert constraint)"; "(check-sat)"]);;

let rec pp_smt_problem_valid
  p g ev c =
    (let a = convert_smt_problem_valid p g ev c in
     let (ga, aa) = a in
     let (d1, ab) = aa in
     let (ac, b) = ab in
      convert_smt_problem_final p g ev c ga d1 ac b);;

let rec has_no_t_var_b
  = function SyntaxVCT.B_var uu -> false
    | SyntaxVCT.B_tuple bs -> Lista.list_all has_no_t_var_b bs
    | SyntaxVCT.B_tid v -> true
    | SyntaxVCT.B_int -> true
    | SyntaxVCT.B_bool -> true
    | SyntaxVCT.B_bit -> true
    | SyntaxVCT.B_unit -> true
    | SyntaxVCT.B_real -> true
    | SyntaxVCT.B_vec (v, va) -> true
    | SyntaxVCT.B_list v -> true
    | SyntaxVCT.B_union (v, va) -> true
    | SyntaxVCT.B_record v -> true
    | SyntaxVCT.B_undef -> true
    | SyntaxVCT.B_reg v -> true
    | SyntaxVCT.B_string -> true
    | SyntaxVCT.B_exception -> true
    | SyntaxVCT.B_finite_set v -> true;;

let rec b_of_e = function Contexts.GEPair (b, uu) -> b
                 | Contexts.GETyp t -> SyntaxUtils.b_of t;;

let rec has_no_t_var_g
  g = Lista.list_all (fun (_, t) -> has_no_t_var_b (b_of_e t))
        (Contexts.gamma_x g);;

let rec has_t_var
  g xbc =
    not (has_no_t_var_g g &&
          Lista.list_all (fun (_, t) -> has_no_t_var_b (b_of_e t)) xbc);;

let rec valid
  s loc p g xbc c =
    (let _ = Debug.trace ("valid call: vars=" ^ Contexts.pp_G g) in
      has_t_var g xbc ||
        Smt2.traceG s g xbc c &&
          not (Smt2.satisfiable s loc (pp_smt_problem_valid p g xbc c) false));;

end;; (*struct Satis*)
module TypingDeclFailRules : sig
  type err = CheckFail of string * Location.loc
  type 'a either_error = OK of 'a | Error of err
  val join : 'a either_error -> 'b either_error -> 'a either_error
  val s_of : SyntaxVCT.xp -> string
  val bot_t : SyntaxVCT.tau
  val update_klist :
    (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
      SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp) ->
        (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list
  val merge_klist :
    (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
      (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
        (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list
  val mk_fresh_lbl : Arith.nat -> string -> Arith.nat * SyntaxVCT.xp
  val b_of_lit_full :
    'a ContextsPiDelta.theta_ext -> SyntaxVCT.lit -> SyntaxVCT.bp
  val subtype_i_i_i_i_i_o :
    Location.loc ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          SyntaxVCT.tau -> SyntaxVCT.tau -> unit either_error Predicate.pred
  val check_pat_i_i_i_i_i_i_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          SyntaxPED.patp ->
            SyntaxVCT.tau ->
              SyntaxVCT.vp ->
                ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                  (SyntaxVCT.xp list * (Arith.nat * unit either_error)))
                  Predicate.pred
  val check_pat_list_i_i_i_i_i_o_i_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          SyntaxPED.patp list ->
            SyntaxVCT.bp list ->
              SyntaxVCT.vp list ->
                ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                  (Arith.nat * unit either_error))
                  Predicate.pred
  val tsubst_bp_many :
    SyntaxVCT.bp -> (string * SyntaxVCT.bp) list -> SyntaxVCT.bp
  val match_arg_i_i_i_i_i_i_i_o_o_o :
    Location.loc ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
          SyntaxVCT.xp ->
            SyntaxVCT.bp ->
              SyntaxVCT.cp ->
                SyntaxVCT.ap list ->
                  (SyntaxVCT.ap *
                    ((string * SyntaxVCT.bp) list * unit either_error))
                    Predicate.pred
  val equal_err : err -> err -> bool
  val equal_either_error :
    'a HOL.equal -> 'a either_error -> 'a either_error -> bool
  val infer_v_i_i_i_o_o :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp -> (SyntaxVCT.tau * unit either_error) Predicate.pred
  val infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp list ->
          (SyntaxVCT.xp list *
            (SyntaxVCT.bp list * (SyntaxVCT.cp list * unit either_error)))
            Predicate.pred
  val infer_v_i_i_i_o_i :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp -> unit either_error -> SyntaxVCT.tau Predicate.pred
  val infer_v_T_G_vp_list_tp_list_i_i_i_o_i :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp list ->
          unit either_error -> (SyntaxVCT.tau list) Predicate.pred
  val infer_v_T_G_vp_list_tp_list_i_i_i_o_o :
    unit ContextsPiDelta.theta_ext ->
      (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
        SyntaxVCT.vp list ->
          (SyntaxVCT.tau list * unit either_error) Predicate.pred
  val check_e_i_i_i_i_i_i_i_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.ep ->
                SyntaxVCT.tau -> (Arith.nat * unit either_error) Predicate.pred
  val check_e_list_i_i_i_i_i_i_i_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.ep list ->
                SyntaxVCT.tau list ->
                  ((SyntaxPED.pexpp, unit) Contexts.gamma_ext *
                    (Arith.nat * unit either_error))
                    Predicate.pred
  val infer_e_i_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.ep ->
                (SyntaxVCT.tau *
                  (SyntaxVCT.vp *
                    ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                      (Arith.nat * unit either_error))))
                  Predicate.pred
  val letbind_i_i_i_i_i_i_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.letbind ->
                ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                  (Arith.nat * unit either_error))
                  Predicate.pred
  val infer_e_list_i_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.ep list ->
                (SyntaxVCT.tau list *
                  (SyntaxVCT.vp list *
                    ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                      (Arith.nat * unit either_error))))
                  Predicate.pred
  val infer_app_i_i_i_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      Location.loc ->
        unit ContextsPiDelta.theta_ext ->
          (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
            (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
              unit ContextsPiDelta.delta_ext ->
                SyntaxVCT.ap list ->
                  SyntaxPED.ep ->
                    (SyntaxVCT.tau *
                      (SyntaxVCT.vp *
                        ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                          (Arith.nat * unit either_error))))
                      Predicate.pred
  val infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o
    : Arith.nat ->
        unit ContextsPiDelta.theta_ext ->
          (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
            (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
              unit ContextsPiDelta.delta_ext ->
                SyntaxPED.ep list ->
                  (SyntaxVCT.xp *
                    (SyntaxVCT.order *
                      (SyntaxVCT.bp *
                        (SyntaxVCT.cp list *
                          (SyntaxVCT.vp list *
                            (((SyntaxVCT.xp *
                                (SyntaxVCT.bp * SyntaxVCT.cp)) list) list *
                              (Arith.nat * unit either_error)))))))
                    Predicate.pred
  val typing_lexp_i_i_i_i_i_i_i_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.lexpp ->
                SyntaxPED.ep ->
                  (unit ContextsPiDelta.delta_ext *
                    ((SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list *
                      (Arith.nat * unit either_error)))
                    Predicate.pred
  val check_pexp_i_i_i_i_i_i_i_i_i_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.pexpp ->
                SyntaxVCT.tau ->
                  SyntaxVCT.tau ->
                    SyntaxVCT.vp ->
                      ((SyntaxPED.pexpp, unit) Contexts.gamma_ext *
                        (Arith.nat * unit either_error))
                        Predicate.pred
  val check_pexp_list_i_i_i_i_i_i_i_i_i_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            unit ContextsPiDelta.delta_ext ->
              SyntaxPED.pexpp list ->
                SyntaxVCT.tau ->
                  SyntaxVCT.tau ->
                    SyntaxVCT.vp ->
                      (Arith.nat * unit either_error) Predicate.pred
  val check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            SyntaxPED.funclp list ->
              SyntaxVCT.xp ->
                SyntaxVCT.bp ->
                  SyntaxVCT.cp ->
                    SyntaxVCT.tau ->
                      ((SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext *
                        ((SyntaxPED.pexpp, unit) Contexts.gamma_ext *
                          (Arith.nat * unit either_error)))
                        Predicate.pred
  val def_checking_mapI_xp_bp_cp_i_o_o_o_o :
    (SyntaxVCT.xp * (SyntaxVCT.bp * SyntaxVCT.cp)) list ->
      (SyntaxVCT.xp list *
        (SyntaxVCT.bp list * (SyntaxVCT.cp list * unit either_error)))
        Predicate.pred
  val check_def_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            SyntaxPED.def ->
              (unit ContextsPiDelta.theta_ext *
                ((SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext *
                  ((SyntaxPED.pexpp, unit) Contexts.gamma_ext *
                    (Arith.nat * unit either_error))))
                Predicate.pred
  val check_defs_i_i_i_i_i_o_o_o_o_o :
    Arith.nat ->
      unit ContextsPiDelta.theta_ext ->
        (SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext ->
          (SyntaxPED.pexpp, unit) Contexts.gamma_ext ->
            SyntaxPED.def list ->
              (unit ContextsPiDelta.theta_ext *
                ((SyntaxPED.pexpp, unit) ContextsPiDelta.phi_ext *
                  ((SyntaxPED.pexpp, unit) Contexts.gamma_ext *
                    (Arith.nat * unit either_error))))
                Predicate.pred
  val check_prog_i_o : SyntaxPED.progp -> unit either_error Predicate.pred
end = struct

type err = CheckFail of string * Location.loc;;

type 'a either_error = OK of 'a | Error of err;;

let rec join x0 uu = match x0, uu with Error e, uu -> Error e
               | OK v, Error e -> Error e
               | OK v, OK va -> OK v;;

let rec s_of = function SyntaxVCT.VNamed s -> s
               | SyntaxVCT.VIndex -> "#0";;

let bot_t : SyntaxVCT.tau
  = SyntaxVCT.T_refined_type
      (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false);;

let rec update_klist
  x0 x1 = match x0, x1 with [], (xp, (bp, cp)) -> [(xp, (bp, cp))]
    | (xpa, (bpa, cpa)) :: klist, (xp, (bp, cp)) ->
        (if SyntaxVCT.equal_xpa xp xpa
          then (xp, (bp, SyntaxVCT.C_conj (cp, cpa))) :: klist
          else (xpa, (bpa, cpa)) :: update_klist klist (xp, (bp, cp)));;

let rec merge_klist
  klist1 klist2 =
    Lista.foldr (fun xpge klist -> update_klist klist xpge) klist1 klist2;;

let rec mk_fresh_lbl
  i s = (let (ia, SyntaxVCT.VNamed xps) = TypingUtils.mk_fresh_i i in
          (ia, SyntaxVCT.VNamed (xps ^ s)));;

let rec b_of_lit_full
  t x1 = match t, x1 with
    t, SyntaxVCT.L_bitvec vs ->
      (match ContextsPiDelta.theta_d t
        with None -> SyntaxVCT.B_vec (SyntaxVCT.Ord_dec, SyntaxVCT.B_bit)
        | Some ord -> SyntaxVCT.B_vec (ord, SyntaxVCT.B_bit))
    | t, SyntaxVCT.L_unit -> SyntaxUtils.b_of_lit SyntaxVCT.L_unit
    | t, SyntaxVCT.L_zero -> SyntaxUtils.b_of_lit SyntaxVCT.L_zero
    | t, SyntaxVCT.L_one -> SyntaxUtils.b_of_lit SyntaxVCT.L_one
    | t, SyntaxVCT.L_true -> SyntaxUtils.b_of_lit SyntaxVCT.L_true
    | t, SyntaxVCT.L_false -> SyntaxUtils.b_of_lit SyntaxVCT.L_false
    | t, SyntaxVCT.L_num v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_num v)
    | t, SyntaxVCT.L_string v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_string v)
    | t, SyntaxVCT.L_undef -> SyntaxUtils.b_of_lit SyntaxVCT.L_undef
    | t, SyntaxVCT.L_real v -> SyntaxUtils.b_of_lit (SyntaxVCT.L_real v);;

let rec subtype_i_i_i_i_i_o
  x xa xb xc xd =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
        (fun (loc, (theta,
                     (gamma,
                       (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                         SyntaxVCT.T_refined_type (zp2, bp2, cp2)))))
          -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
               (fun a ->
                 (match a with None -> Predicate.bot_pred
                   | Some _ ->
                     Predicate.bind
                       (UnifyType.eq_o_i (TypingUtils.mk_fresh_g gamma))
                       (fun xe ->
                         Predicate.bind
                           (UnifyType.eq_i_i Product_Type.equal_bool true
                             (Satis.valid "check_valid" loc theta
                               (Contexts.add_var gamma
                                 (xe, Contexts.GEPair
(bp1, SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe))))
                               [] (SyntaxUtils.subst_x_cp cp2 zp2
                                    (SyntaxVCT.V_var xe))))
                           (fun () -> Predicate.single (OK ())))))))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
          (fun (loc, (_, (_, (SyntaxVCT.T_refined_type (_, bp1, _),
                               SyntaxVCT.T_refined_type (_, bp2, _)))))
            -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                 (fun a ->
                   (match a
                     with None ->
                       Predicate.single
                         (Error (CheckFail ("subtype: unify fail", loc)))
                     | Some _ -> Predicate.bot_pred))))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
            (fun (loc, (_, (gamma,
                             (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                               SyntaxVCT.T_refined_type (zp2, _, cp2)))))
              -> Predicate.bind
                   (UnifyType.eq_o_i (TypingUtils.mk_fresh_g gamma))
                   (fun xe ->
                     Predicate.bind
                       (UnifyType.eq_i_i Product_Type.equal_bool false
                         (Satis.wf_g
                           (Contexts.add_var gamma
                             (xe, Contexts.GEPair
                                    (bp1, SyntaxVCT.C_conj
    (SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe),
      SyntaxUtils.subst_x_cp cp2 zp2 (SyntaxVCT.V_var xe)))))))
                       (fun () ->
                         Predicate.single
                           (Error
                             (CheckFail
                               ("subtype: G not well formed", loc)))))))
          (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
            (fun (loc, (theta,
                         (gamma,
                           (SyntaxVCT.T_refined_type (zp1, bp1, cp1),
                             SyntaxVCT.T_refined_type (zp2, bp2, cp2)))))
              -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                   (fun a ->
                     (match a with None -> Predicate.bot_pred
                       | Some _ ->
                         Predicate.bind
                           (UnifyType.eq_o_i (TypingUtils.mk_fresh_g gamma))
                           (fun xe ->
                             Predicate.bind
                               (UnifyType.eq_i_i Product_Type.equal_bool false
                                 (Satis.valid "check_valid" loc theta
                                   (Contexts.add_var gamma
                                     (xe, Contexts.GEPair
    (bp1, SyntaxUtils.subst_x_cp cp1 zp1 (SyntaxVCT.V_var xe))))
                                   [] (SyntaxUtils.subst_x_cp cp2 zp2
(SyntaxVCT.V_var xe))))
                               (fun () ->
                                 Predicate.single
                                   (Error
                                     (CheckFail
                                       ("subtype: valid fail", loc)))))))))));;

let rec check_pat_i_i_i_i_i_i_o_o_o_o
  x xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
              Predicate.bot_pred
            | (i1, (_, (_, (SyntaxPED.Pp_wild _,
                             (SyntaxVCT.T_refined_type (zp, bp, cp), _)))))
              -> Predicate.bind (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                   (fun (i2, xp2) ->
                     Predicate.single
                       ([(xp2, (bp, SyntaxUtils.subst_x_cp cp zp
                                      (SyntaxVCT.V_var xp2)))],
                         ([xp2], (i2, OK ()))))
            | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) -> Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) -> Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) -> Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
              Predicate.bot_pred
            | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
          (fun a ->
            (match a
              with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) -> Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                Predicate.bot_pred
              | (i, (_, (_, (SyntaxPED.Pp_id (_, idd),
                              (SyntaxVCT.T_refined_type (_, bp, _), vp)))))
                -> Predicate.single
                     ([(SyntaxVCT.VNamed idd,
                         (bp, SyntaxVCT.C_eq
                                (SyntaxVCT.CE_val vp,
                                  SyntaxVCT.CE_val
                                    (SyntaxVCT.V_var
                                      (SyntaxVCT.VNamed idd)))))],
                       ([SyntaxVCT.VNamed idd], (i, OK ())))
              | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                Predicate.bot_pred
              | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
            (fun a ->
              (match a
                with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_var _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_tid _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_int, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_bool, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_bit, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_unit, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_real, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_vec (_, _), _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_list _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (i1, (theta,
                         (gamma,
                           (SyntaxPED.Pp_tup (_, patp_list),
                             (SyntaxVCT.T_refined_type
                                (zp, SyntaxVCT.B_tuple bp_list, cp),
                               vp)))))
                  -> Predicate.bind (UnifyType.eq_o_i (mk_fresh_lbl i1 "ptup"))
                       (fun (i2, xp) ->
                         Predicate.bind
                           (UnifyType.eq_o_i
                             (TypingUtils.mk_proj_vars xp bp_list))
                           (fun (xp_list, klist1) ->
                             Predicate.bind
                               (check_pat_list_i_i_i_i_i_o_i_o_o i2 theta
                                 (TypingUtils.g_cons3 gamma [klist1]) patp_list
                                 bp_list
                                 (Lista.map (fun aa -> SyntaxVCT.V_var aa)
                                   xp_list))
                               (fun (klist2, (i3, ok)) ->
                                 Predicate.bind
                                   (UnifyType.eq_o_i
                                     (merge_klist klist1 klist2))
                                   (fun xa ->
                                     Predicate.single
                                       ((xp,
  (SyntaxVCT.B_tuple bp_list,
    SyntaxVCT.C_conj
      (SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xp),
        SyntaxUtils.mk_v_eq_c xp vp))) ::
  Lista.concat [xa],
 (xp_list, (i3, ok)))))))
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_union (_, _), _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_record _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_undef, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_reg _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_string, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_exception, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _),
                                (SyntaxVCT.T_refined_type
                                   (_, SyntaxVCT.B_finite_set _, _),
                                  _)))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
              (fun a ->
                (match a
                  with (i1, (theta,
                              (_, (SyntaxPED.Pp_lit (_, lit),
                                    (SyntaxVCT.T_refined_type (_, bp, _),
                                      xp1)))))
                    -> Predicate.bind
                         (UnifyType.unify_b_i_i_o (b_of_lit_full theta lit) bp)
                         (fun aa ->
                           (match aa with None -> Predicate.bot_pred
                             | Some _ ->
                               Predicate.bind
                                 (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                                 (fun (i2, xp2) ->
                                   Predicate.single
                                     ([(xp2,
 (b_of_lit_full theta lit,
   SyntaxVCT.C_eq
     (SyntaxVCT.CE_val xp1, SyntaxVCT.CE_val (SyntaxVCT.V_lit lit))))],
                                       ([xp2], (i2, OK ()))))))
                  | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                (fun a ->
                  (match a
                    with (i1, (theta,
                                (_, (SyntaxPED.Pp_lit (loc, lit),
                                      (SyntaxVCT.T_refined_type (_, bp, _),
_)))))
                      -> Predicate.bind
                           (UnifyType.unify_b_i_i_o (b_of_lit_full theta lit)
                             bp)
                           (fun aa ->
                             (match aa
                               with None ->
                                 Predicate.single
                                   ([], ([],
  (i1, Error (CheckFail ("Pattern literal. Base type mismatch", loc)))))
                               | Some _ -> Predicate.bot_pred))
                    | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_var _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_tid _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_int, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_bool, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_bit, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_unit, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_real, _),
_)))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (gamma,
                                 (SyntaxPED.Pp_vector_concat (_, cs),
                                   (SyntaxVCT.T_refined_type
                                      (_, SyntaxVCT.B_vec (_, bp), _),
                                     _)))))
                        -> Predicate.bind
                             (check_pat_list_i_i_i_i_i_o_i_o_o i1 theta gamma cs
                               (Lista.replicate (Lista.size_list cs) bp) [])
                             (fun (klist, (i2, ok)) ->
                               Predicate.single (klist, ([], (i2, ok))))
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_list _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_tuple _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_union (_, _), _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_record _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_undef, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_reg _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_string, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_exception, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
                                      (SyntaxVCT.T_refined_type
 (_, SyntaxVCT.B_finite_set _, _),
_)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _)))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind
                    (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (i1, (theta,
                                 (gamma,
                                   (SyntaxPED.Pp_typ (loc, tau_1, patp),
                                     (SyntaxVCT.T_refined_type (zp, bp, cp),
                                       xpa)))))
                          -> Predicate.bind
                               (check_pat_i_i_i_i_i_i_o_o_o_o i1 theta gamma
                                 patp tau_1 xpa)
                               (fun (klist, (xlist, (i2, ok1))) ->
                                 Predicate.bind
                                   (subtype_i_i_i_i_i_o loc theta
                                     (TypingUtils.g_cons3 gamma [klist]) tau_1
                                     (SyntaxVCT.T_refined_type (zp, bp, cp)))
                                   (fun xa ->
                                     Predicate.single
                                       (klist, (xlist, (i2, join ok1 xa)))))
                        | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _), _))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _), _))))
                          -> Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind
                      (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                      (fun a ->
                        (match a
                          with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (i1, (theta,
                                   (gamma,
                                     (SyntaxPED.Pp_app (loc, id, patp_list),
                                       (tau_2, _)))))
                            -> Predicate.bind
                                 (UnifyType.eq_o_i
                                   (ContextsPiDelta.lookup_constr_union_type
                                     theta id))
                                 (fun aa ->
                                   (match aa with None -> Predicate.bot_pred
                                     | Some (tau_1, tau_in) ->
                                       Predicate.bind
 (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
 (fun (i2, xp3) ->
   Predicate.bind
     (UnifyType.unify_b_i_i_o (UnifyType.b_of tau_1) (UnifyType.b_of tau_2))
     (fun ab ->
       (match ab with None -> Predicate.bot_pred
         | Some bsub ->
           Predicate.bind
             (UnifyType.eq_o_i (TypingUtils.tsubst_t_many tau_in bsub))
             (fun (SyntaxVCT.T_refined_type (zp, bp, cp)) ->
               Predicate.bind (subtype_i_i_i_i_i_o loc theta gamma tau_2 tau_1)
                 (fun xa ->
                   Predicate.bind
                     (check_pat_i_i_i_i_i_i_o_o_o_o i2 theta
                       (Contexts.add_var gamma
                         (xp3, Contexts.GEPair
                                 (bp, SyntaxUtils.subst_x_cp cp zp
(SyntaxVCT.V_var xp3))))
                       (SyntaxPED.Pp_tup (loc, patp_list))
                       (SyntaxVCT.T_refined_type (zp, bp, cp))
                       (SyntaxVCT.V_var xp3))
                     (fun (klist, (xlist, (i3, ok1))) ->
                       Predicate.bind
                         (UnifyType.eq_o_i (Contexts.mk_ctor_v id xlist))
                         (fun _ ->
                           Predicate.single
                             ((xp3, (bp, SyntaxUtils.subst_x_cp cp zp
   (SyntaxVCT.V_var xp3))) ::
                                klist,
                               (xp3 :: xlist, (i3, join ok1 xa))))))))))))
                          | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_vector_concat (_, _),
  _))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (SyntaxPED.Pp_string_append (_, _),
  _))))
                            -> Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind
                        (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                        (fun a ->
                          (match a
                            with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_as_var (_, _, _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_as_typ (_, _, _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_app (_, _, []), _)))) ->
                              Predicate.bot_pred
                            | (i1a, (theta,
                                      (gamma,
(SyntaxPED.Pp_app (loca, ida, [patpa]), (tau_2a, _)))))
                              -> Predicate.bind
                                   (UnifyType.eq_o_i
                                     (ContextsPiDelta.lookup_constr_union_type
                                       theta ida))
                                   (fun aa ->
                                     (match aa with None -> Predicate.bot_pred
                                       | Some (tau_1a, tau_ina) ->
 Predicate.bind (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1a))
   (fun (i2a, xp3a) ->
     Predicate.bind (UnifyType.eq_o_i xp3a)
       (fun _ ->
         Predicate.bind
           (UnifyType.unify_b_i_i_o (UnifyType.b_of tau_1a)
             (UnifyType.b_of tau_2a))
           (fun ab ->
             (match ab with None -> Predicate.bot_pred
               | Some bsuba ->
                 Predicate.bind
                   (UnifyType.eq_o_i (TypingUtils.tsubst_t_many tau_ina bsuba))
                   (fun (SyntaxVCT.T_refined_type (zpa, bpa, cpa)) ->
                     Predicate.bind
                       (UnifyType.eq_o_i
                         (Contexts.GEPair
                           (bpa, SyntaxUtils.subst_x_cp cpa zpa
                                   (SyntaxVCT.V_var xp3a))))
                       (fun _ ->
                         Predicate.bind
                           (subtype_i_i_i_i_i_o loca theta gamma tau_2a tau_1a)
                           (fun xa ->
                             Predicate.bind
                               (check_pat_i_i_i_i_i_i_o_o_o_o i2a theta
                                 (Contexts.add_var gamma
                                   (xp3a,
                                     Contexts.GEPair
                                       (bpa,
 SyntaxUtils.subst_x_cp cpa zpa (SyntaxVCT.V_var xp3a))))
                                 patpa
                                 (SyntaxVCT.T_refined_type (zpa, bpa, cpa))
                                 (SyntaxVCT.V_var xp3a))
                               (fun (klista, (xlista, (i3a, ok1a))) ->
                                 Predicate.bind
                                   (UnifyType.eq_o_i
                                     (Contexts.mk_ctor_v ida xlista))
                                   (fun _ ->
                                     Predicate.single
                                       ((xp3a,
  (bpa, SyntaxUtils.subst_x_cp cpa zpa (SyntaxVCT.V_var xp3a))) ::
  klista,
 (xp3a :: xlista, (i3a, join ok1a xa))))))))))))))
                            | (_, (_, (_,
(SyntaxPED.Pp_app (_, _, _ :: _ :: _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_,
(SyntaxPED.Pp_vector_concat (_, _), _))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_, (SyntaxPED.Pp_cons (_, _, _), _)))) ->
                              Predicate.bot_pred
                            | (_, (_, (_,
(SyntaxPED.Pp_string_append (_, _), _))))
                              -> Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind
                          (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                          (fun a ->
                            (match a
                              with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                                Predicate.bot_pred
                              | (_, (_, (_,
  (SyntaxPED.Pp_as_var (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                                Predicate.bot_pred
                              | (_, (_, (_,
  (SyntaxPED.Pp_as_typ (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (SyntaxPED.Pp_vector_concat (_, _), _))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                                Predicate.bot_pred
                              | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _)))) ->
                                Predicate.bot_pred
                              | (i, (_, (_,
  (SyntaxPED.Pp_cons (loc, _, _), (_, _)))))
                                -> Predicate.single
                                     ([], ([],
    (i, Error (CheckFail ("Pp_cons not impl", loc)))))
                              | (_, (_, (_,
  (SyntaxPED.Pp_string_append (_, _), _))))
                                -> Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind
                            (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                            (fun a ->
                              (match a
                                with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_var (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_vector_concat (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (i, (_,
(_, (SyntaxPED.Pp_list (loc, _), (_, _)))))
                                  -> Predicate.single
                                       ([],
 ([], (i, Error (CheckFail ("Pp_list not impl", loc)))))
                                | (_, (_,
(_, (SyntaxPED.Pp_cons (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_string_append (_, _), _))))
                                  -> Predicate.bot_pred)))
                          (Predicate.bind
                            (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
                            (fun a ->
                              (match a
                                with (_, (_, (_, (SyntaxPED.Pp_lit (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_wild _, _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_var (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_id (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_as_typ (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_app (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_vector (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_vector_concat (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_tup (_, _), _)))) ->
                                  Predicate.bot_pred
                                | (_, (_, (_, (SyntaxPED.Pp_list (_, _), _))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (SyntaxPED.Pp_cons (_, _, _), _))))
                                  -> Predicate.bot_pred
                                | (i, (_,
(_, (SyntaxPED.Pp_string_append (loc, _), (_, _)))))
                                  -> Predicate.single
                                       ([],
 ([], (i, Error (CheckFail ("Pp_string_append not impl", loc))))))))))))))))))
and check_pat_list_i_i_i_i_i_o_i_o_o
  x xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (i, (_, (_, ([], ([], []))))) ->
              Predicate.single (TypingUtils.k_list [], (i, OK ()))
            | (_, (_, (_, ([], ([], _ :: _))))) -> Predicate.bot_pred
            | (_, (_, (_, ([], (_ :: _, _))))) -> Predicate.bot_pred
            | (_, (_, (_, (_ :: _, _)))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (x, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, ([], _)))) -> Predicate.bot_pred
            | (_, (_, (_, (_ :: _, ([], _))))) -> Predicate.bot_pred
            | (_, (_, (_, (_ :: _, (_ :: _, []))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (gamma,
                       (patp :: patp_list, (bp :: bp_list, vp :: vp_list)))))
              -> Predicate.bind
                   (check_pat_i_i_i_i_i_i_o_o_o_o i1 theta gamma patp
                     (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, bp, SyntaxVCT.C_true))
                     vp)
                   (fun (klist, (_, (i2, ok1))) ->
                     Predicate.bind
                       (check_pat_list_i_i_i_i_i_o_i_o_o i2 theta
                         (TypingUtils.g_cons3 gamma [klist]) patp_list bp_list
                         vp_list)
                       (fun (klist2, (i3, ok2)) ->
                         Predicate.single
                           (TypingUtils.k_append [klist; klist2],
                             (i3, join ok1 ok2)))))));;

let rec tsubst_bp_many
  b x1 = match b, x1 with b, [] -> b
    | ba, (bv, b) :: bsub -> SyntaxPED.tsubst_bp b bv (tsubst_bp_many ba bsub);;

let rec match_arg_i_i_i_i_i_i_i_o_o_o
  x xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, xf)))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, (_, [])))))) -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (_, SyntaxVCT.A_monotype _ :: _)))))) ->
              Predicate.bot_pred
            | (loc, (theta,
                      (gamma,
                        (zp2, (bp2, (cp2, SyntaxVCT.A_function
    (xp1, bp1, cp1, SyntaxVCT.T_refined_type (zp3, bp3, cp3)) ::
    _))))))
              -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                   (fun aa ->
                     (match aa with None -> Predicate.bot_pred
                       | Some bsub ->
                         Predicate.bind
                           (subtype_i_i_i_i_i_o loc theta gamma
                             (SyntaxVCT.T_refined_type
                               (zp2, tsubst_bp_many bp2 bsub, cp2))
                             (SyntaxVCT.T_refined_type
                               (xp1, tsubst_bp_many bp1 bsub, cp1)))
                           (fun xg ->
                             Predicate.single
                               (SyntaxVCT.A_function
                                  (xp1, bp1, cp1,
                                    SyntaxVCT.T_refined_type (zp3, bp3, cp3)),
                                 (bsub, xg))))))))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, xf)))))))
          (fun a ->
            (match a with (_, (_, (_, (_, (_, (_, [])))))) -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (_, SyntaxVCT.A_monotype _ :: _)))))) ->
                Predicate.bot_pred
              | (loc, (_, (_, (_, (bp2, (_,
  SyntaxVCT.A_function
    (xp1, bp1, cp1, SyntaxVCT.T_refined_type (zp3, bp3, cp3)) ::
    _))))))
                -> Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                     (fun aa ->
                       (match aa
                         with None ->
                           Predicate.single
                             (SyntaxVCT.A_function
                                (xp1, bp1, cp1,
                                  SyntaxVCT.T_refined_type (zp3, bp3, cp3)),
                               ([], Error (CheckFail ("match_arg", loc))))
                         | Some _ -> Predicate.bot_pred)))))
        (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, xf)))))))
          (fun a ->
            (match a with (_, (_, (_, (_, (_, (_, [])))))) -> Predicate.bot_pred
              | (loc, (theta, (gamma, (zp2, (bp2, (cp2, _ :: ap_list)))))) ->
                Predicate.bind
                  (match_arg_i_i_i_i_i_i_i_o_o_o loc theta gamma zp2 bp2 cp2
                    ap_list)
                  (fun aa ->
                    (match aa
                      with (SyntaxVCT.A_monotype _, _) -> Predicate.bot_pred
                      | (SyntaxVCT.A_function
                           (xp1, bp1, cp1,
                             SyntaxVCT.T_refined_type (zp3, bp3, cp3)),
                          (bsub, ok))
                        -> Predicate.single
                             (SyntaxVCT.A_function
                                (xp1, bp1, cp1,
                                  SyntaxVCT.T_refined_type (zp3, bp3, cp3)),
                               (bsub, ok))))))));;

let rec equal_err
  (CheckFail (x1, x2)) (CheckFail (y1, y2)) =
    ((x1 : string) = y1) && Location.equal_loc x2 y2;;

let rec equal_either_error _A
  x0 x1 = match x0, x1 with OK x1, Error x2 -> false
    | Error x2, OK x1 -> false
    | Error x2, Error y2 -> equal_err x2 y2
    | OK x1, OK y1 -> HOL.eq _A x1 y1;;

let rec infer_v_i_i_i_o_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, SyntaxVCT.V_lit _)) -> Predicate.bot_pred
            | (_, (gamma, SyntaxVCT.V_var xp)) ->
              Predicate.bind (UnifyType.eq_o_i (Contexts.lookup_var gamma xp))
                (fun aa ->
                  (match aa with None -> Predicate.bot_pred
                    | Some (Contexts.GEPair (bp, cp)) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, bp,
                             SyntaxUtils.subst_x_cp cp xp
                               (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                          OK ())
                    | Some (Contexts.GETyp _) -> Predicate.bot_pred))
            | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
            | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, SyntaxVCT.V_lit _)) -> Predicate.bot_pred
              | (_, (gamma, SyntaxVCT.V_var xp)) ->
                Predicate.bind
                  (UnifyType.eq_i_i (Option.equal_option Contexts.equal_g_entry)
                    None (Contexts.lookup_var gamma xp))
                  (fun () ->
                    Predicate.single
                      (bot_t,
                        Error (CheckFail
                                ("lookup failed: " ^ s_of xp,
                                  Location.Loc_unknown))))
              | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
              | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xa, xb)))
            (fun a ->
              (match a
                with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                         SyntaxVCT.C_eq
                           (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                             SyntaxVCT.CE_val
                               (SyntaxVCT.V_lit SyntaxVCT.L_true))),
                      OK ())
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                  Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xa, xb)))
              (fun a ->
                (match a
                  with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                    Predicate.single
                      (SyntaxVCT.T_refined_type
                         (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                           SyntaxVCT.C_eq
                             (SyntaxVCT.CE_val
                                (SyntaxVCT.V_var SyntaxVCT.VIndex),
                               SyntaxVCT.CE_val
                                 (SyntaxVCT.V_lit SyntaxVCT.L_false))),
                        OK ())
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                    Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                  | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xa, xb)))
                (fun a ->
                  (match a
                    with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num num))) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, SyntaxVCT.B_int,
                             SyntaxVCT.C_eq
                               (SyntaxVCT.CE_val
                                  (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                 SyntaxVCT.CE_val
                                   (SyntaxVCT.V_lit (SyntaxVCT.L_num num)))),
                          OK ())
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                      Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_constr (_, _))) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                    | (_, (_, SyntaxVCT.V_proj (_, _))) -> Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (x, (xa, xb)))
                  (fun a ->
                    (match a
                      with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                        Predicate.single
                          (SyntaxVCT.T_refined_type
                             (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                               SyntaxVCT.C_eq
                                 (SyntaxVCT.CE_val
                                    (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                   SyntaxVCT.CE_val
                                     (SyntaxVCT.V_lit SyntaxVCT.L_one))),
                            OK ())
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_cons (_, _))) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                        Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                      | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind (Predicate.single (x, (xa, xb)))
                    (fun a ->
                      (match a
                        with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                          Predicate.single
                            (SyntaxVCT.T_refined_type
                               (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                                 SyntaxVCT.C_eq
                                   (SyntaxVCT.CE_val
                                      (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                     SyntaxVCT.CE_val
                                       (SyntaxVCT.V_lit SyntaxVCT.L_zero))),
                              OK ())
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                          Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                        | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                          Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind (Predicate.single (x, (xa, xb)))
                      (fun a ->
                        (match a
                          with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                 (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                   SyntaxVCT.C_eq
                                     (SyntaxVCT.CE_val
(SyntaxVCT.V_var SyntaxVCT.VIndex),
                                       SyntaxVCT.CE_val
 (SyntaxVCT.V_lit SyntaxVCT.L_unit))),
                                OK ())
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                            Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_record _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_tuple _)) -> Predicate.bot_pred
                          | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                            Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind (Predicate.single (x, (xa, xb)))
                        (fun a ->
                          (match a
                            with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _)))
                              -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _)))
                              -> Predicate.single
                                   (SyntaxVCT.T_refined_type
                                      (SyntaxVCT.VIndex, SyntaxVCT.B_string,
SyntaxVCT.C_true),
                                     OK ())
                            | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_var _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_vec _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_list _)) -> Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_record _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_tuple _)) ->
                              Predicate.bot_pred
                            | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                              Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind (Predicate.single (x, (xa, xb)))
                          (fun a ->
                            (match a
                              with (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_unit)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_zero)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_one)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_true)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_false)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_num _))) ->
                                Predicate.bot_pred
                              | (theta,
                                  (_, SyntaxVCT.V_lit
(SyntaxVCT.L_bitvec b_list)))
                                -> Predicate.bind
                                     (UnifyType.eq_o_i
                                       (Arith.integer_of_nat
 (Lista.size_list b_list)))
                                     (fun xc ->
                                       Predicate.bind
 (UnifyType.eq_o_i (ContextsPiDelta.theta_d theta))
 (fun aa ->
   (match aa with None -> Predicate.bot_pred
     | Some order ->
       Predicate.single
         (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, SyntaxVCT.B_bit),
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_uop
                   (SyntaxVCT.Len,
                     SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                  SyntaxVCT.CE_val (SyntaxVCT.V_lit (SyntaxVCT.L_num xc)))),
           OK ()))))
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_string _)))
                                -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit SyntaxVCT.L_undef)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_lit (SyntaxVCT.L_real _)))
                                -> Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_var _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_vec _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_list _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_record _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_tuple _)) ->
                                Predicate.bot_pred
                              | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind (Predicate.single (x, (xa, xb)))
                            (fun a ->
                              (match a
                                with (_, (_, SyntaxVCT.V_lit _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_var _)) ->
                                  Predicate.bot_pred
                                | (theta, (gamma, SyntaxVCT.V_vec vm_list)) ->
                                  Predicate.bind
                                    (UnifyType.eq_o_i
                                      (ContextsPiDelta.theta_d theta))
                                    (fun aa ->
                                      (match aa with None -> Predicate.bot_pred
| Some order ->
  Predicate.bind
    (infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o theta gamma
      vm_list)
    (fun (_, (bp_list, (_, ok))) ->
      Predicate.bind
        (UnifyType.eq_o_i (Arith.integer_of_nat (Lista.size_list bp_list)))
        (fun xc ->
          Predicate.bind (UnifyType.eq_o_i (Contexts.single_base bp_list))
            (fun ab ->
              (match ab with None -> Predicate.bot_pred
                | Some bm ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bm),
                         SyntaxVCT.C_eq
                           (SyntaxVCT.CE_uop
                              (SyntaxVCT.Len,
                                SyntaxVCT.CE_val
                                  (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                             SyntaxVCT.CE_val
                               (SyntaxVCT.V_lit (SyntaxVCT.L_num xc)))),
                      ok)))))))
                                | (_, (_, SyntaxVCT.V_list _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_record _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_tuple _)) ->
                                  Predicate.bot_pred
                                | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                  Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind (Predicate.single (x, (xa, xb)))
                              (fun a ->
                                (match a
                                  with (_, (_, SyntaxVCT.V_lit _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_var _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_vec _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_list _)) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, SyntaxVCT.V_record _)) ->
                                    Predicate.bot_pred
                                  | (theta, (gamma, SyntaxVCT.V_tuple vp_list))
                                    -> Predicate.bind
 (infer_v_T_G_vp_list_tp_list_i_i_i_o_o theta gamma vp_list)
 (fun (tp_list, ok) ->
   Predicate.bind (UnifyType.eq_o_i (Lista.map UnifyType.b_of tp_list))
     (fun xc ->
       Predicate.single
         (SyntaxVCT.T_refined_type
            (SyntaxVCT.VIndex, SyntaxVCT.B_tuple xc,
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                  SyntaxVCT.CE_val (SyntaxVCT.V_tuple vp_list))),
           ok)))
                                  | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                    Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind (Predicate.single (x, (xa, xb)))
                                (fun a ->
                                  (match a
                                    with (_, (_, SyntaxVCT.V_lit _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_var _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_vec _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_list _)) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, SyntaxVCT.V_cons (vp1, vp2)))
                                      -> Predicate.bind
   (infer_v_i_i_i_o_o theta gamma vp1)
   (fun (SyntaxVCT.T_refined_type (zp, bp, _), ok1) ->
     Predicate.bind (infer_v_i_i_i_o_o theta gamma vp2)
       (fun aa ->
         (match aa
           with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (zpa, SyntaxVCT.B_list bpa, _), ok2) ->
             (if SyntaxVCT.equal_bpa bp bpa && SyntaxVCT.equal_xpa zp zpa
               then Predicate.single
                      (SyntaxVCT.T_refined_type
                         (SyntaxVCT.VIndex, SyntaxVCT.B_list bp,
                           SyntaxVCT.C_eq
                             (SyntaxVCT.CE_val
                                (SyntaxVCT.V_var SyntaxVCT.VIndex),
                               SyntaxVCT.CE_val (SyntaxVCT.V_cons (vp1, vp2)))),
                        join ok1 ok2)
               else Predicate.bot_pred)
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _), _) ->
             Predicate.bot_pred)))
                                    | (_, (_, SyntaxVCT.V_constr (_, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_record _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_tuple _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                      Predicate.bot_pred)))
                              (Predicate.bind (Predicate.single (x, (xa, xb)))
                                (fun a ->
                                  (match a
                                    with (_, (_, SyntaxVCT.V_lit _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_var _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_vec _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_list _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_cons (_, _))) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, SyntaxVCT.V_constr (ctor, vp)))
                                      -> Predicate.bind
   (UnifyType.eq_o_i (TypingUtils.lookup_ctor_base theta ctor))
   (fun aa ->
     (match aa with None -> Predicate.bot_pred
       | Some (SyntaxVCT.T_refined_type (zp, bp2, cp2), bp) ->
         Predicate.bind (infer_v_i_i_i_o_o theta gamma vp)
           (fun (SyntaxVCT.T_refined_type (zpa, bp1, cp1), ok1) ->
             (if SyntaxVCT.equal_xpa zp zpa
               then Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                      (fun ab ->
                        (match ab with None -> Predicate.bot_pred
                          | Some bsub ->
                            Predicate.bind
                              (subtype_i_i_i_i_i_o Location.Loc_unknown theta
                                gamma
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp1 bsub,
                                    cp1))
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp2 bsub,
                                    cp2)))
                              (fun xc ->
                                Predicate.single
                                  (SyntaxVCT.T_refined_type
                                     (zp, TypingUtils.tsubst_bp_many bp bsub,
                                       SyntaxVCT.C_eq
 (SyntaxVCT.CE_val (SyntaxVCT.V_var zp),
   SyntaxVCT.CE_val (SyntaxVCT.V_constr (ctor, vp)))),
                                    join ok1 xc))))
               else Predicate.bot_pred))))
                                    | (_, (_, SyntaxVCT.V_record _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_tuple _)) ->
                                      Predicate.bot_pred
                                    | (_, (_, SyntaxVCT.V_proj (_, _))) ->
                                      Predicate.bot_pred)))))))))))))))
and infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.single ([], ([], ([], OK ())))
            | (_, (_, _ :: _)) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: vp_list)) ->
                Predicate.bind (infer_v_i_i_i_o_i theta gamma vp (OK ()))
                  (fun (SyntaxVCT.T_refined_type (zp, bp, cp)) ->
                    Predicate.bind
                      (infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o
                        theta gamma vp_list)
                      (fun (zp_list, (bp_list, (cp_list, ok))) ->
                        Predicate.single
                          (zp :: zp_list,
                            (bp :: bp_list, (cp :: cp_list, ok))))))))
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: _)) ->
                Predicate.bind (infer_v_i_i_i_o_o theta gamma vp)
                  (fun aa ->
                    (match aa
                      with (SyntaxVCT.T_refined_type (_, _, _), OK _) ->
                        Predicate.bot_pred
                      | (SyntaxVCT.T_refined_type (_, _, _), Error sa) ->
                        Predicate.single ([], ([], ([], Error sa)))))))))
and infer_v_i_i_i_o_i
  x xa xb xc =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
        (fun a ->
          (match a with (_, (_, (SyntaxVCT.V_lit _, _))) -> Predicate.bot_pred
            | (_, (gamma, (SyntaxVCT.V_var xp, OK ()))) ->
              Predicate.bind (UnifyType.eq_o_i (Contexts.lookup_var gamma xp))
                (fun aa ->
                  (match aa with None -> Predicate.bot_pred
                    | Some (Contexts.GEPair (bp, cp)) ->
                      Predicate.single
                        (SyntaxVCT.T_refined_type
                          (SyntaxVCT.VIndex, bp,
                            SyntaxUtils.subst_x_cp cp xp
                              (SyntaxVCT.V_var SyntaxVCT.VIndex)))
                    | Some (Contexts.GETyp _) -> Predicate.bot_pred))
            | (_, (_, (SyntaxVCT.V_var _, Error _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_constr (_, _), _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
            | (_, (_, (SyntaxVCT.V_proj (_, _), _))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
          (fun a ->
            (match a with (_, (_, (SyntaxVCT.V_lit _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_var _, OK _))) -> Predicate.bot_pred
              | (_, (gamma,
                      (SyntaxVCT.V_var xp,
                        Error (CheckFail (xd, Location.Loc_unknown)))))
                -> Predicate.bind
                     (UnifyType.eq_i_i
                       (Option.equal_option Contexts.equal_g_entry) None
                       (Contexts.lookup_var gamma xp))
                     (fun () ->
                       (if ((xd : string) = ("lookup failed: " ^ s_of xp))
                         then Predicate.single bot_t else Predicate.bot_pred))
              | (_, (_, (SyntaxVCT.V_var _,
                          Error (CheckFail (_, Location.Loc_range (_, _))))))
                -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_constr (_, _), _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
              | (_, (_, (SyntaxVCT.V_proj (_, _), _))) -> Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
            (fun a ->
              (match a
                with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, OK ()))) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                      (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                        SyntaxVCT.C_eq
                          (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                            SyntaxVCT.CE_val
                              (SyntaxVCT.V_lit SyntaxVCT.L_true))))
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, Error _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                  Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_constr (_, _), _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
              (fun a ->
                (match a
                  with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, OK ()))) ->
                    Predicate.single
                      (SyntaxVCT.T_refined_type
                        (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                          SyntaxVCT.C_eq
                            (SyntaxVCT.CE_val
                               (SyntaxVCT.V_var SyntaxVCT.VIndex),
                              SyntaxVCT.CE_val
                                (SyntaxVCT.V_lit SyntaxVCT.L_false))))
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, Error _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_cons (_, _), _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                    Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                  | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                (fun a ->
                  (match a
                    with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num num), OK ())))
                      -> Predicate.single
                           (SyntaxVCT.T_refined_type
                             (SyntaxVCT.VIndex, SyntaxVCT.B_int,
                               SyntaxVCT.C_eq
                                 (SyntaxVCT.CE_val
                                    (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                   SyntaxVCT.CE_val
                                     (SyntaxVCT.V_lit (SyntaxVCT.L_num num)))))
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), Error _)))
                      -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                      Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_record _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                    | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                  (fun a ->
                    (match a
                      with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, OK ()))) ->
                        Predicate.single
                          (SyntaxVCT.T_refined_type
                            (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                              SyntaxVCT.C_eq
                                (SyntaxVCT.CE_val
                                   (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                  SyntaxVCT.CE_val
                                    (SyntaxVCT.V_lit SyntaxVCT.L_one))))
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, Error _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_list _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_record _, _))) ->
                        Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_tuple _, _))) -> Predicate.bot_pred
                      | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                    (fun a ->
                      (match a
                        with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, OK ()))) ->
                          Predicate.single
                            (SyntaxVCT.T_refined_type
                              (SyntaxVCT.VIndex, SyntaxVCT.B_bit,
                                SyntaxVCT.C_eq
                                  (SyntaxVCT.CE_val
                                     (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                    SyntaxVCT.CE_val
                                      (SyntaxVCT.V_lit SyntaxVCT.L_zero))))
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, Error _)))
                          -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _), _)))
                          -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _), _)))
                          -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_var _, _))) -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_vec _, _))) -> Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_list _, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_record _, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                          Predicate.bot_pred
                        | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                          Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                      (fun a ->
                        (match a
                          with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit,
 OK ())))
                            -> Predicate.single
                                 (SyntaxVCT.T_refined_type
                                   (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                     SyntaxVCT.C_eq
                                       (SyntaxVCT.CE_val
  (SyntaxVCT.V_var SyntaxVCT.VIndex),
 SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_unit))))
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit,
                                      Error _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _),
                                      _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
                                      _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _), _)))
                            -> Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_var _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_list _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_record _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                            Predicate.bot_pred
                          | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                            Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                        (fun a ->
                          (match a
                            with (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_unit, _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _), _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _),
_)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
OK ())))
                              -> Predicate.single
                                   (SyntaxVCT.T_refined_type
                                     (SyntaxVCT.VIndex, SyntaxVCT.B_string,
                                       SyntaxVCT.C_true))
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
Error _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _),
_)))
                              -> Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_var _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_list _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_record _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                              Predicate.bot_pred
                            | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                              Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                          (fun a ->
                            (match a
                              with (_, (_,
 (SyntaxVCT.V_lit SyntaxVCT.L_unit, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_zero, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_one, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_true, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_false, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_num _),
  _)))
                                -> Predicate.bot_pred
                              | (theta,
                                  (_, (SyntaxVCT.V_lit
 (SyntaxVCT.L_bitvec b_list),
OK ())))
                                -> Predicate.bind
                                     (UnifyType.eq_o_i
                                       (Arith.integer_of_nat
 (Lista.size_list b_list)))
                                     (fun xd ->
                                       Predicate.bind
 (UnifyType.eq_o_i (ContextsPiDelta.theta_d theta))
 (fun aa ->
   (match aa with None -> Predicate.bot_pred
     | Some order ->
       Predicate.single
         (SyntaxVCT.T_refined_type
           (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, SyntaxVCT.B_bit),
             SyntaxVCT.C_eq
               (SyntaxVCT.CE_uop
                  (SyntaxVCT.Len,
                    SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                 SyntaxVCT.CE_val (SyntaxVCT.V_lit (SyntaxVCT.L_num xd))))))))
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_bitvec _),
  Error _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_string _),
  _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit SyntaxVCT.L_undef, _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_lit (SyntaxVCT.L_real _),
  _)))
                                -> Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                Predicate.bot_pred
                              | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
                            (fun a ->
                              (match a
                                with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                  Predicate.bot_pred
                                | (theta,
                                    (gamma, (SyntaxVCT.V_vec vm_list, ok)))
                                  -> Predicate.bind
                                       (UnifyType.eq_o_i
 (ContextsPiDelta.theta_d theta))
                                       (fun aa ->
 (match aa with None -> Predicate.bot_pred
   | Some order ->
     Predicate.bind
       (infer_v_T_G_vp_list_xp_list_bp_list_cp_list_i_i_i_o_o_o_o theta gamma
         vm_list)
       (fun (_, (bp_list, (_, oka))) ->
         (if equal_either_error Product_Type.equal_unit ok oka
           then Predicate.bind
                  (UnifyType.eq_o_i
                    (Arith.integer_of_nat (Lista.size_list bp_list)))
                  (fun xd ->
                    Predicate.bind
                      (UnifyType.eq_o_i (Contexts.single_base bp_list))
                      (fun ab ->
                        (match ab with None -> Predicate.bot_pred
                          | Some bm ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bm),
                                  SyntaxVCT.C_eq
                                    (SyntaxVCT.CE_uop
                                       (SyntaxVCT.Len,
 SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                                      SyntaxVCT.CE_val
(SyntaxVCT.V_lit (SyntaxVCT.L_num xd))))))))
           else Predicate.bot_pred))))
                                | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                  Predicate.bot_pred
                                | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                  Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind
                              (Predicate.single (x, (xa, (xb, xc))))
                              (fun a ->
                                (match a
                                  with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_constr (_, _), _))) ->
                                    Predicate.bot_pred
                                  | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                    Predicate.bot_pred
                                  | (theta,
                                      (gamma, (SyntaxVCT.V_tuple vp_list, ok)))
                                    -> Predicate.bind
 (infer_v_T_G_vp_list_tp_list_i_i_i_o_i theta gamma vp_list ok)
 (fun xd ->
   Predicate.bind (UnifyType.eq_o_i (Lista.map UnifyType.b_of xd))
     (fun xe ->
       Predicate.single
         (SyntaxVCT.T_refined_type
           (SyntaxVCT.VIndex, SyntaxVCT.B_tuple xe,
             SyntaxVCT.C_eq
               (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                 SyntaxVCT.CE_val (SyntaxVCT.V_tuple vp_list))))))
                                  | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                    Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind
                                (Predicate.single (x, (xa, (xb, xc))))
                                (fun a ->
                                  (match a
                                    with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, (SyntaxVCT.V_cons (vp1, vp2), xd)))
                                      -> Predicate.bind
   (infer_v_i_i_i_o_o theta gamma vp1)
   (fun (SyntaxVCT.T_refined_type (zp, bp, _), ok1) ->
     Predicate.bind (infer_v_i_i_i_o_o theta gamma vp2)
       (fun aa ->
         (match aa
           with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (zpa, SyntaxVCT.B_list bpa, _), ok2) ->
             (if SyntaxVCT.equal_bpa bp bpa &&
                   (SyntaxVCT.equal_xpa zp zpa &&
                     equal_either_error Product_Type.equal_unit xd
                       (join ok1 ok2))
               then Predicate.single
                      (SyntaxVCT.T_refined_type
                        (SyntaxVCT.VIndex, SyntaxVCT.B_list bp,
                          SyntaxVCT.C_eq
                            (SyntaxVCT.CE_val
                               (SyntaxVCT.V_var SyntaxVCT.VIndex),
                              SyntaxVCT.CE_val (SyntaxVCT.V_cons (vp1, vp2)))))
               else Predicate.bot_pred)
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (_, _), _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _), _) ->
             Predicate.bot_pred
           | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _), _) ->
             Predicate.bot_pred)))
                                    | (_, (_, (SyntaxVCT.V_constr (_, _), _)))
                                      -> Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                      Predicate.bot_pred)))
                              (Predicate.bind
                                (Predicate.single (x, (xa, (xb, xc))))
                                (fun a ->
                                  (match a
                                    with (_, (_, (SyntaxVCT.V_lit _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_var _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_vec _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_list _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_cons (_, _), _))) ->
                                      Predicate.bot_pred
                                    | (theta,
(gamma, (SyntaxVCT.V_constr (ctor, vp), xd)))
                                      -> Predicate.bind
   (UnifyType.eq_o_i (TypingUtils.lookup_ctor_base theta ctor))
   (fun aa ->
     (match aa with None -> Predicate.bot_pred
       | Some (SyntaxVCT.T_refined_type (zp, bp2, cp2), bp) ->
         Predicate.bind (infer_v_i_i_i_o_o theta gamma vp)
           (fun (SyntaxVCT.T_refined_type (zpa, bp1, cp1), ok1) ->
             (if SyntaxVCT.equal_xpa zp zpa
               then Predicate.bind (UnifyType.unify_b_i_i_o bp1 bp2)
                      (fun ab ->
                        (match ab with None -> Predicate.bot_pred
                          | Some bsub ->
                            Predicate.bind
                              (subtype_i_i_i_i_i_o Location.Loc_unknown theta
                                gamma
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp1 bsub,
                                    cp1))
                                (SyntaxVCT.T_refined_type
                                  (zp, TypingUtils.tsubst_bp_many bp2 bsub,
                                    cp2)))
                              (fun xaa ->
                                (if equal_either_error Product_Type.equal_unit
                                      xd (join ok1 xaa)
                                  then Predicate.single
 (SyntaxVCT.T_refined_type
   (zp, TypingUtils.tsubst_bp_many bp bsub,
     SyntaxVCT.C_eq
       (SyntaxVCT.CE_val (SyntaxVCT.V_var zp),
         SyntaxVCT.CE_val (SyntaxVCT.V_constr (ctor, vp)))))
                                  else Predicate.bot_pred))))
               else Predicate.bot_pred))))
                                    | (_, (_, (SyntaxVCT.V_record _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_tuple _, _))) ->
                                      Predicate.bot_pred
                                    | (_, (_, (SyntaxVCT.V_proj (_, _), _))) ->
                                      Predicate.bot_pred)))))))))))))))
and infer_v_T_G_vp_list_tp_list_i_i_i_o_i
  x xa xb xc =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
        (fun a ->
          (match a with (_, (_, ([], OK ()))) -> Predicate.single []
            | (_, (_, ([], Error _))) -> Predicate.bot_pred
            | (_, (_, (_ :: _, _))) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
          (fun a ->
            (match a with (_, (_, ([], _))) -> Predicate.bot_pred
              | (theta, (gamma, (vp :: vp_list, ok))) ->
                Predicate.bind
                  (infer_v_T_G_vp_list_tp_list_i_i_i_o_i theta gamma vp_list ok)
                  (fun xd ->
                    Predicate.bind (infer_v_i_i_i_o_i theta gamma vp (OK ()))
                      (fun xaa -> Predicate.single (xaa :: xd))))))
        (Predicate.bind (Predicate.single (x, (xa, (xb, xc))))
          (fun a ->
            (match a with (_, (_, ([], _))) -> Predicate.bot_pred
              | (_, (_, (_ :: _, OK _))) -> Predicate.bot_pred
              | (theta, (gamma, (vp :: _, Error sa))) ->
                Predicate.bind (infer_v_i_i_i_o_i theta gamma vp (Error sa))
                  (fun _ -> Predicate.single [])))))
and infer_v_T_G_vp_list_tp_list_i_i_i_o_o
  x xa xb =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, xb)))
        (fun a ->
          (match a with (_, (_, [])) -> Predicate.single ([], OK ())
            | (_, (_, _ :: _)) -> Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: vp_list)) ->
                Predicate.bind (infer_v_i_i_i_o_i theta gamma vp (OK ()))
                  (fun xc ->
                    Predicate.bind
                      (infer_v_T_G_vp_list_tp_list_i_i_i_o_o theta gamma
                        vp_list)
                      (fun (tp_list, ok) ->
                        Predicate.single (xc :: tp_list, ok))))))
        (Predicate.bind (Predicate.single (x, (xa, xb)))
          (fun a ->
            (match a with (_, (_, [])) -> Predicate.bot_pred
              | (theta, (gamma, vp :: _)) ->
                Predicate.bind (infer_v_i_i_i_o_o theta gamma vp)
                  (fun aa ->
                    (match aa with (_, OK _) -> Predicate.bot_pred
                      | (_, Error sa) -> Predicate.single ([], Error sa)))))));;

let rec check_e_i_i_i_i_i_i_i_o_o
  xa xb xc xd xe xf xg =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constr (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let2 (_, _, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma, (delta, (SyntaxPED.Ep_return (_, ep), _))))))
              -> Predicate.bind (UnifyType.eq_o_i (Contexts.gamma_e gamma))
                   (fun aa ->
                     (match aa with None -> Predicate.bot_pred
                       | Some tau_1 ->
                         Predicate.bind
                           (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma delta
                             ep tau_1)
                           (fun (i2, ok) -> Predicate.single (i2, ok))))
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
                                    _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind
          (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
          (fun a ->
            (match a
              with (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constr (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _),
                                      _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _),
                                      _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let2 (_, _, _, _, _), _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _, _), _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _)))))) ->
                Predicate.bot_pred
              | (i1, (theta,
                       (phi, (gamma, (delta, (SyntaxPED.Ep_exit (_, ep), _))))))
                -> Predicate.bind
                     (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma delta ep
                       (SyntaxVCT.T_refined_type
                         (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                           SyntaxVCT.C_true)))
                     (fun (i2, ok) -> Predicate.single (i2, ok))
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
                                      _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind
            (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constr (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _),
_))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _),
_))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let2 (_, _, _, _, _),
_))))))
                  -> Predicate.bot_pred
                | (i1, (theta,
                         (phi, (gamma,
                                 (delta,
                                   (SyntaxPED.Ep_if (loc, ep, ep1, ep2),
                                     SyntaxVCT.T_refined_type (zp, bp, cp)))))))
                  -> Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta
                         ep)
                       (fun (SyntaxVCT.T_refined_type (zp3, b, cp1),
                              (vp, (klist, (i2, ok1))))
                         -> Predicate.bind
                              (subtype_i_i_i_i_i_o loc theta
                                (TypingUtils.g_cons3 gamma [klist])
                                (SyntaxVCT.T_refined_type (zp3, b, cp1))
                                (SyntaxVCT.T_refined_type
                                  (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                                    SyntaxVCT.C_true)))
                              (fun x ->
                                Predicate.bind
                                  (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i2))
                                  (fun (i3, xp3) ->
                                    Predicate.bind
                                      (check_e_i_i_i_i_i_i_i_o_o i3 theta phi
(TypingUtils.g_cons3 gamma
  [Lista.concat
     [(xp3, (SyntaxVCT.B_bool,
              SyntaxVCT.C_eq
                (SyntaxVCT.CE_val vp,
                  SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_true)))) ::
        klist]])
delta ep1
(SyntaxVCT.T_refined_type
  (zp, bp,
    SyntaxVCT.C_imp
      (SyntaxVCT.C_eq
         (SyntaxVCT.CE_val vp,
           SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_true)),
        cp))))
                                      (fun (i4, ok3) ->
Predicate.bind
  (check_e_i_i_i_i_i_i_i_o_o i4 theta phi
    (TypingUtils.g_cons3 gamma
      [Lista.concat
         [(xp3, (SyntaxVCT.B_bool,
                  SyntaxVCT.C_eq
                    (SyntaxVCT.CE_val vp,
                      SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_false)))) ::
            klist]])
    delta ep2
    (SyntaxVCT.T_refined_type
      (zp, bp,
        SyntaxVCT.C_imp
          (SyntaxVCT.C_eq
             (SyntaxVCT.CE_val vp,
               SyntaxVCT.CE_val (SyntaxVCT.V_lit SyntaxVCT.L_false)),
            cp))))
  (fun (i5, ok4) -> Predicate.single (i5, join (join ok1 x) (join ok3 ok4)))))))
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _, _), _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
_))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind
              (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constr (_, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_field_access (_, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record_update (_, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (i1, (theta,
                           (phi, (gamma,
                                   (delta,
                                     (SyntaxPED.Ep_let
(_, SyntaxPED.LBp_val (loc, patp, ep1), ep2),
                                       tau))))))
                    -> Predicate.bind
                         (letbind_i_i_i_i_i_i_o_o_o i1 theta phi gamma delta
                           (SyntaxPED.LBp_val (loc, patp, ep1)))
                         (fun (klist, (i2, ok1)) ->
                           Predicate.bind
                             (check_e_i_i_i_i_i_i_i_o_o i2 theta phi
                               (TypingUtils.g_cons3 gamma [klist]) delta ep2
                               tau)
                             (fun (i3, ok2) ->
                               Predicate.single (i3, join ok1 ok2)))
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let2 (_, _, _, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_case (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assign (_, _, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _),
  _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _)))))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind
                (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_bop (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_constr (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_field_access (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_record_update (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_let2 (_, _, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (i1, (theta,
                             (phi, (gamma,
                                     (delta,
                                       (SyntaxPED.Ep_case (_, ep, patp_ep_list),
 t_exp))))))
                      -> Predicate.bind
                           (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma
                             delta ep)
                           (fun (tau, (xp, (klist1, (i2, ok1)))) ->
                             Predicate.bind
                               (check_pexp_list_i_i_i_i_i_i_i_i_i_o_o i2 theta
                                 phi (TypingUtils.g_cons3 gamma [klist1]) delta
                                 patp_ep_list tau t_exp xp)
                               (fun (i3, ok2) ->
                                 Predicate.single (i3, join ok1 ok2)))
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_assign (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_constraint (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_loop (_, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.Ep_assert (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                      -> Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_proj (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_constr (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_field_access (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_cast (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_record (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_record_update (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_let2 (_, _, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_if (_, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_block (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_case (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (phi, (gamma,
                                       (delta,
 (SyntaxPED.Ep_assign (_, lexpp, ep1, ep2),
   SyntaxVCT.T_refined_type (zp, bp, cp)))))))
                        -> Predicate.bind
                             (typing_lexp_i_i_i_i_i_i_i_o_o_o_o i1 theta phi
                               gamma delta lexpp ep1)
                             (fun (deltaa, (klist, (i2, ok1))) ->
                               Predicate.bind
                                 (check_e_i_i_i_i_i_i_i_o_o i2 theta phi
                                   (TypingUtils.g_cons3 gamma [klist]) deltaa
                                   ep2 (SyntaxVCT.T_refined_type (zp, bp, cp)))
                                 (fun (i3, ok2) ->
                                   Predicate.single (i3, join ok1 ok2)))
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_throw (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_constraint (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_assert (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.Ep_cons (_, _, _), _))))))
                        -> Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind
                    (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (_,
   (_, (SyntaxPED.Ep_val (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_concat (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_tuple (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_app (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_constr (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_record (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_let (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_let2 (_, _, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_block (_, []), _))))))
                          -> Predicate.bot_pred
                        | (i1, (theta,
                                 (phi, (gamma,
 (delta, (SyntaxPED.Ep_block (_, [ep]), tau))))))
                          -> Predicate.bind
                               (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma
                                 delta ep tau)
                               (fun (i2, ok) -> Predicate.single (i2, ok))
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_block (_, _ :: _ :: _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_case (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_assign (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_return (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_ref (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_throw (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_try (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_constraint (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_vec (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                          -> Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind
                      (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                      (fun a ->
                        (match a
                          with (_, (_, (_,
 (_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_concat (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_constr (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_record (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_let2 (_, _, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_block (_, []), _))))))
                            -> Predicate.bot_pred
                          | (i1, (theta,
                                   (phi, (gamma,
   (delta, (SyntaxPED.Ep_block (loc, ep :: ep_list), tau))))))
                            -> Predicate.bind
                                 (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma
                                   delta ep
                                   (SyntaxVCT.T_refined_type
                                     (SyntaxVCT.VIndex, SyntaxVCT.B_unit,
                                       SyntaxVCT.C_true)))
                                 (fun (i2, ok1) ->
                                   Predicate.bind
                                     (check_e_i_i_i_i_i_i_i_o_o i2 theta phi
                                       gamma delta
                                       (SyntaxPED.Ep_block (loc, ep_list)) tau)
                                     (fun (i3, ok2) ->
                                       Predicate.single (i3, join ok1 ok2)))
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_case (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_assign (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_return (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_exit (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_ref (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_throw (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_vec (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_list (_, _), _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                            -> Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind
                        (Predicate.single
                          (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                        (fun a ->
                          (match a
                            with (_, (_, (_,
   (_, (_, (SyntaxPED.Ep_val (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_mvar (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_concat (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_tuple (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_app (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_bop (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_uop (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_proj (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_constr (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_field_access (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_sizeof (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_cast (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_record (_, _),
          SyntaxVCT.T_refined_type (SyntaxVCT.VNamed _, _, _)))))))
                              -> Predicate.bot_pred
                            | (i1, (theta,
                                     (phi, (gamma,
     (delta,
       (SyntaxPED.Ep_record (loc, field_e_list),
         SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, b, c)))))))
                              -> Predicate.bind
                                   (UnifyType.eq_o_i
                                     (ContextsPiDelta.lookup_fields theta
                                       (Lista.map Product_Type.fst
 field_e_list)))
                                   (fun aa ->
                                     (match aa with None -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _)) ->
 Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _)) ->
 Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _)) ->
 Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (_, _), _)) ->
 Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (z, SyntaxVCT.B_record fb_list, ca)) ->
 Predicate.bind
   (subtype_i_i_i_i_i_o loc theta gamma
     (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, b, c))
     (SyntaxVCT.T_refined_type (z, SyntaxVCT.B_record fb_list, ca)))
   (fun x ->
     Predicate.bind
       (check_e_list_i_i_i_i_i_i_i_o_o_o i1 theta phi gamma delta
         (Lista.map Product_Type.snd field_e_list)
         (Lista.map
           (fun (_, ba) ->
             SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, ba, SyntaxVCT.C_true))
           fb_list))
       (fun (_, (i2, ok1)) -> Predicate.single (i2, join ok1 x)))
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _)) -> Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _)) ->
 Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _)) ->
 Predicate.bot_pred
                                       |
 Some (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _)) ->
 Predicate.bot_pred))
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_record_update (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_let (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_let2 (_, _, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_if (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_block (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_case (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_assign (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_return (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_exit (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_ref (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_throw (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_try (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_constraint (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_loop (_, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_for (_, _, _, _, _, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_assert (_, _, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_vec (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_list (_, _), _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, (SyntaxPED.Ep_cons (_, _, _), _))))))
                              -> Predicate.bot_pred)))
                      (Predicate.bind
                        (Predicate.single
                          (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                        (fun (i1, (theta, (phi, (gamma, (delta, (ep, tau_2))))))
                          -> Predicate.bind
                               (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma
                                 delta ep)
                               (fun (tau_1, (_, (klist, (i2, ok1)))) ->
                                 Predicate.bind
                                   (subtype_i_i_i_i_i_o (SyntaxPED.loc_e ep)
                                     theta (TypingUtils.g_cons3 gamma [klist])
                                     tau_1 tau_2)
                                   (fun x ->
                                     Predicate.single
                                       (i2, join ok1 x)))))))))))))
and check_e_list_i_i_i_i_i_i_i_o_o_o
  xa xb xc xd xe xf xg =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a
            with (i, (_, (_, (gamma, (_, ([], [])))))) ->
              Predicate.single (gamma, (i, OK ()))
            | (_, (_, (_, (_, (_, ([], _ :: _)))))) -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (_ :: _, _)))))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, ([], _)))))) -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, (_ :: _, [])))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma, (delta, (ep :: ep_list, tau :: tp_list))))))
              -> Predicate.bind
                   (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma delta ep tau)
                   (fun (i2, ok1) ->
                     Predicate.bind
                       (check_e_list_i_i_i_i_i_i_i_o_o_o i2 theta phi gamma
                         delta ep_list tp_list)
                       (fun (gammaa, (i3, ok2)) ->
                         Predicate.single (gammaa, (i3, join ok1 ok2)))))))
and infer_e_i_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (i1, (theta, (_, (gamma, (_, SyntaxPED.Ep_val (_, vp)))))) ->
              Predicate.bind (infer_v_i_i_i_o_o theta gamma vp)
                (fun (SyntaxVCT.T_refined_type (zp, bp, cp), ok) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type (zp, bp, cp),
                      (vp, ([], (i1, ok)))))
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
          (fun a ->
            (match a
              with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                Predicate.bot_pred
              | (i1, (theta, (_, (_, (_, SyntaxPED.Ep_ref (_, idd)))))) ->
                Predicate.bind
                  (UnifyType.eq_o_i
                    (ContextsPiDelta.lookup_register theta
                      (SyntaxVCT.VNamed idd)))
                  (fun aa ->
                    (match aa with None -> Predicate.bot_pred
                      | Some t ->
                        Predicate.bind
                          (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                          (fun (i2, xpa) ->
                            Predicate.single
                              (SyntaxVCT.T_refined_type
                                 (SyntaxVCT.VIndex, SyntaxVCT.B_reg t,
                                   SyntaxVCT.C_true),
                                (SyntaxVCT.V_var xpa,
                                  ([(xpa, (SyntaxVCT.B_reg t,
    SyntaxVCT.C_true))],
                                    (i2, OK ())))))))
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                -> Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                  Predicate.bot_pred
                | (i1, (theta,
                         (phi, (gamma,
                                 (delta, SyntaxPED.Ep_cast (loc, t1, ep))))))
                  -> Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta
                         ep)
                       (fun (t2, (vp, (klist, (i2, ok1)))) ->
                         Predicate.bind
                           (subtype_i_i_i_i_i_o loc theta
                             (TypingUtils.g_cons3 gamma [klist]) t2 t1)
                           (fun x ->
                             Predicate.single
                               (t2, (vp, (klist, (i2, join ok1 x))))))
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_for
(_, _, _, _, _, _, _))))))
                  -> Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                    Predicate.bot_pred
                  | (i1, (_, (_, (_, (delta, SyntaxPED.Ep_mvar (_, up)))))) ->
                    Predicate.bind
                      (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                      (fun (i2, xpa) ->
                        Predicate.bind
                          (UnifyType.eq_o_i
                            (ContextsPiDelta.lookup_mvar delta up))
                          (fun aa ->
                            (match aa with None -> Predicate.bot_pred
                              | Some (SyntaxVCT.T_refined_type (zp, bp, cp)) ->
                                Predicate.single
                                  (SyntaxVCT.T_refined_type (zp, bp, cp),
                                    (SyntaxVCT.V_var xpa,
                                      ([(xpa,
  (bp, SyntaxPED.subst_cp (SyntaxVCT.V_var xpa) zp cp))],
(i2, OK ())))))))
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update
  (_, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_for
  (_, _, _, _, _, _, _))))))
                    -> Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind
                (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
SyntaxPED.Ep_field_access (_, _, _))))))
                      -> Predicate.bot_pred
                    | (i1, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, cep)))))) ->
                      Predicate.bind
                        (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                        (fun (i2, xpa) ->
                          Predicate.single
                            (SyntaxVCT.T_refined_type
                               (SyntaxVCT.VIndex, SyntaxVCT.B_int,
                                 SyntaxVCT.C_eq
                                   (SyntaxVCT.CE_val
                                      (SyntaxVCT.V_var SyntaxVCT.VIndex),
                                     cep)),
                              (SyntaxVCT.V_var xpa,
                                ([(xpa, (SyntaxVCT.B_int,
  SyntaxVCT.C_eq (SyntaxVCT.CE_val (SyntaxVCT.V_var xpa), cep)))],
                                  (i2, OK ())))))
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
SyntaxPED.Ep_record_update (_, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                      Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_field_access (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_record_update (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_assign (_, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                        Predicate.bot_pred
                      | (i1, (_, (_, (_, (_,
   SyntaxPED.Ep_constraint (_, cp))))))
                        -> Predicate.bind
                             (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                             (fun (i2, xpa) ->
                               Predicate.single
                                 (SyntaxVCT.T_refined_type
                                    (SyntaxVCT.VIndex, SyntaxVCT.B_bool, cp),
                                   (SyntaxVCT.V_var xpa,
                                     ([(xpa, (SyntaxVCT.B_bool, cp))],
                                       (i2, OK ())))))
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
                        Predicate.bot_pred)))
                (Predicate.sup_pred
                  (Predicate.bind
                    (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                    (fun a ->
                      (match a
                        with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
                          Predicate.bot_pred
                        | (i1, (theta,
                                 (phi, (gamma,
 (delta, SyntaxPED.Ep_app (loc, fp, ep))))))
                          -> Predicate.bind
                               (UnifyType.eq_o_i
                                 (TypingUtils.lookup_fun_type theta phi fp))
                               (fun aa ->
                                 (match aa with None -> Predicate.bot_pred
                                   | Some ap_list ->
                                     Predicate.bind
                                       (infer_app_i_i_i_i_i_i_i_i_o_o_o_o_o i1
 loc theta phi gamma delta ap_list ep)
                                       (fun (tau_1, (vp1, (klist, (i2, ok)))) ->
 Predicate.single (tau_1, (vp1, (klist, (i2, ok)))))))
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_field_access (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_record_update (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_assign (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_constraint (_, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_loop (_, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_,
(_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                          -> Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                          Predicate.bot_pred
                        | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                          -> Predicate.bot_pred)))
                  (Predicate.sup_pred
                    (Predicate.bind
                      (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                      (fun a ->
                        (match a
                          with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                            -> Predicate.bot_pred
                          | (i, (theta,
                                  (phi, (_,
  (_, SyntaxPED.Ep_app (loc, fp, _))))))
                            -> Predicate.bind
                                 (UnifyType.eq_i_i
                                   (Option.equal_option
                                     (Lista.equal_list SyntaxVCT.equal_ap))
                                   None
                                   (TypingUtils.lookup_fun_type theta phi fp))
                                 (fun () ->
                                   Predicate.single
                                     (SyntaxVCT.T_refined_type
(SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
                                       (SyntaxVCT.V_var SyntaxVCT.VIndex,
 ([], (i, Error (CheckFail ("unknown function: " ^ s_of fp, loc)))))))
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_constr (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_field_access (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_record_update (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_if (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_constraint (_, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_,
  (_, SyntaxPED.Ep_assert (_, _, _))))))
                            -> Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
                            Predicate.bot_pred
                          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                            -> Predicate.bot_pred)))
                    (Predicate.sup_pred
                      (Predicate.bind
                        (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                        (fun a ->
                          (match a
                            with (_, (_, (_,
   (_, (_, SyntaxPED.Ep_val (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_concat (_, _))))))
                              -> Predicate.bot_pred
                            | (i1, (theta,
                                     (phi, (gamma,
     (delta, SyntaxPED.Ep_tuple (_, ep_list))))))
                              -> Predicate.bind
                                   (UnifyType.eq_o_i
                                     (TypingUtils.mk_fresh_i i1))
                                   (fun (i2, xpa) ->
                                     Predicate.bind
                                       (infer_e_list_i_i_i_i_i_i_o_o_o_o_o i2
 theta phi gamma delta ep_list)
                                       (fun
 (tp_list, (xp_lista, (klist, (i3, ok)))) ->
 Predicate.bind (UnifyType.eq_o_i (Lista.map UnifyType.b_of tp_list))
   (fun x ->
     Predicate.single
       (SyntaxVCT.T_refined_type
          (SyntaxVCT.VIndex, SyntaxVCT.B_tuple x,
            SyntaxVCT.C_eq
              (SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex),
                SyntaxVCT.CE_val (SyntaxVCT.V_tuple xp_lista))),
         (SyntaxVCT.V_var xpa,
           ((xpa, (SyntaxVCT.B_tuple x,
                    SyntaxVCT.C_eq
                      (SyntaxVCT.CE_val (SyntaxVCT.V_var xpa),
                        SyntaxVCT.CE_val (SyntaxVCT.V_tuple xp_lista)))) ::
              klist,
             (i3, ok)))))))
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_app (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_record (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_let (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_case (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_return (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_try (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_constraint (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                              -> Predicate.bot_pred
                            | (_, (_, (_,
(_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                              -> Predicate.bot_pred)))
                      (Predicate.sup_pred
                        (Predicate.bind
                          (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                          (fun a ->
                            (match a
                              with (_, (_,
 (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                -> Predicate.bot_pred
                              | (i1, (theta,
                                       (phi,
 (gamma, (delta, SyntaxPED.Ep_concat (_, ep_list))))))
                                -> Predicate.bind
                                     (infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o
                                       i1 theta phi gamma delta ep_list)
                                     (fun (_,
    (order, (bp, (_, (xp_lista, (klist_list, (i2, ok)))))))
                                       -> Predicate.bind
    (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i2))
    (fun (i3, xpa) ->
      Predicate.single
        (SyntaxVCT.T_refined_type
           (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bp),
             SyntaxVCT.C_eq
               (SyntaxVCT.CE_uop
                  (SyntaxVCT.Len,
                    SyntaxVCT.CE_val (SyntaxVCT.V_var SyntaxVCT.VIndex)),
                 SyntaxVCT.CE_many_plus
                   (Lista.map (fun aa -> SyntaxVCT.CE_val aa) xp_lista))),
          (SyntaxVCT.V_var xpa,
            ((xpa, (SyntaxVCT.B_vec (order, bp),
                     SyntaxVCT.C_eq
                       (SyntaxVCT.CE_uop
                          (SyntaxVCT.Len,
                            SyntaxVCT.CE_val (SyntaxVCT.V_var xpa)),
                         SyntaxVCT.CE_many_plus
                           (Lista.map (fun aa -> SyntaxVCT.CE_val aa)
                             xp_lista)))) ::
               TypingUtils.k_append klist_list,
              (i3, ok))))))
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_record (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_block (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_return (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_list (_, _))))))
                                -> Predicate.bot_pred
                              | (_, (_, (_,
  (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                -> Predicate.bot_pred)))
                        (Predicate.sup_pred
                          (Predicate.bind
                            (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
                            (fun a ->
                              (match a
                                with (_, (_,
   (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (i1, (theta,
 (phi, (gamma, (delta, SyntaxPED.Ep_field_access (loc, ep, field))))))
                                  -> Predicate.bind
                                       (UnifyType.eq_o_i
 (ContextsPiDelta.lookup_field_record_type theta field))
                                       (fun aa ->
 (match aa with None -> Predicate.bot_pred
   | Some (bp, tau_1) ->
     Predicate.bind (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
       (fun (tau_2, (vp1, (klist, (i2, ok1)))) ->
         Predicate.bind
           (subtype_i_i_i_i_i_o loc theta (TypingUtils.g_cons3 gamma [klist])
             tau_2 tau_1)
           (fun x ->
             Predicate.bind (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i2))
               (fun (i3, xp2) ->
                 Predicate.single
                   (SyntaxVCT.T_refined_type
                      (SyntaxVCT.VIndex, bp,
                        SyntaxVCT.C_eq
                          (SyntaxVCT.CE_field_access (vp1, field),
                            SyntaxVCT.CE_val
                              (SyntaxVCT.V_var SyntaxVCT.VIndex))),
                     (SyntaxVCT.V_var xp2,
                       ((xp2, (bp, SyntaxVCT.C_eq
                                     (SyntaxVCT.CE_field_access (vp1, field),
                                       SyntaxVCT.CE_val
 (SyntaxVCT.V_var xp2)))) ::
                          klist,
                         (i3, join ok1 x)))))))))
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                                  -> Predicate.bot_pred
                                | (_, (_,
(_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                  -> Predicate.bot_pred)))
                          (Predicate.sup_pred
                            (Predicate.bind
                              (Predicate.single
                                (xa, (xb, (xc, (xd, (xe, xf))))))
                              (fun a ->
                                (match a
                                  with (_,
 (_, (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                    -> Predicate.bot_pred
                                  | (i1, (theta,
   (phi, (gamma, (delta, SyntaxPED.Ep_loop (_, _, ep1, ep2))))))
                                    -> Predicate.bind
 (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
 (fun (i2, xpa) ->
   Predicate.bind (infer_e_i_i_i_i_i_i_o_o_o_o_o i2 theta phi gamma delta ep1)
     (fun aa ->
       (match aa
         with (SyntaxVCT.T_refined_type (SyntaxVCT.VNamed _, _, _), _) ->
           Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_var _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_tid _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_int, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_bool, _),
             (_, (klist1, (i3, ok1))))
           -> Predicate.bind
                (check_e_i_i_i_i_i_i_i_o_o i3 theta phi
                  (TypingUtils.g_cons3 gamma [klist1]) delta ep2
                  (SyntaxVCT.T_refined_type
                    (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_true)))
                (fun (i4, ok2) ->
                  Predicate.single
                    (SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_true),
                      (SyntaxVCT.V_var xpa,
                        ([(xpa, (SyntaxVCT.B_unit, SyntaxVCT.C_true))],
                          (i4, join ok1 ok2)))))
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_bit, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_unit, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_real, _), _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_vec (_, _), _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_list _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_tuple _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_union (_, _), _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_record _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_undef, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_reg _, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type (SyntaxVCT.VIndex, SyntaxVCT.B_string, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_exception, _),
             _)
           -> Predicate.bot_pred
         | (SyntaxVCT.T_refined_type
              (SyntaxVCT.VIndex, SyntaxVCT.B_finite_set _, _),
             _)
           -> Predicate.bot_pred)))
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                                    -> Predicate.bot_pred
                                  | (_, (_,
  (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                    -> Predicate.bot_pred)))
                            (Predicate.sup_pred
                              (Predicate.bind
                                (Predicate.single
                                  (xa, (xb, (xc, (xd, (xe, xf))))))
                                (fun a ->
                                  (match a
                                    with (_,
   (_, (_, (_, (_, SyntaxPED.Ep_val (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_concat (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_record (_, _))))))
                                      -> Predicate.bot_pred
                                    | (i1,
(theta,
  (phi, (gamma, (delta, SyntaxPED.Ep_record_update (_, e, field_e_list))))))
                                      -> Predicate.bind
   (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta e)
   (fun (SyntaxVCT.T_refined_type (z, b, c), (_, (klist, (i2, ok1)))) ->
     Predicate.bind
       (UnifyType.eq_o_i
         (ContextsPiDelta.lookup_types_for b
           (Lista.map Product_Type.fst field_e_list)))
       (fun aa ->
         (match aa with None -> Predicate.bot_pred
           | Some b_list ->
             Predicate.bind
               (check_e_list_i_i_i_i_i_i_i_o_o_o i2 theta phi
                 (TypingUtils.g_cons3 gamma [klist]) delta
                 (Lista.map Product_Type.snd field_e_list)
                 (Lista.map
                   (fun ba ->
                     SyntaxVCT.T_refined_type
                       (SyntaxVCT.VIndex, ba, SyntaxVCT.C_true))
                   b_list))
               (fun (_, (i3, ok2)) ->
                 Predicate.bind (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i3))
                   (fun (i4, x) ->
                     Predicate.single
                       (SyntaxVCT.T_refined_type (z, b, c),
                         (SyntaxVCT.V_var x,
                           ((x, (b, SyntaxPED.subst_cp (SyntaxVCT.V_var x) z
                                      c)) ::
                              klist,
                             (i4, join ok1 ok2)))))))))
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_block (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_return (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_exit (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_ref (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_throw (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_vec (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_list (_, _))))))
                                      -> Predicate.bot_pred
                                    | (_,
(_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _))))))
                                      -> Predicate.bot_pred)))
                              (Predicate.sup_pred
                                (Predicate.bind
                                  (Predicate.single
                                    (xa, (xb, (xc, (xd, (xe, xf))))))
                                  (fun a ->
                                    (match a
                                      with
(_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) -> Predicate.bot_pred
                                      |
(i1, (theta, (_, (_, (_, SyntaxPED.Ep_vec (_, e_list)))))) ->
Predicate.bind
  (UnifyType.eq_o_i (Arith.integer_of_nat (Lista.size_list e_list)))
  (fun x ->
    Predicate.bind (UnifyType.eq_o_i (Contexts.single_base [SyntaxVCT.B_bit]))
      (fun aa ->
        (match aa with None -> Predicate.bot_pred
          | Some bp ->
            Predicate.bind (UnifyType.eq_o_i (ContextsPiDelta.theta_d theta))
              (fun ab ->
                (match ab with None -> Predicate.bot_pred
                  | Some order ->
                    Predicate.bind
                      (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i1))
                      (fun (i2, xpa) ->
                        Predicate.single
                          (SyntaxVCT.T_refined_type
                             (SyntaxVCT.VIndex, SyntaxVCT.B_vec (order, bp),
                               SyntaxVCT.C_eq
                                 (SyntaxVCT.CE_uop
                                    (SyntaxVCT.Len,
                                      SyntaxVCT.CE_val
(SyntaxVCT.V_var SyntaxVCT.VIndex)),
                                   SyntaxVCT.CE_val
                                     (SyntaxVCT.V_lit (SyntaxVCT.L_num x)))),
                            (SyntaxVCT.V_var xpa,
                              ([(xpa, (SyntaxVCT.B_vec (order, bp),
SyntaxVCT.C_eq
  (SyntaxVCT.CE_uop (SyntaxVCT.Len, SyntaxVCT.CE_val (SyntaxVCT.V_var xpa)),
    SyntaxVCT.CE_val (SyntaxVCT.V_lit (SyntaxVCT.L_num x)))))],
                                (i2, OK ()))))))))))
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
                                      |
(_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) -> Predicate.bot_pred)))
                                (Predicate.sup_pred
                                  (Predicate.bind
                                    (Predicate.single
                                      (xa, (xb, (xc, (xd, (xe, xf))))))
                                    (fun a ->
                                      (match a
with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
| (i1, (theta, (phi, (gamma, (delta, SyntaxPED.Ep_throw (_, ep)))))) ->
  Predicate.bind (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
    (fun aa ->
      (match aa
        with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_vec (_, _), _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_union (_, _), _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _) ->
          Predicate.bot_pred
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _),
            (_, (klist, (i2, ok1))))
          -> Predicate.bind (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i2))
               (fun (i3, xpa) ->
                 Predicate.single
                   (SyntaxVCT.T_refined_type
                      (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_true),
                     (SyntaxVCT.V_var xpa,
                       ((xpa, (SyntaxVCT.B_unit, SyntaxVCT.C_true)) :: klist,
                         (i3, ok1)))))
        | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_finite_set _, _), _) ->
          Predicate.bot_pred))
| (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
  Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
| (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) -> Predicate.bot_pred)))
                                  (Predicate.sup_pred
                                    (Predicate.bind
                                      (Predicate.single
(xa, (xb, (xc, (xd, (xe, xf))))))
                                      (fun a ->
(match a
  with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
    Predicate.bot_pred
  | (i1, (_, (_, (_, (_, SyntaxPED.Ep_return (loc, _)))))) ->
    Predicate.single
      (SyntaxVCT.T_refined_type
         (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
        (SyntaxVCT.V_var SyntaxVCT.VIndex,
          ([], (i1, Error (CheckFail ("Not Implemented: return", loc))))))
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
    Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
  | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
    Predicate.bot_pred)))
                                    (Predicate.sup_pred
                                      (Predicate.bind
(Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
(fun a ->
  (match a
    with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) -> Predicate.bot_pred
    | (i1, (_, (_, (_, (_, SyntaxPED.Ep_exit (loc, _)))))) ->
      Predicate.single
        (SyntaxVCT.T_refined_type
           (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
          (SyntaxVCT.V_var SyntaxVCT.VIndex,
            ([], (i1, Error (CheckFail ("Not Implemented: exit", loc))))))
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
      Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
    | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
      Predicate.bot_pred)))
                                      (Predicate.sup_pred
(Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
  (fun a ->
    (match a
      with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) -> Predicate.bot_pred
      | (i1, (_, (_, (_, (_, SyntaxPED.Ep_try (loc, _, _)))))) ->
        Predicate.single
          (SyntaxVCT.T_refined_type
             (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
            (SyntaxVCT.V_var SyntaxVCT.VIndex,
              ([], (i1, Error (CheckFail ("Not Implemented: try", loc))))))
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
        Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) -> Predicate.bot_pred
      | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
        Predicate.bot_pred)))
(Predicate.sup_pred
  (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
    (fun a ->
      (match a
        with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) -> Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
          Predicate.bot_pred
        | (i1, (_, (_, (_, (_, SyntaxPED.Ep_constraint (loc, _)))))) ->
          Predicate.single
            (SyntaxVCT.T_refined_type
               (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
              (SyntaxVCT.V_var SyntaxVCT.VIndex,
                ([], (i1, Error (CheckFail
                                  ("Not Implemented: constraint", loc))))))
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) -> Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
          Predicate.bot_pred
        | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
          Predicate.bot_pred)))
  (Predicate.sup_pred
    (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
      (fun a ->
        (match a
          with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
            Predicate.bot_pred
          | (i1, (_, (_, (_, (_, SyntaxPED.Ep_assert (loc, _, _)))))) ->
            Predicate.single
              (SyntaxVCT.T_refined_type
                 (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
                (SyntaxVCT.V_var SyntaxVCT.VIndex,
                  ([], (i1, Error (CheckFail
                                    ("Not Implemented: assert", loc))))))
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cons (_, _, _)))))) ->
            Predicate.bot_pred)))
    (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
      (fun a ->
        (match a
          with (_, (_, (_, (_, (_, SyntaxPED.Ep_val (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_mvar (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_concat (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_tuple (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_app (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_bop (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_uop (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_proj (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_constr (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_field_access (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_sizeof (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_cast (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_record (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_record_update (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_let (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_let2 (_, _, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_if (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_block (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_case (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_assign (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_return (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_exit (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_ref (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_throw (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_try (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_constraint (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_loop (_, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_assert (_, _, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_vec (_, _)))))) ->
            Predicate.bot_pred
          | (_, (_, (_, (_, (_, SyntaxPED.Ep_list (_, _)))))) ->
            Predicate.bot_pred
          | (i1, (_, (_, (_, (_, SyntaxPED.Ep_cons (loc, _, _)))))) ->
            Predicate.single
              (SyntaxVCT.T_refined_type
                 (SyntaxVCT.VIndex, SyntaxVCT.B_unit, SyntaxVCT.C_false),
                (SyntaxVCT.V_var SyntaxVCT.VIndex,
                  ([], (i1, Error (CheckFail
                                    ("Not Implemented: cons",
                                      loc))))))))))))))))))))))))))))
and letbind_i_i_i_i_i_i_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun (i1, (theta,
                    (phi, (gamma, (delta, SyntaxPED.LBp_val (_, patp, ep))))))
          -> Predicate.bind
               (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
               (fun (tau, (xp1, (klist1, (i2, ok1)))) ->
                 Predicate.bind
                   (check_pat_i_i_i_i_i_i_o_o_o_o i2 theta
                     (TypingUtils.g_cons3 gamma [klist1]) patp tau xp1)
                   (fun (klist2, (yp_list, (i3, ok2))) ->
                     Predicate.bind
                       (Predicate.if_pred (Contexts.check_vars gamma yp_list))
                       (fun () ->
                         Predicate.single
                           (Lista.concat [klist1; klist2],
                             (i3, join ok1 ok2)))))))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                       (_, SyntaxPED.Pp_lit (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_wild _, _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_as_var (_, _, _), _))))))
              -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (_, SyntaxPED.LBp_val
                                   (_, SyntaxPED.Pp_typ
 (_, SyntaxVCT.T_refined_type (zp, bp, cp), patp),
                                     ep))))))
              -> Predicate.bind
                   (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma
                     ContextsPiDelta.emptyDEnv ep
                     (SyntaxVCT.T_refined_type (zp, bp, cp)))
                   (fun (i2, ok1) ->
                     Predicate.bind
                       (UnifyType.eq_o_i (TypingUtils.mk_fresh_i i2))
                       (fun (i3, xpa) ->
                         Predicate.bind
                           (check_pat_i_i_i_i_i_i_o_o_o_o i3 theta
                             (Contexts.add_var gamma
                               (xpa, Contexts.GEPair
                                       (bp,
 SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xpa))))
                             patp (SyntaxVCT.T_refined_type (zp, bp, cp))
                             (SyntaxVCT.V_var xpa))
                           (fun (klist, (xp_list, (i4, ok2))) ->
                             Predicate.bind
                               (Predicate.if_pred
                                 (Contexts.check_vars gamma xp_list))
                               (fun () ->
                                 Predicate.single
                                   ((xpa, (bp,
    SyntaxUtils.subst_x_cp cp zp (SyntaxVCT.V_var xpa))) ::
                                      klist,
                                     (i4, join ok1 ok2))))))
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_id (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_as_typ (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_app (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_vector (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_vector_concat (_, _),
                                      _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_tup (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_list (_, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_cons (_, _, _), _))))))
              -> Predicate.bot_pred
            | (_, (_, (_, (_, (_, SyntaxPED.LBp_val
                                    (_, SyntaxPED.Pp_string_append (_, _),
                                      _))))))
              -> Predicate.bot_pred)))
and infer_e_list_i_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a
            with (i1, (_, (_, (_, (_, []))))) ->
              Predicate.single ([], ([], ([], (i1, OK ()))))
            | (_, (_, (_, (_, (_, _ :: _))))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, (delta, ep :: ep_list))))) ->
              Predicate.bind
                (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
                (fun (tau, (vp, (klist1, (i2, ok1)))) ->
                  Predicate.bind
                    (infer_e_list_i_i_i_i_i_i_o_o_o_o_o i2 theta phi
                      (TypingUtils.g_cons3 gamma [klist1]) delta ep_list)
                    (fun (tp_list, (vp_list, (klist2, (i3, ok2)))) ->
                      Predicate.single
                        (tau :: tp_list,
                          (vp :: vp_list,
                            (Lista.concat [klist1; klist2],
                              (i3, join ok1 ok2)))))))))
and infer_app_i_i_i_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe xf xg xh =
    Predicate.bind
      (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh))))))))
      (fun (i1, (loc, (theta, (phi, (gamma, (delta, (ap_list, ep))))))) ->
        Predicate.bind
          (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
          (fun (SyntaxVCT.T_refined_type (zp2, bp2, cp2),
                 (vp2, (klist, (i2, ok1))))
            -> Predicate.bind (UnifyType.eq_o_i (mk_fresh_lbl i2 "_app"))
                 (fun (i3, xp3) ->
                   Predicate.bind
                     (match_arg_i_i_i_i_i_i_i_o_o_o loc theta
                       (TypingUtils.g_cons3 gamma [klist]) zp2 bp2 cp2 ap_list)
                     (fun a ->
                       (match a
                         with (SyntaxVCT.A_monotype _, _) -> Predicate.bot_pred
                         | (SyntaxVCT.A_function
                              (xp1a, _, _,
                                SyntaxVCT.T_refined_type (zp3, bp3, cp3)),
                             (bsub, ok2))
                           -> Predicate.single
                                (SyntaxVCT.T_refined_type
                                   (zp3, tsubst_bp_many bp3 bsub,
                                     SyntaxUtils.subst_x_cp cp3 xp1a vp2),
                                  (SyntaxVCT.V_var xp3,
                                    ((xp3, (tsubst_bp_many bp3 bsub,
     SyntaxUtils.subst_x_cp (SyntaxUtils.subst_x_cp cp3 xp1a vp2) zp3
       (SyntaxVCT.V_var xp3))) ::
                                       klist,
                                      (i3, join ok1 ok2)))))))))
and infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o
  xa xb xc xd xe xf =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, (delta, [ep]))))) ->
              Predicate.bind
                (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
                (fun aa ->
                  (match aa
                    with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (zp, SyntaxVCT.B_vec (order, bp), cp),
                        (xp, (klist, (i2, ok))))
                      -> Predicate.single
                           (zp, (order,
                                  (bp, ([cp], ([xp], ([klist], (i2, ok)))))))
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_union (_, _), _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_finite_set _, _),
                        _)
                      -> Predicate.bot_pred))
            | (_, (_, (_, (_, (_, _ :: _ :: _))))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, xf))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, []))))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, (delta, ep :: ep_list))))) ->
              Predicate.bind
                (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta ep)
                (fun aa ->
                  (match aa
                    with (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_var _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tid _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_int, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bool, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_bit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_unit, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_real, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (zp, SyntaxVCT.B_vec (order, bp), cp),
                        (xp, (klist, (i2, ok1))))
                      -> Predicate.bind
                           (infer_e_T_P_G_D_ep_list_xp_order_bp_cp_list_xp_list_klist_list_i_i_i_i_i_i_o_o_o_o_o_o_o_o
                             i2 theta phi gamma delta ep_list)
                           (fun (zpa, (ordera,
(bpa, (cp_list, (xp_lista, (klist_list, (i3, ok2)))))))
                             -> (if SyntaxVCT.equal_bpa bp bpa &&
                                      (SyntaxVCT.equal_order order ordera &&
SyntaxVCT.equal_xpa zp zpa)
                                  then Predicate.single
 (zp, (order,
        (bp, (cp :: cp_list,
               (xp :: xp_lista, (klist :: klist_list, (i3, join ok1 ok2)))))))
                                  else Predicate.bot_pred))
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_list _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_tuple _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_union (_, _), _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_record _, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_undef, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_reg _, _), _) ->
                      Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_string, _), _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type (_, SyntaxVCT.B_exception, _),
                        _)
                      -> Predicate.bot_pred
                    | (SyntaxVCT.T_refined_type
                         (_, SyntaxVCT.B_finite_set _, _),
                        _)
                      -> Predicate.bot_pred)))))
and typing_lexp_i_i_i_i_i_i_i_o_o_o_o
  xa xb xc xd xe xf xg =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
        (fun a ->
          (match a
            with (i1, (theta,
                        (phi, (gamma,
                                (delta, (SyntaxPED.LEXPp_mvar (_, up), ep))))))
              -> Predicate.bind
                   (Predicate.if_pred (ContextsPiDelta.mvar_not_in_d delta up))
                   (fun () ->
                     Predicate.bind
                       (infer_e_i_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma delta
                         ep)
                       (fun (tau, (_, (klist, (i2, ok)))) ->
                         Predicate.single
                           (ContextsPiDelta.add_mvar delta (up, tau),
                             (klist, (i2, ok)))))
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_cast (_, _, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _)))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind
          (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
          (fun a ->
            (match a
              with (i1, (theta,
                          (phi, (gamma,
                                  (delta,
                                    (SyntaxPED.LEXPp_mvar (_, up), ep))))))
                -> Predicate.bind
                     (UnifyType.eq_o_i (ContextsPiDelta.lookup_mvar delta up))
                     (fun aa ->
                       (match aa with None -> Predicate.bot_pred
                         | Some tau ->
                           Predicate.bind
                             (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma delta
                               ep tau)
                             (fun (i2, ok) ->
                               Predicate.single
                                 (delta, (TypingUtils.k_list [], (i2, ok))))))
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_cast (_, _, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _)))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind
            (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                  -> Predicate.bot_pred
                | (i1, (theta,
                         (phi, (gamma,
                                 (delta,
                                   (SyntaxPED.LEXPp_cast (_, tau, up), ep))))))
                  -> Predicate.bind
                       (Predicate.if_pred
                         (ContextsPiDelta.mvar_not_in_d delta up))
                       (fun () ->
                         Predicate.bind
                           (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma delta
                             ep tau)
                           (fun (i2, ok) ->
                             Predicate.single
                               (ContextsPiDelta.add_mvar delta (up, tau),
                                 (TypingUtils.k_list [], (i2, ok)))))
                | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _), _))))))
                  -> Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind
              (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                    -> Predicate.bot_pred
                  | (i1, (theta,
                           (phi, (gamma,
                                   (delta,
                                     (SyntaxPED.LEXPp_cast (loc, tau_2, up),
                                       ep))))))
                    -> Predicate.bind
                         (UnifyType.eq_o_i
                           (ContextsPiDelta.lookup_mvar delta up))
                         (fun aa ->
                           (match aa with None -> Predicate.bot_pred
                             | Some tau_1 ->
                               Predicate.bind
                                 (subtype_i_i_i_i_i_o loc theta gamma tau_2
                                   tau_1)
                                 (fun x ->
                                   Predicate.bind
                                     (check_e_i_i_i_i_i_i_i_o_o i1 theta phi
                                       gamma delta ep tau_2)
                                     (fun (i2, ok2) ->
                                       Predicate.single
 (ContextsPiDelta.update_mvar delta (up, tau_2),
   (TypingUtils.k_list [], (i2, join x ok2)))))))
                  | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _)))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_field (_, _, _),
  _))))))
                    -> Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind
                (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, (_,
   (SyntaxPED.LEXPp_mvar (_, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_cast (_, _, _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_, (SyntaxPED.LEXPp_tup (_, _), _))))))
                      -> Predicate.bot_pred
                    | (i1, (theta,
                             (phi, (gamma,
                                     (delta,
                                       (SyntaxPED.LEXPp_field
  (loc, SyntaxPED.LEXPp_mvar (_, up), _),
 ep))))))
                      -> Predicate.bind
                           (UnifyType.eq_o_i
                             (ContextsPiDelta.lookup_field_and_record_type theta
                               up))
                           (fun aa ->
                             (match aa with None -> Predicate.bot_pred
                               | Some (tau_1, tau_2) ->
                                 Predicate.bind
                                   (UnifyType.eq_o_i
                                     (ContextsPiDelta.lookup_mvar delta up))
                                   (fun ab ->
                                     (match ab with None -> Predicate.bot_pred
                                       | Some tau ->
 Predicate.bind (subtype_i_i_i_i_i_o loc theta gamma tau tau_2)
   (fun x ->
     Predicate.bind
       (check_e_i_i_i_i_i_i_i_o_o i1 theta phi gamma delta ep tau_1)
       (fun (i2, ok2) ->
         Predicate.single
           (delta, (TypingUtils.k_list [], (i2, join x ok2)))))))))
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_cast (_, _, _), _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_tup (_, _), _), _))))))
                      -> Predicate.bot_pred
                    | (_, (_, (_, (_, (_,
(SyntaxPED.LEXPp_field (_, SyntaxPED.LEXPp_field (_, _, _), _), _))))))
                      -> Predicate.bot_pred)))
              (Predicate.sup_pred
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_,
 (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_cast (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, []), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_val (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_mvar (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_concat (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_tuple (_, [])))))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (phi, (gamma,
                                       (delta,
 (SyntaxPED.LEXPp_tup (_, [lexpp]), SyntaxPED.Ep_tuple (_, [ep])))))))
                        -> Predicate.bind
                             (typing_lexp_i_i_i_i_i_i_i_o_o_o_o i1 theta phi
                               gamma delta lexpp ep)
                             (fun (_, (klist, (i2, ok))) ->
                               Predicate.single (delta, (klist, (i2, ok))))
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_tuple (_, _ :: _ :: _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_app (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_bop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_uop (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_proj (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_constr (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_field_access (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_sizeof (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_cast (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_record (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_record_update (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_let (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_let2 (_, _, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_if (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_block (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_case (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_assign (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_return (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_exit (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_ref (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_throw (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_try (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_constraint (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_loop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_assert (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_vec (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_list (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, [_]), SyntaxPED.Ep_cons (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _ :: _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_field (_, _, _), _))))))
                        -> Predicate.bot_pred)))
                (Predicate.bind
                  (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, xg)))))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_,
 (_, (SyntaxPED.LEXPp_mvar (_, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_cast (_, _, _), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, []), _))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_val (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_mvar (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_concat (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_tuple (_, [])))))))
                        -> Predicate.bot_pred
                      | (i1, (theta,
                               (phi, (gamma,
                                       (delta,
 (SyntaxPED.LEXPp_tup (loc, lexpp :: lexpp_list),
   SyntaxPED.Ep_tuple (loca, ep :: ep_list)))))))
                        -> Predicate.bind
                             (typing_lexp_i_i_i_i_i_i_i_o_o_o_o i1 theta phi
                               gamma delta lexpp ep)
                             (fun (deltaa, (klist1, (i2, ok1))) ->
                               Predicate.bind
                                 (typing_lexp_i_i_i_i_i_i_i_o_o_o_o i2 theta phi
                                   gamma deltaa
                                   (SyntaxPED.LEXPp_tup (loc, lexpp_list))
                                   (SyntaxPED.Ep_tuple (loca, ep_list)))
                                 (fun (deltab, (klist2, (i3, ok2))) ->
                                   Predicate.single
                                     (deltab,
                                       (Lista.concat [klist1; klist2],
 (i3, join ok1 ok2)))))
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_app (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_bop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_uop (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_proj (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_constr (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_field_access (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_sizeof (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_cast (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_record (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_record_update (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_let (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_let2 (_, _, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_if (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_block (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_case (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_assign (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_return (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_exit (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_ref (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_throw (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_try (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_constraint (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_loop (_, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_for (_, _, _, _, _, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_assert (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_vec (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_list (_, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_tup (_, _ :: _), SyntaxPED.Ep_cons (_, _, _)))))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, (_,
  (SyntaxPED.LEXPp_field (_, _, _), _))))))
                        -> Predicate.bot_pred))))))))
and check_pexp_i_i_i_i_i_i_i_i_i_o_o_o
  xa xb xc xd xe xf xg xh xi =
    Predicate.sup_pred
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a
            with (i1, (theta,
                        (phi, (gamma,
                                (delta,
                                  (SyntaxPED.PEXPp_exp (patp, ep),
                                    (SyntaxVCT.T_refined_type (zp, bp, cp),
                                      (tau, xp))))))))
              -> Predicate.bind
                   (check_pat_i_i_i_i_i_i_o_o_o_o i1 theta gamma patp
                     (SyntaxVCT.T_refined_type (zp, bp, cp)) xp)
                   (fun (klist, (_, (i3, ok1))) ->
                     Predicate.bind
                       (check_e_i_i_i_i_i_i_i_o_o i3 theta phi
                         (TypingUtils.g_cons3 gamma [klist]) delta ep tau)
                       (fun (i4, ok2) ->
                         Predicate.single
                           (TypingUtils.g_cons3 gamma [klist],
                             (i4, join ok1 ok2))))
            | (_, (_, (_, (_, (_, (SyntaxPED.PEXPp_when (_, _, _), _)))))) ->
              Predicate.bot_pred)))
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, (_, (SyntaxPED.PEXPp_exp (_, _), _)))))) ->
              Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (delta,
                               (SyntaxPED.PEXPp_when (patp, ep1, ep2),
                                 (tau_2, (tau_1, xp))))))))
              -> Predicate.bind
                   (check_pat_i_i_i_i_i_i_o_o_o_o i1 theta gamma patp tau_2 xp)
                   (fun (klist, (_, (i3, ok1))) ->
                     Predicate.bind
                       (check_e_i_i_i_i_i_i_i_o_o i3 theta phi
                         (TypingUtils.g_cons3 gamma [klist]) delta ep1
                         (SyntaxVCT.T_refined_type
                           (SyntaxVCT.VIndex, SyntaxVCT.B_bool,
                             SyntaxVCT.C_true)))
                       (fun (i4, ok2) ->
                         Predicate.bind
                           (check_e_i_i_i_i_i_i_i_o_o i4 theta phi
                             (TypingUtils.g_cons3
                               (TypingUtils.g_cons3 gamma [klist]) [])
                             delta ep2 tau_1)
                           (fun (i5, ok3) ->
                             Predicate.single
                               (TypingUtils.g_cons3
                                  (TypingUtils.g_cons3 gamma []) [klist],
                                 (i5, join ok1 (join ok2 ok3)))))))))
and check_pexp_list_i_i_i_i_i_i_i_i_i_o_o
  xa xb xc xd xe xf xg xh xi =
    Predicate.sup_pred
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, ([], _)))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma, (delta, ([pexp], (tau_pat, (t_exp, xp))))))))
              -> Predicate.bind
                   (check_pexp_i_i_i_i_i_i_i_i_i_o_o_o i1 theta phi gamma delta
                     pexp tau_pat t_exp xp)
                   (fun (_, (i2, ok)) -> Predicate.single (i2, ok))
            | (_, (_, (_, (_, (_, (_ :: _ :: _, _)))))) -> Predicate.bot_pred)))
      (Predicate.bind
        (Predicate.single (xa, (xb, (xc, (xd, (xe, (xf, (xg, (xh, xi)))))))))
        (fun a ->
          (match a with (_, (_, (_, (_, (_, ([], _)))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (delta,
                               (pexp :: pexp_list, (tau_pat, (t_exp, xp))))))))
              -> Predicate.bind (Predicate.if_pred (not (Lista.null pexp_list)))
                   (fun () ->
                     Predicate.bind
                       (check_pexp_i_i_i_i_i_i_i_i_i_o_o_o i1 theta phi gamma
                         delta pexp tau_pat t_exp xp)
                       (fun (_, (i2, ok1)) ->
                         Predicate.bind
                           (check_pexp_list_i_i_i_i_i_i_i_i_i_o_o i2 theta phi
                             gamma delta pexp_list tau_pat t_exp xp)
                           (fun (i3, ok2) ->
                             Predicate.single (i3, join ok1 ok2)))))));;

let rec check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o
  x xa xb xc xd xe xf xg xh =
    Predicate.sup_pred
      (Predicate.bind
        (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh)))))))))
        (fun a ->
          (match a
            with (i, (_, (phi, (gamma, ([], (_, (_, (_, _)))))))) ->
              Predicate.single (phi, (gamma, (i, OK ())))
            | (_, (_, (_, (_, (_ :: _, _))))) -> Predicate.bot_pred)))
      (Predicate.bind
        (Predicate.single (x, (xa, (xb, (xc, (xd, (xe, (xf, (xg, xh)))))))))
        (fun a ->
          (match a with (_, (_, (_, (_, ([], _))))) -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             (SyntaxPED.FCLp_funcl (loc, id, pexpp) ::
                                funclp_list,
                               (xp, (bp, (cp, tau_2))))))))
              -> Predicate.bind (UnifyType.eq_o_i (mk_fresh_lbl i1 "_xp2"))
                   (fun (i2, xp2) ->
                     Predicate.bind
                       (UnifyType.eq_o_i
                         (Contexts.gamma_e_update (fun _ -> Some tau_2) gamma))
                       (fun xi ->
                         Predicate.bind
                           (UnifyType.eq_o_i
                             (TypingUtils.add_fun_all phi
                               (SyntaxVCT.A_function (xp, bp, cp, tau_2))
                               [SyntaxPED.FCLp_funcl (loc, id, pexpp)]))
                           (fun xaa ->
                             Predicate.bind
                               (check_e_i_i_i_i_i_i_i_o_o i2 theta phi
                                 (Contexts.add_var xi
                                   (xp2, Contexts.GEPair
   (bp, SyntaxUtils.subst_x_cp cp xp (SyntaxVCT.V_var xp2))))
                                 ContextsPiDelta.emptyDEnv
                                 (SyntaxPED.Ep_case
                                   (loc, SyntaxPED.Ep_val
   (loc, SyntaxVCT.V_var xp2),
                                     [SyntaxPED.subst_pexpp
(SyntaxVCT.V_var xp2) xp pexpp]))
                                 (SyntaxPED.subst_tp (SyntaxVCT.V_var xp2) xp
                                   tau_2))
                               (fun (i3, ok1) ->
                                 Predicate.bind
                                   (check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o i3
                                     theta xaa gamma funclp_list xp bp cp tau_2)
                                   (fun (phia, (gammaa, (i4, ok2))) ->
                                     Predicate.single
                                       (phia,
 (gammaa, (i4, join ok1 ok2)))))))))));;

let rec def_checking_mapI_xp_bp_cp_i_o_o_o_o
  x = Predicate.sup_pred
        (Predicate.bind (Predicate.single x)
          (fun a ->
            (match a with [] -> Predicate.single ([], ([], ([], OK ())))
              | _ :: _ -> Predicate.bot_pred)))
        (Predicate.bind (Predicate.single x)
          (fun a ->
            (match a with [] -> Predicate.bot_pred
              | (kp, (bp, cp)) :: xp_bp_cp_list ->
                Predicate.bind
                  (def_checking_mapI_xp_bp_cp_i_o_o_o_o xp_bp_cp_list)
                  (fun (kp_list, (bp_list, (cp_list, ok))) ->
                    Predicate.single
                      (kp :: kp_list,
                        (bp :: bp_list, (cp :: cp_list, ok)))))));;

let rec check_def_i_i_i_i_i_o_o_o_o_o
  xa xb xc xd xe =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
        (fun a ->
          (match a
            with (_, (_, (_, (_, SyntaxPED.DEFp_fundef
                                   (_, SyntaxVCT.A_monotype _, _)))))
              -> Predicate.bot_pred
            | (i1, (theta,
                     (phi, (gamma,
                             SyntaxPED.DEFp_fundef
                               (_, SyntaxVCT.A_function (xp, bp, cp, tau_2),
                                 funclp_list)))))
              -> Predicate.bind
                   (check_funcls_i_i_i_i_i_i_i_i_i_o_o_o_o i1 theta phi gamma
                     funclp_list xp bp cp tau_2)
                   (fun (phia, (gammaa, (i2, ok))) ->
                     Predicate.single (theta, (phia, (gammaa, (i2, ok)))))
            | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
              Predicate.bot_pred
            | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
              Predicate.bot_pred)))
      (Predicate.sup_pred
        (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
          (fun a ->
            (match a
              with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                Predicate.bot_pred
              | (i1, (theta,
                       (phi, (gamma,
                               SyntaxPED.DEFp_val
                                 (_, SyntaxPED.LBp_val (loc, patp, ep))))))
                -> Predicate.bind
                     (letbind_i_i_i_i_i_i_o_o_o i1 theta phi gamma
                       ContextsPiDelta.emptyDEnv
                       (SyntaxPED.LBp_val (loc, patp, ep)))
                     (fun (klist, (i2, ok)) ->
                       Predicate.single
                         (theta,
                           (phi, (TypingUtils.g_cons3 gamma [klist],
                                   (i2, ok)))))
              | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                Predicate.bot_pred
              | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                Predicate.bot_pred)))
        (Predicate.sup_pred
          (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
            (fun a ->
              (match a
                with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _, _, _))))) ->
                  Predicate.bot_pred
                | (i, (theta, (phi, (gamma, SyntaxPED.DEFp_spec (_, id, ap)))))
                  -> Predicate.single
                       (theta,
                         (ContextsPiDelta.add_fun phi
                            (SyntaxVCT.VNamed id, (ap, None)),
                           (gamma, (i, OK ()))))
                | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                  Predicate.bot_pred
                | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                  Predicate.bot_pred)))
          (Predicate.sup_pred
            (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
              (fun a ->
                (match a
                  with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                    Predicate.bot_pred
                  | (i, (theta,
                          (phi, (gamma,
                                  SyntaxPED.DEFp_overload (_, id, id_list)))))
                    -> Predicate.single
                         (theta,
                           (ContextsPiDelta.add_to_overload phi
                              (SyntaxVCT.VNamed id)
                              (Lista.map (fun aa -> SyntaxVCT.VNamed aa)
                                id_list),
                             (gamma, (i, OK ()))))
                  | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                    Predicate.bot_pred
                  | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                    Predicate.bot_pred)))
            (Predicate.sup_pred
              (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                (fun a ->
                  (match a
                    with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                      Predicate.bot_pred
                    | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                      Predicate.bot_pred
                    | (i, (theta,
                            (phi, (gamma, SyntaxPED.DEFp_default (_, order)))))
                      -> Predicate.single
                           (ContextsPiDelta.theta_d_update (fun _ -> Some order)
                              theta,
                             (phi, (gamma, (i, OK ())))))))
              (Predicate.sup_pred
                (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_typedef (_, _, _, _)))))
                        -> Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                        Predicate.bot_pred
                      | (i, (theta,
                              (phi, (gamma, SyntaxPED.DEFp_reg (_, t, x)))))
                        -> Predicate.single
                             (ContextsPiDelta.add_register theta x t,
                               (phi, (gamma, (i, OK ()))))
                      | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                        Predicate.bot_pred)))
                (Predicate.bind (Predicate.single (xa, (xb, (xc, (xd, xe)))))
                  (fun a ->
                    (match a
                      with (_, (_, (_, (_, SyntaxPED.DEFp_fundef (_, _, _)))))
                        -> Predicate.bot_pred
                      | (i, (theta,
                              (phi, (gamma,
                                      SyntaxPED.DEFp_typedef
(_, id, k_bp_c_list, tau)))))
                        -> Predicate.bind
                             (def_checking_mapI_xp_bp_cp_i_o_o_o_o k_bp_c_list)
                             (fun (_, (_, (_, ok))) ->
                               Predicate.single
                                 (ContextsPiDelta.add_type theta
                                    (SyntaxVCT.VNamed id) tau,
                                   (phi, (gamma, (i, ok)))))
                      | (_, (_, (_, (_, SyntaxPED.DEFp_spec (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_val (_, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_reg (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_overload (_, _, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_scattered (_, _))))) ->
                        Predicate.bot_pred
                      | (_, (_, (_, (_, SyntaxPED.DEFp_default (_, _))))) ->
                        Predicate.bot_pred))))))));;

let rec check_defs_i_i_i_i_i_o_o_o_o_o
  x xa xb xc xd =
    Predicate.sup_pred
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
        (fun a ->
          (match a with (_, (_, (_, (_, [])))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, [def])))) ->
              Predicate.bind
                (check_def_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma def)
                (fun (thetaa, (phia, (gammaa, (i2, ok)))) ->
                  Predicate.single (thetaa, (phia, (gammaa, (i2, ok)))))
            | (_, (_, (_, (_, _ :: _ :: _)))) -> Predicate.bot_pred)))
      (Predicate.bind (Predicate.single (x, (xa, (xb, (xc, xd)))))
        (fun a ->
          (match a with (_, (_, (_, (_, [])))) -> Predicate.bot_pred
            | (i1, (theta, (phi, (gamma, def :: def_list)))) ->
              Predicate.bind
                (check_def_i_i_i_i_i_o_o_o_o_o i1 theta phi gamma def)
                (fun (thetaa, (phia, (gammaa, (i2, ok1)))) ->
                  Predicate.bind
                    (check_defs_i_i_i_i_i_o_o_o_o_o i2 thetaa phia gammaa
                      def_list)
                    (fun (thetab, (phib, (gammab, (i3, ok2)))) ->
                      Predicate.single
                        (thetab, (phib, (gammab, (i3, join ok1 ok2)))))))));;

let rec check_prog_i_o
  x = Predicate.bind (Predicate.single x)
        (fun (SyntaxPED.Pp_prog defs) ->
          Predicate.bind
            (check_defs_i_i_i_i_i_o_o_o_o_o Arith.zero_nat TypingUtils.emptyTEnv
              ContextsPiDelta.emptyPiEnv TypingUtils.emptyEnv defs)
            (fun (_, a) -> (let (_, aa) = a in
                            let (_, ab) = aa in
                            let (_, ac) = ab in
                             Predicate.single ac)));;

end;; (*struct TypingDeclFailRules*)
