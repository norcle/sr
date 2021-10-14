# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fonbet = Bookmaker.find_or_create_by(id: 1, name_ru: 'Фонбет', name_en: 'Fonbet', slug: 'fonbet', url: 'https://www.fonbet.ru/live/')
basketball = Sport.find_or_create_by(id: 1, name_ru: 'Баскетбол', name_en: 'Basketball', slug: 'basketball')
Sport.find_or_create_by name_ru: 'Футбол', id: 2, slug: 'footbal'
Sport.find_or_create_by name_ru: 'Хоккей', id: 3, slug: 'hokkey'
Sport.find_or_create_by name_ru: 'Волейбол', id: 4, slug: 'volleyball'
Sport.find_or_create_by name_ru: 'Теннис', id: 5, slug: 'tennis'
Sport.find_or_create_by name_ru: 'Настольный теннис', id: 6, slug: 'table_tennis'
Sport.find_or_create_by name_ru: 'Гандбол', id: 7, slug: 'handball'
Sport.find_or_create_by name_ru: 'Пляжный волейбол', id: 8, slug: 'beach_volleyball'
Sport.find_or_create_by name_ru: 'Флорбол', id: 9, slug: 'florball'
Sport.find_or_create_by name_ru: 'Регби', id: 10, slug: 'rugby'
Sport.find_or_create_by name_ru: 'Бейсбол', id: 11, slug: 'baseball'
Sport.find_or_create_by name_ru: 'CounterStrike', id: 12, slug: 'counter_strike'
Sport.find_or_create_by name_ru: 'Dota 2', id: 13, slug: 'dota_2'
Sport.find_or_create_by name_ru: 'Rainbow Six Siege', id: 14, slug: 'rainbow_six_siege'
Sport.find_or_create_by name_ru: 'Cyber Volley', id: 16, slug: 'cyber_volley'
Sport.find_or_create_by name_ru: 'Backetball 3x3', id: 17, slug: 'basketball_3x3'
Sport.find_or_create_by name_ru: 'Cyber Regby', id: 18, slug: 'cyber_rugby'
Sport.find_or_create_by name_ru: 'Пляжный футбол', id: 15, slug: 'beach_football'
Sport.find_or_create_by name_ru: 'Valorant', id: 19, slug: 'valorant'
Sport.find_or_create_by name_ru: 'MMA', id: 20, slug: 'mma'
Sport.find_or_create_by name_ru: 'Футзал', id: 21, slug: 'footcort'
Sport.find_or_create_by name_ru: 'Дартс', id: 22, slug: 'darts'
Sport.find_or_create_by name_ru: 'Футбол 8х8', id: 23, slug: 'football_8x8'
Sport.find_or_create_by name_ru: 'Водное поло', id: 24, slug: 'swim_pool'
Sport.find_or_create_by name_ru: 'NHL20', id: 25, slug: 'nhl20'
Sport.find_or_create_by name_ru: 'Бадминтон', id: 26, slug: 'badminton'
Sport.find_or_create_by name_ru: 'Австралийский футбол.', id: 27, slug: 'australlian_football'
Sport.find_or_create_by name_ru: 'Футбол 5х5.', id: 28, slug: 'football_5x5'
Sport.find_or_create_by name_ru: 'League of legends', id: 29, slug: 'league_of_legends'
Sport.find_or_create_by name_ru: 'Бокс', id: 30, slug: 'box'
Sport.find_or_create_by name_ru: 'FIFA 20.', id: 31, slug: 'fifa_20'
Sport.find_or_create_by name_ru: 'NBA 2K.', id: 32, slug: 'nba_2k'


FactorKey.find_or_create_by id: 1, name_ru: 'ScoreHome', name_en: 'ScoreHome', external_id: 0
FactorKey.find_or_create_by id: 2, name_ru: 'ScoreAway', name_en: 'ScoreAway', external_id: 0
FactorKey.find_or_create_by id: 10, name_ru: 'П1', name_en: 'W1', external_id: 921
FactorKey.find_or_create_by id: 11, name_ru: 'X', name_en: 'X', external_id: 922
FactorKey.find_or_create_by id: 12, name_ru: 'П2', name_en: 'W2', external_id: 923
FactorKey.find_or_create_by id: 13, name_ru: '1X', name_en: '1X', external_id: 924
FactorKey.find_or_create_by id: 14, name_ru: '12', name_en: '12', external_id: 925
FactorKey.find_or_create_by id: 15, name_ru: 'X2', name_en: 'X2', external_id: 926
FactorKey.find_or_create_by id: 16, name_ru: 'Тотал1', name_en: 'Total1', external_id: 930
FactorKey.find_or_create_by id: 17, name_ru: 'Тотал2', name_en: 'Total2', external_id: 931
FactorKey.find_or_create_by id: 18, name_ru: 'Тотал1', name_en: 'Total1', external_id: 940
FactorKey.find_or_create_by id: 19, name_ru: 'Тотал2', name_en: 'Total2', external_id: 941
FactorKey.find_or_create_by id: 20, name_ru: 'Фора1', name_en: 'Fora1', external_id: 927
FactorKey.find_or_create_by id: 21, name_ru: 'Фора2', name_en: 'Fora2', external_id: 928
FactorKey.find_or_create_by id: 22, name_ru: 'Score1', name_en: 'Score1', external_id: 0
FactorKey.find_or_create_by id: 23, name_ru: 'Score2', name_en: 'Score2', external_id: 0
