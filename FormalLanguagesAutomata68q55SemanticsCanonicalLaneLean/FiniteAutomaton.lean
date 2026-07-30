import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AlphabetLanguage

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure FiniteAutomaton (A : Alphabet) where
  states : Type u
  finiteStates : Fintype states
  startState : states
  acceptStates : Set states
  transitionFunction : A.carrier → states → states
  deterministic : Prop
  deterministicTerm : deterministic

structure AutomatonEvidence {A : Alphabet} (M : FiniteAutomaton A) where
  deterministicClosed : M.deterministic
  finiteStatesClosed : Fintype.card M.states > 0

def AutomatonClosed {A : Alphabet} (M : FiniteAutomaton A) : Prop :=
  M.deterministic ∧ Fintype.card M.states > 0

theorem automaton_closed_from_evidence {A : Alphabet} (M : FiniteAutomaton A) (E : AutomatonEvidence M) : AutomatonClosed M := by
  exact And.intro E.deterministicClosed E.finiteStatesClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
