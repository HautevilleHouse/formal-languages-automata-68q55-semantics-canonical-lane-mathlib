import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure OmegaRegularLanguage (Σ : Type v) where
  language : Set (Stream Σ)
  buchiRecognizable : Prop
  mullerRecognizable : Prop

def omegaRegularClosed (L : OmegaRegularLanguage Σ) : Prop := L.buchiRecognizable ∧ L.mullerRecognizable

theorem omega_regular_consistent (L : OmegaRegularLanguage Σ) (h1 : L.buchiRecognizable) (h2 : L.mullerRecognizable) :
    omegaRegularClosed L := by
  exact And.intro h1 h2

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
