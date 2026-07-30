import FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
