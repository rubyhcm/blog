class CreateVisitors < ActiveRecord::Migration[7.0]
  def change
    create_table :visitors do |t|
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
