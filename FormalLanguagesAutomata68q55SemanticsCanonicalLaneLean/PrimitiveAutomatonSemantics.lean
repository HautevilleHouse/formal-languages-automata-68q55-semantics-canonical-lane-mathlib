import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure PrimitiveAutomaton (Alphabet : Type u) where
  states : Type v
  transitions : states -> Alphabet -> states -> Prop
  initialState : states
  finalStates : Set states
  determinism : Prop
  determinismTerm : determinism

structure PrimitiveAutomatonFamily (Alphabet : Type u) (A : PrimitiveAutomaton Alphabet) where
  automatonParameter : Type w
  automatonFamily : automatonParameter -> PrimitiveAutomaton Alphabet
  familyContinuity : Prop
  familyContinuityTerm : familyContinuity

structure PrimitiveSemanticsDomain where
  alphabet : Type u
  words : Type v
  concatenation : words -> words -> words
  emptyWord : words
  concatenationAssociative : Prop
  emptyWordIdentity : Prop
  concatenationAssociativeTerm : concatenationAssociative
  emptyWordIdentityTerm : emptyWordIdentity

structure PrimitiveLanguage (Alphabet : Type u) (W : PrimitiveSemanticsDomain) where
  wordSet : Set W.words
  regular : Prop
  regularClosed : regular

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
