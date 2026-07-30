import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.RegularLanguages
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.ContextFreeGrammar
import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.PushdownAutomaton

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure ChomskyLevel where
  level : ℕ
  description : String
  automatonType : String
  grammarType : String
  levelTerm : level ≤ 3
  descriptionTerm : description ≠ ""

structure ChomskyHierarchy where
  regular : ChomskyLevel
  contextFree : ChomskyLevel
  contextSensitive : ChomskyLevel
  recursivelyEnumerable : ChomskyLevel
  levelsOrdered : regular.level < contextFree.level ∧ contextFree.level < contextSensitive.level ∧ contextSensitive.level < recursivelyEnumerable.level
  levelsOrderedTerm : levelsOrdered

structure HierarchyEvidence (H : ChomskyHierarchy) where
  levelsOrderedClosed : H.levelsOrdered

def HierarchyClosed (H : ChomskyHierarchy) : Prop :=
  H.levelsOrdered

theorem hierarchy_closed_from_evidence (H : ChomskyHierarchy) (E : HierarchyEvidence H) : HierarchyClosed H := by
  exact E.levelsOrderedClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
