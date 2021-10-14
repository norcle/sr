# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fonbet = Bookmaker.find_or_create_by(id: 1, name_ru: 'Фонбет', name_en: 'Fonbet', slug: 'fonbet', url: 'https://www.fonbet.ru/live/')
basketball = Sport.find_or_create_by(id: 1, name_ru: 'Баскетбол', name_en: 'Basketball', slug: 'basketball')

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
