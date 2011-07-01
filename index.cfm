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
	<div class="tabs">
		<ul>
			<li class="first"><a href="##tab_faqs">dspFAQs</a></li>
			<li><a href="##tab_calJump">dspCalJump</a></li>
			<li><a href="##tab_sectionSearch">dspSectionSearch</a></li>
			<li><a href="##tab_gist">dspGist</a></li>
			<li><a href="##tab_features">dspFeatures</a></li>
		</ul>
		<div id="tab_faqs">
			<p>dspFAQs adds a jQuery enabled display of an FAQ listing.  The page that the object is added to shows a list of questions, and when the question is clicked the answer will slide below the question.</p> 
			<strong>To Use</strong>
			<ol>
				<li>Create a Page in your Site Manager</li>
				<li>Add the FAQ Display Object to the Page</li>
				<li>Create a page under the page for each question in an FAQ</li>
				<li>The Title of each Page will be the question</li>
				<li>The Body of each Page will be the answer</li>
				<li>Make sure that your template includes the jQuery framework</li>
			</ol>
		</div>
		<div id="tab_calJump"></div>
		<div id="tab_sectionSearch"></div>
		<div id="tab_gist"></div>
		<div id="tab_features"></div>
	</div>
	</cfoutput>
</cfsavecontent>

<cfoutput>#application.pluginManager.renderAdminTemplate(body=variables.body,pageTitle=request.pluginConfig.getName())#</cfoutput>