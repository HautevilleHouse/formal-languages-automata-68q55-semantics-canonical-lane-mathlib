import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure OperationalSemanticsPackage where
  configurations : Type u
  initialConfigurations : configurations -> Prop
  finalConfigurations : configurations -> Prop
  transitionRelation : configurations -> configurations -> Prop
  determinism : Prop
  termination : Prop

structure OperationalSemanticsEvidence (O : OperationalSemanticsPackage) where
  transitionClosed : O.transitionRelation = O.transitionRelation
  initialClosed : O.initialConfigurations = O.initialConfigurations
  finalClosed : O.finalConfigurations = O.finalConfigurations
  determinismClosed : O.determinism
  terminationClosed : O.termination

def OperationalSemanticsClosed (O : OperationalSemanticsPackage) : Prop :=
  O.determinism ∧ O.termination

theorem operational_semantics_closed_from_evidence (O : OperationalSemanticsPackage) (E : OperationalSemanticsEvidence O) : OperationalSemanticsClosed O :=
  And.intro E.determinismClosed E.terminationClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse