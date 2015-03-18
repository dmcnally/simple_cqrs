class CreateSimpleCqrsCommandIds < ActiveRecord::Migration
  def change
    create_table :simple_cqrs_command_ids do |t|
      t.string :key
      t.integer :value, null: false, default: 0

      t.timestamps null: false
    end
  end
end
