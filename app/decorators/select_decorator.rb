class SelectDecorator
  def self.collection(resources, attribute)
    resources.collect{|m| [m.send(attribute), m.id] }
  end
end
