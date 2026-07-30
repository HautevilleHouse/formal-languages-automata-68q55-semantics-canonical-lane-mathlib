import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.RegularLanguages

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure PumpingLemma (A : Alphabet) where
  language : Language A
  pumpingLength : ℕ
  property : ∀ w ∈ language.subset, |w| ≥ pumpingLength → (∃ x y z, w = x ++ y ++ z ∧ |y| > 0 ∧ ∀ i, x ++ (y ^ i) ++ z ∈ language.subset)
  propertyTerm : property

structure PumpingLemmaEvidence {A : Alphabet} (P : PumpingLemma A) where
  propertyClosed : P.property

def PumpingLemmaClosed {A : Alphabet} (P : PumpingLemma A) : Prop :=
  P.property

theorem pumping_lemma_closed_from_evidence {A : Alphabet} (P : PumpingLemma A) (E : PumpingLemmaEvidence P) : PumpingLemmaClosed P := by
  exact E.propertyClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
