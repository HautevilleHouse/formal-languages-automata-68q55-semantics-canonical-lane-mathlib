import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure FormalLanguagePackage where
  alphabet : Type u
  language : Set (List alphabet)
  closureProperties : Prop
  pumpingLemmaHolds : Prop
  myhillNerodeRelation : Prop

structure FormalLanguageEvidence (L : FormalLanguagePackage) where
  closurePropertiesClosed : L.closureProperties
  pumpingLemmaHoldsClosed : L.pumpingLemmaHolds
  myhillNerodeRelationClosed : L.myhillNerodeRelation

def FormalLanguageClosed (L : FormalLanguagePackage) : Prop :=
  L.closureProperties ∧ L.pumpingLemmaHolds ∧ L.myhillNerodeRelation

theorem formal_language_closed_from_evidence (L : FormalLanguagePackage)
    (E : FormalLanguageEvidence L) : FormalLanguageClosed L := by
  exact And.intro E.closurePropertiesClosed
    (And.intro E.pumpingLemmaHoldsClosed E.myhillNerodeRelationClosed)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse