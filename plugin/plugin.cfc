<cfcomponent extends="mura.plugin.plugincfc">

	<cffunction name="init" returntype="any" access="public" output="false">
		<cfargument name="pluginConfig" type="any" default="" />

		<cfset variables.pluginConfig = arguments.pluginConfig />

		<cfreturn this />
	</cffunction>

	<cffunction name="install" returntype="void" access="public" output="false">
		<!--- TODO: Auto-generated method stub --->
	</cffunction>

	<cffunction name="update" returntype="void" access="public" output="false">
		<!--- TODO: Auto-generated method stub --->
	</cffunction>

	<cffunction name="delete" returntype="void" access="public" output="false">
		<!--- TODO: Auto-generated method stub --->
	</cffunction>

</cfcomponent>