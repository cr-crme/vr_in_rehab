from enum import Enum


class Difficulty(Enum):
    # The numbers should fit the numbers in 'difficulty.dart'
    predetermined = 0
    adjustable = 1
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "non_adjust":
            return Difficulty.predetermined
        elif tag == "adjust":
            return Difficulty.adjustable
        else:
            raise RuntimeError(f"Wrong choice of difficulty ({tag})")
