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

def get_proteinas(i)
    @proteinas[i]
end

def get_glucidos(i)
    @glucidos[i]
end

def get_lipidos(i)
    @lipidos[i]
end

def get_calorias(i)
    @calorias = ((@proteinas[i]*4)+(@glucidos[i]*4)+(@lipidos[i]*9))
end

end
end
