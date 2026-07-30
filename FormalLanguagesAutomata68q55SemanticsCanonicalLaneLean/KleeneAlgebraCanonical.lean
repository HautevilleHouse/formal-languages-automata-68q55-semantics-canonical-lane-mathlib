import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure KleeneAlgebraCanonicalPackage {A : AutomatonAlgebra} where
  orderDefined : Prop
  monotonePlus : Prop
  monotoneTimes : Prop
  starFixpoint : Prop
  starLeastFixedPoint : Prop

structure KleeneAlgebraCanonicalEvidence {A : AutomatonAlgebra}
    (K : KleeneAlgebraCanonicalPackage A) where
  orderDefinedClosed : K.orderDefined
  monotonePlusClosed : K.monotonePlus
  monotoneTimesClosed : K.monotoneTimes
  starFixpointClosed : K.starFixpoint
  starLeastFixedPointClosed : K.starLeastFixedPoint

def KleeneAlgebraCanonicalClosed {A : AutomatonAlgebra}
    (K : KleeneAlgebraCanonicalPackage A) : Prop :=
  K.orderDefined ∧ K.monotonePlus ∧ K.monotoneTimes ∧
  K.starFixpoint ∧ K.starLeastFixedPoint

theorem kleene_algebra_canonical_closed_from_evidence
    {A : AutomatonAlgebra} (K : KleeneAlgebraCanonicalPackage A)
    (E : KleeneAlgebraCanonicalEvidence K) : KleeneAlgebraCanonicalClosed K := by
  exact And.intro E.orderDefinedClosed
    (And.intro E.monotonePlusClosed
      (And.intro E.monotoneTimesClosed
        (And.intro E.starFixpointClosed E.starLeastFixedPointClosed)))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse