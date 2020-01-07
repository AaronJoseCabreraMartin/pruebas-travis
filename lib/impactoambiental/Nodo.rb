Nodo = Struct.new(:value, :next, :prev) do
  include Comparable

  # Devuelve una version en string del contenido del nodo
  def to_s
    value.to_s
  end

  # Operador <=> necesario para que sea comparable
  def <=>(other)
    if other.instance_of?Nodo
      value <=> other.value
    else
      nil
    end
  end
end
