class Information:
    def __init__(self):
        self.description = ""
        self.time = ""
        self.position = ""
        self.nb_players = ""
        self.progression = ""
        self.performance_feedback = ""
        self.results_feedback = ""
        self.physical_requirements = ""
        self.motor_skills = ""
        self.side_notes = ""
        self.cognitive_requirements = ""

    @staticmethod
    def parse_all_columns(cols):
        info = Information()
        info.description = cols[0].replace(";", "\n") if cols[0] else "N/A"
        info.time = cols[1].replace(";", "\n") if cols[1] else "N/A"
        info.position = cols[2].replace(";", "\n") if cols[2] else "N/A"
        info.nb_players = cols[3].replace(";", "\n") if cols[3] else "N/A"
        info.progression = cols[4].replace(";", "\n") if cols[4] else "N/A"
        info.performance_feedback = cols[5].replace(";", "\n") if cols[5] else "N/A"
        info.results_feedback = cols[6].replace(";", "\n") if cols[6] else "N/A"
        info.physical_requirements = cols[7].replace(";", "\n") if cols[7] else "N/A"
        info.motor_skills = cols[8].replace(";", "\n") if cols[8] else "N/A"
        info.side_notes = cols[9].replace(";", "\n") if cols[9] else "N/A"
        info.cognitive_requirements = cols[10].replace(";", "\n") if cols[10] else "N/A"
        return info
