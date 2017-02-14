require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all=[]

  def initialize(poke_hash)
    @id=poke_hash[:id]
    @name=poke_hash[:name]
    @type= poke_hash[:type]
    @db=poke_hash[:db]
    @hp=hp
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', [name, type])
  end


  def self.find(id, db)
    poke_object=db.execute('SELECT * FROM pokemon WHERE id=(?)', [id])
    poke_object.flatten!
    poke_hash={:id=> poke_object[0], :name=>poke_object[1], :type=>poke_object[2], :hp=>poke_object[3], :db=> db}
    Pokemon.new(poke_hash)
    binding.pry
  end

  def alter_hp(new_hp, db)
    db.execute('UPDATE pokemon SET hp=? WHERE id=?', new_hp, self.id)
    binding.pry
    # self.hp=db.execute('SELECT hp FROM pokemon WHERE name=(?)', [self.name])


  end

end
