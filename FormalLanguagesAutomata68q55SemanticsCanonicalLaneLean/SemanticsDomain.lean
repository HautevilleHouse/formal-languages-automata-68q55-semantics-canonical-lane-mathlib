import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.ChomskyHierarchy

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure DomainTheory where
  scottDomain : Type u
  continuousFunctions : Type v
  fixedPointExistence : ∀ f : continuousFunctions, ∃ x : scottDomain, f x = x
  fixedPointExistenceTerm : fixedPointExistence

structure DomainEvidence (D : DomainTheory) where
  fixedPointExistenceClosed : D.fixedPointExistence

def DomainClosed (D : DomainTheory) : Prop :=
  D.fixedPointExistence

theorem domain_closed_from_evidence (D : DomainTheory) (E : DomainEvidence D) : DomainClosed D := by
  exact E.fixedPointExistenceClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
