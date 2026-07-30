import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure RegularExpressionSemantics where
  languageMap : RegularExpression → Language
  unionInterpretation : Prop
  concatenationInterpretation : Prop
  starInterpretation : Prop
  emptyLanguage : Prop
  singletonLanguage : Prop

structure RegularExpressionSemanticsEvidence
    (R : RegularExpressionSemantics) where
  unionInterpretationClosed : R.unionInterpretation
  concatenationInterpretationClosed : R.concatenationInterpretation
  starInterpretationClosed : R.starInterpretation
  emptyLanguageClosed : R.emptyLanguage
  singletonLanguageClosed : R.singletonLanguage

def RegularExpressionSemanticsClosed (R : RegularExpressionSemantics) : Prop :=
  R.unionInterpretation ∧ R.concatenationInterpretation ∧
  R.starInterpretation ∧ R.emptyLanguage ∧ R.singletonLanguage

theorem regular_expression_semantics_closed_from_evidence
    (R : RegularExpressionSemantics) (E : RegularExpressionSemanticsEvidence R) :
    RegularExpressionSemanticsClosed R := by
  exact And.intro E.unionInterpretationClosed
    (And.intro E.concatenationInterpretationClosed
      (And.intro E.starInterpretationClosed
        (And.intro E.emptyLanguageClosed E.singletonLanguageClosed)))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse