module Private
  class DepositsController < BaseController
    before_action :auth_verified!

    def gen_address
      current_user.ac(currency).payment_address
      head 204
    end

    def destroy
      record = current_user.deposits.find(params[:id]).lock!
      if record.cancel!
        head 204
      else
        head 422
      end
    end

  private

    def currency
      @currency ||= Currency.find_by_code!(params[:currency])
    end
  end
end
