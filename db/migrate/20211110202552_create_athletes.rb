class CreateAthletes < ActiveRecord::Migration[6.1]
  def change
    create_table :athletes do |t|
      t.string :name
      t.time :first_lap, default: nil
      t.time :second_lap, default: nil
      t.time :third_lap, default: nil
      t.time :end_lap, default: nil
      t.timestamps
    end
  end
end
