# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner = Owner.create(name: "Sam's Snacks")
@dons  = owner.machines.create(id: 1, location: "Don's Mixed Drinks")
@snack1 = Snack.create(id: 1, name: 'Reeses', price: 1.50)
@snack2 = Snack.create(id: 2, name: 'Cheese itz', price: 4.00)
snack3 = Snack.create(id: 3, name: 'Doritos', price: 4.00)
MachineSnack.create(machine_id: 1, snack_id: 1)
MachineSnack.create(machine_id: 1, snack_id: 2)
