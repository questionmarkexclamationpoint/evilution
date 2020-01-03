module Evilution
  module Record
    class OrganismGeneration < ApplicationRecord
      belongs_to :generation
      belongs_to :organism, polymorphic: true, dependent: :destroy
    end
  end
end