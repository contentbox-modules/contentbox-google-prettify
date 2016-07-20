<cfoutput>
<!--- Custom Javascript --->
<script type="text/javascript">
function embedCode(){
	var code = $("##codeForm").find("##code").val();
	if( !code.length ){
		alert("Please enter some code!");return;
	}
	var lineNumbers = $("##codeForm").find("##lineNumbers:checked").val();
	var linesCSS = ( lineNumbers == "true" ? " linenums" : "");
	var text = '<pre class="prettyprint' + linesCSS + '">' + code + '</pre>';
	sendEditorText( text );
}
function sendEditorText(text){
	insertEditorContent( '#rc.editorName#', text );
	closeRemoteModal();
}
</script>
</cfoutput>