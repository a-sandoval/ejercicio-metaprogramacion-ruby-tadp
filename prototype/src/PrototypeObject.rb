require_relative 'Prototype'
class PrototypedObject
  include Prototype
end

guerrero = PrototypedObject.new
guerrero.set_property(:energia, 100)

puts guerrero.energia
guerrero.set_property(:potencial_defensivo, 10)
guerrero.set_property(:potencial_ofensivo, 30)

guerrero.set_method(:atacar_a,
                    proc {
                      |otro_guerrero|
                      if(otro_guerrero.potencial_defensivo < self.potencial_ofensivo)
                        otro_guerrero.recibe_danio(self.potencial_ofensivo - otro_guerrero.potencial_defensivo)
                      end
                    });
guerrero.set_method(:recibe_danio, proc {

  |danio|
  self.set_property(:energia, self.energia - danio)
})
otro_guerrero = guerrero.clone #clone es un metodo que ya viene definido en Ruby
guerrero.atacar_a otro_guerrero

puts otro_guerrero.energia
