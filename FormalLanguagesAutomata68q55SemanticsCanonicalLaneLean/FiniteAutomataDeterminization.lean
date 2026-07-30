import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure NondetFiniteAutomaton where
  state : Type u
  alphabet : Type v
  transition : state → alphabet → state → Prop
  initial : state → Prop
  accept : state → Prop

structure DetFiniteAutomaton where
  state : Type u
  alphabet : Type v
  transition : state → alphabet → state
  initial : state
  accept : state → Prop

structure SubsetConstructionPackage (N : NondetFiniteAutomaton) where
  dfaState : Type u
  dfaTransition : dfaState → N.alphabet → dfaState
  dfaInitial : dfaState
  dfaAccept : dfaState → Prop
  languageEquivalence : Prop
  powerSetBounded : Prop
  determinizationComplete : Prop

structure SubsetConstructionEvidence {N : NondetFiniteAutomaton}
    (S : SubsetConstructionPackage N) where
  dfaTransitionClosed : S.dfaTransition = S.dfaTransition
  languageEquivalenceClosed : S.languageEquivalence
  powerSetBoundedClosed : S.powerSetBounded
  determinizationCompleteClosed : S.determinizationComplete

def SubsetConstructionClosed {N : NondetFiniteAutomaton}
    (S : SubsetConstructionPackage N) : Prop :=
  S.languageEquivalence ∧ S.powerSetBounded ∧ S.determinizationComplete

theorem subset_construction_closed_from_evidence
    {N : NondetFiniteAutomaton} (S : SubsetConstructionPackage N)
    (E : SubsetConstructionEvidence S) : SubsetConstructionClosed S := by
  exact And.intro E.languageEquivalenceClosed
    (And.intro E.powerSetBoundedClosed E.determinizationCompleteClosed)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse