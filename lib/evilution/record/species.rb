module Evilution
  module Record
    class Species < EvolvableRecord
      include Evilution::Species

      has_many :generations, dependent: :destroy
      has_many :organisms, through: :generations
      belongs_to :current_generation, class_name: 'Generation'
      delegate :current_organisms, to: :current_generation, allow_nil: false

      amoeba(&:enable)

      after_create do |s|
        s.current_generation = Generation.create(species: s)
        s.save
      end

      def self.table_name
        :species
      end

      def self.create_columns(table)
        table.integer :current_generation_id, allow_nil: false
        table.index :current_generation_id
      end

      def self.create_table
        unless ActiveRecord::Base.connection.table_exists?(:species)
          ActiveRecord::Base.connection.create_table :species do |table|
            table.column :current_generation_id, :integer
            table.index :current_generation_id
          end
        end
      end
    end
  end
end