from .console import Console
from .upper_extremity import UpperExtremity
from .lower_extremity import LowerExtremity
from .contraindications import Contraindications
from .game_goals import GameGoals
from .game_length import GameLength
from .difficulty import Difficulty
from .can_save import CanSave
from .information import Information


class Game:
    def __init__(self):
        self.code: str = ""
        self.name: str = ""
        self.collection: str = ""
        self.image_path: str = ""
        self.console: Console = Console.unspecified
        self.upper_limb_ability: list[UpperExtremity, ...] = [UpperExtremity.unspecified]
        self.lower_limb_ability: list[LowerExtremity, ...] = [LowerExtremity.unspecified]
        self.contraindications: list[Contraindications, ...] = [Contraindications.unspecified]
        self.goal: list[GameGoals, ...] = [GameGoals.unspecified]
        self.length: list[GameLength, ...] = [GameLength.unspecified]
        self.difficulty: Difficulty = Difficulty.unspecified
        self.can_save: CanSave = CanSave.unspecified

        self.information: dict[str, Information] = {"en": Information(), "fr": Information()}

    def serialize(self):
        return {
            "title": self.name,
            "collection": self.collection,
            "console": self.console.value,
            "imagePath": self.image_path,
            "information": {
                "description": {"en": self.information["en"].description, "fr": self.information["fr"].description},
                "time": {"en": self.information["en"].time, "fr": self.information["fr"].time},
                "position": {"en": self.information["en"].position, "fr": self.information["fr"].position},
                "numberPlayers": {"en": self.information["en"].nb_players, "fr": self.information["fr"].nb_players},
                "progression": {"en": self.information["en"].progression, "fr": self.information["fr"].progression},
                "performanceFeedback": {"en": self.information["en"].performance_feedback, "fr": self.information["fr"].performance_feedback},
                "resultsFeedback": {"en": self.information["en"].results_feedback, "fr": self.information["fr"].results_feedback},
                "physicalRequirements": {"en": self.information["en"].physical_requirements, "fr": self.information["fr"].physical_requirements},
                "motorSkills": {"en": self.information["en"].motor_skills, "fr": self.information["fr"].motor_skills},
                "sideNotes": {"en": self.information["en"].side_notes, "fr": self.information["fr"].side_notes},
                "cognitiveRequirements": {"en": self.information["en"].cognitive_requirements, "fr": self.information["fr"].cognitive_requirements},
            },
            "filter": {
                "upper": [val.value for val in self.upper_limb_ability],
                "lower": [val.value for val in self.lower_limb_ability],
                "contra": [val.value for val in self.contraindications],
                "goal": [val.value for val in self.goal],
                "length": [val.value for val in self.length],
                "difficulty": self.difficulty.value,
                "canSave": self.can_save.value,
            },
        }
