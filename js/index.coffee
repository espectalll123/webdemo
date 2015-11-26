rickroll = ->
        d = new Date
        d.setTime d.getTime() + 1000 * 60 * 60
        $('body').empty()
        $('body').append(
          '<video id="rickRoll" autoplay loop>' +
          '<source type="video/webm" src="./v/rickroll.webm" />' +
          '<source type="video/mp4" src="./v/rickroll.mp4" />' +
          '</video>')
        $('#rickRoll')[0].oncontextmenu = new Function 'return false'

        document.cookie = 'rickRolled=true; ' +
          'expires=' + d.toUTCString();

hawawa = (e) ->
        e.preventDefault()
        if document.cookie.indexOf('hawawa=true') < 0
                document.cookie = 'hawawa=true; ' +
                  'expires=Fri, 31 Dec 9999 23:59:59 GMT'
        window.location = $('.img').attr 'href'

$(document).ready () ->
        if document.cookie.indexOf('rickRolled=true') >= 0
                alert 'Por cierto, eso fue una demo de vídeo HTML5 ;)'
                document.cookie =
                  'rickRolled=; expires=Thu, 01-Jan-70 00:00:01 GMT;'
        if document.cookie.indexOf('hawawa=true') >= 0
                $('.img img').attr( 'src', './img/hawawa.gif')
        $('.goToValhalla').click rickroll
        $('.img img').click hawawa
