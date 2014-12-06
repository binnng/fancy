# 弹层
# 基于zepto

((WIN, DOC) ->

  $ = WIN["$"]

  elBody = $("body")
  elHtml = $("html")

  CLICK = "click"

  inWalletFancyCls = "in-wallet-fancy"
  
  isHasMask = no

  getMax = (arr = []) ->
    _arr = arr.sort (a, b) -> b - a
    _arr[0]


  class Fancy

    htmlMask = "<div class='wallet-mask'></div>"

    htmlContent = [
      "<div class='wallet-fancy'>"
      "<em>X</em>"
      "</div>"
    ]

    transitionValue = "all .3s ease"

    publicStyles = 
      position: "absolute"
      webkitTransition: transitionValue
      transition: transitionValue
      opacity: 0
      display: "none"

    maskStyles = 
      left: 0
      top: 0
      width: "100%"
      background: "rgba(0, 0, 0, .6)"
      zIndex: 10

    $.extend maskStyles, publicStyles


    fancyStyles = 
      zIndex: 20
      width: "80%"
      left: "50%"
      marginLeft: "-40%"
      top: "100px"
      background: "rgba(0, 0, 0, .6)"
      paddingTop: "20px"

    $.extend fancyStyles, publicStyles


    easeShow = (el, time = 50) ->
      el.show()

      setTimeout ->
        el.css "opacity", 1
      , time

    easeHide = (el, time = 50) ->
      el.css "opacity", 0

      setTimeout ->
        el.hide()
      , time

    elMask = null


    mask = 
      init: (config) ->
        elMask = $ htmlMask

        $.extend maskStyles, config.maskStyles or {}

        elMask.css maskStyles

        elBody.append elMask

      show: (time = 50) ->
        easeShow elMask, time

      hide: (time = 50) ->
        easeHide elMask, time


    constructor: (@config = {}) ->
      @content = @config.content or ""
      @name = @config.name or ""
      @time = @config.time or 50
      @elFancy = null
      @width = config.width

    init: ->
      config = @config

      mask.init(config) unless isHasMask

      isHasMask = yes

      htmlContent.splice 1, 0, @content

      @elFancy = elFancy = $ htmlContent.join ""

      $.extend fancyStyles, config.fancyStyles or {}
      elFancy.css fancyStyles

      elFancy.attr "name", @name if @name

      elBody.append elFancy unless @config.onlyMask

      @elClose = elClose = $ "em", elFancy

      elClose.on CLICK, => @hide()

      htmlContent.splice 1, 1

      @

    show: ->

      elMask.height getMax [
        $(WIN).height()
        elHtml.height()
        elBody.height()
      ]

      elFancy = @elFancy
      mask.show @time
      easeShow elFancy, @time

      elHtml.addClass inWalletFancyCls

      $(WIN).scrollTop 0

      @

    hide: ->
      elFancy = @elFancy

      mask.hide @time
      easeHide elFancy

      elHtml.removeClass inWalletFancyCls


  entry = (config) ->
    (new Fancy(config)).init()

  entry.mask = -> 
    (new Fancy({onlyMask: yes})).init().show()

  if typeof define is "function"
    define "wallet/fancy", (require, exports, module) ->
      entry

  else
    WIN["Fancy"] = entry

) window, document