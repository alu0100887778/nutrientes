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

#Método para obtener el nombre del alimento
def get_ali(i)
    @alimento[i]
end

#Método para obtener las proteinas del alimento
def get_proteinas(i)
    @proteinas[i]
end

#Método para obtener los glucidos del alimento
def get_glucidos(i)
    @glucidos[i]
end

#Método para obtener los lipidos del alimento
def get_lipidos(i)
    @lipidos[i]
end

#Método para obtener el valor energético del alimento
def get_calorias(i)
    @calorias = [0.0]
    @calorias [i] = ((@proteinas[i]*4)+(@glucidos[i]*4)+(@lipidos[i]*9))
end

#Método para obtener el formateado del alimento
def get_formateado(i)
    get_calorias(i)
    "#{@alimento[i]}" " = " "#{@proteinas[i]}" " gr de proteinas + " "#{@glucidos[i]}" " gr de glucidos + " "#{@lipidos[i]}" " gr de lipidos | " "#{@calorias[i]}" " Kcal en total"
end

end
end

class Lacteos < Alimentos::Alimentos
    
    
    ##Añadimos atributo de lectura a la variable edad
    attr_reader :alimento
    
    ##Inicializacio de variables de la clase
    def initialize(alimento, proteinas, glucidos, lipidos,dieta)
    @alimento = alimento
    @proteinas = proteinas
    @glucidos = glucidos
    @lipidos = lipidos
    end
  
end