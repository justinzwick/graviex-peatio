@SettingsUI = flight.component ->
  @attributes
    zbx_discount_mark: '#zbx_discount_mark'

  @updateDiscounts  = ->
    #  0 - disabled
    #  1 - enabled
    # -1 - undefined
    zbx_discount_flag = -1

    for currency, account of @accounts
      #console.log(account)
      if account.currency == 'zbx' && account.hasOwnProperty('zbx_discount')
        #console.log(account.currency, account.zbx_discount)
        if account.zbx_discount == true
          zbx_discount_flag = 1
        if account.zbx_discount == false
          zbx_discount_flag = 0

    zbx_discount_mark_node = @select('zbx_discount_mark')
    #console.log(@select('zbx_discount_mark'))
    if zbx_discount_flag == 1
      #console.log("turning ON")
      zbx_discount_mark_node.attr('class', 'fa fa-star')
      zbx_discount_mark_node.attr('style', 'color: #e6b800')
    else if zbx_discount_flag == 0
      #console.log("turning OFF")
      zbx_discount_mark_node.attr('class', '_empty')
      zbx_discount_mark_node.attr('style', '_empty')

    #console.log gon.current_user

  @after 'initialize', ->
    @accounts = gon.accounts

    @on document, 'account::update', (event, data) =>
      @accounts = data
      @updateDiscounts()

    @on document, 'market::tickers', (event, data) =>
      @tickers = data.raw
      @updateDiscounts()


