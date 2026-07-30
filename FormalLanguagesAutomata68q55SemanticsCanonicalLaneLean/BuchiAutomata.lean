import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure BuchiAutomaton (Q : Type u) (Σ : Type v) where
  transition : Q × Σ → Set Q
  start : Q
  accept : Set Q

def language (A : BuchiAutomaton Q Σ) : Set (Stream Σ) := { w | ∃ run : Stream Q, run.head = A.start ∧ ∀ n, run.tail n ∈ A.transition (run n, w n) ∧ inf ran run ∩ A.accept ≠ ∅ }

def BuchiComplementProblem (A : BuchiAutomaton Q Σ) (B : BuchiAutomaton Q' Σ) : Prop :=
  language B = (Set.univ : Set (Stream Σ)) \ language A

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
