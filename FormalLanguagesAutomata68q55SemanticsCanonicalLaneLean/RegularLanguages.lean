import FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.Determinization

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure RegularLanguagePackage (N : NondeterministicAutomaton) where
  language : (N.inputAlphabet -> Prop) -> Prop
  recognizedByAutomaton : Bool
  regularExpression : Type
  pumpingLemmaApplication : Prop
  closureUnderUnion : Prop
  closureUnderConcatenation : Prop
  closureUnderKleeneStar : Prop
  closureUnderComplement : Prop
  closureUnderIntersection : Prop
  pumpingLemmaProof : Prop

structure RegularLanguageEvidence {N : NondeterministicAutomaton}
    (R : RegularLanguagePackage N) where
  recognizedByAutomatonClosed : R.recognizedByAutomaton
  closureUnderUnionClosed : R.closureUnderUnion
  closureUnderConcatenationClosed : R.closureUnderConcatenation
  closureUnderKleeneStarClosed : R.closureUnderKleeneStar
  closureUnderComplementClosed : R.closureUnderComplement
  closureUnderIntersectionClosed : R.closureUnderIntersection
  pumpingLemmaProofClosed : R.pumpingLemmaProof

def RegularLanguageClosed {N : NondeterministicAutomaton}
    (R : RegularLanguagePackage N) : Prop :=
  R.recognizedByAutomaton ∧ R.closureUnderUnion ∧ R.closureUnderConcatenation ∧
  R.closureUnderKleeneStar ∧ R.closureUnderComplement ∧ R.closureUnderIntersection ∧
  R.pumpingLemmaProof

theorem regular_language_closed_from_evidence
    {N : NondeterministicAutomaton} (R : RegularLanguagePackage N)
    (E : RegularLanguageEvidence R) : RegularLanguageClosed R := by
  exact And.intro E.recognizedByAutomatonClosed
    (And.intro E.closureUnderUnionClosed
      (And.intro E.closureUnderConcatenationClosed
        (And.intro E.closureUnderKleeneStarClosed
          (And.intro E.closureUnderComplementClosed
            (And.intro E.closureUnderIntersectionClosed
              E.pumpingLemmaProofClosed)))))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
