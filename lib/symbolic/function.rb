module Symbolic
  class Function
    include Symbolic

    def initialize(variable, operation)
      @variable, @operation = variable, operation
    end

    def to_s
      "#{@operation}(#{@variable})"
    end

    def value
      Math.send @operation, @variable.value if undefined_variables.empty?
    end

    def variables
      @variable.variables
    end

    def undefined_variables
      @variable.undefined_variables
    end

    def detailed_operations
      @variable.detailed_operations.tap {|it| it[@operation] += 1}
    end
  end
end