
class mcollective::plugin::process {
#    realize Package["sys-proctable"] # for process agent
    gem_package {
      "sys-proctable":
        ensure => installed;
    }
    mcollective::plugin_file { "agent/process.rb": source => "agent/process/process.rb" }
}

