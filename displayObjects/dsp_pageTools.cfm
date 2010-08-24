<cfsilent>
<cfset loadShadowBoxJS() />
<cfset rbFactory=getSite().getRBFactory()/>
</cfsilent>
<cfoutput>
<div id="svPageTools">
	<ul>
		<li id="sendToFriend"><a rel="shadowbox;width=600;height=500" href="http://#application.settingsManager.getSite(request.siteid).getDomain()##application.configBean.getServerPort()##application.configBean.getContext()#/#getSite().getDisplayPoolID()#/includes/display_objects/sendtofriend/index.cfm?link=#URLEncodedFormat(getCurrentURL())#&siteid=#request.siteid#">#rbFactory.getResourceBundle().messageFormat(rbFactory.getKey('favorites.emailthis'),rbFactory.getKey('sitemanager.content.type.#request.contentbean.getType()#'))#</a> </li>
		<li id="print"><a href="javascript:window.print();void(0);">#rbFactory.getResourceBundle().messageFormat(rbFactory.getKey('favorites.printthis'),rbFactory.getKey('sitemanager.content.type.#request.contentbean.getType()#'))#</a></li>
	</ul>
</div>
</cfoutput>