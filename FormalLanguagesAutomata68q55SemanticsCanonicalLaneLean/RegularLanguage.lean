import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.FiniteAutomaton

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure RegularLanguagePackage (A : AlphabetPackage) (F : FiniteAutomatonPackage A) where
  recognizedLanguage : Set (List A.symbolType)
  languageAcceptedByAutomaton : recognizedLanguage = {w | ∃ q, F.acceptStates q ∧ (F.transitionFunction w) F.startState = q}
  closureProperties : Prop

structure RegularLanguageEvidence {A : AlphabetPackage} {F : FiniteAutomatonPackage A} (R : RegularLanguagePackage A F) where
  languageAcceptedClosed : R.languageAcceptedByAutomaton
  closurePropertiesClosed : R.closureProperties

def RegularLanguageClosed {A : AlphabetPackage} {F : FiniteAutomatonPackage A} (R : RegularLanguagePackage A F) : Prop :=
  R.languageAcceptedByAutomaton ∧ R.closureProperties

theorem regular_language_closed_from_evidence {A : AlphabetPackage} {F : FiniteAutomatonPackage A} (R : RegularLanguagePackage A F) (E : RegularLanguageEvidence R) : RegularLanguageClosed R :=
  And.intro E.languageAcceptedClosed E.closurePropertiesClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse