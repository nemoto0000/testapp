$(document).ready(function() { //perform actions when DOM is ready
  var z = 0; //for setting the initial z-index's
  var inAnimation = false; //flag for testing if we are in a animation
  var OK = 1;
  var NG = 2;
  i = 1; //ヴューでもつかうの
  //var i = 1;

  $('#pictures img').each(function() { //set the initial z-index's
    z++; //at the end we have the highest z-index value stored in the z variable
    $(this).css('z-index', z); //apply increased z-index to <img>
  });

  function swapFirstLast(isFirst) {
    if(inAnimation) return false; //if already swapping pictures just return
    else inAnimation = true; //set the flag that we process a image

    var processZindex, direction, newZindex, inDeCrease; //change for previous or next image
    processZindex = z; direction = '-'; newZindex = 1; inDeCrease = 1;
    // if(isFirst == OK)

    i++; // 次の人へ
    // 表示用
    $('#prof').text($('.prof')[i].innerText);

    $('#pictures img').each(function() { //process each image
      if($(this).css('z-index') == processZindex) { //if its the image we need to process
        $(this).animate({ 'top' : direction + $(this).height() + 'px' }, 'fast', function() { //animate the img above/under the gallery (assuming all pictures are equal height)
          $(this).css('z-index', newZindex) //set new z-index
            .animate({ 'top' : '0' }, 'fast', function() { //animate the image back to its original position
              inAnimation = false; //reset the flag
            });
        });
      } else { //not the image we need to process, only in/de-crease z-index
        $(this).animate({ 'top' : '0' }, 'fast', function() { //make sure to wait swapping the z-index when image is above/under the gallery
          $(this).css('z-index', parseInt($(this).css('z-index')) + inDeCrease); //in/de-crease the z-index by one
        });
      }
    });
    return false; //don't follow the clicked link
  }

// オッケー
  $('#ok a').click(function() {
    return swapFirstLast(1); //swap first image to last position
  });

  // ダメ
  $('#na a').click(function() {
    return swapFirstLast(2); //swap last image to first position
  });
});
