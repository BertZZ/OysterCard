class Station #Understands information about your journey 
attr_reader :name, :zone
def initialize(name,zone)
    @name = name
    @zone = zone
  end
end
