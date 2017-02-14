require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  @@all=[]

  def initialize(id:, name:, type:, hp:nil, db:)
    @id=id
    @name=name
    @type= type
    @hp=hp
    @db=db

  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', [name, type])
  end


  def self.find(id, db)

    poke_object=db.execute('SELECT * FROM pokemon WHERE id=(?)', [id])
    poke_object.flatten!
    poke_hash={:id=> poke_object[0], :name=>poke_object[1], :type=>poke_object[2], :hp=>poke_object[3], :db=> db}
    new_pokemon=Pokemon.new(poke_hash)
    # binding.pry
  end

  def alter_hp(hp, db)
      # binding.pry
    db.execute('UPDATE pokemon SET hp=? WHERE id=?', hp, self.id)
    # binding.pry
  end

end
