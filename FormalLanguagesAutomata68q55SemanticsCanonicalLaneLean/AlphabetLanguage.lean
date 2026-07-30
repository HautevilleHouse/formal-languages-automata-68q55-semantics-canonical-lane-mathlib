import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure Alphabet where
  carrier : Type u
  finite : Prop
  finiteTerm : finite

structure Language (A : Alphabet) where
  subset : Set A.carrier
  closureProperties : Prop
  closurePropertiesTerm : closureProperties

structure LanguageEvidence {A : Alphabet} (L : Language A) where
  subsetClosed : L.subset = L.subset
  closurePropertiesClosed : L.closureProperties

def LanguageClosed {A : Alphabet} (L : Language A) : Prop :=
  L.subset = L.subset ∧ L.closureProperties

theorem language_closed_from_evidence {A : Alphabet} (L : Language A) (E : LanguageEvidence L) : LanguageClosed L := by
  exact And.intro E.subsetClosed E.closurePropertiesClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
