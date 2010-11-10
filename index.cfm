<!--- 
	Plugin: MuraDspObjects
 --->

<cfinclude template="plugin/config.cfm" />

<cfsilent>
	<!--- TODO: Implement code... --->
</cfsilent>

<cfsavecontent variable="variables.body">
	<cfoutput>
	<h2>#request.pluginConfig.getName()#</h2>
	<!--- TODO: Implement code... --->
	<dl>
		<dt>FAQ Display</dt>
		<dd>
			<p>The FAQ Display adds a jQuery enabled display of an FAQ listing.</p> 
			<strong>To Use</strong>
			<ol>
				<li>Create a Portal in your Site Manager</li>
				<li>Add the FAQ Display Object to the Portal</li>
				<li>Create a page inside the portal for each question in an FAQ</li>
				<li>The Title of each Page will be the question</li>
				<li>The Body of each Page will be the answer</li>
				<li>Make sure that your template includes the jQuery framework</li>
			</ol>
		</dd>
	</dl>
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=variables.body,pageTitle=request.pluginConfig.getName())#</cfoutput>