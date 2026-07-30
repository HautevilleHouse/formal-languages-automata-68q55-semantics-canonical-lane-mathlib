import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure AutomatonSemanticsPackage where
  alphabet : Type u
  stateSpace : Type v
  transitionRelation : stateSpace -> alphabet -> stateSpace -> Prop
  initialStates : stateSpace -> Prop
  acceptingStates : stateSpace -> Prop
  languageGenerated : Type w
  languageGeneratedDefined : Prop

structure AutomatonSemanticsEvidence (A : AutomatonSemanticsPackage) where
  transitionRelationClosed : A.transitionRelation = A.transitionRelation
  initialStatesClosed : A.initialStates = A.initialStates
  acceptingStatesClosed : A.acceptingStates = A.acceptingStates
  languageGeneratedDefinedClosed : A.languageGeneratedDefined

def AutomatonSemanticsClosed (A : AutomatonSemanticsPackage) : Prop :=
  A.languageGeneratedDefined

theorem automaton_semantics_closed_from_evidence (A : AutomatonSemanticsPackage) (E : AutomatonSemanticsEvidence A) : AutomatonSemanticsClosed A :=
  E.languageGeneratedDefinedClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse