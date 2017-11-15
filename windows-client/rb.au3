#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include "SSH_udf.au3"

_SSHStartup()

Global $ConnectedSocket = -1
Global $msg, $recv, $ret

$address = "10.10.111.9"
$port = "22"
$username = "sc24865023"
$password = "dE1Eeao4o4q3JqTc"
$command = "/opt/scripts/cisco/configure-cisco.sh" ; выполняемая команда

_SSHParametreSet("yesall","1") ; чтоб не задавало вопросов при подключении
_SSHParametreSet("protocol","ssh")
_SSHParametreSet("login",$username)
_SSHParametreSet("passwd",$password)
$ConnectedSocket = _SSHConnect($address,$port)

If $ConnectedSocket = 0 Then ; пробуем подключиться
	MsgBox(0,"Error", "It's impossible to connect")
Else
	$t = MsgBox (4, "Сonfirmation ask" ,"Are you sure?") ; вопрос-ответ
	If $t = 6 Then ; если "да"
		$ret = _SSHSend( $ConnectedSocket , $command&@crlf)
		MsgBox(64,"Info", "Command completed", 3)
	ElseIf $t = 7 Then ; если "нет"
		MsgBox(64,"Info", "Command canceled", 3)
	EndIf
EndIf

Sleep (1000 * 300) ; приостановка перед убиванием сессии для завершения работы удаленного скрипта

_SSHCloseSocket($ConnectedSocket)
_SSHShutdown()
