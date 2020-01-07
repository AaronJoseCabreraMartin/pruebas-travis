class Menu
  attr_reader :nombre, :descripcion, :componentes, :precio, :precios
  def initialize(nombremenu, &bloque)
    @nombre = nombremenu
    if block_given?
      if bloque.arity == 1
        yield self
      else
        instance_eval( &bloque )
      end
    end
  end

  def descripcion(texto = "no hay descripcion")
    @descripcion = texto
  end

  def componente( datos = {} )
    if @componentes == nil
      @componentes = [ platos(datos[:descripcion]) ]
      @precios = [ datos[:precio] ]
    else
      @componentes << platos(datos[:descripcion])
      @precios << datos[:precio]
    end
  end

  def precio( precio = 0)
    @precio = precio
  end

  def to_s
    string = "#{@nombre}\n"
    string += "Platos: #{@descripcion}\n"
    i = 0
    kgco2eq = 0
    m2anio = 0
    while i < componentes.size
      string += " #{i+1}º #{componentes[i]}\nPrecio: #{precios[i]}€\n"
      kgco2eq += componentes[i].kgco2eq
      m2anio += componentes[i].m2anio
      i = i + 1
    end
    string += "\nHuella ambiental del menu: #{kgco2eq} kgco2eq, #{m2anio} m2anio\n"
    string += "Precio del menu:#{@precio}€"
  end
#falta hacer que no sea solo guardando el nombre sino que guarde el plato como tal
#tambien falta travis y coveralls
  private def platos ( nombre )
    if nombre == "Hamburguesa especial de la casa"
      plato = Plato.new("Hamburguesa") do
        nombre "Hamburguesa especial de la casa"
        alimento :descripcion => "carne de vaca",
                 :gramos => 100
        alimento :descripcion => "huevo",
                 :gramos => 20
      end
    elsif nombre == "Papas pequeñas"
      plato = Plato.new("Papas") do
        nombre "Papas pequeñas"
        alimento :descripcion => "Papas",
                 :gramos => 100
      end
    elsif nombre == "Refrescos de lata"
      plato = Plato.new("Refrescos") do
        nombre "Refrescos de lata"
        alimento :descripcion => "Refresco",
                 :gramos => 75
      end
    end
    return plato
  end
end
