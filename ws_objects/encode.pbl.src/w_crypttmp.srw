$PBExportHeader$w_crypttmp.srw
forward
global type w_crypttmp from window
end type
type mle_1 from multilineedit within w_crypttmp
end type
end forward

global type w_crypttmp from window
integer width = 1440
integer height = 840
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
end type
global w_crypttmp w_crypttmp

type variables

end variables

on w_crypttmp.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on w_crypttmp.destroy
destroy(this.mle_1)
end on

event open;CrypterObject lco_crypt
CoderObject lco_code
String ls_Value, ls_output

lco_crypt = message.powerobjectparm

lco_code = Create CoderObject
If IsValid ( lco_crypt ) Then
	ls_Value = lco_code.HexEncode( lco_crypt.MD5(Blob("Appeon", EncodingANSI!)))
	Destroy ( lco_crypt )
	Destroy ( lco_code )
Else
	ls_Value = "none"
End If

gs_values = ls_Value

lco_crypt = Create CrypterObject

closewithreturn(this,lco_crypt)

end event

type mle_1 from multilineedit within w_crypttmp
integer x = 18
integer y = 28
integer width = 1394
integer height = 524
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

