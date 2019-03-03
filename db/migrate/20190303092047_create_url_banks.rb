class CreateUrlBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :url_banks do |t|
      t.string :actual_url
      t.string :tiny_url

      t.timestamps
    end
  end
end
