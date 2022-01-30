From Coq Require Import List ZArith.Int.
From Coq Require Import Program.Program.
From Coq Require Import ssreflect.

From Hammer Require Import Hammer Tactics.

From QuickChick Require Import QuickChick.

Require Import String Ascii.
Require Import NArith Arith.PeanoNat Bool.
Require Import ZArith ZArith.BinIntDef ZArith.Zdiv.

Definition is_in_range (s e c : nat) : bool :=
  andb (s <=? c) (c <=? e).

Definition is_in_range_char (s e c : ascii) : bool :=
  is_in_range (nat_of_ascii s) (nat_of_ascii e) (nat_of_ascii c).

Definition Z_of_ascii (c : ascii) : Z := Z_of_nat (nat_of_ascii c).

(** Utils for strings *)
Definition is_lower : ascii -> bool :=
  is_in_range_char "a" "z".

Definition is_upper : ascii -> bool :=
  is_in_range_char "A" "Z".

Definition is_alpha (c : ascii) : bool := is_upper c || is_lower c.

Definition ascii_diff_nat (a b : ascii) : Z := Z_of_ascii b - Z_of_ascii a.

Definition lower_char_ascii_diff : ascii -> Z := ascii_diff_nat "a".

Definition upper_char_ascii_diff : ascii -> Z := ascii_diff_nat "A".

Definition ascii_add (c : ascii) (offset : Z) : ascii :=
  ascii_of_nat (Z.abs_nat ((Z_of_ascii c) + offset)).

Definition lower_start_offset : Z -> ascii := ascii_add "a".

Definition upper_start_offset : Z -> ascii := ascii_add "A".

Definition shift_ascii (offset : Z) (c : ascii) : ascii :=
  match is_alpha c, is_upper c with
  | true, false => lower_start_offset ((lower_char_ascii_diff c + offset) mod 26)
  | true, true  => upper_start_offset ((upper_char_ascii_diff c + offset) mod 26)
  | _   , _     => c
  end.

Lemma shift_char_0 : forall (c : ascii), shift_ascii 0 c = c.
Proof.
  move => [].
  move => [] [] [] [] [] [] [] []; by trivial.
Qed.


(* Theorem shift_iso : *)
(*   forall (n : Z) (c : ascii), *)
(*     shift_ascii (-n) (shift_ascii n c) *)
(*   = c. *)
(* Proof. *)
(*   move => n []. *)
(*   move => [] [] [] [] [] [] [] []. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   ssimpl. *)
(*   - unfold shift_ascii. *)
(* Qed. *)

Definition encode (offset : Z) (text : string) : string :=
  (string_of_list_ascii
     (List.map (shift_ascii offset) (list_ascii_of_string text))).

Definition decode (offset : Z) : string -> string :=
  encode (-offset).

(* Theorem enc_and_dec_is_inverse : *)
(*   forall (n : Z) (text : string), text = decode n (encode n text). *)
(* Proof. *)
(*   move => n text. *)
(*   unfold decode. *)
(*   unfold encode. *)
(*   unfold shift_ascii. *)
(*   sauto. *)

(* Qed. *)
