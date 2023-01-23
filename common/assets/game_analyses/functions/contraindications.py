from enum import Enum


class Contraindications(Enum):
    # The numbers should fit the numbers in 'contraindications.dart'
    epilepsy = 0
    colorBlind = 1
    unspecified = 2

    @staticmethod
    def from_tag(tag):
        if tag == "visiocasque":
            return Contraindications.epilepsy
        elif tag == "color":
            return Contraindications.colorBlind
        elif tag == "none":
            return Contraindications.unspecified
        else:
            raise RuntimeError(f"Wrong choice of contraindications ({tag})")
