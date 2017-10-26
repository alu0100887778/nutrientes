require "alimentos/version.rb"

module Alimentos

class Alimentos
    
attr_reader :alimentos, :proteinas, :glucidos, :lipidos

#Inicializamos las variables

def initialize(alimento,proteinas,glucidos,lipidos)
    
    @alimento = alimento
    @proteinas = proteinas
    @glucidos = glucidos
    @lipidos = lipidos
    
end

def get_ali(i)
    @alimento[i]
end
    
end
end
