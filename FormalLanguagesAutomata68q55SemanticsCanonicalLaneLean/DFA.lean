import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonSemantics

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure DFAPackage extends AutomatonSemanticsPackage where
  deterministic : Prop
  deterministicClosed : deterministic

structure DFAEvidence (D : DFAPackage) where
  deterministicClosed : D.deterministic

def DFAClosed (D : DFAPackage) : Prop :=
  D.deterministic ∧ AutomatonSemanticsEvidence D.toAutomatonSemanticsPackage

theorem DFA_closed_from_evidence (D : DFAPackage) (E : DFAEvidence D) : DFAClosed D :=
  And.intro E.deterministicClosed (by
    exact {
      transitionFunctionDefined := fun s a => rfl
      initialStatesNonempty := by
        sorry
    })

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse