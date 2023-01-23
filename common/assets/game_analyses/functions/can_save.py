from enum import Enum


class CanSave(Enum):
    # The numbers should fit the numbers in 'can_save.dart'
    cannot_save = 0
    can_save = 1
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "not_save":
            return CanSave.cannot_save
        elif tag == "save":
            return CanSave.can_save
        else:
            raise RuntimeError(f"Wrong choice of can_save ({tag})")
