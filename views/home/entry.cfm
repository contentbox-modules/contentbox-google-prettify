<cfoutput>
<h2>ContentBox Google Code Prettify</h2>
<div>
	<p>Paste your code so we can magically prettify it on your site.</p>
	#html.startForm(name="codeForm")#
		#html.textarea(name="code", label="Code: ", class="textfield", required="true", rows="10")#
		<!--- Show Line Numbers --->
		#html.label(field="lineNumbers",content="Show Line Numbers:")#
		#html.radioButton(name="lineNumbers",value=true)# Yes
		#html.radioButton(name="lineNumbers",checked=true,value=false)# No
	#html.endForm()#
</div>
<hr/>
<!--- Button Bar --->
<div id="bottomCenteredBar" class="textRight">
	<button class="button2" onclick="embedCode()"> Embed Code </button>
	<button class="buttonred" onclick="closeRemoteModal()"> Cancel </button>
</div>
</cfoutput>