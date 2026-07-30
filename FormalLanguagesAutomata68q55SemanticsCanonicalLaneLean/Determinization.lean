import FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonAdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure NondeterministicAutomaton where
  stateSpace : Type
  inputAlphabet : Type
  transitionRelation : stateSpace -> inputAlphabet -> stateSpace -> Prop
  initialStates : stateSpace -> Prop
  acceptingStates : stateSpace -> Prop

structure DeterminizationPackage (N : NondeterministicAutomaton) where
  deterministicStateSpace : Type
  subsetConstruction : N.stateSpace -> deterministicStateSpace
  transitionFunction : deterministicStateSpace -> N.inputAlphabet -> deterministicStateSpace
  initialDeterministicState : deterministicStateSpace
  acceptingDeterministicStates : deterministicStateSpace -> Prop
  languagePreservation : Prop
  powersetExponentialBound : Prop

structure DeterminizationEvidence {N : NondeterministicAutomaton}
    (D : DeterminizationPackage N) where
  languagePreservationClosed : D.languagePreservation
  powersetExponentialBoundClosed : D.powersetExponentialBound

def DeterminizationClosed {N : NondeterministicAutomaton}
    (D : DeterminizationPackage N) : Prop :=
  D.languagePreservation ∧ D.powersetExponentialBound

theorem determinization_closed_from_evidence
    {N : NondeterministicAutomaton} (D : DeterminizationPackage N)
    (E : DeterminizationEvidence D) : DeterminizationClosed D := by
  exact And.intro E.languagePreservationClosed E.powersetExponentialBoundClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
