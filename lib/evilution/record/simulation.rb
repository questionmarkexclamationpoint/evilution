module Evilution
  module Record
    class Simulation
      def initialize(db_config, &block)
        block ||= ->{}

        ActiveRecord::Base.establish_connection(db_config)

        ActiveRecord::Schema.define do
          ApplicationRecord.descendants.reject(&:abstract_class?).each(&:create_table)
        end

        block.call
      end

      def evolve!
        Species.all.each do |species|
          species.mutate!.save
        end
      end
    end
  end
end