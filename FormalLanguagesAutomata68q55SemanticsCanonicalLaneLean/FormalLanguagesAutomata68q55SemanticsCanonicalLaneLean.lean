import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonObject where
  carrier : Type
  transition : carrier → carrier → Prop
  initial : carrier → Prop
  final : carrier → Prop

structure AdmittedAutomaton where
  object : AutomatonObject
  deterministic : Prop
  total : Prop
  conclusion : deterministic ∧ total

structure AdmissibleClass where
  object : AdmittedAutomaton
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.deterministic ∧ A.object.total) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse