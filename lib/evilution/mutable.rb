module Evilution
  module Mutable
    def mutate
      reproduce.mutate!
    end

    def mutate!
      self
    end

    def recombine(other)
      self
    end

    def reproduce
      dup
    end

    def mutated_value(curr, min, max, rate, chance)
      return curr if rand > chance
      upper = max - curr
      lower = min - curr
      dist = upper.abs.to_f / (upper - lower).abs
      range = rand < dist ? lower : upper
      curr + rand * rate * range
    end
  end
end