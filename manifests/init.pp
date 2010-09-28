
class mcollective {

    include mcollective::service

    mcollective::plugin { $mcollective_plugins: }

}

define mcollective::plugin() {
  include "mcollective::plugin::$name"
}

