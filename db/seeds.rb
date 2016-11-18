# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Position.create(title: "seed", description: "alex's seed", election_id: 1,)
User.create(created_at: "russiaseedfactory", updated_at: "chinaseedfactory", email: "seedy1@seeded.seed", encrypted_password: "seedymcseeds",remember_token: "seed1")
User.create(created_at: "russiaseedfactory", updated_at: "chinaseedfactory", email: "seed2@seeded.seed", encrypted_password: "seedymcseeds",remember_token: "seed2")
