class PrototypedConstructor
  include Prototype
  def self.new(prototype=nil)
    obj = Object.new
    obj.extend(Prototype)
    obj.set_prototype(prototype) if prototype
    obj
  end

  def new(properties={})

    obj = self.class.new(self)
    properties.each do |prop, value|
      obj.set_property(prop, value)
    end
    obj
  end

end
