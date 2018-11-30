module Private
  module Deposits
    class ZenbitexsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
