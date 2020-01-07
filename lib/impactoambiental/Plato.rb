class Plato < PlatoBasico
  # Metodo para calcular los kgco2eq o los m2anio emitidos o usados en funcion de los alimentos que componen el plato
  def calcularimpactoambiental(elemento)
    total = 0
    i = 0
    while i < @ingredientes.nodos
      if elemento == "kgco2eq"
        total += @ingredientes.get(i).value.kgco2eq * cantidades[i]
      elsif elemento == "m2anio"
        total += @ingredientes.get(i).value.m2anio * cantidades[i]
      end
      i = i + 1
    end
    return total
  end

  # Obtener kgco2eq totales producidos por el conjunto de alimentos
  def kgco2eq
    calcularimpactoambiental("kgco2eq")
  end

  # Obtener m2anio totales usados por el conjunto de alimentos
  def m2anio
    calcularimpactoambiental("m2anio")
  end

  # Representacion de Plato en forma de string
  def to_s
    string = "Nombre: #{@nombreplato}\n"
    string += "Tipo de plato: #{@tipoplato}\nIngredientes: #{@ingredientes}"
    i = 0
    string += "\nProteinas: "
    while i < proteinas.size
      string += "#{@proteinas[i]}% "
      i = i + 1
    end
    string += "\nCarbohidratos: "
    i = 0
    while i < carbohidratos.size
      string += "#{@carbohidratos[i]}% "
      i = i + 1
    end
    string += "\nLipidos: "
    i = 0
    while i < lipidos.size
      string += "#{@lipidos[i]}% "
      i = i + 1
    end
    string += "\nValor Energetico: #{@valor_energetico} cal"
    string += "\nImpacto Ambiental: #{kgco2eq} kgco2 y #{m2anio} m2anio"
  end

  # Devuelve un de dos elementos vector formado por los valores de kgco2eq y m2anio
  def eficiencia_energetica
    [ kgco2eq, m2anio ]
  end

  # Operador <=> necesario para usar comparable
  def <=>(other)
    if other == nil
      return nil
    end
    raise "Error no se puede comparar" unless (other.instance_of?Plato)
    (indicador_huella_nutricional) <=> (other.indicador_huella_nutricional)
  end

  # Metodo que devuelve la huella energetica media del conjunto de alimentos que forman el plato
  def huella_energetica
    @valor_energetico/@numeroplatos
  end

  # Metodo que devuelve el indicador de huella energetica del plato
  def indicador_huella_energetica
    if huella_energetica < 670
      return 1
    elsif huella_energetica > 830
      return 3
    end
    return 2
  end

  # Metodo que devuelve la huella ambiental media del conjunto de alimentos que forman el plato
  def huella_ambiental
    eficiencia_energetica[0]/@numeroplatos
  end

  # Metodo que devuelve el indicador de huella ambiental del plato
  def indicador_huella_ambiental
    if huella_ambiental < 800
      return 1
    elsif huella_ambiental > 1200
      return 3
    end
    return 2
  end

  # Metodo que devuelve el indicador de huella nutricional del plato
  def indicador_huella_nutricional
    ((indicador_huella_energetica+indicador_huella_ambiental)/2).round(0)
  end

  # Metodo que devuelve el valor de la huella nutricional del plato
  def huella_nutricional
    ((huella_energetica+huella_ambiental)/2).round(0)
  end
end

# Calcula el indicador huella nutricional medio de los platos del menu que le pasemos
def indicador_huella_nutricional(menu)
  if menu.instance_of? Array
    acu1, acu2 = 0 , 0
    menu.each do |n|
      acu1 = acu1 + n.indicador_huella_ambiental
      acu2 = acu2 + n.indicador_huella_energetica
    end
    return ( acu1/menu.size + acu2/menu.size )/2
  end
  return (menu.indicador_huella_ambiental + menu.indicador_huella_energetica)/2
end

# Calcula la huella nutricional media de un menu
def huella_nutricional(menu)
  if menu.instance_of? Array
    acu1, acu2 = 0 , 0
    menu.each do |n|
      acu1 = acu1 + n.huella_ambiental
      acu2 = acu2 + n.huella_energetica
    end
    return (acu1/menu.size+acu2/menu.size)/2
  end
  return (menu.huella_ambiental + menu.huella_energetica)/2
end

# Reajusta el vector de precios en funcion del % de huella nutricional que represente cada plato
def precios(menu, precios)
  precios.map do |x|
    if indicador_huella_nutricional(menu) == 1
      (x*1.1).round(2)
    elsif indicador_huella_nutricional(menu) == 2
      (x*1.5).round(2)
    else
      (x*2).round(2)
    end
  end
end
