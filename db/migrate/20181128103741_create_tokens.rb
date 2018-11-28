class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.belongs_to :user, index: true
      t.string :auth_token

      t.timestamps
    end
  end
end
