import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure DenotationalDomain (Alphabet : Type u) (W : PrimitiveSemanticsDomain Alphabet) where
  domain : Type v
  partialOrder : domain -> domain -> Prop
  leastElement : domain
  monotoneFunction : (domain -> domain) -> Prop
  fixedPoint : (domain -> domain) -> domain
  partialOrderClosed : partialOrder
  leastElementClosed : leastElement
  monotoneFunctionClosed : monotoneFunction
  fixedPointClosed : fixedPoint

structure DenotationalSemanticsPackage (Alphabet : Type u)
    (W : PrimitiveSemanticsDomain Alphabet) (D : DenotationalDomain Alphabet W) where
  meaningFunction : W.words -> D.domain
  compositionality : Prop
  compositionalityTerm : compositionality

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
