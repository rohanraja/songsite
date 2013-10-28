function change_song(e, str)
{

  var player = $("#jquery_jplayer_1");

      player.jPlayer("setMedia", { 
            mp3: 'http://localhost:3000/home/download/'+str
          }); 
      
      player.jPlayer("play", 0);
    


	//$('audio').attr('src', 'http://localhost:3000/home/download/' + str);

  $("#head_list li").each(function(i,val){
    $(val).removeClass('active');
  });

  console.log($(e).parent().addClass('active'));

}


function searchq(str)
{

  if(str.length > 2 || str == "")
  {
    if(str == "")
      str = "0";

    $.ajax({
    async: "false",
        type: "GET",

  url: '/home/search/' + str, 
  success: function(data)
    {
      console.log(data);

      $('#head_list').html(data);

    //   $('#head_list li a').eq(0).click();

    }});
  }
}


function next_heading()
{
  if($('li.active').length > 0)
    $('li.active').next().next().find('a').click();
  else
    $('#head_list li a').eq(0).click();

}

function prev_heading()
{
  if($('li.active').length > 0)
    $('li.active').prev().prev().find('a').click();
  else
    $('#head_list li a').eq(0).click();

}



$(document).ready(function(){


$("#jquery_jplayer_1").jPlayer({


    ready: function () {
      $(this).jPlayer("setMedia", {
        mp3:""
      });
    },
    swfPath: "js",
    supplied: "mp3",
    wmode: "window",
    smoothPlayBar: true,
    keyEnabled: true
  });  


});

       






