<cfparam name="url.categoryID" default="" />
<cfif url.categoryID neq "">
	<cfset QuestionsIterator = application.contentManager.getKidsIterator(ParentID='#request.contentBean.getContentID()#',CategoryID='#url.categoryID#',siteid='#request.siteid#') />
<cfelse>
	<cfset QuestionsIterator = request.contentBean.getKidsIterator() />
</cfif>

<cfoutput>
<div id="PowerFAQS">
	<cfif QuestionsIterator.recordcount() gt 0>
		<cfloop condition="QuestionsIterator.hasNext()">
			<cfset Question = QuestionsIterator.next() />
			<cfset PermLink = Question.getURL() />
			<dl class="multiquestion">
				<dt class="question"><span class="QIcon">Q:</span>#Question.getTitle()#</dt>
				<dd class="answer"><span class="AIcon">A:</span>#Question.getBody()#<div class="permalink"><a href="#PermLink#">Perminent Link To FAQ</a></div></dd>
			</dl>
		</cfloop>
	<cfelse>
		<dl class="singlequestion">
			<dt class="question"><span class="QIcon">Q:</span>#request.contentBean.getTitle()#</dt>
			<dd class="answer"><span class="AIcon">A:</span>#request.contentBean.getBody()#</dd>
		</dl>
	</cfif>
</div>
</cfoutput>