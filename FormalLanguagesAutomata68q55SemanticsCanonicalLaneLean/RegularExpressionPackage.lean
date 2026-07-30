import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

inductive RegularExpression (α : Type u) : Type u where
  | empty : RegularExpression α
  | epsilon : RegularExpression α
  | symbol : α → RegularExpression α
  | union : RegularExpression α → RegularExpression α → RegularExpression α
  | concatenation : RegularExpression α → RegularExpression α → RegularExpression α
  | star : RegularExpression α → RegularExpression α

def denotes {α : Type u} : RegularExpression α → Set (List α) := by
  intro r
  induction r with
  | empty => exact ∅
  | epsilon => exact {[]}
  | symbol a => exact {[a]}
  | union r1 r2 ih1 ih2 => exact ih1 ∪ ih2
  | concatenation r1 r2 ih1 ih2 => exact {w1 ++ w2 | w1 ∈ ih1, w2 ∈ ih2}
  | star r ih => exact {w | ∃ (ws : List (List α)), (∀ w' ∈ ws, w' ∈ ih) ∧ w = ws.join}

structure RegularExpressionPackage (α : Type u) where
  regex : RegularExpression α
  language : Set (List α)
  correctnessProof : denotes regex = language

def RegularExpressionClosed {α : Type u} (R : RegularExpressionPackage α) : Prop :=
  denotes R.regex = R.language

theorem regular_expression_closed {α : Type u} (R : RegularExpressionPackage α) :
    RegularExpressionClosed R := R.correctnessProof

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse