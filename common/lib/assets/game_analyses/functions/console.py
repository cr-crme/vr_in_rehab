from enum import Enum


class Console(Enum):
    # The numbers should fit the numbers in 'console.dart'
    bootle_blast = 0
    jintronix = 1
    habilup = 2
    xbox = 3
    nintendo_switch = 4
    oculus = 5
    vive = 6
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
