module Evilution
  class Gene
    include Mutable

    attr_accessor :value, :chance, :rate, :minimum, :maximum

    def initialize(value: rand, chance: 0.1, rate: 0.1, minimum: 0.0, maximum: 1.0)
      @value = value
      @chance = chance
      @minimum = minimum
      @maximum = maximum
    end

    def mutate!
      if value.is_a?(Mutable)
        value.mutate!
      elsif value.is_a?(Number)
        @value = mutated_value(value, minimum, maximum, rate, chance)
      end

      self
    end

    def recombine(other)
      child = self.reproduce
      child.value = other.value if rand < 0.5

      child
    end

    def reproduce
      Marshal.load(Marshal.dump(self))
    end
  end
end
