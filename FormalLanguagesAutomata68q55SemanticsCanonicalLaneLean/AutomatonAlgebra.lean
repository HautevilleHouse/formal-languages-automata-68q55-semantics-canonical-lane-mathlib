import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonAlgebra where
  carrier : Type u
  plus : carrier → carrier → carrier
  times : carrier → carrier → carrier
  star : carrier → carrier
  plusAssoc : ∀ a b c : carrier, plus (plus a b) c = plus a (plus b c)
  plusComm : ∀ a b : carrier, plus a b = plus b a
  plusIdem : ∀ a : carrier, plus a a = a
  timesAssoc : ∀ a b c : carrier, times (times a b) c = times a (times b c)
  distrLeft : ∀ a b c : carrier, times a (plus b c) = plus (times a b) (times a c)
  distrRight : ∀ a b c : carrier, times (plus a b) c = plus (times a c) (times b c)
  starUnfold : ∀ a : carrier, star a = plus (times (star a) a) a
  starRefine : ∀ a : carrier, star a = plus (times a (star a)) a

structure AutomatonAlgebraEvidence (A : AutomatonAlgebra) where
  plusAssocClosed : A.plusAssoc
  plusCommClosed : A.plusComm
  plusIdemClosed : A.plusIdem
  timesAssocClosed : A.timesAssoc
  distrLeftClosed : A.distrLeft
  distrRightClosed : A.distrRight
  starUnfoldClosed : A.starUnfold
  starRefineClosed : A.starRefine

def AutomatonAlgebraClosed (A : AutomatonAlgebra) : Prop :=
  A.plusAssoc ∧ A.plusComm ∧ A.plusIdem ∧ A.timesAssoc ∧
  A.distrLeft ∧ A.distrRight ∧ A.starUnfold ∧ A.starRefine

theorem automaton_algebra_closed_from_evidence (A : AutomatonAlgebra)
    (E : AutomatonAlgebraEvidence A) : AutomatonAlgebraClosed A := by
  exact And.intro E.plusAssocClosed
    (And.intro E.plusCommClosed
      (And.intro E.plusIdemClosed
        (And.intro E.timesAssocClosed
          (And.intro E.distrLeftClosed
            (And.intro E.distrRightClosed
              (And.intro E.starUnfoldClosed E.starRefineClosed))))))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse