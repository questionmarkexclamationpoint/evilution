module Evilution
  class Simulation
    def initialize(&block)
      block.call
    end

    def evolve!
      Species.all.each do |species|
        species.mutate!.save
      end
    end
  end
end