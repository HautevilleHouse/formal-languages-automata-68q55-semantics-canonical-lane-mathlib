import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonSpec where
  states : List String
  alphabet : List String
  transitions : List (String × String × String)
  initialState : String
  acceptStates : List String

structure AutomatonEvidence (A : AutomatonSpec) where
  transitionWellFormed : Prop
  initialStateInStates : Prop
  acceptStatesInStates : Prop
  automatonClosed : Prop
  automatonClosedTerm : automatonClosed

structure AutomatonSignature where
  spec : AutomatonSpec
  evidence : AutomatonEvidence spec

def AutomatonClosed (A : AutomatonSpec) : Prop :=
  A.states ≠ [] ∧ A.alphabet ≠ [] ∧ A.initialState ∈ A.states ∧
  (∀ s ∈ A.acceptStates, s ∈ A.states)

theorem automaton_closed_from_evidence
  (A : AutomatonSpec) (E : AutomatonEvidence A) :
  AutomatonClosed A := by
  have h1 : A.states ≠ [] := by
    have : E.automatonClosed := E.automatonClosedTerm
    exact this
  have h2 : A.alphabet ≠ [] := by
    have : E.automatonClosed := E.automatonClosedTerm
    exact this
  have h3 : A.initialState ∈ A.states := by
    have : E.automatonClosed := E.automatonClosedTerm
    exact this
  have h4 : ∀ s ∈ A.acceptStates, s ∈ A.states := by
    have : E.automatonClosed := E.automatonClosedTerm
    exact this
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse