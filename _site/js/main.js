



function init()
{

  elem = document.getElementById("site-brand-hover");
  elembrand = document.getElementById("site-brand");
  style = elem.style;
  this.style.backgroundImage = "transparent";

  this._onMouseMove = function(event)
  {
    console.log(event.clientX);
  }


  elem.addEventListener('mousemove', function(event)
  {
    var w = elembrand.offsetWidth / 2;
    var h = elembrand.offsetHeight / 2;
    //var x = elem.offsetLeft + (w / 2);// y = elem.offsetTop + h / 2;
    //var px = (((event.clientX - elem.offsetLeft) - w ) / w);// * 180;
    //var py = (((event.clientX - elem.offsetTop) - h ) / h);// * 180;
    var px2 = event.clientX;// - elembrand.offsetLeft;
    var py2 = event.clientY;// - elembrand.offsetTop;
    var px = elembrand.offsetLeft + w;
    var py = elembrand.offsetTop + h;

    //var delta = px =
    // Math.atan((px2-py) / (px2 - px))* 180 / Math.PI;
    var ang = Math.atan2(py2 - py,px2 - px) * 180 / Math.PI;
    var bg = "linear-gradient(" + ang + "deg,#3b87b6,#241f6f)"; // #3b87b6,#241f6f

    this.style.backgroundImage = bg;
    console.log(px - px2);
  });
}



/*
$(".site-brand").mousemove(function( event ) {
  var w = $(this).width(),
      pct = 360*(+event.pageX)/w,
      bg = "linear-gradient(" + pct + "deg,#4ac1ff,#795bb0)";
      $(".gradient").css("background-image", bg);
});
*/
