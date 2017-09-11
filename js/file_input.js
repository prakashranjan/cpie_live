/*$("session #container").hide(); */
/*

function uplo() {
 $("#startfile").hide();
 
  
    var App = {
        init: function() {
            App.attachListeners();
        },
        attachListeners: function() {
            var self = this;

            $(".controls input[type=file]").on("change", function(e) {
                if (e.target.files && e.target.files.length) {
                    App.decode(URL.createObjectURL(e.target.files[0]));
                   $("#sigchannel").prop('checked', true);
                }
            });

            $(".controls button").on("click", function(e) {
                var input = document.querySelector(".controls input[type=file]");
                if (input.files && input.files.length) {
                    App.decode(URL.createObjectURL(input.files[0]));
                }
            });

            $(".controls .reader-config-group").on("change", "input, select", function(e) {
                e.preventDefault();
                var $target = $(e.target),
                    value = $target.attr("type") === "checkbox" ? $target.prop("checked") : $target.val(),
                    name = $target.attr("name"),
                    state = self._convertNameToState(name);

                console.log("Value of "+ state + " changed to " + value);
                self.setState(state, value);
            });
        },
        _accessByPath: function(obj, path, val) {
            var parts = path.split('.'),
                depth = parts.length,
                setter = (typeof val !== "undefined") ? true : false;

            return parts.reduce(function(o, key, i) {
                if (setter && (i + 1) === depth) {
                    o[key] = val;
                }
                return key in o ? o[key] : {};
            }, obj);
        },
        _convertNameToState: function(name) {
            return name.replace("_", ".").split("-").reduce(function(result, value) {
                return result + value.charAt(0).toUpperCase() + value.substring(1);
            });
        },
        detachListeners: function() {
            $(".controls input[type=file]").off("change");
            $(".controls .reader-config-group").off("change", "input, select");
            $(".controls button").off("click");
        },
        decode: function(src) {
            var self = this,
                config = $.extend({}, self.state, {src: src});

            Quagga.decodeSingle(config, function(result) {});
        },
        setState: function(path, value) {
            var self = this;

            if (typeof self._accessByPath(self.inputMapper, path) === "function") {
                value = self._accessByPath(self.inputMapper, path)(value);
            }

            self._accessByPath(self.state, path, value);

            console.log(JSON.stringify(self.state));
            $("#sigchannel").prop('checked', true);
            App.detachListeners();
            App.init();
        },
        inputMapper: {
            inputStream: {
                size: function(value){
                    return parseInt(value);
                }
            },
            numOfWorkers: function(value) {
                return parseInt(value);
            },
            decoder: {
                readers: function(value) {
                    if (value === 'ean_extended') {
                        return [{
                            format: "ean_reader",
                            config: {
                                supplements: [
                                    'ean_5_reader', 'ean_2_reader'
                                ]
                            }
                        }];
                    }
                    return [{
                        format: value + "_reader",
                        config: {}
                    }];
                }
            }
        },
        state: {
            inputStream: {
                size: 800,
                singleChannel: false
            },
            locator: {
                patchSize: "medium",
                halfSample: true
            },
            decoder: {
                readers: [{
                    format: "code_39_reader",
                    config: {}
                }]
            },
            locate: true,
            src: null
        }
    };

    App.init();


    function calculateRectFromArea(canvas, area) {
        var canvasWidth = canvas.width,
            canvasHeight = canvas.height,
            top = parseInt(area.top)/100,
            right = parseInt(area.right)/100,
            bottom = parseInt(area.bottom)/100,
            left = parseInt(area.left)/100;

        top *= canvasHeight;
        right = canvasWidth - canvasWidth*right;
        bottom = canvasHeight - canvasHeight*bottom;
        left *= canvasWidth;

        return {
            x: left,
            y: top,
            width: right - left,
            height: bottom - top
        };
    }

    Quagga.onProcessed(function(result) {
        var drawingCtx = Quagga.canvas.ctx.overlay,
            drawingCanvas = Quagga.canvas.dom.overlay,
            area;
    

        if (result) {
         console.log("its running hell");

            if (result.boxes) {
                drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
                result.boxes.filter(function (box) {
                    return box !== result.box;
                }).forEach(function (box) {
                    Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: "green", lineWidth: 2});
                });
            }

            if (result.box) {
                Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: "#00F", lineWidth: 2});
            }

            if (result.codeResult && result.codeResult.code) {
                Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3});
            }

            if (App.state.inputStream.area) {
                area = calculateRectFromArea(drawingCanvas, App.state.inputStream.area);
                drawingCtx.strokeStyle = "#0F0";
                drawingCtx.strokeRect(area.x, area.y, area.width, area.height);
            }
      
/* wrong barcode type */
          /*    
            $("#container").html("<h2 class='text-info' style='text-align:center;'><a href='#contact' onclick='showcam2();' ><i class='fa fa-refresh fa-3x' aria-hidden='true'></i></a> try again</h2>");    
             
            
        }
else
{

/* try again *//*
                
          $("#container").html("<h2 class='text-info' style='text-align:center;'><a href='#contact' onclick='showcam2();' ><i class='fa fa-refresh fa-3x' aria-hidden='true'></i></a> try again</h2>");    
                                 
}
    });

    Quagga.onDetected(function(result) {
        var code = result.codeResult.code,
            $node,
            canvas = Quagga.canvas.dom.image;

       /* $node = $('<li><div class="thumbnail"><div class="imgWrapper"><img /></div><div class="caption"><h4 class="code"></h4></div></div></li>');
        $node.find("img").attr("src", canvas.toDataURL());
        $node.find("h4.code").html(code);
        $("#result_strip ul.thumbnails").prepend($node);
*//*
      var temp=code;
              var bardata = temp.split('/',3);
               console.log("year-"+bardata[0]);
              console.log("branch-"+bardata[1]);
              console.log("rollno-"+bardata[2]);
/* checker *//*
var er=[];
var temp1=bardata[0];
var temp2=bardata[1];
var temp3=bardata[2];

if(temp1=="13"||temp1=="14"||temp1=="15"||temp1=="16"){er[0]=1;}
else {er[0]=0;}
console.log(er[0]);
if(temp2=="OIT"||temp2=="CSE"||temp2=="ECE"||temp2=="OEE"||temp2=="OCE"||temp2=="OIC"||temp2=="OMT"||temp2=="OME"){er[1]=1;}
else {er[1]=0;}
console.log(er[1]);
/*checker ends*//*
if(bardata[2] && bardata[0] && bardata[1] && er[0] &er[1] ){

             if(bardata[2].length<=3 && bardata[0].length==2 && bardata[1].length<=3 ){
             
             /*correct*//*
            
            $("#container").html("<h1 style='color:green;text-align:center;'><i class='fa fa-check-square fa-3x'></i> barcode accepted</h1> ");
                  $("#headody").remove(); 
                 $('#signModal').modal('show'); 
                 $("#result").html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
                          $.ajax({
         type:"get",
   url:"signupprompt_ajax.php",
   
   data: {yr:bardata[0] , br:bardata[1],rl:bardata[2]},
   success: function( data ) {
   $( "#result" ).html(data);
   },
   
   cache: false
})
                

                }
             else {
               
             /* wrong*//*
             $("#container").html("<h2 class='text-info' style='text-align:center;'><a href='#contact' onclick='showcam2();' ><i class='fa fa-refresh fa-3x' aria-hidden='true'></i></a> try again</h2>");    
             
                   

                    }
              }
            else{
            
             /* wrong*//*
              $("#container").html("<h2 class='text-info' style='text-align:center;'><a href='#contact' onclick='showcam2();' ><i class='fa fa-refresh fa-3x' aria-hidden='true'></i></a> try again</h2>");    
             
                  }
/* checker end*//*

    });
}
*/