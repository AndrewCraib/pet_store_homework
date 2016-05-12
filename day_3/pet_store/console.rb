require_relative( './models/pet')
require_relative( './models/store')

require ( 'pry-byebug' )

pet1 = Pet.new( { 'name' => 'Sam', 'type' => 'Beagle', 'image' => 'image9'} ).save()
return pet1


binding.pry
nil