import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonSemantics

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure NFAPackage extends AutomatonSemanticsPackage where
  nondeterministic : Prop
  epsilonTransitions : Prop
  nondeterministicClosed : nondeterministic
  epsilonTransitionsClosed : epsilonTransitions

structure NFAEvidence (N : NFAPackage) where
  nondeterministicClosed : N.nondeterministic
  epsilonTransitionsClosed : N.epsilonTransitions

def NFAClosed (N : NFAPackage) : Prop :=
  N.nondeterministic ∧ N.epsilonTransitions ∧ AutomatonSemanticsEvidence N.toAutomatonSemanticsPackage

theorem NFA_closed_from_evidence (N : NFAPackage) (E : NFAEvidence N) : NFAClosed N :=
  And.intro (And.intro E.nondeterministicClosed E.epsilonTransitionsClosed) (by
    exact {
      transitionFunctionDefined := fun s a => rfl
      initialStatesNonempty := by
        sorry
    })

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse