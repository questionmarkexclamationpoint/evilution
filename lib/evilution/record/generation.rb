module Evilution
  module Record
    class Generation < ApplicationRecord
      belongs_to :species
      has_many :organism_generations, dependent: :destroy
      has_many :organisms, through: :organism_generations
      belongs_to :previous, class_name: 'Generation'
      has_one :next, class_name: 'Generation', foreign_key: 'previous_id'

      amoeba(&:enable)

      def self.table_name
        :generations
      end

      def self.create_columns(table)
        table.references :species, null: false
        table.integer :previous_id
        table.index :previous_id
      end
    end
  end
end