import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure DenotationalSemanticsPackage where
  syntax : Type u
  domain : Type v
  interpretation : syntax -> domain
  compositionality : Prop
  adequacy : Prop
  fullAbstraction : Prop

structure DenotationalSemanticsEvidence (D : DenotationalSemanticsPackage) where
  interpretationClosed : D.interpretation = D.interpretation
  compositionalityClosed : D.compositionality
  adequacyClosed : D.adequacy
  fullAbstractionClosed : D.fullAbstraction

def DenotationalSemanticsClosed (D : DenotationalSemanticsPackage) : Prop :=
  D.compositionality ∧ D.adequacy ∧ D.fullAbstraction

theorem denotational_semantics_closed_from_evidence (D : DenotationalSemanticsPackage) (E : DenotationalSemanticsEvidence D) : DenotationalSemanticsClosed D :=
  And.intro E.compositionalityClosed (And.intro E.adequacyClosed E.fullAbstractionClosed)

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse