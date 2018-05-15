<%
'Copyright (C) Stefan Buchali, UDG United Digital Group, www.udg.de
'
'This software is licensed under a
'Creative Commons GNU General Public License (http://creativecommons.org/licenses/GPL/2.0/)
'Some rights reserved.
'
'You should have received a copy of the GNU General Public License
'along with saveMapPosition.  If not, see http://www.gnu.org/licenses/.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Server.ScriptTimeOut=300

SessionKey=request.form("sessionkey")
RedakteurLoginGUID=request.form("loginguid")
AktuelleSeiteGUID = request.form("pageguid")

' Eingaben holen
saveMapPositionX = request.form("saveMapPositionX")
saveMapPositionY = request.form("saveMapPositionY")
saveEltTemplateNameX = request.form("saveEltTemplateNameX")
saveEltTemplateNameY = request.form("saveEltTemplateNameY")


if saveMapPositionX="" then saveMapPositionX="#"&SessionKey end if
if saveMapPositionY="" then saveMapPositionY="#"&SessionKey end if


	' XML-Verarbeitung per Microsoft-DOM vorbereiten
	set XMLDoc = Server.CreateObject("MSXML2.DOMDocument")
	XMLDoc.async = false
	XMLDoc.validateOnParse = false

	' RedDot Object fuer RQL-Zugriffe anlegen
	set objIO = Server.CreateObject("OTWSMS.AspLayer.PageData")

	' Variablendeklaration
	Dim xmlSendDoc		' RQL-Anfrage, die zum Server geschickt wird
	Dim ServerAnswer	' Antwort des Servers


	'Elemente der Seite auslesen
	xmlSendDoc=	"<IODATA loginguid=""" & RedakteurLoginGUID & """ sessionkey=""" & SessionKey & """ dialoglanguageid=""DEU"">"&_
					"<PAGE guid=""" & AktuelleSeiteGUID & """>"&_
						"<ELEMENTS action=""load"" />"&_
					"</PAGE>"&_
				"</IODATA>"
	ServerAnswer = objIO.ServerExecuteXml (xmlSendDoc, sError)
	XMLDoc.loadXML(ServerAnswer)
	saveEltGuidX = XMLDoc.selectsinglenode("//ELEMENT/@guid[../@name='" & saveEltTemplateNameX & "']").text
	saveEltGuidY = XMLDoc.selectsinglenode("//ELEMENT/@guid[../@name='" & saveEltTemplateNameY & "']").text


	'Eingaben speichern
	xmlSendDoc=	"<IODATA loginguid=""" & RedakteurLoginGUID & """ sessionkey=""" & SessionKey & """>"&_
					"<ELEMENTS action=""save"" reddotcacheguid="""">"&_
						"<ELT guid=""" & saveEltGuidX & """ type=""1"" value=""" & saveMapPositionX & """/>"&_
						"<ELT guid=""" & saveEltGuidY & """ type=""1"" value=""" & saveMapPositionY & """/>"&_
					"</ELEMENTS>"&_
				"</IODATA>"
	ServerAnswer = objIO.ServerExecuteXml (xmlSendDoc, sError)


set objIO = nothing
set XMLDoc = nothing

%>ok