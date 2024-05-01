module Prototype

  attr_accessor :prototype #, :properties

  #Valor inicial a un getter que esta definiendo (a efectos practicos funciona como setter)
  # Definimos metodo que retorna constantemenete el mismo valor
  # Estos metodos se van pisando entre si para devolver el valor que le digas
  # Devuelvo siempre el valor que le dije. def v do 7 end -> devuelve 7 siempre
  def set_property(prop_symb, value)
    define_singleton_method(prop_symb) do
      value ## getter
    end
    define_singleton_method("#{prop_symb}=") do |valor|
      value = valor ## setter
    end
    #  @properties[prop_symb] = value

  end
  #Mensaje ejecutado en el contexto del prototype object (como instancia) --> SELF
  # Atributo como caso particular de este
  def set_method(method_sym, proc)
    #definir metodo y esperar un bloque, ejecutado en la instancia
    # dice en su contrato sera ejecutado en el contexto del objeto que lo esta definiendo
    # El control sobre quien lo va a ejecutar lo define esta linea
    # Servir de intermediario
    define_singleton_method(method_sym, &proc)
  end
  
  def set_prototype(prototype)
    @prototype = prototype
  end

  private def method_missing(name, *args)
    if prototype.respond_to?(name)
      prototype.name
    end

    super
  end
  def respond_to_missing? (sym, include_all=false)

    prototype.respond_to?(sym) || super

  end
  ## La consigna dice que el prototipo no tiene que proveer estado, solo comportamiento, pero en ruby el estado
  # está definido por métodos, entonces son comportamiento también,
  # por lo tanto si le pido la fuerza a un objeto que no la tiene definida pero su prototipo sí voy a estar obteniendo parte del estado de esa clase, eso está bien??
end
