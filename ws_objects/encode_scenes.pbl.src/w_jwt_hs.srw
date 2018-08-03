$PBExportHeader$w_jwt_hs.srw
forward
global type w_jwt_hs from window
end type
type sle_1 from singlelineedit within w_jwt_hs
end type
type cb_4 from commandbutton within w_jwt_hs
end type
type cb_2 from commandbutton within w_jwt_hs
end type
type cb_1 from commandbutton within w_jwt_hs
end type
type st_11 from statictext within w_jwt_hs
end type
type sle_2 from singlelineedit within w_jwt_hs
end type
type st_3 from statictext within w_jwt_hs
end type
type mle_5 from multilineedit within w_jwt_hs
end type
type cb_3 from commandbutton within w_jwt_hs
end type
type st_2 from statictext within w_jwt_hs
end type
type mle_2 from multilineedit within w_jwt_hs
end type
type st_1 from statictext within w_jwt_hs
end type
type mle_1 from multilineedit within w_jwt_hs
end type
end forward

global type w_jwt_hs from window
integer width = 3666
integer height = 1896
boolean titlebar = true
string title = "Google JWT"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_1 sle_1
cb_4 cb_4
cb_2 cb_2
cb_1 cb_1
st_11 st_11
sle_2 sle_2
st_3 st_3
mle_5 mle_5
cb_3 cb_3
st_2 st_2
mle_2 mle_2
st_1 st_1
mle_1 mle_1
end type
global w_jwt_hs w_jwt_hs

forward prototypes
public subroutine wf_replace (ref string as_string, string as_str, string as_rep)
public function string wf_gettimestamp ()
end prototypes

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

public function string wf_gettimestamp ();Long 		ll_days, ll_Seconds, ll_microsecond
Double 	ll_Stamp
Date 		ld_Today
Time 		lt_Now

ld_Today = Today()
ll_days = DaysAfter ( Date(1970,1,1), ld_Today )

lt_Now = Now()
ll_Seconds = SecondsAfter ( Time ( 8,0,0 ), lt_Now )

ll_Stamp = ll_days * 24 * 60 * 60 + ll_Seconds


Return String ( ll_Stamp )
end function

on w_jwt_hs.create
this.sle_1=create sle_1
this.cb_4=create cb_4
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_11=create st_11
this.sle_2=create sle_2
this.st_3=create st_3
this.mle_5=create mle_5
this.cb_3=create cb_3
this.st_2=create st_2
this.mle_2=create mle_2
this.st_1=create st_1
this.mle_1=create mle_1
this.Control[]={this.sle_1,&
this.cb_4,&
this.cb_2,&
this.cb_1,&
this.st_11,&
this.sle_2,&
this.st_3,&
this.mle_5,&
this.cb_3,&
this.st_2,&
this.mle_2,&
this.st_1,&
this.mle_1}
end on

on w_jwt_hs.destroy
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_11)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.mle_5)
destroy(this.cb_3)
destroy(this.st_2)
destroy(this.mle_2)
destroy(this.st_1)
destroy(this.mle_1)
end on

event open;//{
//  'typ': 'JWT',
//  'alg': 'HS256'
//}
//{
//  "alg": "HS256",
//  "typ": "JWT"
//}
mle_1.Text = '{"alg":"HS256","typ":"JWT"}'

//{
//  "sub": "1234567890",
//  "name": "John Doe",
//  "iat": 1516239022
//}
/////////////////{"sub":"1234567890","name":"John Doe","iat":1516239022}
//mle_2.Text = '{"sub":"1234567890","name":"John Doe","iat":1516239022}'
//{"nameid":"vulcan.lee@vulcan.net","http://schemas.microsoft.com/ws/2008/06/identity/claims/role": "Admini","exp": 1521383649,"iss":"CoreJWT.vulcan.net","aud": "Xamarin RESTful API"}
mle_2.Text = '{"nameid":"vulcan.lee@vulcan.net","roles": "Admini","exp":'+wf_gettimestamp()+',"iss":"CoreJWT.vulcan.net","aud": "Xamarin RESTful API"}'

//HMACSHA256(
//  base64UrlEncode(header) + "." +
//  base64UrlEncode(payload),
//  
//secret
//
//) 
//mle_4.Text = '{"alg":"HS256","typ":"JWT"}' + '.' +'{"sub":"1234567890","name":"John Doe","iat":1516239022}'
end event

type sle_1 from singlelineedit within w_jwt_hs
integer x = 1271
integer y = 1124
integer width = 841
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_jwt_hs
integer x = 841
integer y = 1128
integer width = 343
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Timestamp"
end type

event clicked;
sle_1.Text =  wf_gettimestamp()
end event

type cb_2 from commandbutton within w_jwt_hs
integer x = 855
integer y = 868
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT HS512"
end type

event clicked;
string 			ls_header, ls_parm, ls_Return, ls_secret
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject

ls_header  = lco_code.Base64Encode( Blob ( mle_1.Text, EncodingUTF8! ) )
ls_parm = lco_code.Base64Encode( Blob ( mle_2.Text, EncodingUTF8! ) )
wf_replace(ls_parm,"=","")
ls_secret = sle_2.Text


lb_return =  lco_Crypt.HMAC(HMACSHA512!,Blob ( ls_header + "." + ls_parm,EncodingUTF8! ), Blob ( ls_secret, EncodingUTF8! ) )
ls_return = lco_Code.Base64Encode(lb_return )
wf_replace(ls_Return,"=","")
wf_replace(ls_Return,"/","_")
wf_replace(ls_Return,"+","-")
mle_5.Text = "Bearer " + ls_header + "." + ls_parm + "." + ls_Return


end event

type cb_1 from commandbutton within w_jwt_hs
integer x = 439
integer y = 868
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT HS384"
end type

event clicked;
string 			ls_header, ls_parm, ls_Return, ls_secret
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject

ls_header  = lco_code.Base64Encode( Blob ( mle_1.Text, EncodingUTF8! ) )
ls_parm = lco_code.Base64Encode( Blob ( mle_2.Text, EncodingUTF8! ) )
wf_replace(ls_parm,"=","")
ls_secret = sle_2.Text


lb_return =  lco_Crypt.HMAC(HMACSHA384!,Blob ( ls_header + "." + ls_parm,EncodingUTF8! ), Blob ( ls_secret, EncodingUTF8! ) )
ls_return = lco_Code.Base64Encode(lb_return )
wf_replace(ls_Return,"=","")
wf_replace(ls_Return,"/","_")
wf_replace(ls_Return,"+","-")
mle_5.Text = "Bearer " + ls_header + "." + ls_parm + "." + ls_Return


end event

type st_11 from statictext within w_jwt_hs
integer x = 27
integer y = 644
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
string text = "Authorization"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_jwt_hs
integer x = 411
integer y = 400
integer width = 1399
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "4{!-!Rjx2.W]fX~~jN:<Ae$D~'dLlnG%%xo`W2D5TatBx&MJjZ>(+ujy*G*Y<XH.X"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_jwt_hs
integer x = 27
integer y = 416
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
string text = "secret"
boolean focusrectangle = false
end type

type mle_5 from multilineedit within w_jwt_hs
integer x = 411
integer y = 516
integer width = 2894
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

type cb_3 from commandbutton within w_jwt_hs
integer x = 37
integer y = 864
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT HS256"
end type

event clicked;
string 			ls_header, ls_parm, ls_Return, ls_secret, ls_header0, ls_parm0
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject

ls_header0 = mle_1.Text
//wf_replace(ls_header0," ","")
//wf_replace(ls_header0,"~r","")
//wf_replace(ls_header0,"~n","")
ls_parm0 = mle_2.Text
//wf_replace(ls_parm0," ","")
//wf_replace(ls_parm0,"~r","")
//wf_replace(ls_parm0,"~n","")

ls_header  = lco_code.Base64Encode( Blob ( ls_header0, EncodingUTF8! ) )
ls_parm = lco_code.Base64Encode( Blob ( ls_parm0, EncodingUTF8! ) )
wf_replace(ls_parm,"=","")
ls_secret = sle_2.Text


lb_return =  lco_Crypt.HMAC(HMACSHA256!,Blob ( ls_header + "." + ls_parm,EncodingUTF8! ), Blob ( ls_secret, EncodingUTF8! ) )
ls_return = lco_Code.Base64Encode(lb_return )
wf_replace(ls_Return,"=","")
wf_replace(ls_Return,"/","_")
wf_replace(ls_Return,"+","-")
mle_5.Text = "Bearer " + ls_header + "." + ls_parm + "." + ls_Return


end event

type st_2 from statictext within w_jwt_hs
integer x = 1518
integer y = 72
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
string text = "Payload"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within w_jwt_hs
integer x = 1902
integer y = 16
integer width = 1513
integer height = 476
integer taborder = 10
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

type st_1 from statictext within w_jwt_hs
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
string text = "Header"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_jwt_hs
integer x = 411
integer y = 24
integer width = 1056
integer height = 320
integer taborder = 10
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

