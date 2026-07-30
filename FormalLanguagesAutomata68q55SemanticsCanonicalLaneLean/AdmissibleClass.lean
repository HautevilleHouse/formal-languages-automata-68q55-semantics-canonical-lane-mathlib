import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.SemanticsDomain

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AdmissibleClass where
  object : LanguageAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LanguageWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
