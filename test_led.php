<?php


echo'
<html>
<head>
<style>





.led-yellow {
  margin:auto;
  width: 12px;
  height: 12px;
  background-color: #FF0;
  border-radius: 50%;
  box-shadow: rgba(0, 0, 0, 0.2) 0 -1px 7px 1px, inset #808002 0 -1px 9px, #FF0 0 2px 12px;
  -webkit-animation: blinkYellow 1s infinite;
  -moz-animation: blinkYellow 1s infinite;
  -ms-animation: blinkYellow 1s infinite;
  -o-animation: blinkYellow 1s infinite;
  animation: blinkYellow 1s infinite;
}

@-webkit-keyframes blinkYellow {
    from { background-color: #FF0; }
    50% { background-color: #AA0; box-shadow: rgba(0, 0, 0, 0.2) 0 -1px 7px 1px, inset #808002 0 -1px 9px, #FF0 0 2px 0; }
    to { background-color: #FF0; }
}
@-moz-keyframes blinkYellow {
    from { background-color: #FF0; }
    50% { background-color: #AA0; box-shadow: rgba(0, 0, 0, 0.2) 0 -1px 7px 1px, inset #808002 0 -1px 9px, #FF0 0 2px 0; }
    to { background-color: #FF0; }
}
@-ms-keyframes blinkYellow {
    from { background-color: #FF0; }
    50% { background-color: #AA0; box-shadow: rgba(0, 0, 0, 0.2) 0 -1px 7px 1px, inset #808002 0 -1px 9px, #FF0 0 2px 0; }
    to { background-color: #FF0; }
}
@-o-keyframes blinkYellow {
    from { background-color: #FF0; }
    50% { background-color: #AA0; box-shadow: rgba(0, 0, 0, 0.2) 0 -1px 7px 1px, inset #808002 0 -1px 9px, #FF0 0 2px 0; }
    to { background-color: #FF0; }
}
@keyframes blinkYellow {
    from { background-color: #FF0; }
    50% { background-color: #AA0; box-shadow: rgba(0, 0, 0, 0.2) 0 -1px 7px 1px, inset #808002 0 -1px 9px, #FF0 0 2px 0; }
    to { background-color: #FF0; }
}


</style>
</head>
<body>
 <div class="led-yellow"></div>
</body>
</html>';
?>
