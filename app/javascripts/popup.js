	 		$(document).ready(function(){
	 			$('#button').click(function(e){
	 				ShowDialog(false);
	 				eArray.preventDefault;
	 				});
	 			$('#close').click(function(){
	 				CloseDialog(false);
	 			});
	 			
	 			$('#btnSubmit').click(function(){
	 				var output=$('#name').val();
	 				$('#output').html("<b>Name of the Project is : </b>" + output);
	 				CloseDialog();
	 				e.prventDefault;
	 			});
	 		});
	 		function ShowDialog(modal){
	 			$('#overlay').show();
	 			$('#popup').fadeIn(300);
	 			
	 			if (modal){
	 			$('#overlay').unbind("click");
	 			}
	 			else{
	 			 $("#overlay").click(function (e) {
            		CloseDialog();
         		});
         	}
	 			
	 		}
	 		
	 		
	 		$(document).ready(function(){
	 			$('#popup').hide();
	 			
	 		});
	 		
	 		function CloseDialog(){
	 				$('#overlay').hide();
	 			$('#popup').fadeOut(300);
	 		
	 		};