// JavaScript Document
//Inbox
$(document).ready(function(){
	$('#inbox_display').hide();
	$('#inbox').click(function(){
		$('#project_topics').fadeOut(1000);
		$('#inbox_display').fadeIn(1000);
		$('#show_details').hide();
		});
	});
	
//Projects topics
$(document).ready(function(){
	$('#project_topics').hide();
	$('#topics').click(function(){
		$('#project_topics').fadeIn(1000);
		$('#inbox_display').hide();
		$('#show_details').hide();
		});
});

$(document).ready(function(){
	$('#show_details').hide();
	$('#project_details').click(function(){
		$('#show_details').fadeIn(1000);
		$('#inbox_display').hide();
		$('#project_topics').hide();
		});
});