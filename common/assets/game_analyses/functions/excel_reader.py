import openpyxl

from .game import (
    Game,
    Console,
    UpperExtremity,
    LowerExtremity,
    Contraindications,
    GameGoals,
    GameLength,
    Difficulty,
    CanSave,
    Information,
)


def read_excel_file(filepath) -> list[Game, ...]:
    # Define variable to load the dataframe
    dataframe = openpyxl.load_workbook(filepath)

    # Define variable to read sheet
    game_sheet = dataframe.active

    # Iterate the loop to read the cell values
    all_games = []
    for i, row in enumerate(game_sheet.rows):
        if i < 3:
            continue

        game = Game()

        try:
            game.code = row[0].value
            game.name = row[1].value
            game.collection = row[2].value if row[2].value is not None else ""
            game.console = Console.from_tag(row[3].value)

            game.upper_limb_ability = [UpperExtremity.from_tag(tag) for tag in row[4].value.split(";")]
            game.lower_limb_ability = [LowerExtremity.from_tag(tag) for tag in row[5].value.split(";")]
            game.contraindications = [Contraindications.from_tag(tag) for tag in row[6].value.split(";")]
            game.goal = [GameGoals.from_tag(tag) for tag in row[7].value.split(";")]
            game.length = [GameLength.from_tag(tag) for tag in row[8].value.split(";")]
            game.difficulty = Difficulty.from_tag(row[9].value)
            game.can_save = CanSave.from_tag(row[10].value)

            game.information["en"] = Information.parse_all_columns([r.value for r in row[11:20]])
            game.information["fr"] = Information.parse_all_columns([r.value for r in row[20:29]])
        except RuntimeError as message:
            raise RuntimeError(f"{message.args[0]} in for the game '{row[0].value}'")

        all_games.append(game)

    return all_games


def serialize_all_games(games):
    out = {}
    for game in games:
        out[game.code] = game.serialize()
    return out
