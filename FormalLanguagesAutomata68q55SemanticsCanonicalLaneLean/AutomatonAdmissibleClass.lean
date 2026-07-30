import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonAdmittedObject where
  stateSpace : Type
  inputAlphabet : Type
  transitionRelation : stateSpace -> inputAlphabet -> stateSpace -> Prop
  initialStates : stateSpace -> Prop
  acceptingStates : stateSpace -> Prop
  deterministic : Prop
  acceptsLanguage : (inputAlphabet -> Prop) -> Prop
  semanticsWellDefined : Prop
  conclusion : semanticsWellDefined

structure AdmissibleClass where
  object : AutomatonAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  AutomatonWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
