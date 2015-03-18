class CreateSimpleCqrsEvents < ActiveRecord::Migration
  def change
    create_table :simple_cqrs_events do |t|
      t.string :name
      t.text :values

      t.timestamps null: false
    end
  end
end
