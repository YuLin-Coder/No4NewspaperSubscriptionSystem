/*新款上市模块横向滚动*/
$(function(){
    var page = 1;
    var i =4; //每版放4个图片
	var len =$(".projlist li").length;// 12;
	var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数
	$(".projlist").css("width",page_count*664+"px");
	var none_unit_width = 664; //获取框架内容的宽度,不带单位
	var $parent = $(".projlist"); 
    //向右 按钮
    $(".goRight").click(function(){ 
		if( !$parent.is(":animated") ){
			if( page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
				$parent.animate({ left : 0}, 800); //通过改变left值，跳转到第一个版面
				page = 1;
			}else{
				$parent.animate({ left : '-='+none_unit_width}, 800);  //通过改变left值，达到每次换一个版面
				page++;
			}
		}
   });
    //往左 按钮
    $(".goLeft").click(function(){
	    if( !$parent.is(":animated") ){
			if( page == 1 ){  //已经到第一个版面了,如果再向前，必须跳转到最后一个版面。
				$parent.animate({ left : '-='+none_unit_width*(page_count-1)}, 800); //通过改变left值，跳转到最后一个版面
				page = page_count;
			}else{
				$parent.animate({ left : '+='+none_unit_width }, 800);  //通过改变left值，达到每次换一个版面
				page--;
			}
		}
    });
});