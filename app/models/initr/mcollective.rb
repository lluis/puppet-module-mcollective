class Initr::Mcollective < Initr::Klass
  unloadable

  validates_presence_of :mcollective_stomp_host,
    :mcollective_stomp_port,
    :mcollective_stomp_user,
    :mcollective_stomp_password,
    :on => :update
  self.accessors_for [ :mcollective_psk,
    :mcollective_stomp_host,
    :mcollective_stomp_port,
    :mcollective_stomp_user,
    :mcollective_stomp_password,
    :mcollective_factsource,
    :mcollective_plugins ]

  @@plugins = %w(facter service package nrpe iptables puppetd filemgr process)

  def initialize(attributes=nil)
    super
    config["mcollective_factsource"] ||= "facter"
    config["mcollective_stomp_port"] ||= 6163
    config["mcollective_plugins"] ||= {"facter"=>"1"}
  end

  # Variables for puppet
  def parameters
    conf = self.config
    conf["mcollective_plugins"] = config["mcollective_plugins"].collect {|k,v| k if v=="1" }.compact
    conf
  end

  def plugins
    @@plugins
  end

  @@plugins.each do |p|
    src = <<-END_SRC
    def mcollective_plugins_#{p}
      config["mcollective_plugins"]["#{p}"]
    end

    def mcollective_plugins_#{p}=(v)
      config["mcollective_plugins"]["#{p}"] = v
    end
    END_SRC
    class_eval src, __FILE__, __LINE__
  end

end
