import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure PumpingLemmaPackage (L : Language) where
  pumpingLength : ℕ
  decompositionExists : Prop
  decompositionProperty : Prop
  contradictionForNonRegular : Prop

structure PumpingLemmaEvidence {L : Language}
    (P : PumpingLemmaPackage L) where
  pumpingLengthClosed : P.pumpingLength = P.pumpingLength
  decompositionExistsClosed : P.decompositionExists
  decompositionPropertyClosed : P.decompositionProperty
  contradictionForNonRegularClosed : P.contradictionForNonRegular

def PumpingLemmaClosed {L : Language} (P : PumpingLemmaPackage L) : Prop :=
  P.decompositionExists ∧ P.decompositionProperty ∧ P.contradictionForNonRegular

theorem pumping_lemma_closed_from_evidence {L : Language}
    (P : PumpingLemmaPackage L) (E : PumpingLemmaEvidence P) :
    PumpingLemmaClosed P := by
  exact And.intro E.decompositionExistsClosed
    (And.intro E.decompositionPropertyClosed E.contradictionForNonRegularClosed)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse