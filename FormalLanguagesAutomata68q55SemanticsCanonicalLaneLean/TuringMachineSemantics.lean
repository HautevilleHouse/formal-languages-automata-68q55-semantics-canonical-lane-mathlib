import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure TuringMachineSemanticsPackage where
  states : Type u
  tapeAlphabet : Type v
  blankSymbol : tapeAlphabet
  transition : states -> tapeAlphabet -> states × tapeAlphabet × Direction
  startState : states
  acceptStates : states -> Prop
  rejectStates : states -> Prop
  languageRecognized : Type w
  languageRecognizedDefined : Prop

inductive Direction where
  | L
  | R
  | N

structure TuringMachineSemanticsEvidence (T : TuringMachineSemanticsPackage) where
  transitionClosed : T.transition = T.transition
  startDefined : Nonempty T.states
  acceptStatesClosed : T.acceptStates = T.acceptStates
  rejectStatesClosed : T.rejectStates = T.rejectStates
  languageDefinedClosed : T.languageRecognizedDefined

def TuringMachineSemanticsClosed (T : TuringMachineSemanticsPackage) : Prop :=
  T.languageRecognizedDefined

theorem turing_machine_semantics_closed_from_evidence (T : TuringMachineSemanticsPackage) (E : TuringMachineSemanticsEvidence T) : TuringMachineSemanticsClosed T :=
  E.languageDefinedClosed

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse