module Prototype
  def initialize(prototipo = nil)
    @prototipo = prototipo
  end
  def set_property(attribute, value)

    define_singleton_method(attribute) do ## uso define single method porque define method establece un método de clase
                                          # y por lo tanto todas las instancias van a decir lo mismo
      value
    end
    define_singleton_method("#{attribute}=") do |new_value|  #defino también el getter
      value = new_value
    end

  end

  def set_method(nombre, bloque)
    define_singleton_method(nombre) do |*args|
      instance_exec(*args, &bloque)              # para ejecutar el bloque sin parametros instance_eval, con parámetros instances_exec
    end
  end

  def set_prototype(prototipo)

    @prototipo = prototipo
  end

  def respond_to_missing(method_name)
    @prototipo.respond_to?(method_name) || super
  end

  def method_missing(method_name, *params, &block)
    if @prototipo.respond_to?(method_name)
      @prototipo.send(method_name, *params, &block)
    else
      super
    end
  end


end
