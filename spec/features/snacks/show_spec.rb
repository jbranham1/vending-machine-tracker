require 'rails_helper'

RSpec.describe 'Snack show page', type: :feature do
  before :each do
    owner = Owner.create(name: "Sam's Snacks")
    @dons  = owner.machines.create(id: 1, location: "Don's Mixed Drinks")
    @vm  = owner.machines.create(id: 2, location: "Vending Machine")
    @snack1 = Snack.create(id: 1, name: 'Reeses', price: 1.50)
    @snack2 = Snack.create(id: 2, name: 'Cheese itz', price: 4.00)
    MachineSnack.create(machine_id: 1, snack_id: 1)
    MachineSnack.create(machine_id: 2, snack_id: 1)
  end
  describe 'As a visitor' do
    describe 'When I visit a snack show page' do
      it 'I see the name of the snack, along with the price' do
        visit snack_path(@snack1)
        expect(page).to have_content(@snack1.name)
        expect(page).to have_content("Price: #{@snack1.round_price}")
        expect(page).to_not have_content(@snack2.name)
        expect(page).to_not have_content("Doritos: 4.00")
      end
      it 'and I see a list of locations with vending machines that carry that snack' do
        visit snack_path(@snack1)
        expect(page).to have_content('Locations:')
        expect(page).to have_content(@dons.location)
        expect(page).to have_content(@vm.location)
      end
      it 'and I see the average price for snacks in those vending machines' do
        visit snack_path(@snack1)
          expect(page).to have_content("average price of $1.50")
      end
      it 'and I see a count of the different kinds of items in that vending machine' do
        visit snack_path(@snack1)
        expect(page).to have_content("1 kinds of snacks")
      end
    end
  end
end
