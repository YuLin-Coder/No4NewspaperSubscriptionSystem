var timeoutid;
$(document).ready(function(){	
	$(".contact li:last").css("background","url(none)");
	
	$(".nav li").hover(function(){
		$(".nav li").find("h3").removeClass("curr") ;
		$(this).find("h3").addClass("curr");
		//alert($(".cy-qa h3 p").index(this));	
		$(".nav li").find("p").css("display","none") ;
		$(this).find("p").css("display","block");
		//$(".newslist").css("display","none").eq($(".news h2 span").index(this)).css("display","block");
	},function(){
		
		$(this).find("h3").removeClass("curr");
		$(this).find("p").css("display","none");
	});
	
	$(".newslist").eq(0).css("display","block");
	$(".news h2 span").hover(function(){
		$(".news h2 span").removeClass("curr") ;
		$(this).addClass("curr");
		//alert($(".cy-qa h3 p").index(this));		
		$(".newslist").css("display","none").eq($(".news h2 span").index(this)).css("display","block");
	},function(){
		
	});
	/*$(".quicklink p:first").css("margin-bottom","5px");
	$(".navlist li:last").css("background","url(none)");
	
	$(".sech-select span").click(function(){
		if ($(".sech-list").css("display")=='none'){			
			$(".sech-list").css("display","block");
		}else{	
			$(".sech-list").css("display","none");			
		}
	});
	$(".sech-list p").click(function(){
		$(".sech-select h3").html($(this).html());
		$(".sech-list").css("display","none");
		$(".sechform-btn input.txttype").val($(this).attr("title"));
	});*/
});
function clearDefault(el)
{
  if (el.defaultValue==el.value) el.value = "";
}
function resetDefault(el)
{
  if (isEmpty(el.value)) el.value=el.defaultValue;
}

function isEmpty(s) 
{
  if (s == null || s=="undefined" || s.length == 0)
    return true;
  return !/\S/.test(s);
}