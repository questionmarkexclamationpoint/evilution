require 'evilution'
require_relative 'triple'

species = nil
sim = Evilution::Simulation.new('triple') do
  species = Evilution::Species.create
end
100.times do
  Triple.create(
      one: (rand * 100).floor,
      two: (rand * 100).floor,
      three: (rand * 100).floor,
      generation: species.current_generation
  )
end

sim.evolve!