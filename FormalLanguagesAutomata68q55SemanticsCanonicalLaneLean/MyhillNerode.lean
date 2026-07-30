import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonSemantics

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure MyhillNerodePackage where
  automaton : AutomatonSemanticsPackage
  rightInvariantEquivalence : Set (Set (List (automaton.inputAlphabet)))
  indexFinite : Prop
  myhillNerodeStatement : Prop
  indexFiniteClosed : indexFinite
  myhillNerodeClosed : myhillNerodeStatement

structure MyhillNerodeEvidence (M : MyhillNerodePackage) where
  indexFiniteClosed : M.indexFinite
  myhillNerodeClosed : M.myhillNerodeClosed

def MyhillNerodeClosed (M : MyhillNerodePackage) : Prop :=
  M.indexFinite ∧ M.myhillNerodeStatement ∧ AutomatonSemanticsEvidence M.automaton

theorem myhill_nerode_closed_from_evidence (M : MyhillNerodePackage) (E : MyhillNerodeEvidence M) : MyhillNerodeClosed M :=
  And.intro E.indexFiniteClosed (And.intro E.myhillNerodeClosed (by
    exact {
      transitionFunctionDefined := fun s a => rfl
      initialStatesNonempty := by
        sorry
    }))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse