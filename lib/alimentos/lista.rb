
##Creamos la estructura de un nodo nuevo, con su valor, su nodo siguiente y su nodo rpevio
Nodo = Struct.new(:valor, :siguiente, :prev)



##Definicion de la Clase Lista
class Lista
  
  ##Incluimos el Enumerable
  include Enumerable
    
  ##Añadimos atributo de lectura
  attr_reader :cabecera, :cola, :size
  
  
  ##Inicializamos la cabecera y la cola de la lista a nulo
  def initialize
  	   @cabecera = nil
       @cola= nil
       @size = 0
  end
  
  
  ##Metodo push de a lista que introduce los valores dentro de la misma
  def push (valores)
          
          if(valores.instance_of? Array)
              if(@cola == nil)
                
                @cola = Nodo.new(valores[0],nil,nil)
                @cabecera = @cola
                valores.shift()
                 @size = @size + 1
              end
  
            valores.each do |valor|
            aux= @cabecera
            @cabecera = Nodo.new(valor,nil,aux)
            aux.siguiente= @cabecera
             @size = @size + 1
  	      end
          else
  
            if(@cola==nil)
              @cola = Nodo.new(valores,nil,nil)
              @cabecera = @cola
              @size = @size + 1
            else
             aux= @cabecera
            @cabecera = Nodo.new(valores,nil,aux)
            aux.siguiente= @cabecera
             @size = @size + 1
            end
          end
          
  end
  
  
  ##Funcion pop que devuelve el valor de la cabecera y la elimina de la lista
  def pop
  	if(@cabecera!=nil)
  	node = @cabecera
  	@cabecera = @cabecera.prev
    if(@cabecera!=nil)
    @cabecera.siguiente = nil
    node.prev= nil
  else @cola = nil
    end
  	return node.valor
  	end
  end
  
  ##metodo each
    def each
    nodo = @cola
    while(nodo != nil)
        yield nodo.valor
        nodo = nodo.siguiente
    end
    end
    
    def convert lista
        lista.map { |x| x}
    end
    
      #Método para ordenar un array creado a partir de una lista.
    def ordenarFor lista
        auxList = lista.convert lista
        for i in 0..(auxList.length) do
            for j in 0..(auxList.length-2) do 
                if(auxList[j].to_f > auxList[j+1].to_f)
                    temporal = auxList[j]
                    auxList[j] = auxList[j+1]
                    auxList[j+1] = temporal 
                end
            end 
        end
        auxList
    end 
    
    #Método para ordenar un array creado a partir de una lista.
    def ordenarEach lista
        auxList = lista.convert lista 
        indice = 0
        auxList.each do |x|
            auxList.each do |y|
                if (indice < auxList.length-1)
                    if (auxList[indice].to_f > auxList[indice+1].to_f)
                        temporal = auxList[indice]
                        auxList[indice] = auxList[indice+1]
                        auxList[indice+1] = temporal 
                    end
                end
                indice = indice+1
            end
            indice = 0
        end
        auxList
    end
    
    #Método para ordenar un array creado a partir de una lista usando el método sort
    def ordenarSort lista
        auxList = lista.convert lista 
        auxList.sort
    end 
end
  
  
