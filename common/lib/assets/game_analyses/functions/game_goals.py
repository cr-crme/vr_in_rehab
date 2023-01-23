from enum import Enum


class GameGoals(Enum):
    # The numbers should fit the numbers in 'game_goal.dart'
    endurance = 0
    coordination = 1
    lower_extremity_strength = 2
    balance = 3
    unimanual_upper_extremity = 4
    bimanual_upper_extremity = 5
    dual_tasking = 6
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "endurance":
            return GameGoals.endurance
        elif tag == "coordination":
            return GameGoals.coordination
        elif tag == "leg_strength":
            return GameGoals.lower_extremity_strength
        elif tag == "balance":
            return GameGoals.balance
        elif tag == "unilateral":
            return GameGoals.unimanual_upper_extremity
        elif tag == "bimanual":
            return GameGoals.bimanual_upper_extremity
        elif tag == "dual":
            return GameGoals.dual_tasking
        else:
            raise RuntimeError(f"Wrong choice of game_goals ({tag})")
