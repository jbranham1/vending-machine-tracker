require 'rails_helper'

RSpec.describe 'Machine show page', type: :feature do
  before :each do
    owner = Owner.create(name: "Sam's Snacks")
    @dons  = owner.machines.create(id: 1, location: "Don's Mixed Drinks")
    @snack1 = Snack.create(id: 1, name: 'Reeses', price: 1.50)
    @snack2 = Snack.create(id: 2, name: 'Cheese itz', price: 4.00)
    snack3 = Snack.create(id: 3, name: 'Doritos', price: 4.00)
    MachineSnack.create(machine_id: 1, snack_id: 1)
    MachineSnack.create(machine_id: 1, snack_id: 2)
  end
  describe 'As a visitor' do
    describe 'When I visit a vending machine show page' do
      it 'I see the name of all of the snacks associated with that vending machine along with their price' do
        visit machine_path(@dons)
        expect(page).to have_content("#{@snack1.name}: $1.50")
        expect(page).to have_content("#{@snack2.name}: $4.00")
        expect(page).to_not have_content("Doritos: 4.00")
      end
      it 'I also see an average price for all of the snacks in that machine' do
        visit machine_path(@dons)
        expect(page).to have_content("Average Price: $2.75")
      end
    end
  end
end
