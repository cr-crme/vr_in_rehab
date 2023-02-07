from enum import Enum


class GameLength(Enum):
    # The numbers should fit the numbers in 'game_length.dart'
    predetermined = 0
    performance_based = 1
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "pred":
            return GameLength.predetermined
        elif tag == "perf":
            return GameLength.performance_based
        else:
            raise RuntimeError(f"Wrong choice of game_length ({tag})")
