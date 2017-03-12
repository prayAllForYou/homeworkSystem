<html>
<head>
<title>Swap Images with onMouseOver and onMouseOut</title>
<script type="text/javascript">
function show_prompt(){  
    var value = prompt('input name', 'defult name');  
    if(value!=null||value!=""){
    window.location.href="paperName.action?tsearchPbm="+value;
    }
}  
</script>
</head>
<body bgcolor="#FFFFCC" text="#3300FF">
<span id="s1" style = "width : 150"><a href="http://www.CsrCode.cn" target="_blank" onmouseover="www_helpor_net.style.width='200';" onmouseout="www_helpor_net.style.width= '150';"><Img src="images/1.jpg" id="www_helpor_net"></a></span>
<span id="s2" style = "width : 150"><a href="http://www.CsrCode.cn" target="_blank" onmouseover="ff.src='images/2.jpg'" onmouseout="ff.src='images/3.jpg'"><Img src="images/1.jpg" id="ff"></a></span>



<input id="prompt_button" type="button" value="prompt" onclick="show_prompt()" >  

</body>
</html>