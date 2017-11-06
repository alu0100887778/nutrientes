
##Creamos la estructura de un nodo nuevo, con su valor, su nodo siguiente y su nodo rpevio
Nodo = Struct.new(:valor, :siguiente, :prev)



##Definicion de la Clase Lista
class Lista
    
  ##Añadimos atributo de lectura
  attr_reader :cabecera, :cola
  
  
  ##Inicializamos la cabecera y la cola de la lista a nulo
  def initialize
  	   @cabecera = nil
       @cola= nil
  end
  

end
  
  
