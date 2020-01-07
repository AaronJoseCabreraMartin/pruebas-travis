class Lista
  include Enumerable
  attr_reader :head, :tail, :nodos

  # Head es el primer elemento, tail el ultimo. El initialize esta preparado para funcionar pasandole tanto el valor que queremos guardar en los nodos como con el nodo en si, tambien se puede iniciar con 1 solo argumento o con 2
  def initialize(head,tail = nil)
    if head.instance_of? Nodo
      if tail == nil
        @nodos = 1
        head.prev = nil
        head.next = nil
        @head = head
        @tail = head
      else
        raise "Error la lista debe contener nodos" unless ( tail.instance_of? Nodo )
        @nodos = 2
        head.prev = nil
        head.next = tail
        tail.prev = head
        tail.next = nil
        @head = head
        @tail = tail
      end
    else
      if tail == nil
        @nodos = 1
        nodo = Nodo.new(head,nil,nil)
        @head = nodo
        @tail = nodo
      else
        raise "Error la lista debe contener elementos de la misma clase" unless ( tail.class == head.class )
        @nodos = 2
        nodo1 = Nodo.new(head,nil,nil)
        nodo2 = Nodo.new(tail,nil,nil)
        nodo1.next = nodo2
        nodo2.prev = nodo1
        @head = nodo1
        @tail = nodo2
      end
    end
  end

  # Inserta el nodo que recibe por argumento en la primera posicion, tambien se puede pasar el valor que queremos que guarde el nodo
  def insert_head(nodo)
    if (nodo.instance_of? Nodo) == false
      nodo = Nodo.new(nodo,nil,nil)
    end
    raise "Error la lista debe contener nodos" unless ( nodo.instance_of? Nodo )
    nodo.next = @head
    @head.prev = nodo
    nodo.prev = nil
    @nodos = @nodos +1
    @head = nodo
  end

  # Inserta el nodo que recibe por argumento en la ultima posicion, tambien se puede pasar el valor que queremos que guarde el nodo
  def insert_tail(nodo)
    if (nodo.instance_of? Nodo) == false
      nodo = Nodo.new(nodo,nil,nil)
    end
    raise "Error la lista debe contener nodos" unless ( nodo.instance_of? Nodo )
    @tail.next = nodo
    nodo.prev = @tail
    nodo.next = nil
    @nodos = @nodos +1
    @tail = nodo
  end

  # Representacion de la lista con sus elementos en forma de string
  def to_s
    string = "[ "
    nodo = @head
    while nodo != @tail
      if nodo.value != nil
        string = string + nodo.value.nombre + ", "
        nodo = nodo.next
      end
    end
    if nodo.value != nil
      string = string + nodo.value.nombre + " ]"
    end
    string
  end

  # Extrae el ultimo elemento de la lista y lo devuelve. Elimina el nodo de la lista.
  def extract_tail
    raise "Error la lista no puede estar vacia" unless (@nodos > 1)
    penultimo = @tail.prev
    penultimo.next = nil
    @nodos = @nodos-1
    oldtail = @tail
    @tail = penultimo
    oldtail
  end

  # Extrae el primer elemento de la lista y lo devuelve. Elimina el nodo de la lista.
  def extract_head
    raise "Error la lista no puede estar vacia" unless (@nodos > 1)
    @nodos = @nodos-1
    segundo = @head.next
    segundo.prev = nil
    oldhead = @head
    @head = segundo
    oldhead
  end

  # Inserta el nodo que le pasamos en la posicion que le pongamos, tambien puede pasarsele el valor que queremos que guarde el nodo
  def insert(nodo, pos)
    if (nodo.instance_of? Nodo) == false
      nodo = Nodo.new(nodo,nil,nil)
    end
    raise "Error la posicion la debe indicar un entero" unless ( pos.instance_of? Integer)
    raise "Error posicion inadecuada" unless ( pos <= @nodos )
    if pos == 0
      insert_head(nodo)
    elsif pos == @nodos
      insert_tail(nodo)
    else
      i = 1
      a = @head
      while i != pos
        i = i+1
        a = a.next
      end
      b = a.next
      nodo.prev = a
      nodo.next = b
      a.next = nodo
      b.prev = nodo
      @nodos = @nodos +1
      nodo
    end
  end

  # Extrae el nodo de la posicion que le pasemos y la devuelve. Elimina el nodo de la lista.
  def extract(pos)
    raise "Error la posicion la debe indicar un entero" unless ( pos.instance_of? Integer)
    raise "Error posicion inadecuada" unless ( pos <= @nodos )
    if pos == 0
      extract_head()
    elsif pos == @nodos
      extract_tail()
    else
      i = 1
      a = @head
      while i != pos
        i = i+1
        a = a.next
      end
      b = a.next
      c = a.prev
      b.prev = c
      c.next = b
      @nodos = @nodos - 1
      a
    end
  end

  # Devuelve el nodo de la posicion que le pasemos. No lo elimina de la lista.
  def get(pos)
    raise "Error la posicion la debe indicar un entero" unless ( pos.instance_of? Integer)
    raise "Error posicion inadecuada" unless ( pos <= @nodos )
    raise "Error posicion inadecuada" unless ( pos >= 0 )
    i = 0
    a = @head
    while i < pos
      i = i+1
      a = a.next
    end
    return a
  end

  # Iterador each
  def each
    if block_given?
      nodo = @head
      while nodo != @tail
        yield nodo.value
        nodo = nodo.next
      end
      yield @tail.value
    else
      nil
    end
  end


  # Calcula el valor energetico si la lista es una lista de platos
  def valorenergetico
    acumulador1 = 0
    nodo = @head
    while nodo != @tail
      acumulador1 = acumulador1 + nodo.value.valor_energetico
      nodo = nodo.next
    end
    acumulador1
  end

  def []i
    get(i)
  end
end
