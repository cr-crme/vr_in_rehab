import json

from functions.excel_reader import read_excel_file, serialize_all_games


def main():
    games = read_excel_file('all_games.xlsx')
    serialized = serialize_all_games(games)
    json_object = json.dumps(serialized, indent=2)

    with open("./all_games.json", "w") as outfile:
        outfile.write(json_object)


if __name__ == "__main__":
    main()
