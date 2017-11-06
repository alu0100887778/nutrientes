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