import FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

def ConstrainedAutomatonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_automaton_endgame (A : AdmissibleClass) :
    ConstrainedAutomatonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
