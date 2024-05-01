require_relative '../src/PrototypedObject.rb'
require_relative '../src/PrototypedConstructor.rb'

def create_guerrero
  guerrero = PrototypedObject.new
  guerrero.set_property(:energia, 100)

  puts guerrero.energia
  guerrero.set_property(:potencial_defensivo, 10)
  guerrero.set_property(:potencial_ofensivo, 30)

  guerrero.set_method(:atacar_a,
                      proc {
                        |otro_guerrero|
                        if(otro_guerrero.potencial_defensivo < self.potencial_ofensivo)
                          otro_guerrero.recibir_danio(self.potencial_ofensivo - otro_guerrero.potencial_defensivo)
                        end
                      });
  guerrero.set_method(:recibir_danio, proc {

    |danio|
    self.set_property(:energia, self.energia - danio)
  })

  return guerrero
end

describe 'prototyped behaviour' do
  it 'should be able to define properties' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:energia, 100)

    expect(guerrero.energia).to eq(100)
  end

  it 'should be able to set prototype' do
     guerrero = create_guerrero
     espadachin = PrototypedObject.new

    espadachin.prototype = guerrero

    expect(espadachin).to respond_to(:energia)
    expect(espadachin).to respond_to(:potencial_ofensivo)
    expect(espadachin).to respond_to(:potencial_defensivo)
    expect(espadachin).to respond_to(:atacar_a)
    expect(espadachin).to respond_to(:recibir_danio)
  end

=begin
  it 'should fail to call an undefined property on another prototype' do
    guerrero = PrototypedObject.new
    guerrero.set_property(:energia, 100)

    expect{(PrototypedObject.new.energia )}. to raise_error(NoMethodError)
  end

=end

  it 'should be able to clone prototype object' do
    guerrero = create_guerrero
    otro_guerrero = guerrero.clone

    expect(otro_guerrero.energia).to eq(100)
  end
end

describe 'prototyped constructor' do
  it'constructor should be able to return an object with prototype' do
    guerrero = create_guerrero

    Guerrero = PrototypedConstructor.new(guerrero)

    expect(Guerrero).to be_a(Object)


  end
end

