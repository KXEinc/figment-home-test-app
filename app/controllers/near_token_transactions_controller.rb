class NearTokenTransactionsController < ApplicationController

  def index
    @transfer_type_transactions = NearTokenTransaction.type_transfer
    @average_gas_burnt = NearTokenTransaction.average_gas_burnt
  end
end
