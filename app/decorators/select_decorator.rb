class SelectDecorator
  def self.collection(resources, attribute)
    resources.collect{|m| [m[attribute], m.id] }
  end
end
