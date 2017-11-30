require "spec_helper"
require "./lib/alimentos.rb"
require  "./lib/alimentos/lista.rb"

        
require 'benchmark'
include Benchmark

context Alimentos do
  
  before :all do 
      
    alimento = ['Huevo frito','Leche vaca','Yogurt','Cerdo','Ternera','Pollo','Bacalao','Atún','Salmon','Aceite de oliva','Chocolate','Azúcar','Arroz','Lentejas','Papas','Tomate','Cebolla','Manzana','Plátanos']
    proteinas = [14.1,3.3,3.8,21.5,21.1,20.6,17.7,21.5,19.9,0.0,5.3,0.0,6.8,23.5,2.0,1.0,1.3,0.3,1.2]
    glucidos = [0.0,4.8,4.9,0.0,0.0,0.0,0.0,0.0,0.0,0.2,47.0,99.8,77.7,52.0,15.4,3.5,5.8,12.4,21.4]
    lipidos = [19.5,3.2,3.8,6.3,3.1,5.6,0.4,15.5,13.6,99.6,30.0,0.0,0.6,1.4,0.1,0.2,0.3,0.4,0.2]
    
    @alimentos = Alimentos::Alimentos.new(alimento, proteinas, glucidos, lipidos)

    @lista = Lista.new();
    @lista.push("Zanahoria")
    
    huevo = [alimento[0],proteinas[0],glucidos[0],lipidos[0]]
    leche = [alimento[1],proteinas[1],glucidos[1],lipidos[1]]
    yogurt = [alimento[2],proteinas[2],glucidos[2],lipidos[2]]
    
    @lista_lacteos = Lista.new();
    @lista_lacteos.push([huevo,leche,yogurt])
    
    cerdo = [alimento[3],proteinas[3],glucidos[3],lipidos[3]]
    ternera = [alimento[4],proteinas[4],glucidos[4],lipidos[4]]
    pollo = [alimento[5],proteinas[5],glucidos[5],lipidos[5]]
    
    @lista_carnes = Lista.new();
    @lista_carnes.push([cerdo,ternera,pollo])
    
    bacalao = [alimento[6],proteinas[6],glucidos[6],lipidos[6]]
    atun = [alimento[7],proteinas[7],glucidos[7],lipidos[7]]
    salmon = [alimento[8],proteinas[8],glucidos[8],lipidos[8]]
    
    @lista_pescado = Lista.new();
    @lista_pescado.push([bacalao, atun, salmon])
    
    @menu_lacteos = Lacteos.new("Yogurt", 15.2, 40.4, 23.1, yogurt)
     
    @list = Lista.new()
    @list.push([6,7,8,10,23,1,15])
  
      
    @menu1 = Alimentos::Alimentos.new("Huevo frito", 14.1,0.0,19.5)
    @menu2 = Alimentos::Alimentos.new("Yogurt", 3.3,4.0,3.2)
    @menu3 = Alimentos::Alimentos.new("Yogurt", 3.3,4.0,3.2)
    @menu4 = Alimentos::Alimentos.new("Cerdo", 21.5,0.0,6.3)
    @menu5 = Alimentos::Alimentos.new("Bacalao",17.7,0.0,0.4)
    @menu6 = Alimentos::Alimentos.new("Platanos", 1.2,21.4,0.2)
    
    @lista_menus = Lista.new()
    @lista_menus.push([@menu1,@menu2,@menu4,@menu5,@menu6])

    
  end    


describe "Pruebas para ordenar" do
    
     
        alimento = ['Huevo frito','Leche vaca','Yogurt','Cerdo','Ternera','Pollo','Bacalao','Atún','Salmon','Aceite de oliva','Chocolate','Azúcar','Arroz','Lentejas','Papas','Tomate','Cebolla','Manzana','Plátanos']
        proteinas = [14.1,3.3,3.8,21.5,21.1,20.6,17.7,21.5,19.9,0.0,5.3,0.0,6.8,23.5,2.0,1.0,1.3,0.3,1.2]
        glucidos = [0.0,4.8,4.9,0.0,0.0,0.0,0.0,0.0,0.0,0.2,47.0,99.8,77.7,52.0,15.4,3.5,5.8,12.4,21.4]
        lipidos = [19.5,3.2,3.8,6.3,3.1,5.6,0.4,15.5,13.6,99.6,30.0,0.0,0.6,1.4,0.1,0.2,0.3,0.4,0.2]
           
        bacalao = [alimento[6],proteinas[6],glucidos[6],lipidos[6]]
        atun = [alimento[7],proteinas[7],glucidos[7],lipidos[7]]
        salmon = [alimento[8],proteinas[8],glucidos[8],lipidos[8]]
  
        lista_pescados2 = Lista.new()
        lista_pescados2.push(bacalao)
        lista_pescados2.push(atun)
        lista_pescados2.push(salmon)

        
    it "Se convierte a array" do
        auxiliar = []
        auxiliar = lista_pescados2.convert(lista_pescados2)
        expect(lista_pescados2.size).to eq(auxiliar.length)
    end
    
     it "Ordenacion por for" do
        auxiliar = []
        auxiliar = lista_pescados2.ordenarFor(lista_pescados2)
        expect(auxiliar[0]).to eq("Bacalao")
        expect(auxiliar[2]).to eq("Atún")
    end
    
       it "Ordenación por each" do 
      aux = []
      aux = lista_pescados2.ordenarEach(lista_pescados2)

      expect(aux[0]).to eq("Bacalao")
      expect(aux[2]).to eq("Atún")
    end 
    
    it "Ordenación por sort" do 
      aux = []
      aux = lista_pescados2.ordenarFor(lista_pescados2)
      
      expect(aux[0]).to eq("Bacalao")
      expect(aux[2]).to eq("Atún")
    end 
    
      it "Tiempos de ejecucion" do
        
        Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
            tf = x.report("for") {for i in 0..30 do lista_pescados2.ordenarFor(lista_pescados2) end}
            tf = x.report("each") {for i in 0..30 do lista_pescados2.ordenarEach(lista_pescados2) end}
        end
        
end
    
end

describe "Pruebas de programacionn funcional" do
    
    before :each do
        @CompManzana = Lacteos.new("Compota de manzana", 4.1, 0.0, 9.5, "Frutas y derivados" )
        @Yogurt = Lacteos.new("Yogurt", 3.8, 4.9, 3.8, "Huevos, lacteos y helados")
        @Chocolate = Lacteos.new("Chocolate", 5.3, 47.0, 30.0, "Alimentos grasos") 
        @Glucosa = Lacteos.new("Glucosa", 0.0, 99.8, 0.0, "Alimentos ricos en carbohidratos")
    
        #Iniciamos el array de data
        @CompManzana.data = [[6.7,6.5,6.8,6.9,7.0,7.1,6.9,6.9,6.9,6.7,6.9,7.3,7.0,7.0,7.2,7.1,6.8,7.2,7.3,7.0,6.8,6.7,6.8,6.7,6.9],
                          [4.6,4.8,5.3,5.6,6.1,6.5,6.6,7.0,7.0,6.8,6.4,6.3,6.1,6.1,6.2,6.0,6.1,6.1,6.2,6.3,6.4,6.1,6.1,5.7,5.9]]
        @Glucosa.data = [[4.9,5.3,5.9,6.7,7.2,7.6,8.0,8.2,8.2,8.4,8.3,8.3,8.0,7.5,7.1,6.8,6.8,6.9,6.8,6.3,6.2,6.3,6.2,6.3,6.1],
                     [6.3,5.4,5.6,5.7,6.5,7.4,7.9,7.4,7.7,7.9,7.9,7.8,7.8,7.8,8.0,8.5,9.4,10.8,10.5,9.1,8.9,8.3,7.7,7.6,7.5]]
        @Yogurt.data = [[6.1,6.6,6.3,6.3,6.1,6.9,6.8,6.5,6.4,6.9,6.8,6.5,6.3,6.2,6.7,6.2,5.9,5.8,5.8,5.8,5.8,5.8,5.9,6.2,6.4],
                     [4.9,4.9,5.2,5.8,6.5,7.0,7.2,7.3,7.3,6.6,6.2,6.1,6.0,6.1,5.9,5.9,5.9,5.9,5.8,5.8,5.5,5.5,5.6,5.9,5.9]]
        @Chocolate.data = [[6.5,6.5,6.7,6.5,6.5,6.8,6.7,6.2,6.5,7.2,6.9,7.0,6.3,6.2,6.1,5.9,5.8,6.1,6.7,6.7,6.6,6.7,6.9,7.2,7.1],
                        [4.6,4.6,4.7,4.7,4.8,4.7,4.8,4.8,4.6,4.4,4.7,4.7,4.8,4.7,5.2,5.9,5.9,5.7,5.4,5.3,5.1,4.8,4.8,4.9,5.9]]
    end
    
    it "Calcular AIBC de un alimento" do 
    expect(@CompManzana.aibc(0)).to eq(27.999999999999993)
    expect(@Yogurt.aibc(0)).to eq(30.500000000000036)
    expect(@Chocolate.aibc(0)).to eq(18.500000000000007)
    expect(@Glucosa.aibc(0)).to eq(255.99999999999997)
  end 

 it "Calculo de indice glucemico por individuo " do
    expect((@CompManzana.aibc(0) / @Glucosa.aibc(0)) * 100).to  eq(10.937499999999998)
    expect((@CompManzana.aibc(1) / @Glucosa.aibc(1)) * 100).to  eq(93.49489795918366)
    expect((@Yogurt.aibc(0) / @Glucosa.aibc(0)) * 100).to  eq(11.914062500000016)
    expect((@Yogurt.aibc(1) / @Glucosa.aibc(1)) * 100).to  eq(70.66326530612243)
    expect((@Chocolate.aibc(0) / @Glucosa.aibc(0)) * 100).to  eq(7.226562500000004)
    expect((@Chocolate.aibc(1) / @Glucosa.aibc(1)) * 100).to  eq(22.83163265306124)
  end 
  
  it "Calculo de indice glucemico del alimento" do
    auxiliar = (0..@CompManzana.data.length - 1).map { |x| (@CompManzana.aibc(x) / @Glucosa.aibc(x)) * 100}
    igCompManz = auxiliar.reduce(:+)/@CompManzana.data.length - 1
    auxiliar = (0..@Yogurt.data.length - 1).map { |x| (@Yogurt.aibc(x) / @Glucosa.aibc(x)) * 100}
    igYogurt = auxiliar.reduce(:+)/@Yogurt.data.length - 1
    auxiliar = (0..@Chocolate.data.length - 1).map { |x| (@Chocolate.aibc(x) / @Glucosa.aibc(x)) * 100}
    igChocolate = auxiliar.reduce(:+)/@Yogurt.data.length - 1
    
    expect(igCompManz).to eq(51.21619897959183)
    expect(igYogurt).to eq(40.28866390306122)
    expect(igChocolate).to eq(14.029097576530623)
  end 
    
end

describe "Uso del enumerable" do
   
    it "Pruebas metodo min con lista basica" do
         expect(@list.min).to eq(1)
    end
       
    it "Pruebas metodo max con lista basica" do
         expect(@list.max).to eq(23)
    end
      
    it "Prueba metodo sort con lista basica" do
        expect(@list.sort).to eq([1, 6, 7, 8, 10, 15, 23])
    end
    
    it"Prueba de metodo minmax con lista basica" do
        expect(@list.minmax).to eq([1,23])
    end
    
    it"Prueba de metodo min con lista de menus" do
      expect(@lista_menus.min).to eq(@menu6)
    end
    
    it "Pruebas metodo max con lista de menus" do
         expect(@lista_menus.max).to eq(@menu4)
    end
      
    it "Prueba metodo sort con lista de menus" do
        expect(@lista_menus.sort).to eq([@menu6, @menu2, @menu1,@menu5,@menu4])
    end
    
    it"Prueba de metodo minmax con lista de menus" do
        expect(@lista_menus.minmax).to eq([@menu6,@menu4])
    end
end

describe "Uso del comparable" do
    
    it "Comprobando metodo comparable >/< para las proteinas de diferentes menus:"do
    expect(@menu1 > @menu2).to eq(true)
    expect(@menu1 < @menu2).to eq(false)
    end
    it "Comprobando metodo comparable = para las proteinas de diferentes menus:"do
    expect(@menu2 == @menu3).to eq(true)
    expect(@menu1 == @menu2).to eq(false)
    end
    it "Comprobando metodo comparable <=/>= para las proteinas de diferentes menus:"do
    expect(@menu4 >= @menu5).to eq(true)
    expect(@menu6 <= @menu5).to eq(true)
     expect(@menu2 >= @menu3).to eq(true)
    expect(@menu2 <= @menu3).to eq(true)
    end

end

describe "Uso de listas" do
    
    it "Comprobación de valores de una lista básica" do
    expect(@lista.cola.valor).to eq("Zanahoria")
    expect(@lista.cabecera.valor).to eq("Zanahoria")
    expect(@lista.cabecera.siguiente). to eq(nil)
    end
    
    it "Se puede introducir un nuevo elemento/elementos o sacarlo/s en la lista básica" do
    expect(@lista.push("Chocolate"))
    expect(@lista.cabecera.prev.valor).to eq("Zanahoria")
    expect(@lista.cola.valor).to eq("Zanahoria")
    expect(@lista.cola.prev).to eq(nil)
    expect(@lista.cabecera.valor).to eq("Chocolate")
    expect(@lista.cabecera.siguiente).to eq(nil)
    expect(@lista.pop).to eq("Chocolate")
    expect(@lista.push(["Almendras", "Avellanas"]))
    expect(@lista.cabecera.valor).to eq("Avellanas")
    expect(@lista.cabecera.prev.valor).to eq("Almendras")
    
    end
    
    it "Operaciones sobre la lista de lacteos  (comprobación de valores, push y pop)" do
    expect(@lista_lacteos.pop).to eq(["Yogurt", 3.8, 4.9, 3.8])
    expect(@lista_lacteos.pop).to eq( ["Leche vaca", 3.3, 4.8, 3.2])
    expect(@lista_lacteos.cabecera.valor).to eq(["Huevo frito", 14.1, 0.0, 19.5])
    end
    
    it "Operaciones sobre la lista de carnes (comprobación de valores, push y pop)" do
    
    expect(@lista_carnes.cabecera.valor).to eq(["Pollo", 20.6, 0.0, 5.6])
    expect(@lista_carnes.cola.valor).to eq( ["Cerdo", 21.5, 0.0, 6.3])
    expect(@lista_carnes.cabecera.prev.valor).to eq(["Ternera", 21.1, 0.0, 3.1])
    expect(@lista_carnes.cabecera.siguiente).to eq(nil)
    expect(@lista_carnes.cabecera.prev.prev.valor).to eq( ["Cerdo", 21.5, 0.0, 6.3])
    expect(@lista_carnes.cabecera.prev.prev.prev).to eq(nil)
    expect(@lista_carnes.pop).to eq(["Pollo", 20.6, 0.0, 5.6])
    expect(@lista_carnes.pop).to eq(["Ternera", 21.1, 0.0, 3.1])
    expect(@lista_carnes.pop).to eq(["Cerdo", 21.5, 0.0, 6.3])
    expect(@lista_carnes.pop).to eq(nil)
    expect(@lista_carnes.push([["Solomillo", 22.5, 23.2, 34.5]]))
    expect(@lista_carnes.cabecera.valor).to eq(["Solomillo", 22.5, 23.2, 34.5])
    
    end
    
    it "Operaciones sobre la lista de pescados  (comprobación de valores, push y pop)" do
    
    expect(@lista_pescado.cabecera.valor).to eq(["Salmon", 19.9, 0.0, 13.6])
    expect(@lista_pescado.cola.valor).to eq( ["Bacalao", 17.7, 0.0, 0.4])
    expect(@lista_pescado.cabecera.prev.valor).to eq( ["Atún", 21.5, 0.0, 15.5])
    expect(@lista_pescado.cabecera.siguiente).to eq(nil)
    expect(@lista_pescado.cabecera.prev.prev.valor).to eq(["Bacalao", 17.7, 0.0, 0.4])
    expect(@lista_pescado.cabecera.prev.prev.prev).to eq(nil)
    expect(@lista_pescado.pop).to eq(["Salmon", 19.9, 0.0, 13.6])
    expect(@lista_pescado.pop).to eq( ["Atún", 21.5, 0.0, 15.5])
    expect(@lista_pescado.pop).to eq(["Bacalao", 17.7, 0.0, 0.4])
    expect(@lista_pescado.pop).to eq(nil)
    expect(@lista_carnes.push([["Panga", 22.5, 23.2, 34.5]]))
    expect(@lista_carnes.cabecera.valor).to eq(["Panga", 22.5, 23.2, 34.5])
    
    
    end
end


describe "Pruebas de herencia" do
  
  it "Pruebas de herencia" do
    expect(@alimentos.class).to eq(Alimentos::Alimentos)
    expect(Alimentos::Alimentos.class).to eq(Class)
    expect(Alimentos.class).to eq(Module)
    expect(@menu_lacteos.class).to eq(Lacteos)
    expect(@menu_lacteos.instance_of?Lacteos).to eq(true)
    expect(Lacteos.is_a?Class).to eq(true)
    expect(@menu_lacteos.is_a?Alimentos::Alimentos).to eq(true)
    
  end
  
end

describe "Existe un nombre para el alimento" do
    
    it "Existe el alimento 3" do
    expect(@alimentos.get_ali(2)).not_to be_nil
  end
  it "Existe el alimento 5" do
    expect(@alimentos.get_ali(4)).not_to be_nil
  end
  it "Existe el alimento 10" do
    expect(@alimentos.get_ali(9)).not_to be_nil
  end
  it "Existe el alimento 8" do
    expect(@alimentos.get_ali(7)).not_to be_nil
  end
  
end

describe "Existe cantidad de proteinas para el alimento" do
    
    it "Existen las proteinas del alimento 3" do
    expect(@alimentos.get_proteinas(2)).not_to be_nil
  end
  it "Existe  las proteinas del alimento 5" do
    expect(@alimentos.get_proteinas(4)).not_to be_nil
  end
  it "Existe las proteinas del alimento 10" do
    expect(@alimentos.get_proteinas(9)).not_to be_nil
  end
  it "Existen las proteinas del alimento 8" do
    expect(@alimentos.get_proteinas(7)).not_to be_nil
  end
  
end

describe "Existe cantidad de glúcidos para el alimento" do
    
    it "Existen los glucidos del alimento 3" do
    expect(@alimentos.get_glucidos(2)).not_to be_nil
  end
  it "Existe  los glucidos del alimento 5" do
    expect(@alimentos.get_glucidos(4)).not_to be_nil
  end
  it "Existe los glucidos del alimento 10" do
    expect(@alimentos.get_glucidos(9)).not_to be_nil
  end
  it "Existen los glucidos del alimento 8" do
    expect(@alimentos.get_glucidos(7)).not_to be_nil
  end
  
end

describe "Existe cantidad de lípidos para el alimento" do
    
    it "Existen los lípidos del alimento 3" do
    expect(@alimentos.get_lipidos(2)).not_to be_nil
  end
  it "Existe  los lípidos del alimento 5" do
    expect(@alimentos.get_lipidos(4)).not_to be_nil
  end
  it "Existe los lípidos del alimento 10" do
    expect(@alimentos.get_lipidos(9)).not_to be_nil
  end
  it "Existen los lípido del alimento 8" do
    expect(@alimentos.get_lipidos(7)).not_to be_nil
  end
  
end

describe "Existe un método para obtener el nombre de los alimentos" do
  
  it "Existe el yogurt" do
    expect(@alimentos.get_ali(2)).to eq("Yogurt")
  end
  
    it "Existe el cerdo" do
    expect(@alimentos.get_ali(3)).to eq("Cerdo")
  end
  
    it "Existe el atún" do
    expect(@alimentos.get_ali(7)).to eq("Atún")
  end

    it "Existe el chocolate" do
    expect(@alimentos.get_ali(10)).to eq("Chocolate")
  end

end

describe "Existe un método para obtener el valor de las proteinas de los alimentos" do
   
   it "Comprobamos las proteinas del huevo frito(14.1)" do
    expect(@alimentos.get_proteinas(0)).to eq(14.1)
  end
  
   it "Comprobamos las proteinas del cerdo(21.5)" do
    expect(@alimentos.get_proteinas(3)).to eq(21.5)
  end
  
   it "Comprobamos las proteinas del chocolate(5.3)" do
    expect(@alimentos.get_proteinas(10)).to eq(5.3)
  end
  
end

describe "Existe un método para obtener el valor de los glucidos de los alimentos" do
   
   it "Comprobamos los glucidos del huevo frito(0.0)" do
    expect(@alimentos.get_glucidos(0)).to eq(0.0)
  end
  
   it "Comprobamos los glucidos del cerdo80.0)" do
    expect(@alimentos.get_glucidos(3)).to eq(0.0)
  end
  
   it "Comprobamos los glucidos del chocolate(47.0)" do
    expect(@alimentos.get_glucidos(10)).to eq(47.0)
  end
  
end

describe "Existe un método para obtener el valor de los lipidos de los alimentos" do
   
   it "Comprobamos los lipidos del huevo frito(19.5)" do
    expect(@alimentos.get_lipidos(0)).to eq(19.5)
  end
  
   it "Comprobamos los lipidos del cerdo(6.3)" do
    expect(@alimentos.get_lipidos(3)).to eq(6.3)
  end
  
   it "Comprobamos los lipidos del chocolate (30)" do
    expect(@alimentos.get_lipidos(10)).to eq(30.0)
  end
  
end

describe "Existe un método para obtener el valor energético de un alimento" do
 
  it "Valor energético del pollo(132.8 Kcal)" do
    expect(@alimentos.get_calorias(5)).to eq(132.8)
  end
  
  it "Valor energético del huevo frito(231.9 Kcal)" do
    expect(@alimentos.get_calorias(0)).to eq(231.9)
  end
  
  it "Valor energético del chocolate (479.2 Kcal)" do
    expect(@alimentos.get_calorias(10)).to eq(479.2)
  end
  
end

describe "Existe un método para obtener el alimento formateado." do
    
    it "Se muestra correctamente formateado el Yogurt " do
        expect( @alimentos.get_formateado(2) ).to eq("Yogurt = 3.8 gr de proteinas + 4.9 gr de glucidos + 3.8 gr de lipidos | 69.0 Kcal en total")
    end 
    
    it "Se muestra correctamente formateado las Papas" do
        expect( @alimentos.get_formateado(14) ).to eq("Papas = 2.0 gr de proteinas + 15.4 gr de glucidos + 0.1 gr de lipidos | 70.5 Kcal en total")
    end 
      
  end  

end