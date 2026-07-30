import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure ProcessCalculiPackage where
  processType : Type u
  actionSet : Type v
  operationalSemantics : processType → actionSet → processType → Prop
  bisimulation : processType → processType → Prop
  bisimulationEquivalence : Prop
  congruence : Prop

structure ProcessCalculiEvidence (P : ProcessCalculiPackage) where
  bisimulationEquivalenceClosed : P.bisimulationEquivalence
  congruenceClosed : P.congruence

def ProcessCalculiClosed (P : ProcessCalculiPackage) : Prop :=
  P.bisimulationEquivalence ∧ P.congruence

theorem process_calculi_closed_from_evidence
    (P : ProcessCalculiPackage) (E : ProcessCalculiEvidence P) :
    ProcessCalculiClosed P := by
  exact And.intro E.bisimulationEquivalenceClosed E.congruenceClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse