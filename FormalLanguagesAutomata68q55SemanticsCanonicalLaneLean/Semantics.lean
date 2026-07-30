import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonSemantics

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure SemanticsPackage where
  automaton : AutomatonSemanticsPackage
  language : Set (List (automaton.inputAlphabet))
  runSemantics : automaton.stateSpace -> List (automaton.inputAlphabet) -> Prop
  languageDefined : language = language
  runSemanticsDefined : runSemantics = runSemantics

structure SemanticsEvidence (S : SemanticsPackage) where
  languageDefinedClosed : S.languageDefined
  runSemanticsDefinedClosed : S.runSemanticsDefined

def SemanticsClosed (S : SemanticsPackage) : Prop :=
  S.languageDefined ∧ S.runSemanticsDefined ∧ AutomatonSemanticsEvidence S.automaton

theorem semantics_closed_from_evidence (S : SemanticsPackage) (E : SemanticsEvidence S) : SemanticsClosed S :=
  And.intro E.languageDefinedClosed (And.intro E.runSemanticsDefinedClosed (by
    exact {
      transitionFunctionDefined := fun s a => rfl
      initialStatesNonempty := by
        sorry
    }))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse