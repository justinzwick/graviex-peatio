module Private::Withdraws
  class ZenbitexsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
