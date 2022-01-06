class CreateNearTokenTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :near_token_transactions do |t|
      t.string :sender
      t.string :receiver
      t.string :deposit
      t.string :gas_burnt
      t.string :action_type

      t.timestamps
    end
  end
end
