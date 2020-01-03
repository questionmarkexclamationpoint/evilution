module Evilution
  module Species
    include Evolvable

    def generations
      []
    end

    def organisms
      []
    end

    def current_generation
      nil
    end

    def current_organisms
      []
    end

    def best
      current_organisms.max_by(&:fitness)
    end

    def fitness
      return 0.0 if current_organisms.length == 0
      current_organisms.inject{ |acc, e| acc + e.fitness } / current_generation.length
    end

    def mutate!
      old_gen = current_generation
      new_gen = Generation.create(species: self, previous: old_gen)
      puts old_gen.organisms
      old_members = old_gen.organisms.all.sort
      parents = weighted_select(old_members)
      parents.dup.each.with_index do |a, i|
        break if i >= old_members.length
        b = (parents - [a]).sample
        if self.evolution_type == :recombine
          child = a.recombine(b)
        elsif self.evolution_type == :mutate
          child = a.reproduce.mutate!
        elsif self.evolution_type == :both
          child = a.reproduce.mutate!.recombine(b.reproduce.mutate!)
        else
          child = a.reproduce
        end
        child.generation = new_gen
        child.save
      end
      self.current_generation = new_gen
      save

      self
    end

    private

    def weighted_select(gen)
      goal = gen.last.fitness + (gen.last.fitness - gen.first.fitness)
      sums = []
      sums[0] = [best.normalized_fitness(goal), best]
      (1..length - 1).each do |i|
        sums[i] = [sums[i - 1][0] + gen[-(i + 1)].normalized_fitness(goal), gen[-(i + 1)]]
      end
      sums[0][0] = 1.0
      cut = rand
      sums.select! do |s|
        s[0] >= cut
      end
      parents = []
      sums.each do |s|
        parents << s[1]
      end
      parents
    end
  end
end