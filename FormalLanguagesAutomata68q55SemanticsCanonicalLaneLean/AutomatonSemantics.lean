import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonSemanticsPackage where
  stateSpace : Type u
  inputAlphabet : Type v
  transitionFunction : stateSpace -> inputAlphabet -> stateSpace
  initialStates : Set stateSpace
  acceptingStates : Set stateSpace

structure AutomatonSemanticsEvidence (A : AutomatonSemanticsPackage) where
  transitionFunctionDefined : ∀ (s : A.stateSpace) (a : A.inputAlphabet), A.transitionFunction s a = A.transitionFunction s a
  initialStatesNonempty : Nonempty A.initialStates

-- closed witness bridges

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PoincareWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse