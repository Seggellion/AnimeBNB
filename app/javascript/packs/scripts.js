jQuery(window).on('load', function () {
    $('.preloader').fadeOut();
});


//getCookie
function getCookie(name) {
    var cname = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++){
        var c = ca[i];
        while(c.charAt(0) == ' '){
            c = c.substring(1);
        }
        if(c.indexOf(cname) == 0){
            return c.substring(cname.length, c.length);
        }
    }
    return "";
}
//end of getCookie

function hideLoadingDiv() {
  setTimeout(function(){
    if(document.getElementById('alert_container')){
    document.getElementById('alert_container').classList.add('hidden');
  };
  },5000)
}

hideLoadingDiv();
let unless = (condition,callback)=>{!condition && callback();};
// start turbolinks
$(document).on('turbolinks:load', function(){
  // darkmode / light mode toggle
  unless(!!getCookie("view_mode"),()=>{
  document.cookie = "view_mode=dark; expires=Wed, 13 Jan 2024 12:00:00 UTC"
});
//set dark mode by default
if (getCookie("view_mode") === "dark") {
  $( ".main-frame" ).addClass( "dark_mode" );
  $(".front").css("left",($(".back").outerWidth()-$(".front").outerWidth()) + "px");
} else {
  $( ".main-frame" ).addClass( "light_mode" );
  $(".front").css("left",0);
}

var border = $(".back").outerWidth()-$(".back").innerWidth();
$('#view_mode').click(function() {
  if (getCookie("view_mode") === "dark") {
    $(".front").css("left",0);
    $(".back").css("background-color","lightcoral");
    $( ".main-frame" ).removeClass( "dark_mode" );
    $( ".main-frame" ).addClass( "light_mode" );
    document.cookie = "view_mode=light; expires=Wed, 13 Jan 2024 12:00:00 UTC";
  } else {
    $(".front").css("left",($(".back").outerWidth()-$(".front").outerWidth()) + "px");
    $(".back").css("background-color","#2c529e");
    $( ".main-frame" ).removeClass( "light_mode" );
    $( ".main-frame" ).addClass( "dark_mode" );
    document.cookie = "view_mode=dark; expires=Wed, 13 Jan 2024 12:00:00 UTC";
  }
});

    //end of turbolinks
  });
