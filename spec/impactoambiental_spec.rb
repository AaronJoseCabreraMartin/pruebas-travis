RSpec.describe Impactoambiental do
  before(:all) do
		#kgco2eq,m2anio,carbohidratos,lipidos,proteinas
		info = [50.0,164.0,0.0,3.1,21.1]
		@carnedevaca = Alimento.new("carne de vaca",info)
		info = [20.0,185.0,0.0,17.0,18.0]
		@carnedecordero = Alimento.new("carne de cordero",info)
		info = [18.0,2.0,1.5,0.6,17.6]
		@camarones = Alimento.new("camarones",info)
    info = [2.3,3.4,47.0,30.0,5.3]
    @chocolate = Alimento.new("chocolate",info)
    info = [6.0,3.7,0.0,13.6,19.9]
    @salmon = Alimento.new("salmon",info)
    info = [7.6,11.0,0.0,6.3,21.5]
    @cerdo = Alimento.new("cerdo",info)
    info = [5.7,7.1,0.0,5.6,20.6]
    @pollo = Alimento.new("pollo",info)
    info = [11.0,41.0,1.3,33.0,25.0]
    @queso = Alimento.new("queso",info)
    info = [0.24,0.22,3.6,0.0,0.5]
    @cerveza = Alimento.new("cerveza",info)
    info = [3.2,8.9,4.8,3.2,3.3]
    @lechedevaca = Alimento.new("leche de vaca",info)
    info = [4.2,5.7,1.1,11.0,13.0]
    @huevos = Alimento.new("huevos",info)
    info = [0.4,0.3,0.0,0.0,0.1]
    @cafe = Alimento.new("cafe",info)
    info = [2.0,2.2,1.9,4.8,8.0]
    @tofu = Alimento.new("tofu",info)
    info = [0.4,3.4,52.0,1.4,23.5]
    @lentejas = Alimento.new("lentejas",info)
    info = [0.3,7.9,21.0,54.0,20.0]
    @nuez = Alimento.new("nuez",info)
	end
  before(:each)do
    ############post prueba al constructor de nodo ################
    @nodo1 = Nodo.new(@carnedevaca, nil, nil )
    @nodo2 = Nodo.new(@carnedecordero, nil, nil )
    @nodo3 = Nodo.new(@camarones, nil, nil )
    @nodo4 = Nodo.new(@chocolate, nil, nil )
    @nodo5 = Nodo.new(@salmon, nil, nil )
    @nodo6 = Nodo.new(@cerdo, nil, nil )
    @nodo7 = Nodo.new(@pollo, nil, nil )
    @nodo8 = Nodo.new(@queso, nil, nil )
    @nodo9 = Nodo.new(@cerveza, nil, nil )
    @nodo10 = Nodo.new(@lechedevaca, nil, nil )
    @nodo11 = Nodo.new(@huevos, nil, nil )
    @nodo12 = Nodo.new(@cafe, nil, nil )
    @nodo13 = Nodo.new(@tofu, nil, nil )
    @nodo14 = Nodo.new(@lentejas, nil, nil )
    @nodo15 = Nodo.new(@nuez, nil, nil )

    ############ post pruebas a nodo ################
    @lista1 = Lista.new(@nodo1, nil)
    @lista2 = Lista.new(@nodo15, nil)

    ########### pruebas listas de platos ###########
    # @platoespañol = Lista.new( @lentejas, @carnedevaca )
    # @platoespañol.insert_tail(@cerdo)
    # @platoespañol.insert_tail(@cerveza)
    # @lentejascompuestas = Plato.new("lentejas compuestas y cerveza", @platoespañol, [250,25,75,100])
    #
    # @plato2español = Lista.new(@cerdo,@huevos)
    # @plato2español.insert_tail(@queso)
    # @plato2español.insert_tail(@pollo)
    # @plato2español.insert_tail(@cafe)
    # @huevosestrellados = Plato.new("huevos estrellados y cafe", @plato2español, [150,200,125,85,50])
    #
    # @plato3español = Lista.new(@lechedevaca,@huevos)
    # @plato3español.insert_tail(@queso)
    # @plato3español.insert_tail(@cafe)
    # @tarta = Plato.new("tarta", @plato3español, [250,60,125,85])
    #
    # @dietaespañola = Lista.new(@lentejascompuestas, @huevosestrellados)
    # @dietaespañola.insert_tail(@tarta)
    #
    # @platovasco = Lista.new(@carnedevaca,@cerdo)
    # @platovasco.insert_tail(@cerveza)
    # @carnevasca = Plato.new("carnevasca",@platovasco,[250,200,75])
    #
    # @plato2vasco = Lista.new(@camarones,@huevos)
    # @plato2vasco.insert_tail(@salmon)
    # @pescadovasco = Plato.new("pescado vasco",@plato2vasco,[124,56,89])
    #
    # @dietavasca = Lista.new(@carnevasca,@pescadovasco)
    #
    #
    # @platovegetariano = Lista.new(@huevos,@queso)
    # @platovegetariano.insert_tail(@cerveza)
    # @vegetariano = Plato.new("plato vegetariano",@platovegetariano,[150,170,50])
    #
    # @platovegeta2riano = Lista.new(@lechedevaca,@tofu)
    # @platovegeta2riano.insert_tail(@chocolate)
    # @platovegeta2riano.insert_tail(@nuez)
    # @vegeta2riano = Plato.new("plato vegetariano",@platovegeta2riano,[65,147,50,72])
    #
    # @dietavegetariana = Lista.new(@vegetariano,@vegeta2riano)
    #
    # @platovetaliano = Lista.new(@nuez,@tofu)
    # @platovetaliano.insert_tail(@cerveza)
    # @vegetaliano = Plato.new("plato vegetaliano",@platovetaliano,[130,200,50])
    # @platovetaliano2 = Lista.new(@cafe,@lentejas)
    # @vegetaliano2 = Plato.new("plato vegetaliano2",@platovetaliano2,[215,5])
    #
    # @dietavetaliana = Lista.new(@vegetaliano,@vegetaliano2)
    #
    # @platocarne = Lista.new(@carnedecordero,@carnedevaca)
    # @platocarne.insert_tail(@cerveza)
    # @platocarne.insert_tail(@queso)
    # @carnivora = Plato.new("plato carnivoro",@platocarne,[290,190,75,60])
    #
    # @platocarne2 = Lista.new(@cerdo,@pollo)
    # @platocarne2.insert_tail(@cafe)
    # @platocarne2.insert_tail(@salmon)
    # @carnivora2 = Plato.new("plato carnivoro2",@platocarne2,[400,300,34,19])
    #
    # @dietalocuraporlacarne = Lista.new(@carnivora,@carnivora2)
	end


  describe "pruebas iniciales" do
    it "Tiene un constructor" do
      expect(Alimento.new("prueba", [1,2,3,4,5]) )
    end
    it "Tiene get nombre" do
      expect(@huevos.nombre).to eq("huevos")
    end
    it "Tiene get proteinas, kgco2eq, m2anio" do
      expect(@nuez.proteinas).to eq(20.0)
      expect(@lentejas.kgco2eq).to eq(0.4)
      expect(@tofu.m2anio).to eq(2.2)
    end
    it "Tiene get valor energetico " do
      expect( (@lechedevaca.valor_energetico).round(4) ).to eq(61.2000)
    end
    it "Tiene un to_s" do
      expect( @cafe.to_s ).to eq("Nombre del alimento: cafe\nKilogramos de CO2: 0.4\nMetros cuadrados año utilizados: 0.3\nCarbohidratos: 0.0\nLipidos: 0.0\nProteinas: 0.1\nValor Energético: 0.4cal")
    end
  end


  describe Nodo do
    it "tiene constructor" do
      expect( Nodo.new(@carnedevaca, nil, nil ) )
    end
    it "tiene los gets" do
      expect( @nodo1.prev  ).to eq(nil)
      expect( @nodo1.next  ).to eq(nil)
      expect( @nodo1.value ).to eq(@carnedevaca)
    end
    it "tiene los sets" do
      @nodo1.next = @nodo2
      expect( @nodo1.next ).to eq(@nodo2)
      @nodo2.prev = @nodo1
      expect( @nodo2.prev ).to eq(@nodo1)
    end
  end



  describe Lista do
    context "metodos de Lista basicos" do
      it "tiene constructor" do
        expect(Lista.new(@nodo1,nil))
      end

      it "tiene los gets" do
        expect(@lista1.head).to eq(@nodo1)
        expect(@lista1.tail).to eq(@nodo1)
        expect(@lista1.nodos).to eq(1)
      end

      it "se puede insertar por la cabeza" do
        @lista1.insert_head(@nodo2)
        expect(@lista1.head).to eq(@nodo2)
        expect(@lista1.tail).to eq(@nodo1)
      end

      it "se puede insertar por la cola" do
        @lista1.insert_tail(@nodo2)
        expect(@lista1.head).to eq(@nodo1)
        expect(@lista1.tail).to eq(@nodo2)
      end

      it "el to_s funciona" do
        expect( @lista1.to_s ).to eq("[ carne de vaca ]")
        @lista1.insert_tail(@nodo15)
        expect( @lista1.to_s ).to eq("[ carne de vaca, nuez ]")
        @lista1.insert_tail(@nodo12)
        expect( @lista1.to_s ).to eq("[ carne de vaca, nuez, cafe ]")
      end

      it "se puede extraer por la cola" do
        @lista1.insert_tail(@nodo2)
        expect(@lista1.tail).to eq(@nodo2)
        @lista1.extract_tail
        expect(@lista1.tail).to eq(@nodo1)
      end

      it "se puede extraer por la cabeza" do
        @lista1.insert_head(@nodo2)
        expect(@lista1.head).to eq(@nodo2)
        @lista1.extract_head
        expect(@lista1.head).to eq(@nodo1)
      end
    end
    context "metodos de lista avanzados" do

      it "se puede insertar en la posicion i" do
        @lista1.insert_tail(@nodo2)
        expect(@lista1.insert(@nodo13,2))
      end

      it "se puede extraer de la posicion i" do
        @lista1.insert_tail(@nodo13)
        @lista1.insert_tail(@nodo2)
        expect( @lista1.extract(2) ).to eq(@nodo13)
      end

    end

    describe "Listas de alimento" do

      it "Se calcula el impacto ambiental de la dieta española " do
        dietaespañola = Lista.new( @nodo2, @nodo4 )
        dietaespañola.insert_tail(@nodo9)
        dietaespañola.insert_tail(@nodo15)
        #40 % de carbohidratos, 40 % de grasas, 20 % de proteınas
        #carnedecordero + chocolate + cerveza + nueces
        #33,09% de carbohidratos, 46,67% grasas, 20,24% de proteinas
        dietaespañola = Dieta.new("mujer",dietaespañola)
        expect(dietaespañola.impactoambiental).to eq([22.84, 196.52])
        expect(dietaespañola.proteinas).to eq(43.8)
        expect(dietaespañola.carbohidratos).to eq(71.6)
        expect(dietaespañola.lipidos).to eq(101)
      end

      it "Se calcula el impacto ambiental de la dieta vasca " do
        #chocolate + lentejas + leche + queso
        vasca = Lista.new( @nodo4, @nodo14 )
        vasca.insert_tail(@nodo10)
        vasca.insert_tail(@nodo8)
        vasca = Dieta.new("hombre",vasca)

        expect(vasca.impactoambiental).to eq([16.9, 56.7])
        expect(vasca.proteinas).to eq(57.1)
        expect(vasca.carbohidratos).to eq(105.1)
        expect(vasca.lipidos).to eq(67.6)
      end

      it "Se calcula el impacto ambiental de la dieta vegetariana " do
        #leche + huevos + tofu + lentejas + nuez
        vegetariana = Lista.new( @nodo10, @nodo11 )
        vegetariana.insert_tail(@nodo13)
        vegetariana.insert_tail(@nodo14)
        vegetariana.insert_tail(@nodo15)
        vegetariana = Dieta.new("mujer",vegetariana)

        expect(vegetariana.impactoambiental).to eq([10.1, 28.1])
        expect(vegetariana.proteinas).to eq(67.8)
        expect(vegetariana.carbohidratos).to eq(80.8)
        expect(vegetariana.lipidos).to eq(74.4)
      end

      it "Se calcula el impacto ambiental de la dieta vegetaliana " do
        #cerveza + cafe + tofu + lentejas + nuez
        vegetaliana = Lista.new( @nodo9, @nodo12 )
        vegetaliana.insert_tail(@nodo13)
        vegetaliana.insert_tail(@nodo14)
        vegetaliana.insert_tail(@nodo15)
        vegetaliana = Dieta.new("mujer",vegetaliana)

        expect(vegetaliana.impactoambiental).to eq([3.34, 14.02])
        expect(vegetaliana.proteinas).to eq(52.1)
        expect(vegetaliana.carbohidratos).to eq(78.5)
        expect(vegetaliana.lipidos).to eq(60.2)
      end

      it "Se calcula el impacto ambiental de la dieta locura por la carne " do
        #carnedevaca+cerdo+pollo+cerveza+lentejas+camarones
        locuraporlacarne = Lista.new( @nodo1, @nodo6 )
        locuraporlacarne.insert_tail(@nodo7)
        locuraporlacarne.insert_tail(@nodo9)
        locuraporlacarne.insert_tail(@nodo14)
        locuraporlacarne.insert_tail(@nodo3)

        locuraporlacarne = Dieta.new("hombre",locuraporlacarne)
        #carnedevaca+cerdo+pollo+cerveza+lentejas+camarones
        expect(locuraporlacarne.impactoambiental).to eq([81.94, 187.72])
        expect(locuraporlacarne.proteinas).to eq(104.8)
        expect(locuraporlacarne.carbohidratos).to eq(57.1)
        expect(locuraporlacarne.lipidos).to eq(17.0)
      end
    end
  end
  describe "Comparable implementado" do
    it "<=> de Alimento implementado" do
      expect(@tofu<@carnedevaca).to eq(true)
      expect(@tofu>@carnedevaca).to eq(false)
      expect(@tofu<=@carnedevaca).to eq(true)
      expect(@tofu>=@carnedevaca).to eq(false)
      expect(@tofu==@carnedevaca).to eq(false)
      expect(@tofu!=@carnedevaca).to eq(true)
      expect(@tofu.between?(@cafe,@carnedevaca)).to eq(true)
      expect(@cafe.clamp(@tofu,@carnedevaca)).to eq(@tofu)
    end

    it "<=> de Nodo Implementado" do
      nodo1 = Nodo.new(@tofu)
      nodo2 = Nodo.new(@carnedevaca)
      nodo3 = Nodo.new(@cafe)
      expect(nodo1<nodo2).to eq(true)
      expect(nodo1>nodo2).to eq(false)
      expect(nodo1<=nodo2).to eq(true)
      expect(nodo1>=nodo2).to eq(false)
      expect(nodo1==nodo2).to eq(false)
      expect(nodo1!=nodo2).to eq(true)
      expect(nodo1.between?(nodo3,nodo2)).to eq(true)
      expect(nodo3.clamp(nodo1,nodo2)).to eq(nodo1)
    end
  end
  describe "Enumerable implementado" do
    it "collect" do
      listaA = Lista.new(@tofu,@cafe)
      expect(listaA.collect{ |x| x + @lechedevaca} )
    end

    it "each" do
      vec = [@tofu,@cafe,@chocolate,@salmon,@pollo]
      listaA = Lista.new(@tofu,@cafe)
      listaA.insert_tail(@chocolate)
      listaA.insert_tail(@salmon)
      listaA.insert_tail(@pollo)
      i = 0
      listaA.each do |auxiliar|
        expect(auxiliar).to eq(vec[i])
        i = i + 1
      end
    end

    it "select" do
      listaA = Lista.new(@tofu,@cafe)
      listaA.insert_tail(@chocolate)
      expect(listaA.select{ |a| a.valor_energetico }).to eq([@tofu,@cafe,@chocolate])
    end

    it "max" do
      listaA = Lista.new(@tofu,@cafe)
      listaB = Lista.new(@carnedevaca,@lechedevaca)
      expect(listaA.max).to eq(@tofu)
      expect(listaB.max).to eq(@carnedevaca)
    end

    it "min" do
      listaA = Lista.new(@tofu,@cafe)
      listaB = Lista.new(@carnedevaca,@lechedevaca)
      expect(listaB.min).to eq(@lechedevaca)
      expect(listaA.min).to eq(@cafe)
    end

    it "sort" do
      listaA = Lista.new(@tofu,@cafe)
      listaA.insert_tail(@chocolate)
      listaA.insert_tail(@salmon)
      listaA.insert_tail(@pollo)
      vec = [@cafe,@tofu,@pollo,@salmon,@chocolate]
      expect( listaA.sort ).to eq(vec)
    end

    describe "clase PlatoBasico" do
      # it "Tiene constructor" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   expect(PlatoBasico.new("platoespañol", platoespañol, [250,25,75,100]))
      # end
      # it "tiene los getters" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   platoBespañol = PlatoBasico.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #   expect(platoBespañol.nombreplato).to eq("lentejas compuestas y cerveza")
      #   expect(platoBespañol.ingredientes).to eq(platoespañol)
      #   expect(platoBespañol.cantidades).to eq([250,25,75,100])
      #   expect(platoBespañol.proteinas).to eq([72.8456, 6.5406, 19.9938, 0.62])
      #   expect(platoBespañol.carbohidratos).to eq([97.3054, 0.0, 0.0, 2.6946])
      #   expect(platoBespañol.lipidos).to eq([38.8889, 8.6111, 52.5, 0.0])
      #   expect(platoBespañol.valor_energetico).to eq(93800.0)
      # end
      #
      # it "tiene salida formateada" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   platoBespañol = PlatoBasico.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #   expect(platoBespañol.to_s)
      # end
    end
    describe "clase Plato" do
      # it "hereda de la clase PlatoBasico" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   platoBespañol = Plato.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #   expect(Plato.superclass).to eq(PlatoBasico)
      #   expect(platoBespañol.is_a?Object).to eq(true)
      #   expect(platoBespañol.is_a?PlatoBasico).to eq(true)
      # end
      #
      # it "tiene get kgco2eq y get m2anio" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   platoBespañol = Plato.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #
      #   expect(platoBespañol.kgco2eq).to eq(1944.0)
      #   expect(platoBespañol.m2anio).to eq(5797.0)
      # end
      #
      # it "tiene salida formateada" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   platoBespañol = Plato.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #   platoBespañol2 = PlatoBasico.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #
      #   expect(platoBespañol.to_s != platoBespañol2.to_s ).to eq(true)
      # end
      # it "Es comparable tiene el <=> implementado" do
      #   platoespañol = Lista.new( @lentejas, @carnedevaca )
      #   platoespañol.insert_tail(@cerdo)
      #   platoespañol.insert_tail(@cerveza)
      #   platoBespañol = Plato.new("lentejas compuestas y cerveza", platoespañol, [250,25,75,100])
      #   platodecarne = Lista.new( @carnedevaca, @carnedecordero )
      #   platodecarne.insert_tail(@cerdo)
      #   platodecarne.insert_tail(@pollo)
      #   platodecarne.insert_tail(@queso)
      #   platoBdecarne = Plato.new("carne variada con queso", platodecarne, [100,45,85,115,20])
      #   expect(platoBespañol == platoBdecarne).to eq(false)
      #   expect(platoBespañol > platoBdecarne).to eq(true)
      #   expect(platoBespañol < platoBdecarne).to eq(false)
      #   expect(platoBespañol != platoBdecarne).to eq(true)
      # end
    end
  end
    describe "dietas compuestas por platos" do
      # it "Comparar elementos de la lista de platos" do
      #   expect(@dietaespañola[1] > @dietavetaliana[1]).to eq(true)
      #   expect(@dietaespañola[0] < @dietavetaliana[0]).to eq(true)
      #   expect(@dietavegetariana[0] != @dietalocuraporlacarne[0]).to eq(true)
      #   expect(@dietavegetariana[1] == @dietalocuraporlacarne[1]).to eq(false)
      #   expect(@dietaespañola[0].value.kgco2eq).to eq(25*@carnedevaca.kgco2eq+250*@lentejas.kgco2eq+75*@cerdo.kgco2eq+100*@cerveza.kgco2eq)
      #   expect(@dietaespañola[0].value.m2anio).to eq(25*@carnedevaca.m2anio+250*@lentejas.m2anio+75*@cerdo.m2anio+100*@cerveza.m2anio)
      #
      #   expect(@dietaespañola[0].between?(@dietaespañola[2],@dietaespañola[1])).to eq(true)
      #   expect(@dietavegetariana[0].clamp(@dietavegetariana[1],@dietalocuraporlacarne[0])).to eq(@dietavegetariana[0])
      # end

      context "Enumerar lista de alimentos" do

        # it "collect" do
        #   expect(@dietavetaliana.collect)
        # end
        #
        # it "select" do
        #   expect(@dietavasca.select{ |a| a }).to eq([ @dietavasca[0].value, @dietavasca[1].value ])
        # end
        #
        # it "each" do
        #   i = 0
        #   @dietaespañola.each do |auxiliar|
        #     expect(auxiliar).to eq(@dietaespañola[i].value)
        #     i = i + 1
        #   end
        # end
        #
        # it "max" do
        #   expect(@dietaespañola.max).to eq(@dietaespañola[1].value)
        # end
        #
        # it "min" do
        #   expect(@dietaespañola.min).to eq(@dietaespañola[2].value)
        # end
        #
        # it "sort" do
        #   expect(@dietaespañola.sort).to eq([@dietaespañola[2].value,@dietaespañola[0].value,@dietaespañola[1].value])
        # end

      end
    end

    describe "menu" do
      it "tiene los gets" do
        # expect(@lentejascompuestas.huella_energetica).to eq(23450.0)
        # expect(@lentejascompuestas.huella_de_carbono).to eq(486.0)
        # expect(@lentejascompuestas.indicador_huella_ambiental).to eq(1)
        # expect(@lentejascompuestas.indicador_huella_energetica).to eq(3)
        # expect(@lentejascompuestas.indicador_huella_nutricional).to eq(2)
      end

      it "metodos avanzados" do
        # menu1 = [@lentejascompuestas, @huevosestrellados, @carnevasca]
        # precios = [ 7, 5, 3.5 ]
        #
        # expect(menu1.max).to eq(@carnevasca)
        # expect(indicador_huella_nutricional(menu1)).to eq(2)
        # expect(precios(menu1,precios)).to eq([10.5, 7.5, 5.25])
        #
        # menu2 = [ @carnivora, @carnivora2 ]
        # precios2 = [ 13, 11.5 ]
        #
        # expect(menu2.max).to eq(@carnivora)
        # expect(indicador_huella_nutricional(menu2)).to eq(3)
        # expect(precios(menu2,precios2)).to eq([26, 23])
        #
        # menu3 = [@vegetaliano, @vegetaliano2]
        # precios = [ 7, 3.5 ]
        #
        # expect(menu3.max).to eq(@vegetaliano)
        # expect(indicador_huella_nutricional(menu3)).to eq(1)
        # expect(precios(menu3,precios)).to eq([7.7, 3.85])
      end
    end

    describe "DSL" do

      it "plato" do
        expect (Plato.new("Hamburguesa") do
          nombre "Hamburguesa especial de la casa"
          alimento :descripcion => "carne de vaca",
                   :gramos => 100
          alimento :descripcion => "huevo",
                   :gramos => 20
        end)
        plato = Plato.new("Hamburguesa") do
          nombre "Hamburguesa especial de la casa"
          alimento :descripcion => "carne de vaca",
                   :gramos => 100
          alimento :descripcion => "huevo",
                   :gramos => 20
        end
        expect( plato.to_s ).to eq("Nombre: Hamburguesa especial de la casa\nTipo de plato: Hamburguesa\nIngredientes: [ carne de vaca, huevo ]\nProteinas: 89.0295% 10.9705% \nCarbohidratos: 0.0% 100.0% \nLipidos: 58.4906% 41.5094% \nValor Energetico: 14338.000000000002 cal\nImpacto Ambiental: 5084.0 kgco2 y 16514.0 m2anio")
      end

      it "menu" do
        expect(Menu.new("Combinado no. 1") do
          descripcion "hamburguesa, papas, refresco"
          componente  :descripcion => "Hamburguesa especial de la casa",
                      :precio => 4.25
          componente  :descripcion => "Papas pequeñas",
                      :precio => 1.75
          componente  :descripcion => "Refrescos de lata",
                      :precio => 1.50
          precio      7.50
        end)
        menu = Menu.new("Combinado no. 1") do
          descripcion "hamburguesa, papas, refresco"
          componente  :descripcion => "Hamburguesa especial de la casa",
                      :precio => 4.25
          componente  :descripcion => "Papas pequeñas",
                      :precio => 1.75
          componente  :descripcion => "Refrescos de lata",
                      :precio => 1.50
          precio      7.50
        end
        expect( menu.to_s )
      end
    end
end
