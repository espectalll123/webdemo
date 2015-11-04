rickroll = function() {
    d = new Date();
    d.setTime(d.getTime() + 1000 * 60 * 60);
    $('#container').append(
	'<video id="rickRoll" src="v/rickroll.mp4"'
	+ 'autoplay loop />');
    document.cookie = 'rickRolled=true; '
        + 'expires=' + d.toUTCString();
}

$(document).ready(function() {
    if(document.cookie.substring(0, 15) == 'rickRolled=true') {
	alert("Por cierto, eso fue una demo de vídeo HTML5 ;)");
	document.cookie = 'rickRolled=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
    };
});
