class PlatoBasico
  include Comparable
  attr_reader :tipoplato, :nombreplato, :ingredientes, :cantidades, :proteinas, :carbohidratos, :lipidos, :valor_energetico, :huella_de_carbono, :energia

  # Constructor de la clase PlatoBasico
  def initialize( nombreplato, lista = nil, cantidades = [], &bloque )
    @nombreplato = nombreplato
    # if block_given?
    if lista == nil and cantidades == []
      if bloque.arity == 1
        yield self
      else
        instance_eval( &bloque )
      end
    else
      if lista.instance_of? Lista
        @ingredientes,@numeroplatos = lista, lista.nodos
        if cantidades.instance_of? Array
          @cantidades = cantidades
          raise "Error en las cantidades de cada alimento" unless @cantidades.size == lista.nodos
        else
          @cantidades = Array.zero(lista.nodos)
        end
      else
        raise "Error, se debe pasar una lista o un alimento" unless lista.instance_of? Nodo
        @ingredientes = Lista.new(lista)
        @cantidades = cantidades
        raise "Error en las cantidades de cada alimento" unless @cantidades.size == 1
      end
    end
    @proteinas = calcular("proteinas")
    @carbohidratos = calcular("carbohidratos")
    @lipidos = calcular("lipidos")
    @valor_energetico = calcular("valor_energetico")
    @energia = @valor_energetico / @ingredientes.nodos
    @huella_de_carbono = calcular("kgco2eq") / @ingredientes.nodos
  end


  # Es un metodo para calcular el valor energetico, los kgco2eq, las proteinas, los carbohidratos y los lipidos totales del PlatoBasico
  def calcular(elemento)
    if elemento == "valor_energetico" || elemento == "kgco2eq"
      aux = 0
    else
      aux = []
    end
    gtotales = 0
    i = 0
    while i < @ingredientes.nodos
      if elemento == "proteinas"
        aux << @ingredientes.get(i).value.proteinas * cantidades[i]
        gtotales += aux[i]
      elsif elemento == "carbohidratos"
        aux << @ingredientes.get(i).value.carbohidratos * cantidades[i]
        gtotales += aux[i]
      elsif elemento == "lipidos"
        aux << @ingredientes.get(i).value.lipidos * cantidades[i]
        gtotales += aux[i]
      elsif elemento == "valor_energetico"
        aux += @ingredientes.get(i).value.valor_energetico * cantidades[i]
        ####################################################
      elsif elemento == "kgco2eq"
        aux += @ingredientes.get(i).value.kgco2eq * cantidades[i]
      end
      i = i + 1
    end
    if elemento != "valor_energetico" && elemento != "kgco2eq"
      i = 0
      while i < aux.size
        aux[i] = ((aux[i]/gtotales) * 100).round(4)
        i = i + 1
      end
    end
    return aux
  end

  # Representacion de Plato Basico en forma de string
  def to_s
    string = "Nombre:#{@nombreplato}\n"
    string += "Tipo de plato: #{@tipoplato}\nIngredientes: #{@ingredientes}"
    i = 0
    string += "\nProteinas: "
    while i < proteinas.size
      string += "#{@proteinas[i].round(4)}% "
      i = i + 1
    end
    string += "\nCarbohidratos: "
    i = 0
    while i < carbohidratos.size
      string += "#{@carbohidratos[i].round(4)}% "
      i = i + 1
    end
    string += "\nLipidos: "
    i = 0
    while i < lipidos.size
      string += "#{@lipidos[i].round(4)}% "
      i = i + 1
    end
    string += "\nValor Energetico: #{@valor_energetico.round(4)} cal"
  end

  # Operador <=> necesario para usar comparable
  def <=>(other)
    if other == nil
      return nil
    end
    raise "Error no se puede comparar" unless (other.instance_of?PlatoBasico)
    (@valor_energetico) <=> (other.valor_energetico)
  end

  #SDL
  def nombre( text = "Sin nombre" )
    # raise "Error el nombre debe ser una cadena de caracteres" unless (text.instance_of?String)
    @nombreplato = text
  end

  def alimento( descripcion = {} )
    raise "Error establezca cada alimento" unless descripcion != {}
    alimento1 = Alimento.new( descripcion[:descripcion], informacion(descripcion[:descripcion]) )#??? como se las cantidades de las
    if @ingredientes == nil || @cantidades == nil
      #proteinas lipidos etc de las cosas que me han metido? todo eso esta en el spect deberia hacer un metodo
      #que me devuelva pasandole un string el alimento correspondiente ya relleno ???
      @ingredientes = Lista.new(alimento1)
      @cantidades = [ descripcion[:gramos] ]
    else
      @ingredientes.insert_tail(alimento1)
      @cantidades << descripcion[:gramos]
    end
  end

  private def informacion(alimento)
    if alimento == "carne de vaca"
      return [50.0,164.0,0.0,3.1,21.1]
    elsif alimento == "carne de cordero"
      return [20.0,185.0,0.0,17.0,18.0]
    elsif alimento == "camarones"
      return [18.0,2.0,1.5,0.6,17.6]
    elsif alimento == "chocolate"
      return [2.3,3.4,47.0,30.0,5.3]
    elsif alimento == "salmon"
      return [6.0,3.7,0.0,13.6,19.9]
    elsif alimento == "cerdo"
      return [7.6,11.0,0.0,6.3,21.5]
    elsif alimento == "pollo"
      return [5.7,7.1,0.0,5.6,20.6]
    elsif alimento == "queso"
      return [11.0,41.0,1.3,33.0,25.0]
    elsif alimento == "cerveza"
      return [0.24,0.22,3.6,0.0,0.5]
    elsif alimento == "leche de vaca"
      return [3.2,8.9,4.8,3.2,3.3]
    elsif alimento == "huevo"
      return [4.2,5.7,1.1,11.0,13.0]
    elsif alimento == "cafe"
      return [0.4,0.3,0.0,0.0,0.1]
    elsif alimento == "tofu"
      return [2.0,2.2,1.9,4.8,8.0]
    elsif alimento == "lentejas"
      return [0.4,3.4,52.0,1.4,23.5]
    elsif alimento == "nuez"
      return [0.3,7.9,21.0,54.0,20.0]
    else
      return [1.0,1.0,1.0,1.0,1.0]
    end
  end

end
