$PBExportHeader$u_cryptobject.sru
forward
global type u_cryptobject from crypterobject
end type
end forward

global type u_cryptobject from crypterobject
event ue_post ( )
event ue_postevent ( )
event ue_trigger ( )
event ue_triggerevent ( )
end type
global u_cryptobject u_cryptobject

type variables
String is_Trigger = "CrypterObject Trigger Event Failed"
String is_Post = "CrypterObject Post Event Failed"
Long 	il_count = 0
end variables

event ue_post();is_Post = "CrypterObject Post Event Success " + String ( il_count )
gs_Post = "CrypterObject Post Event Success " + String ( il_count )
end event

event ue_postevent();string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "u_Crypt.ue_PostEvent logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
else
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "u_Crypt.ue_PostEvent logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
end if
end event

event ue_trigger();is_Trigger = "CrypterObject Trigger Event Success " + String ( il_count )
end event

event ue_triggerevent();string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "u_Crypt.ue_TriggerEvent logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
else
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "u_Crypt.ue_TriggerEvent logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
end if
end event

event constructor;string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "u_Crypt.PostEvent Constructor! logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
elseIf string(message.wordparm) = '100' Then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "u_Crypt.PostEvent Constructor! logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
else
	il_count++
	gs_values = "CrypterObject Constructor:" + String ( il_count )
	
//	Post 	Event ue_post()
//	Trigger Event ue_Trigger()
end if
end event

on u_cryptobject.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_cryptobject.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;string ls_tmp1,ls_tmp2

if string(message.wordparm) = '0' then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm,"address")
	gs_values = "u_Crypt.TriggerEvent Destructor! logptrw:" + ls_tmp1 + " stringl:" + ls_tmp2
elseIf string(message.wordparm) = '100' Then
	ls_tmp1 = string(message.wordparm)
	ls_tmp2 = string(message.longparm)
	gs_values = "u_Crypt.TriggerEvent Destructor! logptrw:" + ls_tmp1 + " longl:" + ls_tmp2
else
	gs_values = "CrypterObject Destructor Success"	
end if
end event

