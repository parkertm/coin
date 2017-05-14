require "sequel"

Database = Sequel.sqlite("../db/coin.db")

unless Database.table_exists? :holdings
  Database.create_table(:holdings) do
    primary_key :id
    String :nickname
    String :address
    String :currency
    Float :balance
    DateTime :created_at
    DateTime :updated_at
  end
end

unless Database.table_exists? :exchange_rates
  Database.create_table(:exchange_rates) do
    primary_key :id
    String :currency
    Float :rate
    DateTime :created_at
    DateTime :updated_at
  end
end

unless Database.table_exists? :historic_holdings
  Database.create_table(:historic_holdings) do
    primary_key :id
    # foreign_key holding_id
    String :address
    String :currency
    Float :balance
    DateTime :recorded_at
    DateTime :created_at
    DateTime :updated_at
  end
end

unless Database.table_exists? :historic_exchange_rates
  Database.create_table(:historic_exchange_rates) do
    primary_key :id
    # foreign_key exchange_rate_id
    String :currency
    Float :rate
    DateTime :recorded_at
    DateTime :created_at
    DateTime :updated_at
  end
end
