$PBExportHeader$w_memory.srw
forward
global type w_memory from window
end type
type cb_4 from commandbutton within w_memory
end type
type cb_3 from commandbutton within w_memory
end type
type st_2 from statictext within w_memory
end type
type st_1 from statictext within w_memory
end type
type cb_2 from commandbutton within w_memory
end type
type cb_1 from commandbutton within w_memory
end type
end forward

global type w_memory from window
integer width = 2199
integer height = 1212
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
end type
global w_memory w_memory

type variables
Boolean 	ib_continue = False, ib_continue2 = False
Long 				il_Count, il_Count2
end variables
on w_memory.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1}
end on

on w_memory.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event closequery;If ib_continue2 Then
	ib_continue2 = False
	MessageBox ( "Tips", "Testing...,Plases stop Test!" )
	Return 1
End If

If ib_continue Then
	ib_continue = False
	MessageBox ( "Tips", "Testing...,Plases stop Test!" )
	Return 1
End If
end event

type cb_4 from commandbutton within w_memory
integer x = 14
integer y = 348
integer width = 672
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CrypterObject Test Start"
end type

event clicked;CrypterObject 	lco_Crypt
Long 				ll_Count
String 			ls_return
Blob 				lb_Data, lb_Key, lb_iv, lb_return
lco_Crypt = Create CrypterObject
ib_continue2 = True

lb_Key = Blob ( "appeonkey1234567",  EncodingUTF8!)
lb_iv = Blob ( "appeoniv12345678",  EncodingUTF8!)
					
Do While ib_continue2
	Yield()
	st_2.Text = "Times:" + String ( il_Count2 )
	lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob("Appeon", EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
	lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
	lb_Data = Blob ( "" )	
	lb_Return = Blob ( "" )
	
	il_Count2 ++
Loop


If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )
end event

type cb_3 from commandbutton within w_memory
integer x = 1262
integer y = 348
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;//Stop
ib_continue2 = False
end event

type st_2 from statictext within w_memory
integer x = 736
integer y = 368
integer width = 434
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Times:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_memory
integer x = 736
integer y = 212
integer width = 434
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Times:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_memory
integer x = 1262
integer y = 192
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Stop"
end type

event clicked;
//Stop
ib_continue = False
end event

type cb_1 from commandbutton within w_memory
integer x = 14
integer y = 192
integer width = 635
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "CoderObject Test Start"
end type

event clicked;CoderObject 	lco_Code
Long 				ll_Count
String 			ls_return
Blob 				lb_Data
lco_Code = Create CoderObject
ib_continue = True

Do While ib_continue
	Yield()
	st_1.Text = "Times:" + String ( il_Count )
	ls_return = lco_Code.HexEncode(Blob("Appeon", EncodingANSI!))
	lb_Data = lco_Code.HexDecode(ls_return)
	ls_return = lco_Code.Base64Encode(Blob("Appeon", EncodingANSI!))
	lb_Data = lco_Code.Base64Decode(ls_return)
	ls_return = lco_Code.UrlEncode(Blob("http://www.appeon.com", EncodingANSI!))
	lb_Data = lco_Code.UrlDecode(ls_return)
	ls_return = CharA (65)
	lb_Data = Blob ( "" )
	
	il_Count ++
Loop


If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
end event

