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
	
	
	<!--- PUBLIC METHODS --->
	<cffunction name="dspFeatures" access="public" output="false" returntype="string">
		<cfargument name="portalid" type="string" required="true" />
		<cfargument name="$" type="any" /> 
		<cfset var features = '<!-- Portal ID not valid -->' />
		<cfset var iterator = application.contentManager.getKidsIterator(ParentID='#portalid#',siteid='#request.siteid#') />
		<cfset var local = structNew() />
		<cfsavecontent variable="features">
			<div class="mdo_feature-container feature-container">
			<cfloop condition="iterator.hasNext()">
				<cfscript>
					local.itemNav = iterator.next();
					local.item = local.itemNav.getContentBean();
					local.class = 'mdo_feature feature ';
					// Generate Alpha's and Omega's
					if((iterator.currentIndex() MOD 3) EQ 1){
						local.class = local.class & 'alpha';
					}else if((iterator.currentIndex() MOD 3) EQ 0){
						local.class = local.class & 'omega';
					}
				</cfscript>
				<cfoutput>
					<div class="#local.class#">
						<div class="feature-inner">
							<h3>#local.item.getValue('title')#</h3>
							<div class="image">
								<img src="#$.createHREFforImage(local.item.getValue('siteID'),local.item.getValue('fileID'),local.item.getValue('fileEXT'),'medium')#" alt="#local.item.getValue('title')#" />
							</div>
							#local.item.getValue('summary')#
						</div>
					</div>
				</cfoutput>
			</cfloop>
			</div>
		</cfsavecontent>

		<cfreturn features />
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

