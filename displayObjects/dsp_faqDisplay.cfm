<!--- File Updated by Blue River (http://www.getmura.com) on 4/22/2011 --->
<!--- File Updated by David Long (http://www.davejlong.com) on 7/1/2011 --->
<cfsilent>
	<cfif len($.event('page'))>
		<cfset currentPage = $.event('page') />
	<cfelse>
		<cfset currentPage = 1 />
	</cfif>

	<cfset QuestionsIterator =$.getBean("contentManager").getKidsIterator(
		parentID=$.content('contentID'),
		categoryID=$.event('categoryID'),
		siteid=$.event('siteID'),
		sortBy=$.content('sortBy'),
		sortDirection=$.content('sortDirection')
	) />	
	<cfset QuestionsIterator.setNextN(10) />
	<cfset QuestionsIterator.setPage(currentPage) />
</cfsilent>
<cfoutput>
<div class="mdo_faqDisplay faqDisplay">
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
	<cfif QuestionsIterator.pageCount() GT 1>
		<dl class="mdo_paginationContainer">
			<dt>More Results:</dt>
			<dl>
				<ul class="mdo_pagination">
					<cfloop from="1" to="#QuestionsIterator.pageCount()#" index="loc.pageCounter">
						<li><cfif NOT loc.pageCounter IS currentPage><a href="?page=#loc.pageCounter#"></cfif>#loc.pageCounter#<cfif NOT loc.pageCounter IS currentPage></a></cfif></li>
					</cfloop>
				</ul>
			</dl>
		</dl>
	</cfif>
</div>

<script type="text/javascript">
	$('.faqDisplay dt').click(function(){
		$($(this).parent()).children('dd').slideToggle("500");
	});
</script>
</cfoutput>