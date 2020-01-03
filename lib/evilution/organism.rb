module Evilution
  module Organism
    def dimensions
      Vector[0.0]
    end

    def children
      []
    end

    def father
      nil
    end

    def mother
      nil
    end

    def generation
      nil
    end

    def parents
      [self.mother, self.father]
    end
  end
end