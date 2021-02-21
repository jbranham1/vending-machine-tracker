class CreateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.references :machine, index:true, foreign_key: true
      t.references :snack, index:true, foreign_key: true

      t.timestamps
    end
  end
end
