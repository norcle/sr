# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fonbet = Bookmaker.first_or_create(name_ru: 'Фонбет', name_en: 'Fonbet', slug: 'fonbet', url: 'https://www.fonbet.ru/live/')
basketball = Sport.first_or_create(name_ru: 'Баскетбол', name_en: 'Basketball', slug: 'basketball')