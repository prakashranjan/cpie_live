<!--<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Tags Input with Autocomplete</title>
	<link href="css/typeahead.css"  rel="stylesheet" />
	<link href="css/bootstrap-tagsinput.css" rel="stylesheet">
    <style>
	body{ font-family:calibri;}
	.twitter-typeahead { display:initial !important; }
	.bootstrap-tagsinput {line-height:40px;display:block !important;}
	.bootstrap-tagsinput .tag {background:#09F;padding:5px;border-radius:4px;}
	.tt-hint {top:2px !important;}
	.tt-input{vertical-align:baseline !important;}
	.typeahead { border: 1px solid #CCCCCC;border-radius: 4px;padding: 8px 12px;width: 300px;font-size:1.5em;}
	.tt-menu { width:300px; }
	span.twitter-typeahead .tt-suggestion {padding: 10px 20px;	border-bottom:#CCC 1px solid;cursor:pointer;}
	span.twitter-typeahead .tt-suggestion:last-child { border-bottom:0px; }
	.demo-label {font-size:1.5em;color: #686868;font-weight: 500;}
	.bgcolor {max-width: 440px;height: 200px;background-color: #c3e8cb;padding: 40px 70px;border-radius:4px;margin:20px 0px;}
	
	</style>
</head>
<body>
	<h1>Bootstrap Tags Input with Auto complete</h1>
	
	<input type="text" value="" id="tags-input" data-role="tagsinput" />
        
        
	
<script src="js/jquery.min.js"></script>
<script src="js/typeahead.js"></script>
<script src="js/bootstrap-tagsinput.js"></script>
<script>
	var countries = new Bloodhound({
	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
	  queryTokenizer: Bloodhound.tokenizers.whitespace,
	  prefetch: {
		url: 'data/countries.json',
		filter: function(list) {
		  return $.map(list, function(name) {
			return { name: name }; });
		}
	  }
	});
	countries.initialize();

	$('#tags-input').tagsinput({
	  typeaheadjs: {
		name: 'countries',
		displayKey: 'name',
		valueKey: 'name',
		source: countries.ttAdapter()
	  }
	});
        
        
        
</script>
</body>
</html>
-->