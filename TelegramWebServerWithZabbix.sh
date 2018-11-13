#!/bin/bash
to=$1										#
subject=$2									#Recibe los parametros desde Zabbix
body=$3										#
LOGFILE="/var/log/zabbix/telegram.log"		#Crea y define el archivo de log
to=${to// /+}								#
subject=${subject// /+}						#Elimina los espacios vacios del texto y los sustituye por "+" para dar formato para el envio.
body=${body// /+}							#
curl --data "Msg="$body"&ChatId="$to"&BotToken="298111298:AAGp-gWWhrHPAzUkIYq7QaNYLM7hCqdRuJs"" http://10.24.1.26/WSTelegram/WSTelegram.asmx/EnviaTLMsg >> ${LOGFILE}		#Envia mensaje
echo "Recipent=$to Message=$subject Body=$body" >> ${LOGFILE}		#Escribe resultado en log 
echo "Finished" >> ${LOGFILE}
