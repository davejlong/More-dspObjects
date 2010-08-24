<cfoutput>
<form name="selectDate" method="post" action="?display=search">
	<input type="hidden" name="searchSectionID" value="#$.content('contentid')#" />
	<input type="hidden" name="display" value="search" />
	<input type="hidden" name="newSearch" value="true" />
	<input type="hidden" name="noCache" value="1" />
	<fieldset>
 		<legend>Search in #$.content('menutitle')#</legend>
		<ol>
			<li>
				<input type="text" name="keywords" />
				<input type="submit" value="Go" />
			</li>
		</ol>
	</fieldset>
</form>
</cfoutput>