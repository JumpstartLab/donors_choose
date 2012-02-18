unless Object.new.respond_to?(:singleton_class)
  class Object
    def singleton_class
      class << self; self; end
    end
  end
end
