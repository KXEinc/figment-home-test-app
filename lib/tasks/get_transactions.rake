require 'dotenv/tasks'

desc "get NEAR token transactions (for now, just the NEAR token)"
task :get_transactions => [:environment, :dotenv]  do
  url = "http://figment-mock-data.figment.network/near/transactions?api_key=#{ENV['API_KEY']}"

  body = HTTP.get(url)
  transactions = JSON.parse(body)

  formatted_transactions = transactions.map do |transaction|
    {
      sender: transaction['sender'],
      receiver: transaction['receiver'],
      deposit: transaction['actions'][0]['data']['deposit'],
      action_type: transaction['actions'][0]['type'],
      gas_burnt: transaction['gas_burnt'],
    }
  end

  NearTokenTransaction.upsert_all(formatted_transactions)
end

