require 'active_record'
require 'sqlite3'
require 'amoeba'

require 'matrix'

require_relative 'array'

require_relative 'evilution/version'
require_relative 'evilution/mutable'
require_relative 'evilution/evolvable'
require_relative 'evilution/organism'
require_relative 'evilution/generation'
require_relative 'evilution/record/evolvable_record'
require_relative 'evilution/record/species'
require_relative 'evilution/record/generation'
require_relative 'evilution/record/organism'
require_relative 'evilution/record/simulation'
require_relative 'evilution/gene'

module Evilution
  class Error < StandardError; end
end
