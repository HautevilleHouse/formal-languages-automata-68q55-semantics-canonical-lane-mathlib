import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.Determinization

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure MinimizationPackage (A : AlphabetPackage) (F : FiniteAutomatonPackage A) (R : RegularLanguagePackage A F) (D : DeterminizationPackage A F R) where
  minimalAutomaton : FiniteAutomatonPackage A
  minimalityProperty : minimalAutomaton.stateSpace ≃ MinimalStateType
  minimalEquivalent : minimalAutomaton.recognizedLanguage = R.recognizedLanguage

structure MinimalStateType where
  carrier : Type
  quotientByEquivalence : Prop

structure MinimizationEvidence {A : AlphabetPackage} {F : FiniteAutomatonPackage A} {R : RegularLanguagePackage A F} {D : DeterminizationPackage A F R} (M : MinimizationPackage A F R D) where
  minimalityPropertyClosed : M.minimalityProperty
  minimalEquivalentClosed : M.minimalEquivalent

def MinimizationClosed {A : AlphabetPackage} {F : FiniteAutomatonPackage A} {R : RegularLanguagePackage A F} {D : DeterminizationPackage A F R} (M : MinimizationPackage A F R D) : Prop :=
  M.minimalityProperty ∧ M.minimalEquivalent

theorem minimization_closed_from_evidence {A : AlphabetPackage} {F : FiniteAutomatonPackage A} {R : RegularLanguagePackage A F} {D : DeterminizationPackage A F R} (M : MinimizationPackage A F R D) (E : MinimizationEvidence M) : MinimizationClosed M :=
  And.intro E.minimalityPropertyClosed E.minimalEquivalentClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse