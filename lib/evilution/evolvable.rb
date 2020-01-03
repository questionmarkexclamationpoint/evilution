module Evilution
  module Evolvable
    include Mutable

    def genes
      {}
    end

    def fitness
      0.0
    end

    def normalized_fitness(goal)
      fitness >= goal ? Float::INFINITY : 1.0 / (goal - fitness)
    end

    def <=>(other)
      return nil unless other.class == self.class

      fitness <=> other.fitness
    end
  end
end