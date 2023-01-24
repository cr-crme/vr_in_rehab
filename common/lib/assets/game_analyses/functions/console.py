from enum import Enum


class Console(Enum):
    # The numbers should fit the numbers in 'console.dart' and in the json
    bootle_blast = "Bootle Blast"
    jintronix = "Jintronix"
    habilup = "Habilup"
    xbox = "Xbox"
    nintendo_switch = "Nintendo Switch"
    oculus = "Oculus"
    vive = "Vive"
    unspecified = ""

    @staticmethod
    def from_tag(tag):
        if tag == "BootleBlast":
            return Console.bootle_blast
        elif tag == "Jintronix":
            return Console.jintronix
        elif tag == "Habilup":
            return Console.habilup
        elif tag == "Xbox":
            return Console.xbox
        elif tag == "Nintendo Switch":
            return Console.nintendo_switch
        elif tag == "Oculus":
            return Console.oculus
        elif tag == "Vive":
            return Console.vive
        else:
            raise RuntimeError(f"Wrong choice of console ({tag})")
