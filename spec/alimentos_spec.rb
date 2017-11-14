require "spec_helper"
require "./lib/alimentos.rb"
require  "./lib/alimentos/lista.rb"

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
  
       
    
    
  end    
    

describe "Uso del enumerable" do
   
    it "Pruebas metodo min" do
         expect(@list.min).to eq(1)
    end
       
    it "Pruebas metodo max" do
         expect(@list.max).to eq(23)
    end
      
    it "Prueba metodo sort" do
        expect(@list.sort).to eq([1, 6, 7, 8, 10, 15, 23])
    end
    
    it"Prueba de metodo minmax" do
        expect(@list.minmax).to eq([1,23])
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