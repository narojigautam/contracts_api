class Payment < ActiveRecord::Base
  belongs_to :contract
  scope :with_contracts, -> { joins("LEFT OUTER JOIN contracts on payments.contract_id = contracts.id").select("payments.*, contracts.name as contract_name") }
end
