module Prototype

  def set_property(attribute, value)

    self.class.send(:attr_accessor, attribute)
    instance_variable_set("@#{attribute}", value)

  end

  def set_property2(attribute, value)

    self.singleton_class.send(:attr_accessor, attribute)
    self.send("#{attribute}=", value)
  end
  def set_method(name, method)
    define_singleton_method(name, &method)
  end
end