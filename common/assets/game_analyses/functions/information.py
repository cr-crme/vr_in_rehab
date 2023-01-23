class Information:
    def __init__(self):
        self.description = ""
        self.accessories = ""
        self.time = ""
        self.position = ""
        self.nb_players = ""
        self.environment = ""
        self.performance = ""
        self.results = ""
        self.physical = ""

    @staticmethod
    def parse_all_columns(cols):
        info = Information()
        info.description = cols[0]
        info.accessories = cols[1]
        info.time = cols[2]
        info.position = cols[3]
        info.nb_players = cols[4]
        info.environment = cols[5]
        info.performance = cols[6]
        info.results = cols[7]
        info.physical = cols[8]
        return info
