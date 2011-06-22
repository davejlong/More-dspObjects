<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onApplicationLoad" output="false">
		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onRenderStart" output="false" returntype="any">
		<cfargument name="event" />
		<cfargument name="$" />
		
		<!--- Inject methods into mura scope to use with mura tags --->
		<cfset $.getContentRenderer().injectMethod('dspGist',dspGist) />
		
		<!--- Add CSS to header --->
		<cfsavecontent variable="PowerToolsHeader">
			<cfoutput>
				<link rel="stylesheet" type="text/css" href="/plugins/#variables.pluginConfig.getDirectory()#/css/global.css" media="all" />
			</cfoutput>			
		</cfsavecontent>
		
		<cfhtmlhead text="#PowerToolsHeader#">
	</cffunction>

	<cffunction name="dspGist" access="public" output="false" returntype="string">
		<cfargument name="gist" type="string" required="true" />
		<cfargument name="file" type="string" required="true" default="" />
		<cfset var gistScript = '' />
		<cfset var gistUrl = 'https://gist.github.com/' />
		<!---
			Ex. Embed All Files: <script src="https://gist.github.com/993735.js"></script>
			Ex. Embed Single File: <script src="https://gist.github.com/993735.js?file=test-query.cfm"></script>
		--->
		<cfscript>
			gistUrl = gistUrl & Arguments.gist & '.js';
			if(len(Arguments.file))gistUrl = gistUrl & '?file=' & Arguments.file;
		</cfscript>
		<cfsavecontent variable="gistScript">
			<cfoutput><script src="#gistUrl#"></script></cfoutput>
		</cfsavecontent>

		<cfreturn gistScript />
	</cffunction>
</cfcomponent>

