class Triple
  extend Evilution::Organism

  attr_accessor :one,
                :two,
                :three

  def fitness
    -((self.one + self.two + self.three) - 100).abs
  end

  def mutate!
    self.one = mutated_value(self.one, 0, 100, 0.1, 1)
    self.two = mutated_value(self.two, 0, 100, 0.1, 1)
    self.three = mutated_value(self.three, 0, 100, 0.1, 1)

    self
  end

  def recombine(other)
    Triple.new(
        one: (self.one + other.one) / 2,
        two: (self.two + other.two) / 2,
        three: (self.three + other.three) / 2
    )
  end

  def self.table_name
    :triples
  end

  def self.create_columns(table)
    super.create_columns(table)
    table.integer :one, null: false
    table.integer :two, null: false
    table.integer :three, null: false
  end
end