<cfif $.content('Type') EQ 'calendar'>
<cfsilent>
	<cfscript>
		if(structKeyExists(URL,'month'))cMonth = URL.month;
		else cMonth = month(now());
		if(structKeyExists(URL,'year'))cYear = URL.year;
		else cYear = year(now());
	</cfscript>
</cfsilent>
<cfoutput>
<form name="selectDate" method="get" class="mdo_calJump" action="?LinkServID=#$.content('contentid')#">
	<fieldset>
		<legend>Jump to Date</legend>
		<select name="ddMonth" id="ddMonth">
			<cfloop from="1" to="12" step="1" index="iMonth">
				<option value="#iMonth#" #iif(iMonth EQ cMonth,de('selected="selected"'),de(''))#>#monthAsString(iMonth)#</option>
			</cfloop>
		</select> 
		<select name="ddYear" id="ddYear">
			<cfset yFrom = (year(now()) - 3) />
			<cfset yTo = (year(now()) + 3) />
			<cfloop from="#yFrom#" to="#yTo#" step="1" index="iYear">
				<option value="#iYear#" #iif(iYear EQ cYear,de('selected="selected"'),de(''))#>#iYear#</option>
			</cfloop>
		</select> 
		<input type="submit" value="Go" onclick="document.location.href='?LinkServID=#$.content('contentid')#&month=' + $('##ddMonth').val() + '&year=' + $('##ddYear').val()" />
	</fieldset>
</form>
</cfoutput>
</cfif>