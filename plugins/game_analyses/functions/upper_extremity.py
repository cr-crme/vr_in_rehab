from enum import Enum


class UpperExtremity(Enum):
    # The numbers should fit the numbers in 'upper_extremity.dart'
    no_arm = 0
    one_arm = 1
    both_arm = 2
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "no_arm":
            return UpperExtremity.no_arm
        elif tag == "one_arm":
            return UpperExtremity.one_arm
        elif tag == "fonc":
            return UpperExtremity.both_arm
        else:
            raise RuntimeError(f"Wrong choice of upper_extremity ({tag})")
