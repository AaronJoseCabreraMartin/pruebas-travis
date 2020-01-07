class Alimento
  include Comparable
  attr_reader :nombre, :kgco2eq, :m2anio, :proteinas, :valor_energetico, :carbohidratos, :lipidos

    # Constructor de la clase Alimento
    def initialize( nombre, informacion)
      @nombre,@kgco2eq,@m2anio, @carbohidratos, @lipidos, @proteinas = nombre, informacion[0].round(4), informacion[1].round(4), informacion[2].round(4), informacion[3].round(4), informacion[4].round(4)
      @valor_energetico = calculatevalorenergetico
    end

    # Aplica la formula para calcular el valor energetico y lo devuelve
    def calculatevalorenergetico
		  4*@carbohidratos+9*@lipidos+4*@proteinas 
	  end

    # Metodo que devuelve una representacion del Alimento en string
    def to_s
		  "Nombre del alimento: #{@nombre}\nKilogramos de CO2: #{@kgco2eq}\nMetros cuadrados año utilizados: #{@m2anio}\nCarbohidratos: #{@carbohidratos}\nLipidos: #{@lipidos}\nProteinas: #{@proteinas}\nValor Energético: #{@valor_energetico}cal"
	  end

    # Definicion del metodo + para poder sumar los diferentes alimentos
    def +(other)
      raise "Se debe sumar con otro alimento" unless other.instance_of?Alimento
      informacion = [@kgco2eq+other.kgco2eq, @m2anio+other.m2anio, @carbohidratos+other.carbohidratos, @lipidos+other.lipidos, @proteinas+other.proteinas ]
      nombre = @nombre + ", " + other.nombre
      Alimento.new(nombre,informacion)
    end

    # Definicion del metodo <=> para que sea Comparable
    def <=>(other)
      if other == nil
        return nil
      end
      raise "Error no se puede comparar" unless (other.instance_of?Alimento)
      (@valor_energetico) <=> (other.valor_energetico)
    end
end
