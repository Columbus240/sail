(*Generated by Lem from ../../src/gen_lib/state_monad.lem.*)
open HolKernel Parse boolLib bossLib;
open lem_pervasives_extraTheory sail_valuesTheory sail_instr_kindsTheory;

val _ = numLib.prefer_num();



val _ = new_theory "state_monad"

(*open import Pervasives_extra*)
(*open import Sail_instr_kinds*)
(*open import Sail_values*)

(* 'a is result type *)

val _ = type_abbrev( "memstate" , ``: (int, memory_byte) fmap``);
val _ = type_abbrev( "tagstate" , ``: (int, bitU) fmap``);
(* type regstate = map string (vector bitU) *)

val _ = Hol_datatype `
(*  'regs *) sequential_state =
  <| regstate : 'regs;
     memstate : memstate;
     tagstate : tagstate;
     write_ea :  (write_kind # int # int)option;
     last_exclusive_operation_was_load : bool;
     (* Random bool generator for use as an undefined bit oracle *)
     next_bool : num -> (bool # num);
     seed : num |>`;


(*val init_state : forall 'regs. 'regs -> (nat -> (bool* nat)) -> nat -> sequential_state 'regs*)
val _ = Define `
 ((init_state:'regs ->(num -> bool#num) -> num -> 'regs sequential_state) regs o1 s=
   (<| regstate := regs;
     memstate := FEMPTY;
     tagstate := FEMPTY;
     write_ea := NONE;
     last_exclusive_operation_was_load := F;
     next_bool := o1;
     seed := s |>))`;


val _ = Hol_datatype `
 ex =
    Failure of string
  | Throw of 'e`;


val _ = Hol_datatype `
 result =
    Value of 'a
  | Ex of ( 'e ex)`;


(* State, nondeterminism and exception monad with result value type 'a
   and exception type 'e. *)
val _ = type_abbrev((* ( 'a_regs, 'b_a, 'c_e) *) "monadS" , ``:'a_regs sequential_state -> (('b_a,'c_e)result #'a_regs sequential_state) set``);

(*val returnS : forall 'regs 'a 'e. 'a -> monadS 'regs 'a 'e*)
val _ = Define `
 ((returnS:'a -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) a s=  ({(Value a,s)}))`;


(*val bindS : forall 'regs 'a 'b 'e. monadS 'regs 'a 'e -> ('a -> monadS 'regs 'b 'e) -> monadS 'regs 'b 'e*)
val _ = Define `
 ((bindS:('regs sequential_state ->(('a,'e)result#'regs sequential_state)set) ->('a -> 'regs sequential_state ->(('b,'e)result#'regs sequential_state)set) -> 'regs sequential_state ->(('b,'e)result#'regs sequential_state)set) m f (s : 'regs sequential_state)=
   (BIGUNION (IMAGE (\x .  
  (case x of   (Value a, s') => f a s' | (Ex e, s') => {(Ex e, s')} )) (m s))))`;


(*val seqS: forall 'regs 'b 'e. monadS 'regs unit 'e -> monadS 'regs 'b 'e -> monadS 'regs 'b 'e*)
val _ = Define `
 ((seqS:('regs sequential_state ->(((unit),'e)result#'regs sequential_state)set) ->('regs sequential_state ->(('b,'e)result#'regs sequential_state)set) -> 'regs sequential_state ->(('b,'e)result#'regs sequential_state)set) m n=  (bindS m (\u .  
  (case (u ) of ( (_ : unit) ) => n ))))`;


(*val chooseS : forall 'regs 'a 'e. SetType 'a => set 'a -> monadS 'regs 'a 'e*)
val _ = Define `
 ((chooseS:'a set -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) xs s=  (IMAGE (\ x .  (Value x, s)) xs))`;


(*val readS : forall 'regs 'a 'e. (sequential_state 'regs -> 'a) -> monadS 'regs 'a 'e*)
val _ = Define `
 ((readS:('regs sequential_state -> 'a) -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) f=  (\ s .  returnS (f s) s))`;


(*val updateS : forall 'regs 'e. (sequential_state 'regs -> sequential_state 'regs) -> monadS 'regs unit 'e*)
val _ = Define `
 ((updateS:('regs sequential_state -> 'regs sequential_state) -> 'regs sequential_state ->(((unit),'e)result#'regs sequential_state)set) f=  (\ s .  returnS ()  (f s)))`;


(*val failS : forall 'regs 'a 'e. string -> monadS 'regs 'a 'e*)
val _ = Define `
 ((failS:string -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) msg s=  ({(Ex (Failure msg), s)}))`;


(*val undefined_boolS : forall 'regval 'regs 'a 'e. unit -> monadS 'regs bool 'e*)
val _ = Define `
 ((undefined_boolS:unit -> 'regs sequential_state ->(((bool),'e)result#'regs sequential_state)set) () =  (bindS
  (readS (\ s .  s.next_bool (s.seed))) (\ (b, seed) .  seqS
  (updateS (\ s .  ( s with<| seed := seed |>)))
  (returnS b))))`;


(*val exitS : forall 'regs 'e 'a. unit -> monadS 'regs 'a 'e*)
val _ = Define `
 ((exitS:unit -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) () =  (failS "exit"))`;


(*val throwS : forall 'regs 'a 'e. 'e -> monadS 'regs 'a 'e*)
val _ = Define `
 ((throwS:'e -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) e s=  ({(Ex (Throw e), s)}))`;


(*val try_catchS : forall 'regs 'a 'e1 'e2. monadS 'regs 'a 'e1 -> ('e1 -> monadS 'regs 'a 'e2) ->  monadS 'regs 'a 'e2*)
val _ = Define `
 ((try_catchS:('regs sequential_state ->(('a,'e1)result#'regs sequential_state)set) ->('e1 -> 'regs sequential_state ->(('a,'e2)result#'regs sequential_state)set) -> 'regs sequential_state ->(('a,'e2)result#'regs sequential_state)set) m h s=
   (BIGUNION (IMAGE (\x .  
  (case x of
        (Value a, s') => returnS a s'
    | (Ex (Throw e), s') => h e s'
    | (Ex (Failure msg), s') => {(Ex (Failure msg), s')}
  )) (m s))))`;


(*val assert_expS : forall 'regs 'e. bool -> string -> monadS 'regs unit 'e*)
val _ = Define `
 ((assert_expS:bool -> string -> 'regs sequential_state ->(((unit),'e)result#'regs sequential_state)set) exp msg=  (if exp then returnS ()  else failS msg))`;


(* For early return, we abuse exceptions by throwing and catching
   the return value. The exception type is "either 'r 'e", where "Right e"
   represents a proper exception and "Left r" an early return of value "r". *)
val _ = type_abbrev((* ( 'a_regs, 'b_a, 'c_r, 'd_e) *) "monadRS" , ``:('a_regs,'b_a, (('c_r,'d_e)sum)) monadS``);

(*val early_returnS : forall 'regs 'a 'r 'e. 'r -> monadRS 'regs 'a 'r 'e*)
val _ = Define `
 ((early_returnS:'r -> 'regs sequential_state ->(('a,(('r,'e)sum))result#'regs sequential_state)set) r=  (throwS (INL r)))`;


(*val catch_early_returnS : forall 'regs 'a 'e. monadRS 'regs 'a 'a 'e -> monadS 'regs 'a 'e*)
val _ = Define `
 ((catch_early_returnS:('regs sequential_state ->(('a,(('a,'e)sum))result#'regs sequential_state)set) -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) m=
   (try_catchS m
    (\x .  (case x of   INL a => returnS a | INR e => throwS e ))))`;


(* Lift to monad with early return by wrapping exceptions *)
(*val liftRS : forall 'a 'r 'regs 'e. monadS 'regs 'a 'e -> monadRS 'regs 'a 'r 'e*)
val _ = Define `
 ((liftRS:('regs sequential_state ->(('a,'e)result#'regs sequential_state)set) -> 'regs sequential_state ->(('a,(('r,'e)sum))result#'regs sequential_state)set) m=  (try_catchS m (\ e .  throwS (INR e))))`;


(* Catch exceptions in the presence of early returns *)
(*val try_catchRS : forall 'regs 'a 'r 'e1 'e2. monadRS 'regs 'a 'r 'e1 -> ('e1 -> monadRS 'regs 'a 'r 'e2) ->  monadRS 'regs 'a 'r 'e2*)
val _ = Define `
 ((try_catchRS:('regs sequential_state ->(('a,(('r,'e1)sum))result#'regs sequential_state)set) ->('e1 -> 'regs sequential_state ->(('a,(('r,'e2)sum))result#'regs sequential_state)set) -> 'regs sequential_state ->(('a,(('r,'e2)sum))result#'regs sequential_state)set) m h=
   (try_catchS m
    (\x .  (case x of   INL r => throwS (INL r) | INR e => h e ))))`;


(*val maybe_failS : forall 'regs 'a 'e. string -> maybe 'a -> monadS 'regs 'a 'e*)
val _ = Define `
 ((maybe_failS:string -> 'a option -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) msg= 
  (\x .  (case x of   SOME a => returnS a | NONE => failS msg )))`;


(*val read_tagS : forall 'regs 'a 'e. Bitvector 'a => 'a -> monadS 'regs bitU 'e*)
val _ = Define `
 ((read_tagS:'a Bitvector_class -> 'a ->('regs,(bitU),'e)monadS)dict_Sail_values_Bitvector_a addr=  (bindS
  (maybe_failS "unsigned" (
  dict_Sail_values_Bitvector_a.unsigned_method addr)) (\ addr . 
  readS (\ s .  option_CASE (FLOOKUP s.tagstate addr) B0 I))))`;


(* Read bytes from memory and return in little endian order *)
(*val read_mem_bytesS : forall 'regs 'e 'a. Bitvector 'a => read_kind -> 'a -> nat -> monadS 'regs (list memory_byte) 'e*)
val _ = Define `
 ((read_mem_bytesS:'a Bitvector_class -> read_kind -> 'a -> num ->('regs,((memory_byte)list),'e)monadS)dict_Sail_values_Bitvector_a read_kind addr sz=  (bindS
  (maybe_failS "unsigned" (
  dict_Sail_values_Bitvector_a.unsigned_method addr)) (\ addr . 
  let sz = (int_of_num sz) in
  let addrs = (index_list addr ((addr+sz)-( 1 : int))(( 1 : int))) in  
  let read_byte = (\ s addr .  FLOOKUP s.memstate addr) in
  bindS (readS (\ s .  just_list (MAP (read_byte s) addrs)))
    (\x .  (case x of
                 SOME mem_val => seqS
                                   (updateS
                                      (\ s . 
                                       if read_is_exclusive read_kind then
                                         ( s with<| last_exclusive_operation_was_load := T |>)
                                       else s)) (returnS mem_val)
             | NONE => failS "read_memS"
           )))))`;


(*val read_memS : forall 'regs 'e 'a 'b. Bitvector 'a, Bitvector 'b => read_kind -> 'a -> integer -> monadS 'regs 'b 'e*)
val _ = Define `
 ((read_memS:'a Bitvector_class -> 'b Bitvector_class -> read_kind -> 'a -> int ->('regs,'b,'e)monadS)dict_Sail_values_Bitvector_a dict_Sail_values_Bitvector_b rk a sz=  (bindS
  (read_mem_bytesS dict_Sail_values_Bitvector_a rk a (nat_of_int sz)) (\ bytes . 
  maybe_failS "bits_of_mem_bytes" (
  dict_Sail_values_Bitvector_b.of_bits_method (bits_of_mem_bytes bytes)))))`;


(*val excl_resultS : forall 'regs 'e. unit -> monadS 'regs bool 'e*)
val _ = Define `
 ((excl_resultS:unit -> 'regs sequential_state ->(((bool),'e)result#'regs sequential_state)set) () =  (bindS
  (readS (\ s .  s.last_exclusive_operation_was_load)) (\ excl_load .  seqS
  (updateS (\ s .  ( s with<| last_exclusive_operation_was_load := F |>)))
  (chooseS (if excl_load then {F; T} else {F})))))`;


(*val write_mem_eaS : forall 'regs 'e 'a. Bitvector 'a => write_kind -> 'a -> nat -> monadS 'regs unit 'e*)
val _ = Define `
 ((write_mem_eaS:'a Bitvector_class -> write_kind -> 'a -> num ->('regs,(unit),'e)monadS)dict_Sail_values_Bitvector_a write_kind addr sz=  (bindS
  (maybe_failS "unsigned" (
  dict_Sail_values_Bitvector_a.unsigned_method addr)) (\ addr . 
  let sz = (int_of_num sz) in
  updateS (\ s .  ( s with<| write_ea := (SOME (write_kind, addr, sz)) |>)))))`;


(* Write little-endian list of bytes to previously announced address *)
(*val write_mem_bytesS : forall 'regs 'e. list memory_byte -> monadS 'regs bool 'e*)
val _ = Define `
 ((write_mem_bytesS:((bitU)list)list -> 'regs sequential_state ->(((bool),'e)result#'regs sequential_state)set) v=  (bindS
  (readS (\ s .  s.write_ea)) (\x .  
  (case x of
        NONE => failS "write ea has not been announced yet"
    | SOME (_, addr, sz) =>
  let addrs = (index_list addr ((addr + sz) - ( 1 : int)) (( 1 : int))) in
  (*let v = external_mem_value (bits_of v) in*)
  let a_v = (lem_list$list_combine addrs v) in
  let write_byte = (\mem p .  (case (mem ,p ) of
                                  ( mem , (addr, v) ) => mem  |+ ( addr ,  
                                                        v )
                              )) in
  seqS
    (updateS
       (\ s .  ( s with<| memstate := (FOLDL write_byte s.memstate a_v) |>)))
    (returnS T)
  ))))`;


(*val write_mem_valS : forall 'regs 'e 'a. Bitvector 'a => 'a -> monadS 'regs bool 'e*)
val _ = Define `
 ((write_mem_valS:'a Bitvector_class -> 'a ->('regs,(bool),'e)monadS)dict_Sail_values_Bitvector_a v=  ((case mem_bytes_of_bits 
  dict_Sail_values_Bitvector_a v of
    SOME v => write_mem_bytesS v
  | NONE => failS "write_mem_val"
)))`;


(*val write_tagS : forall 'regs 'a 'e. Bitvector 'a => 'a -> bitU -> monadS 'regs bool 'e*)
val _ = Define `
 ((write_tagS:'a Bitvector_class -> 'a -> bitU ->('regs,(bool),'e)monadS)dict_Sail_values_Bitvector_a addr t=  (bindS
   (maybe_failS "unsigned" (
  dict_Sail_values_Bitvector_a.unsigned_method addr)) (\ addr .  seqS
   (updateS (\ s .  ( s with<| tagstate := (s.tagstate |+ (addr, t)) |>)))
   (returnS T))))`;


(*val read_regS : forall 'regs 'rv 'a 'e. register_ref 'regs 'rv 'a -> monadS 'regs 'a 'e*)
val _ = Define `
 ((read_regS:('regs,'rv,'a)register_ref -> 'regs sequential_state ->(('a,'e)result#'regs sequential_state)set) reg=  (readS (\ s .  reg.read_from s.regstate)))`;


(* TODO
let read_reg_range reg i j state =
  let v = slice (get_reg state (name_of_reg reg)) i j in
  [(Value (vec_to_bvec v),state)]
let read_reg_bit reg i state =
  let v = access (get_reg state (name_of_reg reg)) i in
  [(Value v,state)]
let read_reg_field reg regfield =
  let (i,j) = register_field_indices reg regfield in
  read_reg_range reg i j
let read_reg_bitfield reg regfield =
  let (i,_) = register_field_indices reg regfield in
  read_reg_bit reg i *)

(*val read_regvalS : forall 'regs 'rv 'e.
  register_accessors 'regs 'rv -> string -> monadS 'regs 'rv 'e*)
val _ = Define `
 ((read_regvalS:(string -> 'regs -> 'rv option)#(string -> 'rv -> 'regs -> 'regs option) -> string -> 'regs sequential_state ->(('rv,'e)result#'regs sequential_state)set) (read, _) reg=  (bindS
  (readS (\ s .  read reg s.regstate)) (\x .  
  (case x of
        SOME v => returnS v
    | NONE => failS ( STRCAT "read_regvalS " reg)
  ))))`;


(*val write_regvalS : forall 'regs 'rv 'e.
  register_accessors 'regs 'rv -> string -> 'rv -> monadS 'regs unit 'e*)
val _ = Define `
 ((write_regvalS:(string -> 'regs -> 'rv option)#(string -> 'rv -> 'regs -> 'regs option) -> string -> 'rv -> 'regs sequential_state ->(((unit),'e)result#'regs sequential_state)set) (_, write) reg v=  (bindS
  (readS (\ s .  write reg v s.regstate)) (\x .  
  (case x of
        SOME rs' => updateS (\ s .  ( s with<| regstate := rs' |>))
    | NONE => failS ( STRCAT "write_regvalS " reg)
  ))))`;


(*val write_regS : forall 'regs 'rv 'a 'e. register_ref 'regs 'rv 'a -> 'a -> monadS 'regs unit 'e*)
val _ = Define `
 ((write_regS:('regs,'rv,'a)register_ref -> 'a -> 'regs sequential_state ->(((unit),'e)result#'regs sequential_state)set) reg v=
   (updateS (\ s .  ( s with<| regstate := (reg.write_to v s.regstate) |>))))`;


(* TODO
val update_reg : forall 'regs 'rv 'a 'b 'e. register_ref 'regs 'rv 'a -> ('a -> 'b -> 'a) -> 'b -> monadS 'regs unit 'e
let update_reg reg f v state =
  let current_value = get_reg state reg in
  let new_value = f current_value v in
  [(Value (), set_reg state reg new_value)]

let write_reg_field reg regfield = update_reg reg regfield.set_field

val update_reg_range : forall 'regs 'rv 'a 'b. Bitvector 'a, Bitvector 'b => register_ref 'regs 'rv 'a -> integer -> integer -> 'a -> 'b -> 'a
let update_reg_range reg i j reg_val new_val = set_bits (reg.is_inc) reg_val i j (bits_of new_val)
let write_reg_range reg i j = update_reg reg (update_reg_range reg i j)

let update_reg_pos reg i reg_val x = update_list reg.is_inc reg_val i x
let write_reg_pos reg i = update_reg reg (update_reg_pos reg i)

let update_reg_bit reg i reg_val bit = set_bit (reg.is_inc) reg_val i (to_bitU bit)
let write_reg_bit reg i = update_reg reg (update_reg_bit reg i)

let update_reg_field_range regfield i j reg_val new_val =
  let current_field_value = regfield.get_field reg_val in
  let new_field_value = set_bits (regfield.field_is_inc) current_field_value i j (bits_of new_val) in
  regfield.set_field reg_val new_field_value
let write_reg_field_range reg regfield i j = update_reg reg (update_reg_field_range regfield i j)

let update_reg_field_pos regfield i reg_val x =
  let current_field_value = regfield.get_field reg_val in
  let new_field_value = update_list regfield.field_is_inc current_field_value i x in
  regfield.set_field reg_val new_field_value
let write_reg_field_pos reg regfield i = update_reg reg (update_reg_field_pos regfield i)

let update_reg_field_bit regfield i reg_val bit =
  let current_field_value = regfield.get_field reg_val in
  let new_field_value = set_bit (regfield.field_is_inc) current_field_value i (to_bitU bit) in
  regfield.set_field reg_val new_field_value
let write_reg_field_bit reg regfield i = update_reg reg (update_reg_field_bit regfield i)*)

(* TODO Add Show typeclass for value and exception type *)
(*val show_result : forall 'a 'e. result 'a 'e -> string*)
val _ = Define `
 ((show_result:('a,'e)result -> string)= 
  (\x .  (case x of
               Value _ => "Value ()"
           | Ex (Failure msg) => STRCAT "Failure " msg
           | Ex (Throw _) => "Throw"
         )))`;


(*val prerr_results : forall 'a 'e 's. SetType 's => set (result 'a 'e * 's) -> unit*)
val _ = Define `
 ((prerr_results:(('a,'e)result#'s)set -> unit) rs=
   (let _ = (IMAGE (\p .  
  (case (p ) of ( (r, _) ) => let _ = (prerr_endline (show_result r)) in ()  )) rs) in
  () ))`;

val _ = export_theory()

