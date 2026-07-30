import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

structure SemanticsEquivalencePackage (Alphabet : Type u)
    (A : PrimitiveAutomaton Alphabet) (W : PrimitiveSemanticsDomain Alphabet)
    (Op : OperationalSemanticsPackage Alphabet A W)
    (D : DenotationalDomain Alphabet W)
    (Den : DenotationalSemanticsPackage Alphabet W D) where
  operationalImpliesDenotational : Prop
  denotationalImpliesOperational : Prop
  equivalenceHolds : Prop

structure SemanticsEquivalenceEvidence (Alphabet : Type u)
    {A : PrimitiveAutomaton Alphabet} {W : PrimitiveSemanticsDomain Alphabet}
    {Op : OperationalSemanticsPackage Alphabet A W}
    {D : DenotationalDomain Alphabet W}
    {Den : DenotationalSemanticsPackage Alphabet W D}
    (E : SemanticsEquivalencePackage Alphabet A W Op D Den) where
  operationalImpliesDenotationalClosed : E.operationalImpliesDenotational
  denotationalImpliesOperationalClosed : E.denotationalImpliesOperational
  equivalenceHoldsClosed : E.equivalenceHolds

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse
