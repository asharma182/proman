/*  window.onload = function() {
        var canvas = document.getElementById("canvas1");
        var context = canvas.getContext("2d");
        var imageObj = new Image();

        imageObj.onload = function() {
          context.drawImage(imageObj, 69, 50);
        };
        imageObj.src = "http://www.html5canvastutorials.com/demos/assets/darth-vader.jpg";
      }*/

      window.onload = function() {
        var canvas = document.getElementById("canvas1");
        var context = canvas.getContext("2d");
      context.fillStyle = 'lightGrey';
      context.strokeStyle = "yellow";
       context.fillRect(0,0,200,200);
      context.strokeRect(0,0,200,200);

        //var string = "hello this is inside canvas";
       // var string=document.getElementById("project").innerHTML;
        //context.font="12pt Aerial"
        //context.fillText(string,20,20);
   
}

