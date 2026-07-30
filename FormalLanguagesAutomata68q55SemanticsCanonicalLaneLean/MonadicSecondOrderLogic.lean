import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

inductive MSOFormula (Σ : Type v) : Type
| existsFO : (Nat → Σ) → MSOFormula Σ
| existsSO : (Set Nat → MSOFormula Σ) → MSOFormula Σ
| and : MSOFormula Σ → MSOFormula Σ → MSOFormula Σ
| not : MSOFormula Σ → MSOFormula Σ

def MSOtoAutomaton {Q : Type u} (φ : MSOFormula Σ) : BuchiAutomaton Q Σ := sorry

def MSOClosed (φ : MSOFormula Σ) (A : BuchiAutomaton Q Σ) : Prop :=
  language A = { w | φ.models w }

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
