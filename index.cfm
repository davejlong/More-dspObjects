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
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=variables.body,pageTitle=request.pluginConfig.getName())#</cfoutput>