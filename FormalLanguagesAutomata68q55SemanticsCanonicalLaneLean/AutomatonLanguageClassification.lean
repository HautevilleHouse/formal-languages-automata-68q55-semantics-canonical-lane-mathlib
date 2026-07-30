import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonSemanticsPackage

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonLanguageClassificationPackage (P : AutomatonSemanticsPackage) where
  languageFamily : Type
  regularLanguages : Prop
  contextFreeLanguages : Prop
  contextSensitiveLanguages : Prop
  recursivelyEnumerableLanguages : Prop
  chomskyHierarchyInclusion : regularLanguages → contextFreeLanguages → contextSensitiveLanguages → recursivelyEnumerableLanguages

structure AutomatonLanguageClassificationEvidence {P : AutomatonSemanticsPackage}
    (C : AutomatonLanguageClassificationPackage P) where
  regularClosed : C.regularLanguages
  contextFreeClosed : C.contextFreeLanguages
  contextSensitiveClosed : C.contextSensitiveLanguages
  recursivelyEnumerableClosed : C.recursivelyEnumerableLanguages
  hierarchyClosed : C.chomskyHierarchyInclusion

def AutomatonLanguageClassificationClosed {P : AutomatonSemanticsPackage}
    (C : AutomatonLanguageClassificationPackage P) : Prop :=
  C.regularLanguages ∧ C.contextFreeLanguages ∧ C.contextSensitiveLanguages ∧
  C.recursivelyEnumerableLanguages ∧ C.chomskyHierarchyInclusion C.regularLanguages C.contextFreeLanguages C.contextSensitiveLanguages

theorem automaton_language_classification_closed_from_evidence
    {P : AutomatonSemanticsPackage} (C : AutomatonLanguageClassificationPackage P)
    (E : AutomatonLanguageClassificationEvidence C) : AutomatonLanguageClassificationClosed C := by
  refine And.intro E.regularClosed (And.intro E.contextFreeClosed (And.intro E.contextSensitiveClosed (And.intro E.recursivelyEnumerableClosed ?_)))
  exact E.hierarchyClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse