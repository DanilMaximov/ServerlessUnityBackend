require 'aws-sdk-dynamodb'

module AwsSdkHelpers
  class DynamoDB
    Client = Aws::DynamoDB::Client.new

    SCHEMAS = {
      user: {
        table_name: ENV['USERS_TABLE_NAME'] || ENV.fetch('CDK_STACK_NAME') + '-Users',
        key: :user_id
      },
      connection: {
        table_name: ENV.fetch('WEBSOCKET_CONNECTIONS_TABLE_NAME'),
        key: :connection_id
      }
    }

    def self.delete(table, pk_value)
      SCHEMAS.fetch(table) => { table_name:, key: }

      Client.delete_item(table_name:, key: { key => pk_value })
    end

    def self.find(table, by:)
      SCHEMAS.fetch(table) => { table_name:, key: }

      Client.get_item(table_name:, key: { key => by })
    end

    def self.find_by(table, key)
      SCHEMAS.fetch(table) => { table_name: }

      Client.get_item(table_name:, key:)
    end
  end
end
