$PBExportHeader$w_jwt_rs.srw
forward
global type w_jwt_rs from window
end type
type cb_2 from commandbutton within w_jwt_rs
end type
type st_4 from statictext within w_jwt_rs
end type
type mle_privkey from multilineedit within w_jwt_rs
end type
type cb_1 from commandbutton within w_jwt_rs
end type
type mle_pubkey from multilineedit within w_jwt_rs
end type
type st_11 from statictext within w_jwt_rs
end type
type st_3 from statictext within w_jwt_rs
end type
type mle_5 from multilineedit within w_jwt_rs
end type
type cb_3 from commandbutton within w_jwt_rs
end type
type st_2 from statictext within w_jwt_rs
end type
type mle_2 from multilineedit within w_jwt_rs
end type
type st_1 from statictext within w_jwt_rs
end type
type mle_1 from multilineedit within w_jwt_rs
end type
end forward

global type w_jwt_rs from window
integer width = 3666
integer height = 1896
boolean titlebar = true
string title = "Google JWTs"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
st_4 st_4
mle_privkey mle_privkey
cb_1 cb_1
mle_pubkey mle_pubkey
st_11 st_11
st_3 st_3
mle_5 mle_5
cb_3 cb_3
st_2 st_2
mle_2 mle_2
st_1 st_1
mle_1 mle_1
end type
global w_jwt_rs w_jwt_rs

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

on w_jwt_rs.create
this.cb_2=create cb_2
this.st_4=create st_4
this.mle_privkey=create mle_privkey
this.cb_1=create cb_1
this.mle_pubkey=create mle_pubkey
this.st_11=create st_11
this.st_3=create st_3
this.mle_5=create mle_5
this.cb_3=create cb_3
this.st_2=create st_2
this.mle_2=create mle_2
this.st_1=create st_1
this.mle_1=create mle_1
this.Control[]={this.cb_2,&
this.st_4,&
this.mle_privkey,&
this.cb_1,&
this.mle_pubkey,&
this.st_11,&
this.st_3,&
this.mle_5,&
this.cb_3,&
this.st_2,&
this.mle_2,&
this.st_1,&
this.mle_1}
end on

on w_jwt_rs.destroy
destroy(this.cb_2)
destroy(this.st_4)
destroy(this.mle_privkey)
destroy(this.cb_1)
destroy(this.mle_pubkey)
destroy(this.st_11)
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
mle_1.Text = '{"alg":"RS256","typ":"JWT"}'

//{
//  "sub": "1234567890",
//  "name": "John Doe",
//  "admin": true,
//  "iat": 1516239022
//}
/////////////////{"sub":"1234567890","name":"John Doe","iat":1516239022}
mle_2.Text = '{"sub":"1234567890","name":"John Doe","admin":true,"iat":1516239022}'



mle_pubkey.Text = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEiz6UVmLdBRTQe28UCjWsSqVc" + &
"RKsfI+APwny3STCTM/v/IWzvNF2K4yxP47aX9LXsPFV3371TISpqRP2E6UaYy5c2" + &
"lj/FXmzNsCN6xHRwesqkvPnuh56Z1mWLX1y+2z0+AnKAUJ3DVElLm0DYhEDmMdUT" + &
"z8wTwCbZ+2aLezphPQIDAQAB"


mle_privkey.Text = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMSLPpRWYt0FFNB7" + &
"bxQKNaxKpVxEqx8j4A/CfLdJMJMz+/8hbO80XYrjLE/jtpf0tew8VXffvVMhKmpE" + &
"/YTpRpjLlzaWP8VebM2wI3rEdHB6yqS8+e6HnpnWZYtfXL7bPT4CcoBQncNUSUub" + &
"QNiEQOYx1RPPzBPAJtn7Zot7OmE9AgMBAAECgYAL/7g9VBzLA4FmzPJWFd16/D+m" + &
"J2cPCqCmNahphCVcB0NuKvs8i0TessnEwtEl68Gjf3d0Twt+5LpzLG0RzTALDmpo" + &
"5DIFS2a+9udlVxYgaUb9GML2AYiTg9BJmR1tYXPAHORkn2cv6kNQhaqCQynY+N2e" + &
"qkzdX3jaYaWZWvw1QQJBAPsyW2p22JtxJiHuVvKkK105E5v98zFtTj+Nn5nwSapT" + &
"Sq+F8MCfg70HO1bEjC7a65JO7Aqo+FDCJnMdx8jn2HECQQDITVq3Z1FhqSfdpxRu" + &
"vIfz9BQOXHwKdlS2yLr9WBRDVTcrekCeh5oJEic9MHtRncOt4fA8sHf/mU42tLSP" + &
"GFuNAkBbLFTn2IkYKkJn8GUYnqOqq2vFo6/gUccj5Bh4vDFQo/ioqpnOoFclhflw" + &
"rdgfrY/xQ7oCyH+QeFeSUs3Pyu7RAkEAhUPKDmoEIDjeGD+4fXCb93g1+9QWhxNx" + &
"i2cD2djHKoFAwoGFCrRnjI9yYeims4eGkGLZZld2jy0dd5JE60umZQJAdF9O7Tbe" + &
"hL18Eeq1EXdzNSmvkd0a7cFJVMTZZyZkCOVpXgcQjFAvt7lnk47umN1WDfJpdwtn" + &
"PI0ipSNM7+Kr7Q=="
end event

type cb_2 from commandbutton within w_jwt_rs
integer x = 782
integer y = 1288
integer width = 466
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT RS256 验证"
end type

event clicked;
string 			ls_header, ls_parm, ls_Return, ls_secret,ls_pubKey,ls_privKey,ls_sign
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return, lb_privKey,lb_pubKey, lb_data, lb_sign
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject
Long 	ll_Ret,li_return

ls_header  = lco_code.Base64Encode( Blob ( mle_1.Text, EncodingUTF8! ) )
ls_parm = lco_code.Base64Encode( Blob ( mle_2.Text, EncodingUTF8! ) )
wf_replace(ls_parm,"=")

ls_pubKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEiz6UVmLdBRTQe28UCjWsSqVc" + &
"RKsfI+APwny3STCTM/v/IWzvNF2K4yxP47aX9LXsPFV3371TISpqRP2E6UaYy5c2" + &
"lj/FXmzNsCN6xHRwesqkvPnuh56Z1mWLX1y+2z0+AnKAUJ3DVElLm0DYhEDmMdUT" + &
"z8wTwCbZ+2aLezphPQIDAQAB"
mle_pubkey.Text = ls_pubKey
lb_pubKey = lco_code.Base64Decode(ls_pubKey)

ls_privKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMSLPpRWYt0FFNB7" + &
"bxQKNaxKpVxEqx8j4A/CfLdJMJMz+/8hbO80XYrjLE/jtpf0tew8VXffvVMhKmpE" + &
"/YTpRpjLlzaWP8VebM2wI3rEdHB6yqS8+e6HnpnWZYtfXL7bPT4CcoBQncNUSUub" + &
"QNiEQOYx1RPPzBPAJtn7Zot7OmE9AgMBAAECgYAL/7g9VBzLA4FmzPJWFd16/D+m" + &
"J2cPCqCmNahphCVcB0NuKvs8i0TessnEwtEl68Gjf3d0Twt+5LpzLG0RzTALDmpo" + &
"5DIFS2a+9udlVxYgaUb9GML2AYiTg9BJmR1tYXPAHORkn2cv6kNQhaqCQynY+N2e" + &
"qkzdX3jaYaWZWvw1QQJBAPsyW2p22JtxJiHuVvKkK105E5v98zFtTj+Nn5nwSapT" + &
"Sq+F8MCfg70HO1bEjC7a65JO7Aqo+FDCJnMdx8jn2HECQQDITVq3Z1FhqSfdpxRu" + &
"vIfz9BQOXHwKdlS2yLr9WBRDVTcrekCeh5oJEic9MHtRncOt4fA8sHf/mU42tLSP" + &
"GFuNAkBbLFTn2IkYKkJn8GUYnqOqq2vFo6/gUccj5Bh4vDFQo/ioqpnOoFclhflw" + &
"rdgfrY/xQ7oCyH+QeFeSUs3Pyu7RAkEAhUPKDmoEIDjeGD+4fXCb93g1+9QWhxNx" + &
"i2cD2djHKoFAwoGFCrRnjI9yYeims4eGkGLZZld2jy0dd5JE60umZQJAdF9O7Tbe" + &
"hL18Eeq1EXdzNSmvkd0a7cFJVMTZZyZkCOVpXgcQjFAvt7lnk47umN1WDfJpdwtn" + &
"PI0ipSNM7+Kr7Q=="
mle_privkey.Text = ls_privkey
lb_privKey = lco_code.Base64Decode(ls_privKey)

//lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)

//ls_sign = "pW-RJOQ-CFON2ibY3Ol63VMubw_GPde24VdBGLj8cuGmhq7JjPlvzwJZuwqwWbz1y0Kqa4qrfylT1LF9WzNTCYDYMEiHa95lpzSfSHvZOkvXHiWD4eMNNmDAHCTka9JA4_MkafEuKIi97fIDjm53rD91Dw_9Vbr3TguQliNTq4A"
//wf_replace(ls_sign,"_","/")
//wf_replace(ls_sign,"-","+")
//ls_sign = ls_sign + "="
lb_data = Blob (  ls_header + "." +ls_parm,EncodingUTF8! )
//lb_sign = Blob (  ls_sign,EncodingUTF16LE! )
lb_return =  lco_Crypt.Sha(SHA256!,lb_data )
lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_return,lb_privKey)
li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_return,lb_pubKey,lb_sign)

mle_5.Text = string(li_return)


end event

type st_4 from statictext within w_jwt_rs
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

type mle_privkey from multilineedit within w_jwt_rs
integer x = 411
integer y = 568
integer width = 2894
integer height = 328
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_jwt_rs
integer x = 421
integer y = 1288
integer width = 343
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT RS256"
end type

event clicked;
string 			ls_header, ls_parm, ls_Return, ls_secret,ls_pubKey,ls_privKey
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return, lb_privKey,lb_pubKey, lb_data, lb_sign
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject
Long 	ll_Ret,li_return

ls_header  = lco_code.Base64Encode( Blob ( mle_1.Text, EncodingUTF8! ) )
ls_parm = lco_code.Base64Encode( Blob ( mle_2.Text, EncodingUTF8! ) )
wf_replace(ls_header,"=")
wf_replace(ls_parm,"=")

ls_pubKey = mle_pubkey.Text
lb_pubKey = lco_code.Base64Decode(ls_pubKey)
wf_replace(ls_pubKey,"~r","")
wf_replace(ls_pubKey,"~n","")
ls_privKey = mle_privkey.Text
wf_replace(ls_privKey,"~r","")
wf_replace(ls_privKey,"~n","")
lb_privKey = lco_code.Base64Decode(ls_privKey)


lb_data = Blob (  ls_header + "." +ls_parm, EncodingUTF8! )
lb_return =  lco_Crypt.Sha(SHA256!,lb_data )
lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_return,lb_privKey)
ls_return = lco_Code.Base64Encode( lb_sign )
wf_replace(ls_Return,"=","")
wf_replace(ls_Return,"/","_")
wf_replace(ls_Return,"+","-")
mle_5.Text = ls_header + "." +ls_parm + "." + ls_Return


end event

type mle_pubkey from multilineedit within w_jwt_rs
integer x = 411
integer y = 212
integer width = 2894
integer height = 328
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_jwt_rs
integer x = 27
integer y = 1060
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

type st_3 from statictext within w_jwt_rs
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

type mle_5 from multilineedit within w_jwt_rs
integer x = 411
integer y = 928
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
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_jwt_rs
integer x = 2697
integer y = 1508
integer width = 343
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test"
end type

event clicked;
string 			ls_header, ls_parm, ls_Return, ls_secret
CoderObject 	lco_code
CrypterObject 	lco_Crypt
Blob 	lb_return, lb_privKey,lb_pubKey, lb_data
lco_code = Create CoderObject
lco_Crypt = Create CrypterObject
Long 	ll_Ret

ls_header  = lco_code.Base64Encode( Blob ( mle_1.Text, EncodingUTF8! ) )
ls_parm = lco_code.Base64Encode( Blob ( mle_2.Text, EncodingUTF8! ) )
wf_replace(ls_parm,"=")
ls_secret = mle_pubkey.Text

ll_Ret = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)
If ll_Ret = 1 Then
	lb_data = Blob ( ls_header + "." + ls_parm,EncodingUTF8! )
	lb_data = Blob ( "56f4a56s4df6a",EncodingUTF8! )
	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
	//lb_return =  lco_Crypt.AsymmetricEncrypt(RSA!,lb_data, lb_pubKey )
	
	
	ls_return = lco_Code.Base64Encode(lb_return )
	wf_replace(ls_Return,"=")
Else
	Return
End If
mle_5.Text = "Bearer " + ls_header + "." + ls_parm + "." + ls_Return


end event

type st_2 from statictext within w_jwt_rs
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

type mle_2 from multilineedit within w_jwt_rs
integer x = 1902
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

type st_1 from statictext within w_jwt_rs
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

type mle_1 from multilineedit within w_jwt_rs
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

