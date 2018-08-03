$PBExportHeader$w_codetmp.srw
forward
global type w_codetmp from window
end type
type mle_1 from multilineedit within w_codetmp
end type
end forward

global type w_codetmp from window
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
global w_codetmp w_codetmp

type variables

end variables

on w_codetmp.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on w_codetmp.destroy
destroy(this.mle_1)
end on

event open;CoderObject lco_code
String ls_Value, ls_output

lco_code = message.powerobjectparm

If IsValid ( lco_code ) Then
	ls_Value = lco_code.Base64Encode(Blob("Appeon", EncodingANSI!))
	Destroy ( lco_code )
Else
	ls_Value = "none"
End If

gs_values = ls_Value

lco_code = Create CoderObject

closewithreturn(this,lco_code)

end event

type mle_1 from multilineedit within w_codetmp
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

