# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sustage.create(stage: 'Ideation')
Sustage.create(stage: 'Proof of concept')
Sustage.create(stage: 'Beta Launched')
Sustage.create(stage:'Early revenues')
Sustage.create(stage:'Stables revenues')
Sustage.create(stage:'Seeded')
Sustage.create(stage:'Series A')
Pallete.create(name: 'basic', color: '')
