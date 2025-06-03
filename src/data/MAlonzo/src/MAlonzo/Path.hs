module MAlonzo.Path where

-- ok so here's the deal
{-
  IUniv : SSet₁
  I : IUniv
  IsOne : I → SSet
  1=1 : IsOne i1
  leftIs1  : ∀ i j → IsOne i → IsOne (i ∨ j)
  rightIs1 : ∀ i j → IsOne j → IsOne (i ∨ j)

  Partial : ∀ {l} (φ : I) (A : Type l) → SSet l
    Partial i A <: .(IsOne φ) → A

  PartialP : ∀ {l} (φ : I) (A : .(@finite o : IsOne φ) → Type l) → SSet l
    PartialP i P <: .(IsOne φ) → (P φ)

  PathP : ∀ {ℓ} (A : I → Type ℓ) → A i0 → A i1 → Type ℓ
  primTransp : ∀ {ℓ} (A : (i : I) → Type (ℓ i)) (φ : I) (a : A i0) → A i1
  primHComp  : ∀ {ℓ} {A : Type ℓ} {φ : I} (u : ∀ i → Partial φ A) (a : A) → A
  primComp : ∀ {ℓ} (A : (i : I) → Type (ℓ i)) {φ : I} (u : ∀ i → Partial φ (A i)) (a : A i0) → A i1

  isOneEmpty : ∀ {ℓ} {A : Partial i0 (Type ℓ)} → PartialP i0 A

  -- why
  primPOr : ∀ {ℓ} (i j : I) {A : Partial (i ∨ j) (Type ℓ)}
          → (u : PartialP i (λ z → A (leftIs1 i j z)))
          → (v : PartialP j (λ z → A (rightIs1 i j z)))
          → PartialP (i ∨ j) A


  -- sub
  Sub  : ∀ {a} (A : Type a) (φ : I) → Partial φ A → SSet a
  inS  : ∀ {ℓ} {A : Type ℓ} {φ} (x : A) → Sub A φ (λ _ → x)
  outS : ∀ {ℓ} {A : Type ℓ} {φ : I} {u : Partial φ A} → Sub A φ u → A
    outS (inS v) = v
    inS (outS v) = v 
    outS v = u 1=1 when r = i1
-}


-- but what do we currently have?
{-
 [[ I          ]] |-> Bool
 [[ IMin       ]] |-> \i j -> i && j
 [[ IMax       ]] |-> \i j -> i || j
 [[ INot       ]] |-> \i -> not i
 [[ IsOne      ]] |-> \i -> ()
 [[ 1=1        ]] |-> ()
 [[ Partial    ]] |-> \l i a -> a
 [[ PartialP   ]] |-> \l i a -> a
 [[ PathP      ]] |-> \l A a b -> ()
 [[ PrimTrans  ]] |-> \l p i x -> x
 [[ PrimHComp  ]] |-> \l A i p x -> x
 [[ isOneEmpty ]] |-> \l A () -> A ()
 [[ primPOr    ]] |-> \l i j A x y -> if i then x else y
 [[ Sub        ]] |-> \l A i P -> ()
 -}


-- what could this be?
{-
 [[ PathP      ]] |-> \l A a b -> k :: (forall a.   -> 

 [[ I          ]] |-> Bool
 [[ IMin       ]] |-> \i j -> i && j
 [[ IMax       ]] |-> \i j -> i || j
 [[ INot       ]] |-> \i -> not i
 [[ IsOne      ]] |-> \i -> ()
 [[ 1=1        ]] |-> ()
 [[ Partial    ]] |-> \l i a -> a
 [[ PartialP   ]] |-> \l i a -> a
 [[ PrimTrans  ]] |-> \l p i x -> x
 [[ PrimHComp  ]] |-> \l A i p x -> x
 [[ isOneEmpty ]] |-> \l A () -> A ()
 [[ primPOr    ]] |-> \l i j A x y -> if i then x else y
 [[ Sub        ]] |-> \l A i P -> ()
-}
