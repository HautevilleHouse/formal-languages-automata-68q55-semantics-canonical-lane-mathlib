import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure InterpretedDomain (Alphabet : Type u) (W : PrimitiveSemanticsDomain Alphabet) where
  denotation : W.words -> Type v
  compositionality : Prop
  denotationClosed : denotation
  compositionalityClosed : compositionality

structure SemanticFunctor (Alphabet : Type u) (W : PrimitiveSemanticsDomain Alphabet)
    (D : InterpretedDomain Alphabet W) where
  fromWord : W.words -> D.denotation
  preservesConcatenation : Prop
  preservesConcatenationTerm : preservesConcatenation

structure SemanticInterpretationPackage (Alphabet : Type u) (W : PrimitiveSemanticsDomain Alphabet)
    (D : InterpretedDomain Alphabet W) where
  denotationMapping : Type v
  denotationMappingDefined : Prop
  denotationMappingDefinedTerm : denotationMappingDefined

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
