module Evilution
  module Record
    class EvolvableRecord < ApplicationRecord
      self.abstract_class = true

      include Evolvable

      def reproduce
        amoeba_dup
      end
    end
  end
end