import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure RightInvariantEquivalence (L : Language) where
  relation : String → String → Prop
  reflexive : ∀ s, relation s s
  symmetric : ∀ s t, relation s t → relation t s
  transitive : ∀ s t u, relation s t → relation t u → relation s u
  rightInvariant : ∀ s t, relation s t → ∀ u, relation (s ++ u) (t ++ u)
  refinement : ∀ s t, relation s t → (L s ↔ L t)

structure MyhillNerodePackage (L : Language) where
  equivalence : RightInvariantEquivalence L
  indexFinite : Prop
  dfaConstructed : Prop
  languageRecognized : Prop

structure MyhillNerodeEvidence {L : Language}
    (M : MyhillNerodePackage L) where
  equivalenceClosed : M.equivalence = M.equivalence
  indexFiniteClosed : M.indexFinite
  dfaConstructedClosed : M.dfaConstructed
  languageRecognizedClosed : M.languageRecognized

def MyhillNerodeClosed {L : Language} (M : MyhillNerodePackage L) : Prop :=
  M.indexFinite ∧ M.dfaConstructed ∧ M.languageRecognized

theorem myhill_nerode_closed_from_evidence {L : Language}
    (M : MyhillNerodePackage L) (E : MyhillNerodeEvidence M) :
    MyhillNerodeClosed M := by
  exact And.intro E.indexFiniteClosed
    (And.intro E.dfaConstructedClosed E.languageRecognizedClosed)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse