
dollar = {}; 





window.addEventListener('message', function(event) {
    eFunc = event.data;
    if(event.data.action == "show") {


    $(".jobtext").html(eFunc.job);
    $("#cashmoney").html('$ '+ eFunc.cash);
    $("#bankmoney").html('$ '+eFunc.bank);
    $("#timediv").html(eFunc.timez);
    $("#playercount").html(eFunc.players + '/' + eFunc.maxplayer);
    


    $(".Container").fadeIn();

         $(".Container").css({"display":"block"});
        $('body').show()
      } else if (event.data.action == "hide") {
        $(".Container").fadeOut();

    } 

})




