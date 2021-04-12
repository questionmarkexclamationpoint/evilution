module Evilution
  module Record
    class Organism < EvolvableRecord
      include Evilution::Organism

      self.abstract_class = true

      has_one :organism_generation
      has_one :generation, through: :organism_generation
      belongs_to :generation
      belongs_to :father, class_name: 'Organism'
      belongs_to :mother, class_name: 'Organism'
      delegate :species, to: :generation, allow_nil: false

      def children
        self.class.where('father_id = ? OR mother_id = ?', id, id)
      end

      def self.create_columns(table)
        table.integer :father_id
        table.index :father_id
        table.integer :mother_id
        table.index :mother_id
        table.references :generation, allow_nil: false
      end

      def self.included(base)
        base.instance_eval do
          has_many :organism_generations, inverse_of: :communication_method, dependent: :destroy
        end
      end
    end
  end
end