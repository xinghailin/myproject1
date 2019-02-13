define(function(require, exports, module) {
	
	loadReady();
	
    $('#topMenu li').click(function () {//topMenu click function
        var fg = false;
        var $this = $(this);
        var index = $(this).index();
        $('#topMenu a').removeClass('current');
        $this.children('a').addClass('current');
        $('#leftMenu li').eq(index).show().siblings().hide();
        $('#leftMenu li').eq(index).find('h2:first').next('dl').stop(true, true).slideDown();
        return fg;
    });
    
    $('#leftMenu a').click(function () {//leftMenu a click function
        var fg = false;
        var $this = $(this);
        var $parent = $this.parent();
        var $src = $this.attr('href');
        $('.iframe').attr('src', $src);
        if ($parent.is('dd') || $parent.is('dt')) {
            $('#leftMenu dd').removeClass('current');
            $('#leftMenu dt').removeClass('current');
            $parent.addClass('current');
        }
        return fg;
    });
    
    $('#leftMenu h2').click(function () {//leftMenu h2 click function
        $('#leftMenu li h2').next('dl').stop(true, true).slideUp();
        $(this).nextUntil('h2', 'dl').stop(true, true).slideDown();
        var fg = false;
        return fg;
    });    
});


function loadReady(){
	 var $bodyH = document.body.scrollHeight,
     $htmlH = document.documentElement.clientHeight,
     $maxH = Math.max($bodyH, $htmlH) - 20, $minH = Math.min($bodyH, $htmlH) - 20,
     $h = $('.kft_left').height() >= $maxH ? $minH : $maxH;
 $h = $h < 540 ? 540 : $h - 65;
 $('.kft_left,.kft_right').css({'height': $h});
}