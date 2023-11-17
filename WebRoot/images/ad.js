/*首页广告淡入淡出效果*/
$(function(){
   
     var len  = $(".num > li").length;
	 var index = 1;
	 var adTimer;
	 $(".num li").mouseover(function(){
		n  =   $(".num li").index(this);
		showImg(n);
	 }).eq(0).mouseover();	
	 
	 $('.lunhuan').hover(function(){
			 clearInterval(adTimer);
		 },function(){
			 adTimer = setInterval(function(){
			    showImg(index)
				index++;
				if(index==len){index=0;}
			  } , 3000);
	 }).trigger("mouseleave");
})

function showImg(i){
      
		
		$(".slider li").css("display","none");
		$(".slider li").eq(i).fadeOut(2000,function(){			
			$(".slider li").eq(i).fadeIn(1000);
		});		
		$(".num li").removeClass("on")
			.eq(i).addClass("on");
		$(".ad-cen p").css("display","none").eq(i).css("display","block")
}