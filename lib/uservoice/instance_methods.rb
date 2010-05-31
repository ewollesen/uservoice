# This module holds all instance methods to be
# included into ActionController::Base class
# for enabling uservoice in a Rails app.
#
# Author::    Alexander Greim  (mailto:alexxx@iltempo.de)
# Copyright:: Copyright (c) 2010 il tempo
# License::   Distributes under the same terms as Ruby

module Uservoice
  module InstanceMethods

    # Set uservoice configuration file path.
    # Can be overridden.
    #
    def uservoice_configuration_file #:nodoc:
      "#{RAILS_ROOT}/config/uservoice.yml"
    end

    # Returns the uservoice configuration hash.
    # It's been lazy loaded and cached in the controller class.
    #
    def uservoice_configuration
      @@uservoice_configuration = begin
        configuration = YAML::load(IO.read(uservoice_configuration_file))
        HashWithIndifferentAccess.new(configuration)
      end
    end

  end
end
