<cfoutput>
<div class="modal-dialog modal-lg" role="document" >
	<div class="modal-content">
		<div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4><i class="fa fa-comments"></i>ContentBox Google Code Prettify</h4>
        </div>
		<div class="modal-body">
			<div>
				<p>Paste your code so we can magically prettify it on your site.</p>
				#html.startForm( name="codeForm" )#
					<div class="form-group">
						#html.label( field="code", content="Code:" )#
						#html.textarea( name="code", class="textfield form-control", required="true", rows="10" )#
					</div>	
					<!--- Show Line Numbers --->
					<br>
					<div class="form-group">
						#html.label( field="lineNumbers", content="Show Line Numbers:" )#
						#html.radioButton( name="lineNumbers", value=true )# Yes
						#html.radioButton( name="lineNumbers", checked=true, value=false )# No
					</div>	
				#html.endForm()#
			</div>
			<hr/>
			<!--- Button Bar --->
			<div id="bottomCenteredBar" class="textRight">
				<button class="btn btn-primary" onclick="embedCode()"> Embed Code </button>
				<button class="btn btn-danger" onclick="closeRemoteModal()"> Cancel </button>
			</div>
		</div>
	</div>
</div>
</cfoutput>
