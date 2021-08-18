module InstanceCounter
  def self.included(base)
    base.extend Instances
    base.include RegisterInstance
  end

  module Instances
    attr_accessor :instances
  end

  private

  module RegisterInstance

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end

  end

end
