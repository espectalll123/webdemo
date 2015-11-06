rickroll = function() {
    d = new Date();
    d.setTime(d.getTime() + 1000 * 60 * 60);
    $('#container').append(
        '<video id="rickRoll" autoplay loop>'
        + '<source type="video/webm" src="./v/rickroll.webm" />'
        + '<source type="video/mp4" src="./v/rickroll.mp4" />'
        + '</video>'
    );
    $('#rickRoll')[0].oncontextmenu = new Function('return false');
    
    document.cookie = 'rickRolled=true; '
        + 'expires=' + d.toUTCString();
}

$(document).ready(function() {
    if(document.cookie.substring(0, 15) == 'rickRolled=true') {
        alert("Por cierto, eso fue una demo de vídeo HTML5 ;)");
	    document.cookie = 'rickRolled=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
    };
});
