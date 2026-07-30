import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure Automaton (Q : Type u) (Σ : Type v) where
  transition : Q × Σ → Q
  start : Q
  accept : Set Q

def automatonClosed (A : Automaton Q Σ) : Prop := True

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
