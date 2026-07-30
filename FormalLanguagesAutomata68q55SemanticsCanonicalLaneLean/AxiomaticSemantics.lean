import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure Assertion (Alphabet : Type u) where
  predicate : Type v
  satisfaction : (PrimitiveAutomaton Alphabet).states -> Prop
  precondition : Prop
  postcondition : Prop

structure AxiomaticSemanticsPackage (Alphabet : Type u)
    (A : PrimitiveAutomaton Alphabet) where
  hoareTriple : Assertion Alphabet -> A.transitions -> Assertion Alphabet -> Prop
  consequenceRule : Prop
  compositionRule : Prop
  iterationRule : Prop
  consequenceRuleClosed : consequenceRule
  compositionRuleClosed : compositionRule
  iterationRuleClosed : iterationRule

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
