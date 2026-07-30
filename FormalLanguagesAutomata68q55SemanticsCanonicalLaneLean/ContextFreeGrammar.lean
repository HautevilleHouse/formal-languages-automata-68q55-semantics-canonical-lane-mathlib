import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AlphabetLanguage

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure ContextFreeGrammar (A : Alphabet) where
  nonterminals : Type u
  finiteNonterminals : Fintype nonterminals
  startSymbol : nonterminals
  productions : nonterminals → List (List (A.carrier ⊕ nonterminals))
  productionsTerm : ∀ n, productions n ≠ []

structure GrammarEvidence {A : Alphabet} (G : ContextFreeGrammar A) where
  finiteNonterminalsClosed : Fintype.card G.nonterminals > 0
  productionsClosed : ∀ n, G.productions n ≠ []

def GrammarClosed {A : Alphabet} (G : ContextFreeGrammar A) : Prop :=
  Fintype.card G.nonterminals > 0 ∧ ∀ n, G.productions n ≠ []

theorem grammar_closed_from_evidence {A : Alphabet} (G : ContextFreeGrammar A) (E : GrammarEvidence G) : GrammarClosed G := by
  exact And.intro E.finiteNonterminalsClosed E.productionsClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
