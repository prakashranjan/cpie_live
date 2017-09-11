
/*


function preview() {
 
        $("#start").hide();
    var resultCollector = Quagga.ResultCollector.create({
        capture: true,
        capacity: 20,
        blacklist: [{code: "2167361334", format: "i2of5"}],
        filter: function(codeResult) {
            // only store results which match this constraint
            // e.g.: codeResult
            return true;
        }
    });
    var App = {
        init : function() {
            var self = this;

            Quagga.init(this.state, function(err) {
                if (err) {
                    return self.handleError(err);
                }
                Quagga.registerResultCollector(resultCollector);
                App.attachListeners();
                Quagga.start();
            });
        },
        handleError: function(err) {
            console.log(err);
        },
        attachListeners: function() {
            var self = this;

            $(".controls").on("click", "button.stop", function(e) {
                e.preventDefault();
                Quagga.stop();
                self._printCollectedResults();
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
        _printCollectedResults: function() {
            var results = resultCollector.getResults(),
                $ul = $("#result_strip ul.collector");

            results.forEach(function(result) {
                var $li = $('<li><div class="thumbnail"><div class="imgWrapper"><img /></div><div class="caption"><h4 class="code"></h4></div></div></li>');

                $li.find("img").attr("src", result.frame);
                $li.find("h4.code").html(result.codeResult.code + " (" + result.codeResult.format + ")");
                $ul.prepend($li);
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
            $(".controls").off("click", "button.stop");
            $(".controls .reader-config-group").off("change", "input, select");
        },
        setState: function(path, value) {
            var self = this;

            if (typeof self._accessByPath(self.inputMapper, path) === "function") {
                value = self._accessByPath(self.inputMapper, path)(value);
            }

            self._accessByPath(self.state, path, value);

            console.log(JSON.stringify(self.state));
            App.detachListeners();
            Quagga.stop();
            App.init();
        },
        inputMapper: {
            inputStream: {
                constraints: function(value){
                    var values = value.split('x');
                    return {
                        width: {min: parseInt(values[0])},
                        height: {min: parseInt(values[1])}
                    };
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
                type : "LiveStream",
                constraints: {
                    width: {min: 640},
                    height: {min: 480},
                   facingMode: "environment",
                    aspectRatio: {min: 1, max: 2}
                }
            },
            locator: {
                patchSize: "medium",
                halfSample: true
            },
            numOfWorkers: 4,
            decoder: {
                readers : [{
                    format: "code_39_reader",
                    config: {}
                }]
            },
            locate: true
        },
        lastResult : null
    };


App.init();
    Quagga.onProcessed(function(result) {
        //var drawingCtx = Quagga.canvas.ctx.overlay,
          //  drawingCanvas = Quagga.canvas.dom.overlay;

        if (result) {
            if (result.boxes) {
            //    drawingCtx.clearRect(0, 0, parseInt(drawingCanvas.getAttribute("width")), parseInt(drawingCanvas.getAttribute("height")));
               // result.boxes.filter(function (box) {
                 //   return box !== result.box;
               // }).forEach(function (box) {
                  //  Quagga.ImageDebug.drawPath(box, {x: 0, y: 1}, drawingCtx, {color: "green", lineWidth: 2});
               // });
            }

            if (result.box) {
              //  Quagga.ImageDebug.drawPath(result.box, {x: 0, y: 1}, drawingCtx, {color: "#00F", lineWidth: 2});
            }

            if (result.codeResult && result.codeResult.code) {
                //Quagga.ImageDebug.drawPath(result.line, {x: 'x', y: 'y'}, drawingCtx, {color: 'red', lineWidth: 3});
            }
        }
    });




    Quagga.onDetected(function(result) {
        var code = result.codeResult.code;

        if (App.lastResult !== code) {
            App.lastResult = code;
           // var $node = null, canvas = Quagga.canvas.dom.image;

          //  $node = $('<li><div class="thumbnail"><div class="imgWrapper"><img /></div><div class="caption"><h4 class="code"></h4></div></div></li>');
            //$node.find("img").attr("src", canvas.toDataURL());
            //$node.find("h4.code").html(code);
            //$("#result_strip ul.thumbnails").prepend($node);
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
             Quagga.stop();
             /*correct*//*
            
            $("#container").html("<h1 style='color:green;text-align:center;'><i class=' fa-3x fa fa-check-square'></i> barcode accepted</h1>");
                   $("#headody").remove();
                  //ajax to get signmodal
                  $('#signModal').modal('show');
                   $.ajax({
         type:"get",
   url:"signupprompt_ajax.php",
     beforeSend: function() {
    $('#result').html("<div style='text-align:center;'><img src='images/copy.gif'/></div>");
  },
   data: {yr:bardata[0] , br:bardata[1],rl:bardata[2]},
   success: function( data ) {
   $( "#result" ).html(data);
   },
   
   cache: false
})
                     

                }
             else {
               Quagga.stop();
             /* wrong*//*
               $("#container").html("<h2 class='text-info' style='text-align:center;'><a href='' ><i class='fa fa-refresh fa-3x' aria-hidden='true'></i></a> try again</h2>");    
             
                   

                    }
              }
            else{
             Quagga.stop();
             /* wrong*//*
                $("#container").html("<h2 class='text-info' style='text-align:center;'><a href='' ><i class='fa fa-refresh fa-3x' aria-hidden='true'></i></a> try again</h2>");    
             
                  }
/* checker end*//*
        }
    });

}

*/
