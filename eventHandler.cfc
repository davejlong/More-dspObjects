<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad" output="false">
		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onRenderStart" output="false" returntype="any">
		<!--- Add CSS to header --->
		<cfsavecontent variable="PowerToolsHeader">
			<cfoutput>
				<link rel="stylesheet" type="text/css" href="/plugins/#variables.pluginConfig.getDirectory()#/css/global.css" media="all" />
			</cfoutput>			
		</cfsavecontent>
		
		<cfhtmlhead text="#PowerToolsHeader#">
	</cffunction>

</cfcomponent>

