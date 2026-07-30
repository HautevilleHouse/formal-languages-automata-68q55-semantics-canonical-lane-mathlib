import HautevilleHouse.FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean.AutomatonAdmissibleClass

namespace HautevilleHouse
namespace FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AutomatonWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FormalLanguagesAutomata68q55SemanticsCanonicalLaneLean
end HautevilleHouse