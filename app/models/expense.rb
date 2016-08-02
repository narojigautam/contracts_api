class Expense < ActiveRecord::Base
  belongs_to :contract
  scope :with_contracts, -> { joins("LEFT OUTER JOIN contracts on expenses.contract_id = contracts.id").select("expenses.*, contracts.name as contract_name") }
end
