require "alimentos/version.rb"

#Modulo alimentos
module Alimentos

#Clase alimentos
class Alimentos

#Añadimos atributos de lectura
attr_reader :alimentos, :proteinas, :glucidos, :lipidos
attr_accessor :data


##Incluimos el comparable
include Comparable

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


     
##Metodo menor,mayor o igual del enumerable
def <=> (another)
     @proteinas <=> another.proteinas
end


##Metodo para calcular AIBC
def aibc(index)
    auxiliar = []
    data[index][1..data[index].length - 1].zip(data[index][0..data[index].length-2]) do |x,y|
        if x < data[index][0]
            auxiliar << 0.0
        else
            auxiliar << (((x - data[index][0]) + (y - data[index][0]))/2) * 5
        end
    end
    auxiliar.reduce(:+)
end

end
end

##Clase Lacteos heredada de alimentos
class Lacteos < Alimentos::Alimentos

    ##Inicializacio de variables de la clase
    def initialize(alimento, proteinas, glucidos, lipidos, subali)
    super(alimento,proteinas,glucidos,lipidos)
    @subali = subali
    end
  
end