import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.ContextFreeGrammar

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure PushdownAutomaton (A : Alphabet) where
  states : Type u
  finiteStates : Fintype states
  stackAlphabet : Type v
  finiteStackAlphabet : Fintype stackAlphabet
  startState : states
  acceptStates : Set states
  transitionFunction : A.carrier → states → stackAlphabet → Set (states × List stackAlphabet)
  nondeterministic : Prop
  nondeterministicTerm : nondeterministic

structure PDAEvidence {A : Alphabet} (P : PushdownAutomaton A) where
  nondeterministicClosed : P.nondeterministic
  finiteStatesClosed : Fintype.card P.states > 0
  finiteStackAlphabetClosed : Fintype.card P.stackAlphabet > 0

def PDAClosed {A : Alphabet} (P : PushdownAutomaton A) : Prop :=
  P.nondeterministic ∧ Fintype.card P.states > 0 ∧ Fintype.card P.stackAlphabet > 0

theorem pda_closed_from_evidence {A : Alphabet} (P : PushdownAutomaton A) (E : PDAEvidence P) : PDAClosed P := by
  exact And.intro E.nondeterministicClosed (And.intro E.finiteStatesClosed E.finiteStackAlphabetClosed)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
