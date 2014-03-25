class Course
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(attributes)
    attributes.each_pair do |key, val|
      public_send("#{key}=", val)
    end
  end

  def id=(id)
    @id = Integer(id)
  end

  def name=(name)
    @name = String(name)
  end

  def created_at=(created_at)
    @created_at = created_at
  end

  def updated_at=(updated_at)
    @updated_at = updated_at
  end
end
