class AddCompanyToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :user, foreign_key: true
  end
end
