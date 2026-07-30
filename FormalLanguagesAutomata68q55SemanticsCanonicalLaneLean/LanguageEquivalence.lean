import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.DFA
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.NFA

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure LanguageEquivalencePackage where
  dfa : DFAPackage
  nfa : NFAPackage
  languagesEqual : Prop
  dfaLanguage : Set (List (dfa.inputAlphabet))
  nfaLanguage : Set (List (nfa.inputAlphabet))
  languagesEqualClosed : languagesEqual

structure LanguageEquivalenceEvidence (L : LanguageEquivalencePackage) where
  languagesEqualClosed : L.languagesEqual
  dfaLanguageDefined : L.dfaLanguage = L.dfaLanguage
  nfaLanguageDefined : L.nfaLanguage = L.nfaLanguage

def LanguageEquivalenceClosed (L : LanguageEquivalencePackage) : Prop :=
  L.languagesEqual ∧ DFAClosed L.dfa ∧ NFAClosed L.nfa

theorem language_equivalence_closed_from_evidence (L : LanguageEquivalencePackage) (E : LanguageEquivalenceEvidence L) : LanguageEquivalenceClosed L :=
  And.intro E.languagesEqualClosed (And.intro (by
    exact DFA_closed_from_evidence L.dfa {
      deterministicClosed := L.dfa.deterministicClosed
    }) (by
    exact NFA_closed_from_evidence L.nfa {
      nondeterministicClosed := L.nfa.nondeterministicClosed
      epsilonTransitionsClosed := L.nfa.epsilonTransitionsClosed
    }))

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse