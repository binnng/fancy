# 弹层
# 基于zepto

((WIN, DOC) ->

  $ = WIN["$"]

  elBody = $("body")

  CLICK = "click"

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


    easeShow = (el, time = 100) ->
      el.show()

      setTimeout ->
        el.css "opacity", 1
      , time

    easeHide = (el, time = 100) ->
      el.css "opacity", 0

      setTimeout ->
        el.hide()
      , 200

    elMask = null

    isHasMask = no

    mask = 
      init: (config) ->
        elMask = $ htmlMask

        $.extend maskStyles, config.maskStyles or {}

        elMask.css maskStyles
        elMask.height $(WIN).height()

        elBody.append elMask

      show: ->
        easeShow elMask

      hide: ->
        easeHide elMask, 200


    constructor: (@config = {}) ->
      @content = @config.content or ""
      @elFancy = null

    init: ->
      config = @config

      mask.init(config) unless isHasMask

      isHasMask = yes

      htmlContent.splice 1, 0, @content

      @elFancy = elFancy = $ htmlContent.join ""

      $.extend fancyStyles, config.fancyStyles or {}
      elFancy.css fancyStyles

      elBody.append elFancy

      @elClose = elClose = $ "em", elFancy

      elClose.on CLICK, => @hide()
      
      htmlContent.splice 1, 1

      @

    show: ->
      elFancy = @elFancy
      mask.show()
      easeShow elFancy, 200

      @

    hide: ->
      elFancy = @elFancy

      mask.hide()

      easeHide elFancy


  entry = (config) ->
    (new Fancy(config)).init()

  if typeof define is "function"
    define "wallet/fancy", (require, exports, module) ->
      entry

  else
    WIN["Fancy"] = entry

) window, document