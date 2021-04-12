module Evilution
  module Record
    class Simulation < Evilution::Simulation
      def initialize(db_config, &block)
        block ||= ->{}

        ActiveRecord::Base.establish_connection(db_config)

        ActiveRecord::Schema.define do
          ApplicationRecord.descendants.reject(&:abstract_class?).each(&:create_table)
        end

        super(block)
      end
    end
  end
end