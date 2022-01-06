class NearTokenTransaction < ApplicationRecord
  scope :type_transfer, -> { where(action_type: 'Transfer') }

  def scaled_deposit
    deposit.to_i / 1e24
  end

  def self.average_gas_burnt
    gas_burnt = pluck(:gas_burnt).map(&:to_i)

    gas_burnt.reduce(:+) / gas_burnt.size if gas_burnt.any?
  end
end
