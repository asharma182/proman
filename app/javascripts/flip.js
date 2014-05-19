/*$(document).ready(function(){
	$("#canvas1").click(function(event){
		alert("thanks for visiting");
		event.preventDefault();
	})
})*/

/* $(document).ready(function() {
   $("td").not(":has(tr)").css("border", "1px solid black"); 
 });*/

/* $(document).ready(function(){
	$(":submit").click(function(){
		alert("Project Created");
		
	})
})*/
/*$(document).ready(function(){
	$("#canvas1").hide();
	$('#test').click(function(){
		$("#canvas1").fadeIn(500,function(){
			// alert("this will now be visible");
		});
	});
});
*/
/*
$(document).ready(function(){
	$('#test').click(function(){
		$('#new').slideToggle('slow');
	});
});
*/
// topic

$(document).ready(function(){
	$("#new").hide();
	$('#test').click(function(){
		$("#new").fadeIn(200,function(){
			// alert("this will now be visible");
		});
	});
});

$(document).ready(function(){
	$('#cancel').click(function(){
		$('#new').fadeOut(200);
	});
});
/*
$(document).ready(function(){
	$("#discussion_list").hide();
	$('#show').click(function(){
		// alert('hello')
		$('#discussion_list').fadeIn(200);
	});
});

$(document).ready(function(){
	$('#hide').hide();
});

//topics

$(document).ready(function(){
	$("#new_topic").hide();
	$('#add_topic').click(function(){
		$("#new_topic").fadeIn(200,function(){
			// alert("this will now be visible");
		});
	});
});

$(document).ready(function(){
	$('#cancel_topic').click(function(){
		$('#new_topic').fadeOut(200);
	});
});

// Discussion
$(document).ready(function(){
	$("#new_discussion").hide();
	$('#add_discussion').click(function(){
		$("#new_discussion").fadeIn(200,function(){
			// alert("this will now be visible");
		});
	});
});

$(document).ready(function(){
	$('#cancel_discussion').click(function(){
		$('#new_discussion').fadeOut(200);
	});
});
*/
$(document).ready(function(){
	$("#hide").hide();
});