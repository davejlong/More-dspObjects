<!--- File Updated by Blue River (http://www.getmura.com) on 4/22/2011 --->
<cfset QuestionsIterator =$.getBean("contentManager").getKidsIterator(
	parentID=$.content('contentID'),
	categoryID=$.event('categoryID'),
	siteid=$.event('siteID'),
	sortBy=$.content('sortBy'),
	sortDirection=$.content('sortDirection')
) />

<cfoutput>
<div class="faqDisplay">
	<cfif QuestionsIterator.recordcount() gt 0>
		<cfloop condition="QuestionsIterator.hasNext()">
			<cfset Question = QuestionsIterator.next() />
			<cfif Question.getType() eq "Portal">
				<cfset SubQuestionsIterator =$.getBean("contentManager").getKidsIterator(
					parentID=Question.getContentID(),
					categoryID=$.event('categoryID'),
					siteid=$.event('siteID'),
					sortBy=Question.getSortBy(),
					sortDirection=Question.getSortDirection()
				) />
				<h3 class="faqSectionTitle">#Question.getTitle()#</h3>
				<cfloop condition="SubQuestionsIterator.hasNext()">
					<cfset SubQuestion = SubQuestionsIterator.next() />
					<cfset SubPermLink = SubQuestion.getURL() />
					<dl class="multiquestion expandable">
						<dt><span class="QIcon">Q:</span> #SubQuestion.getTitle()#</dt>
						<dd><span class="AIcon">A:</span> #SubQuestion.getBody()#<div class="permalink"><a href="#SubPermLink#">Permanent Link To FAQ</a></div></dd>
					</dl>
				</cfloop>
			<cfelse>
				<cfset PermLink = Question.getURL() />
				<dl class="multiquestion">
					<dt><span class="QIcon">Q:</span> #Question.getTitle()#</dt>
					<dd><span class="AIcon">A:</span> #Question.getBody()#<div class="permalink"><a href="#PermLink#">Permanent Link To FAQ</a></div></dd>
				</dl>
			</cfif> 
		</cfloop>
	<cfelse>
		<dl class="singlequestion expandable">
			<dt><span class="QIcon">Q:</span> #$.content('title')#</dt>
			<dd><span class="AIcon">A:</span> #$.content('body')#</dd>
		</dl>
	</cfif>
</div>

<script type="text/javascript">
	$('.faqDisplay dt').click(function(){
		$($(this).parent()).children('dd').slideToggle("500");
	});
</script>
</cfoutput>