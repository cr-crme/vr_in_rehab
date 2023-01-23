from enum import Enum


class LowerExtremity(Enum):
    # The numbers should fit the numbers in 'lower_extremity.dart'
    static = 0
    dynamic_inside = 1
    dynamic_outside = 2
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "stat":
            return LowerExtremity.static
        elif tag == "dyn_inside":
            return LowerExtremity.dynamic_inside
        elif tag == "dyn_outside":
            return LowerExtremity.dynamic_outside
        else:
            raise RuntimeError(f"Wrong choice of lower_extremity ({tag})")
