
##Creamos la estructura de un nodo nuevo, con su valor, su nodo siguiente y su nodo rpevio
Nodo = Struct.new(:valor, :siguiente, :prev)



##Definicion de la Clase Lista
class Lista
  
  ##Incluimos el Enumerable
  include Enumerable
    
  ##Añadimos atributo de lectura
  attr_reader :cabecera, :cola
  
  
  ##Inicializamos la cabecera y la cola de la lista a nulo
  def initialize
  	   @cabecera = nil
       @cola= nil
  end
  
  
  ##Metodo push de a lista que introduce los valores dentro de la misma
  def push (valores)
          
          if(valores.instance_of? Array)
              if(@cola == nil)
                
                @cola = Nodo.new(valores[0],nil,nil)
                @cabecera = @cola
                valores.shift()
              end
  
            valores.each do |valor|
            aux= @cabecera
            @cabecera = Nodo.new(valor,nil,aux)
            aux.siguiente= @cabecera
  	end
          else
  
            if(@cola==nil)
              @cola = Nodo.new(valores,nil,nil)
              @cabecera = @cola
            else
             aux= @cabecera
            @cabecera = Nodo.new(valores,nil,aux)
            aux.siguiente= @cabecera
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
  
end
  
  
