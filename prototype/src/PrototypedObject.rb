require_relative 'Prototype.rb'
class PrototypedObject
  attr_accessor :prototype
  include Prototype

  end

#   private def method_missing(symbol, args, block)
#     message_name = symbol.to_s
#     if message_name.end_with?('=')
#       property = message_name.delete_suffix('=')
#       self.set_property(property, args.first)
#   else
#     super
#   end
#   end
#
#   def respond_to_missing? (sym, include_all=false)
#     message_name = symbol.to_s
#
#     if message_name.end_with('=')
#       property = message_name.delete_suffix('=')
#
#     end
#   endend
#
#end




# guerrero = PrototypedObject.new
# guerrero.set_property(:energia, 100)
#
# puts guerrero.energia
# guerrero.set_property(:potencial_defensivo, 10)
# guerrero.set_property(:potencial_ofensivo, 30)
#
# guerrero.set_method(:atacar_a,
#                     proc {
#                       |otro_guerrero|
#                       if(otro_guerrero.potencial_defensivo < self.potencial_ofensivo)
#                         otro_guerrero.recibe_danio(self.potencial_ofensivo - otro_guerrero.potencial_defensivo)
#                       end
#                     });
# guerrero.set_method(:recibe_danio, proc {
#
#   |danio|
#   self.set_property(:energia, self.energia - danio)
# })
# otro_guerrero = guerrero.clone #clone es un metodo que ya viene definido en Ruby
# guerrero.atacar_a otro_guerrero
#
# puts otro_guerrero.energia

