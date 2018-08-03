$PBExportHeader$w_asymmetric.srw
forward
global type w_asymmetric from window
end type
type cb_1 from commandbutton within w_asymmetric
end type
type st_2 from statictext within w_asymmetric
end type
type mle_2 from multilineedit within w_asymmetric
end type
type cb_4 from commandbutton within w_asymmetric
end type
type st_4 from statictext within w_asymmetric
end type
type mle_privkey from multilineedit within w_asymmetric
end type
type mle_pubkey from multilineedit within w_asymmetric
end type
type st_11 from statictext within w_asymmetric
end type
type st_3 from statictext within w_asymmetric
end type
type mle_5 from multilineedit within w_asymmetric
end type
type st_1 from statictext within w_asymmetric
end type
type mle_1 from multilineedit within w_asymmetric
end type
end forward

global type w_asymmetric from window
integer width = 3666
integer height = 1896
boolean titlebar = true
string title = "RSA Encode/Decode"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
st_2 st_2
mle_2 mle_2
cb_4 cb_4
st_4 st_4
mle_privkey mle_privkey
mle_pubkey mle_pubkey
st_11 st_11
st_3 st_3
mle_5 mle_5
st_1 st_1
mle_1 mle_1
end type
global w_asymmetric w_asymmetric

forward prototypes
public subroutine wf_replace (ref string as_string, string as_str)
public subroutine wf_replace (ref string as_string, string as_str, string as_rep)
end prototypes

public subroutine wf_replace (ref string as_string, string as_str);Long 		ll_pos
do while true
	ll_pos = pos(as_string,as_str)
	if ll_pos > 0 then
		as_string = Replace(as_string,ll_pos,Len(as_str), "")
	else
		exit
	end if
loop
end subroutine

public subroutine wf_replace (ref string as_string, string as_str, string as_rep);Long 		ll_pos
do while true
	ll_pos = pos(as_string,as_str)
	if ll_pos > 0 then
		as_string = Replace(as_string,ll_pos,Len(as_str), as_rep)
	else
		exit
	end if
loop
end subroutine

on w_asymmetric.create
this.cb_1=create cb_1
this.st_2=create st_2
this.mle_2=create mle_2
this.cb_4=create cb_4
this.st_4=create st_4
this.mle_privkey=create mle_privkey
this.mle_pubkey=create mle_pubkey
this.st_11=create st_11
this.st_3=create st_3
this.mle_5=create mle_5
this.st_1=create st_1
this.mle_1=create mle_1
this.Control[]={this.cb_1,&
this.st_2,&
this.mle_2,&
this.cb_4,&
this.st_4,&
this.mle_privkey,&
this.mle_pubkey,&
this.st_11,&
this.st_3,&
this.mle_5,&
this.st_1,&
this.mle_1}
end on

on w_asymmetric.destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.mle_2)
destroy(this.cb_4)
destroy(this.st_4)
destroy(this.mle_privkey)
destroy(this.mle_pubkey)
destroy(this.st_11)
destroy(this.st_3)
destroy(this.mle_5)
destroy(this.st_1)
destroy(this.mle_1)
end on

event open;
mle_1.Text = 'Test Appeon'



mle_pubkey.Text = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDSLuIf6GQWLet7s88P0NilTMYc" + &
"t2BRbhUXF8fDdGTSojp0Tip5YwtUBMgCVkJi6emcBtohUVuGNnSEZroLFr8W5M3G" + &
"uPJxl8MvgQJ3agxk6nWYlEswSmkkNd6FCKo/6GIA+kg5s9hRWN23SkoKBHL4bbUT" + &
"Vts73HWH1EjyCuiL1wIDAQAB"


mle_privkey.Text = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANIu4h/oZBYt63uz" + &
"zw/Q2KVMxhy3YFFuFRcXx8N0ZNKiOnROKnljC1QEyAJWQmLp6ZwG2iFRW4Y2dIRm" + &
"ugsWvxbkzca48nGXwy+BAndqDGTqdZiUSzBKaSQ13oUIqj/oYgD6SDmz2FFY3bdK" + &
"SgoEcvhttRNW2zvcdYfUSPIK6IvXAgMBAAECgYAkiC+Xei4DSOH4M02XIya0vH5m" + &
"uVzNaoPR6rk2+MEZd0cPthJd3OA4L0iQV2vcg2muS+aYCesNjeN8q9pEWSTHRhvn" + &
"EnJWru25ygRy184dpPALN6DIjyHrTVQDZmUp03A+sJq3LyshLkU9ro25uO2h32Zr" + &
"KJU4d8kRDTHh15MBcQJBAPcDDHOrdKctSZvPY7auzTGfMUHy8XcmWb4b6r63RaDt" + &
"kB0JRCa1s2Xl79SeS/Ta00S5uIfQXqtHlSXDLKbG288CQQDZ1MT12GnjHU88ddPY" + &
"vZdLN4hA1mjacRmMP8+QtOwbZ4m5R1MAFQMvWIH/W/Q1Uesy/6g7M2If/1c/GTis" + &
"Aal5AkEAhRLcY3iMWQBZ9poNIz8bBs+3rsrecY10ranGlsaPuXoiuLHkSGJ9arks" + &
"ssQxMZGuXgkcM/b6+ZWP8Y8rgBIEGwJBAJ5vXg5+KI3y/HW6Map8QzWHH4ghKsRu" + &
"7KkQpHTY0r4f8ZEcKmdt4RInqu3DwPyjJ5HBV2gvuFgTjS6stoaM8ukCQQCSAAoZ" + &
"hCVeWToyBs3Ah/PkhDEGd68I2blpOYUuExCnrKpfzyIQtHBATgDJBKSjFzfshJ6A" + &
"EGJArakafrRcSy4h"
end event

type cb_1 from commandbutton within w_asymmetric
integer x = 1033
integer y = 928
integer width = 571
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "RSA Sign/VerSign"
end type

event clicked;
string 			ls_Body, ls_Return, ls_pubKey,ls_privKey
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return, lb_privKey,lb_pubKey, lb_data, lb_sign, lb_return2
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject
Long 	ll_Ret,li_return

ls_Body  = mle_1.Text

ls_pubKey = mle_pubkey.Text
lb_pubKey = lco_code.Base64Decode(ls_pubKey)
wf_replace(ls_pubKey,"~r","")
wf_replace(ls_pubKey,"~n","")
ls_privKey = mle_privkey.Text
wf_replace(ls_privKey,"~r","")
wf_replace(ls_privKey,"~n","")
lb_privKey = lco_code.Base64Decode(ls_privKey)

lb_Data = Blob(ls_Body, EncodingUTF8!)
Try
	lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
	If Len(lb_return) > 0 Then
		mle_5.Text = lco_code.Base64Encode( lb_return )
	Else
		Messagebox ( "fail",  String ( lb_return ) )
	End If
Catch(Throwable ex)
	mle_5.Text = ex.GetMessage()
End Try

Try
	li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_return)
	If li_return = 1 Then
		mle_2.Text = String(li_return) 
	Else
		Messagebox ( "fail",  String ( li_return ) )
	End If
Catch(Throwable ex1)
	mle_2.Text = ex1.GetMessage()
End Try

end event

type st_2 from statictext within w_asymmetric
integer x = 27
integer y = 1504
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "Decode Body"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within w_asymmetric
integer x = 411
integer y = 1444
integer width = 1056
integer height = 180
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_asymmetric
integer x = 416
integer y = 932
integer width = 567
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "RSA Encode/Decode"
end type

event clicked;
string 			ls_Body, ls_Return, ls_pubKey,ls_privKey
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return, lb_privKey,lb_pubKey, lb_data, lb_sign, lb_return2
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject
Long 	ll_Ret,li_return

ls_Body  = mle_1.Text

ls_pubKey = mle_pubkey.Text
lb_pubKey = lco_code.Base64Decode(ls_pubKey)
wf_replace(ls_pubKey,"~r","")
wf_replace(ls_pubKey,"~n","")
ls_privKey = mle_privkey.Text
wf_replace(ls_privKey,"~r","")
wf_replace(ls_privKey,"~n","")
lb_privKey = lco_code.Base64Decode(ls_privKey)

lb_Data = Blob(ls_Body, EncodingUTF8!)
Try
	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
	If Len(lb_return) > 0 Then
		mle_5.Text = lco_code.Base64Encode( lb_return )
	Else
		Messagebox ( "fail",  String ( lb_return ) )
	End If
Catch(Throwable ex)
	mle_5.Text = ex.GetMessage()
End Try

Try
	lb_return2 = lco_Crypt.AsymmetricDecrypt(RSA!, lb_return,lb_privKey)
	If Len(lb_return2) > 0 Then
		mle_2.Text = String(lb_return2,EncodingUTF8!) 
	Else
		Messagebox ( "fail",  String ( lb_return2 ) )
	End If
Catch(Throwable ex1)
	mle_2.Text = ex1.GetMessage()
End Try

end event

type st_4 from statictext within w_asymmetric
integer x = 27
integer y = 700
integer width = 343
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PrivKey"
boolean focusrectangle = false
end type

type mle_privkey from multilineedit within w_asymmetric
integer x = 411
integer y = 568
integer width = 3086
integer height = 328
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_pubkey from multilineedit within w_asymmetric
integer x = 411
integer y = 212
integer width = 3086
integer height = 328
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_asymmetric
integer x = 27
integer y = 1212
integer width = 357
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "Encode"
boolean focusrectangle = false
end type

type st_3 from statictext within w_asymmetric
integer x = 27
integer y = 344
integer width = 343
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PubKey"
boolean focusrectangle = false
end type

type mle_5 from multilineedit within w_asymmetric
integer x = 411
integer y = 1080
integer width = 3086
integer height = 328
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_asymmetric
integer x = 27
integer y = 76
integer width = 343
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Body"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_asymmetric
integer x = 411
integer y = 16
integer width = 1056
integer height = 180
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

