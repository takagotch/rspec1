class Roster
  def initialize(id, database)
    @id = id
    @database = database
  end

  def register(student)
    @database.count('Roster', :cource_id => @id)
    @database.begin
    @database.add(student)
    @database.commit
  end
end

