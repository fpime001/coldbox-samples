<!-----------------------------------------------------------------------Author 	 :	Luis MajanoDate     :	September 25, 2005Description :	General handler for my hello application. Please remember to alter	your extends base component using the Coldfusion Mapping.	example:		Mapping: fwsample		Argument Type: fwsample.system.eventhandlerModification History:Sep/25/2005 - Luis Majano	-Created the template.-----------------------------------------------------------------------><cfcomponent name="ehGeneral" extends="coldbox.system.eventhandler">	<!--- ************************************************************* --->		<cffunction name="onApplicationStart" access="public" output="false" returntype="void">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfset var isColdFusionMX7 = server.coldfusion.productname is "ColdFusion Server" and server.coldfusion.productversion lte 7>		<cfset var isColdFusionMX8 = server.coldfusion.productname is "ColdFusion Server" and server.coldfusion.productversion gte 8>				<cfset getColdboxOCM().set("isColdfusionMX7",isColdfusionMX7,0)>		<cfset getColdboxOCM().set("isColdfusionMX8",isColdfusionMX8,0)>				<!--- Use the isProxyRequest() --->		<cfif isColdfusionMX7>			<cfif event.isProxyRequest()>				<cfset getPlugin("JavaLoader").setup( listToArray( ExpandPath("../includes/helloworld.jar")) )>			<cfelse>				<cfset getPlugin("JavaLoader").setup( listToArray( ExpandPath("includes/helloworld.jar")) )>			</cfif>		</cfif>				<!--- Cache a datasource bean --->		<cfset getColdboxOCM().set("mysiteDSNBean",getDatasource("mysite"),0)>		<!--- Log something. --->		<cfset getPlugin("logger").logEntry("information","AppStart Fired")>	</cffunction>	<!--- ************************************************************* --->	</cfcomponent>