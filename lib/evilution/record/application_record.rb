module Evilution
  module Record
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true

      def self.create_table
        unless ActiveRecord::Base.connection.table_exists?(self.table_name)
          ActiveRecord::Base.connection.create_table(self.table_name) do |table|
            self.fields.each do |field|
              field.call(table)
            end
          end
        end
      end

      def self.create_columns(table)
      end

      def self.table_name
        :""
      end
    end
  end
end