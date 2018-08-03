$PBExportHeader$w_appeon.srw
forward
global type w_appeon from window
end type
type tab_1 from tab within w_appeon
end type
type tabpage_1 from userobject within tab_1
end type
type st_19 from statictext within tabpage_1
end type
type mle_2 from multilineedit within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type st_10 from statictext within tabpage_1
end type
type st_9 from statictext within tabpage_1
end type
type mle_1 from multilineedit within tabpage_1
end type
type sle_scope from singlelineedit within tabpage_1
end type
type sle_password from singlelineedit within tabpage_1
end type
type sle_secret from singlelineedit within tabpage_1
end type
type sle_username from singlelineedit within tabpage_1
end type
type sle_id from singlelineedit within tabpage_1
end type
type st_8 from statictext within tabpage_1
end type
type st_7 from statictext within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type sle_method from singlelineedit within tabpage_1
end type
type sle_url from singlelineedit within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_19 st_19
mle_2 mle_2
cb_2 cb_2
cb_1 cb_1
st_10 st_10
st_9 st_9
mle_1 mle_1
sle_scope sle_scope
sle_password sle_password
sle_secret sle_secret
sle_username sle_username
sle_id sle_id
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
ddlb_1 ddlb_1
st_3 st_3
sle_method sle_method
sle_url sle_url
st_2 st_2
st_1 st_1
end type
type tabpage_2 from userobject within tab_1
end type
type st_20 from statictext within tabpage_2
end type
type mle_4 from multilineedit within tabpage_2
end type
type mle_3 from multilineedit within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type st_18 from statictext within tabpage_2
end type
type st_17 from statictext within tabpage_2
end type
type sle_scope2 from singlelineedit within tabpage_2
end type
type st_16 from statictext within tabpage_2
end type
type sle_secret2 from singlelineedit within tabpage_2
end type
type st_15 from statictext within tabpage_2
end type
type sle_id2 from singlelineedit within tabpage_2
end type
type st_14 from statictext within tabpage_2
end type
type ddlb_2 from dropdownlistbox within tabpage_2
end type
type st_13 from statictext within tabpage_2
end type
type sle_method2 from singlelineedit within tabpage_2
end type
type st_12 from statictext within tabpage_2
end type
type sle_url2 from singlelineedit within tabpage_2
end type
type st_11 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_20 st_20
mle_4 mle_4
mle_3 mle_3
cb_4 cb_4
cb_3 cb_3
st_18 st_18
st_17 st_17
sle_scope2 sle_scope2
st_16 st_16
sle_secret2 sle_secret2
st_15 st_15
sle_id2 sle_id2
st_14 st_14
ddlb_2 ddlb_2
st_13 st_13
sle_method2 sle_method2
st_12 st_12
sle_url2 sle_url2
st_11 st_11
end type
type tab_1 from tab within w_appeon
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_appeon from window
integer width = 3479
integer height = 2132
boolean titlebar = true
string title = "Appeon OAuth2.0"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_appeon w_appeon

type variables

String 		is_AccessToken, is_AccessToken2
end variables

on w_appeon.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_appeon.destroy
destroy(this.tab_1)
end on

event open;//itr_Request.SetHeader("Accept","application/json")
//itr_Request.SetHeader("Expect","100-continue")
end event

type tab_1 from tab within w_appeon
integer x = 46
integer y = 52
integer width = 3360
integer height = 1948
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 124
integer width = 3323
integer height = 1808
long backcolor = 67108864
string text = "password"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_19 st_19
mle_2 mle_2
cb_2 cb_2
cb_1 cb_1
st_10 st_10
st_9 st_9
mle_1 mle_1
sle_scope sle_scope
sle_password sle_password
sle_secret sle_secret
sle_username sle_username
sle_id sle_id
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
ddlb_1 ddlb_1
st_3 st_3
sle_method sle_method
sle_url sle_url
st_2 st_2
st_1 st_1
end type

on tabpage_1.create
this.st_19=create st_19
this.mle_2=create mle_2
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_10=create st_10
this.st_9=create st_9
this.mle_1=create mle_1
this.sle_scope=create sle_scope
this.sle_password=create sle_password
this.sle_secret=create sle_secret
this.sle_username=create sle_username
this.sle_id=create sle_id
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.ddlb_1=create ddlb_1
this.st_3=create st_3
this.sle_method=create sle_method
this.sle_url=create sle_url
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.st_19,&
this.mle_2,&
this.cb_2,&
this.cb_1,&
this.st_10,&
this.st_9,&
this.mle_1,&
this.sle_scope,&
this.sle_password,&
this.sle_secret,&
this.sle_username,&
this.sle_id,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.ddlb_1,&
this.st_3,&
this.sle_method,&
this.sle_url,&
this.st_2,&
this.st_1}
end on

on tabpage_1.destroy
destroy(this.st_19)
destroy(this.mle_2)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.mle_1)
destroy(this.sle_scope)
destroy(this.sle_password)
destroy(this.sle_secret)
destroy(this.sle_username)
destroy(this.sle_id)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.ddlb_1)
destroy(this.st_3)
destroy(this.sle_method)
destroy(this.sle_url)
destroy(this.st_2)
destroy(this.st_1)
end on

type st_19 from statictext within tabpage_1
integer x = 727
integer y = 116
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "grant_type=password"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within tabpage_1
integer x = 27
integer y = 888
integer width = 3282
integer height = 916
integer taborder = 80
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
boolean hideselection = false
end type

type cb_2 from commandbutton within tabpage_1
integer x = 2903
integer y = 372
integer width = 343
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Resource"
end type

event clicked;HttpClient 	lhc_Client
Integer 		li_rtn
String 		ls_Body, ls_Url

If Len ( is_AccessToken ) < 1 Then
	MessageBox ( "提示", "AccessToken没有获取,请先获取Token!" )
	Return
End If

lhc_Client = Create HttpClient

lhc_Client.SetRequestHeader( "Authorization", is_AccessToken )
ls_Url = "https://sc_ident.appeon.com/order/getall"

li_rtn = lhc_Client.SendRequest( "GET", ls_Url )
st_9.Text = "StatusCode:" + String ( lhc_Client.GetResponseStatusCode() )
st_10.Text = "StatusText:" + String ( lhc_Client.GetResponseStatusText() )
If li_rtn = 1 And lhc_Client.GetResponseStatusCode() = 200 Then
	li_rtn = lhc_Client.GetResponseBody(ls_Body)
	If li_rtn = 1 Then
		mle_2.Text = ls_Body
	Else
		mle_2.Text = "GetBody Return :" + String ( li_rtn )
	End If
Else
	mle_2.Text = "RequestResource Return:" + String ( li_Rtn ) + "~r~n" + lhc_Client.GetResponseHeaders()
End If


end event

type cb_1 from commandbutton within tabpage_1
integer x = 2537
integer y = 372
integer width = 343
integer height = 100
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Token"
end type

event clicked;HttpClient 		lhc_Client
CoderObject 	lco_Code
Jsonpackage 		ljpg_json
String 			ls_ClientID, ls_Sercet, ls_Auth, ls_Url, ls_PostData, ls_UserName, ls_Password, ls_scope, ls_Body, ls_Error
String 			ls_Token, ls_RefreshToken, ls_TokenType
Blob 				lblb_data
Long 				ll_return

lhc_Client = Create HttpClient
lco_Code = Create CoderObject
ljpg_json = Create Jsonpackage

ls_Url = sle_url.Text

//验证信息加密
ls_ClientID = sle_id.Text
ls_Sercet = sle_secret.Text
lblb_data = Blob ( ls_ClientID + ":" + ls_Sercet, EncodingUTF8! )
ls_Auth = lco_Code.Base64Encode( lblb_data )

//Authorization: Basic MzY3YzQxNjNkZGMxNDI3ZDk2NjU1Y2QyMjBjNjcxNGI6NDA3OWY4NzQ5OTM5NDQ2Y2JjODFmZDBjMjc3MDkxODc=
lhc_Client.SetRequestHeader( "Authorization", "Basic " + ls_Auth )
lhc_Client.SetRequestHeader( "Content-Type", "application/x-www-form-urlencoded" )

ls_UserName = sle_username.Text
ls_Password = sle_password.Text
//注意字符的Url编码
ls_scope = sle_scope.Text

//grant_type=password&username=appeon&password=appeon&scope=testcode upcode profile offline_access
ls_PostData = "grant_type=password&username="+ls_UserName+"&password="+ls_Password+"&scope=" + lco_Code.UrlEncode( Blob(ls_scope,EncodingUTF8!))

ll_return = lhc_Client.SendRequest( "POST", ls_Url, ls_PostData )
st_9.Text = "StatusCode:" + String ( lhc_Client.GetResponseStatusCode() )
st_10.Text = "StatusText:" + String ( lhc_Client.GetResponseStatusText() )
If ll_return = 1 And lhc_Client.GetResponsestatusCode() = 200 Then
	lhc_Client.GetResponseBody ( ls_body )
	mle_1.Text = ls_Body + "~r~n" +  lhc_Client.GetResponseHeaders()
	//{"access_token":"0374672c0f9a83d7e808725bd8ea748a250f2b8e151b9d93f2afa7805ec2dd52","expires_in":3600,"token_type":"Bearer","refresh_token":"8a9767b5f7e59245339cb965ce4bfdf589e155535c042a8b2a90d89093eefb7e"}
	ls_Error = ljpg_json.loadString ( ls_body )
	If ls_Error = "" then
		ls_TokenType = ljpg_json.GetValue("token_type")
		ls_Token = ljpg_json.GetValue("access_token")
		is_AccessToken = ls_TokenType + " " + ls_Token
		ls_RefreshToken = ljpg_json.GetValue("refresh_token")
	Else
		mle_1.Text = ls_Error
	End If
Else
	mle_1.Text = "AccessToken Return :" + String ( ll_return ) + "~r~n" + lhc_Client.GetResponseHeaders()
End If


If IsValid ( ljpg_json ) Then DesTroy ( ljpg_json )
If IsValid ( lhc_Client ) Then DesTroy ( lhc_Client )
If IsValid ( lco_Code ) Then DesTroy ( lco_Code )


end event

type st_10 from statictext within tabpage_1
integer x = 1111
integer y = 404
integer width = 951
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "StatusText:"
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_1
integer x = 37
integer y = 404
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "StatusCode:"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within tabpage_1
integer x = 27
integer y = 476
integer width = 3282
integer height = 400
integer taborder = 70
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
boolean hideselection = false
end type

type sle_scope from singlelineedit within tabpage_1
integer x = 2683
integer y = 288
integer width = 558
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "testcode upcode profile offline_access"
borderstyle borderstyle = stylelowered!
end type

type sle_password from singlelineedit within tabpage_1
integer x = 1623
integer y = 288
integer width = 841
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "appeon"
borderstyle borderstyle = stylelowered!
end type

type sle_secret from singlelineedit within tabpage_1
integer x = 1623
integer y = 200
integer width = 1618
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "4079f8749939446cbc81fd0c27709187"
borderstyle borderstyle = stylelowered!
end type

type sle_username from singlelineedit within tabpage_1
integer x = 288
integer y = 288
integer width = 946
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "appeon"
borderstyle borderstyle = stylelowered!
end type

type sle_id from singlelineedit within tabpage_1
integer x = 288
integer y = 200
integer width = 946
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "367c4163ddc1427d96655cd220c6714b"
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within tabpage_1
integer x = 2446
integer y = 300
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "scope:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within tabpage_1
integer x = 1353
integer y = 300
integer width = 261
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_1
integer y = 300
integer width = 270
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "username:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_1
integer x = 1266
integer y = 212
integer width = 347
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "client_secret:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_1
integer y = 212
integer width = 233
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "client_id:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 2830
integer y = 108
integer width = 411
integer height = 340
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
boolean sorted = false
boolean vscrollbar = true
string item[] = {"default","TLS1.0","TLS1.1","TLS1.2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;This.selectitem( 1 )
end event

event selectionchanged;st_9.Text = "StatusCode:"
st_10.Text = "StatusText:"
mle_1.Text = ""
mle_2.Text = ""
end event

type st_3 from statictext within tabpage_1
integer x = 2382
integer y = 124
integer width = 407
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SecureProtocol:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_method from singlelineedit within tabpage_1
integer x = 288
integer y = 112
integer width = 384
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "POST"
borderstyle borderstyle = stylelowered!
end type

type sle_url from singlelineedit within tabpage_1
integer x = 288
integer y = 24
integer width = 2953
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://authserver.appeon.com/connect/token"
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within tabpage_1
integer x = 5
integer y = 124
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Method:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 101
integer y = 36
integer width = 133
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url:"
alignment alignment = right!
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 124
integer width = 3323
integer height = 1808
long backcolor = 67108864
string text = "client_credentials"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_20 st_20
mle_4 mle_4
mle_3 mle_3
cb_4 cb_4
cb_3 cb_3
st_18 st_18
st_17 st_17
sle_scope2 sle_scope2
st_16 st_16
sle_secret2 sle_secret2
st_15 st_15
sle_id2 sle_id2
st_14 st_14
ddlb_2 ddlb_2
st_13 st_13
sle_method2 sle_method2
st_12 st_12
sle_url2 sle_url2
st_11 st_11
end type

on tabpage_2.create
this.st_20=create st_20
this.mle_4=create mle_4
this.mle_3=create mle_3
this.cb_4=create cb_4
this.cb_3=create cb_3
this.st_18=create st_18
this.st_17=create st_17
this.sle_scope2=create sle_scope2
this.st_16=create st_16
this.sle_secret2=create sle_secret2
this.st_15=create st_15
this.sle_id2=create sle_id2
this.st_14=create st_14
this.ddlb_2=create ddlb_2
this.st_13=create st_13
this.sle_method2=create sle_method2
this.st_12=create st_12
this.sle_url2=create sle_url2
this.st_11=create st_11
this.Control[]={this.st_20,&
this.mle_4,&
this.mle_3,&
this.cb_4,&
this.cb_3,&
this.st_18,&
this.st_17,&
this.sle_scope2,&
this.st_16,&
this.sle_secret2,&
this.st_15,&
this.sle_id2,&
this.st_14,&
this.ddlb_2,&
this.st_13,&
this.sle_method2,&
this.st_12,&
this.sle_url2,&
this.st_11}
end on

on tabpage_2.destroy
destroy(this.st_20)
destroy(this.mle_4)
destroy(this.mle_3)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.sle_scope2)
destroy(this.st_16)
destroy(this.sle_secret2)
destroy(this.st_15)
destroy(this.sle_id2)
destroy(this.st_14)
destroy(this.ddlb_2)
destroy(this.st_13)
destroy(this.sle_method2)
destroy(this.st_12)
destroy(this.sle_url2)
destroy(this.st_11)
end on

type st_20 from statictext within tabpage_2
integer x = 745
integer y = 116
integer width = 759
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "grant_type=client_credentials"
boolean focusrectangle = false
end type

type mle_4 from multilineedit within tabpage_2
integer x = 27
integer y = 888
integer width = 3282
integer height = 916
integer taborder = 90
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
boolean hideselection = false
end type

type mle_3 from multilineedit within tabpage_2
integer x = 27
integer y = 476
integer width = 3282
integer height = 400
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type cb_4 from commandbutton within tabpage_2
integer x = 2903
integer y = 372
integer width = 343
integer height = 100
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.Resource"
end type

event clicked;OAuthRequest 	loa_Request
ResourceResponse 	lrr_Resopnse
OAuthClient 		loa_Client
Integer 		li_rtn
String 		ls_Body

If Len ( is_AccessToken2 ) < 1 Then
	MessageBox ( "提示", "AccessToken没有获取,请先获取Token!" )
	Return
End If
loa_Client = Create OauthClient
li_rtn = loa_Request.SetAccessToken (is_AccessToken2)

loa_Request.Method = "GET"
loa_Request.Url = "https://sc_svc.appeon.com/order/getall/"

li_rtn = loa_Client.requestresource( loa_Request, lrr_Resopnse )
If li_rtn = 1 Then
	st_17.Text = "StatusCode:" + String ( lrr_Resopnse.GetStatusCode() )
	st_18.Text = "StatusText:" + String ( lrr_Resopnse.GetStatusText() )
	li_rtn = lrr_Resopnse.GetBody(ls_Body)
	If li_rtn = 1 Then
		mle_4.Text = ls_Body
	Else
		mle_4.Text = "GetBody Return :" + String ( li_rtn )
	End If
Else
	mle_4.Text = "RequestResource Return:" + String ( li_Rtn )
End If
If IsValid ( loa_Client ) Then DesTroy ( loa_Client )
end event

type cb_3 from commandbutton within tabpage_2
integer x = 2537
integer y = 372
integer width = 343
integer height = 100
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.Token"
end type

event clicked;//获取Token
String 	ls_Url, ls_Method, ls_SecurePort, ls_Password, ls_UserName, ls_id, ls_secret, ls_Scope
String 	ls_Body, ls_type, ls_description, ls_uri, ls_state
Integer 	li_securePort,li_rtn
OAuthClient 		loa_Client
TokenRequest 	ltr_Request
TokenResponse 	ltr_Response

loa_Client = Create OAuthClient

//url
ls_Url = sle_url2.Text
If IsNull ( ls_Url ) Or Trim ( ls_Url ) = '' Then
	MessageBox ( "提示", "url is null!" )
	Return
End If
ltr_Request.tokenlocation = ls_Url
//Method
ls_Method = sle_method2.Text
If IsNull ( ls_Method ) Or Trim ( ls_Method ) = '' Then
	MessageBox ( "提示", "Method is null!" )
	Return
End If
ltr_Request.Method = ls_Method
//SecurePortocol
ls_SecurePort = ddlb_2.Text
If IsNull ( ls_SecurePort ) Or Trim ( ls_SecurePort ) = '' Then
	MessageBox ( "提示", "SecurePortocol is null!" )
	Return
End If
Choose case ls_SecurePort 
	Case "default"
		li_SecurePort = 0
	Case "TLS1.0"
		li_SecurePort = 1
	Case "TLS1.1"
		li_SecurePort = 2
	Case "TLS1.2"
		li_SecurePort = 3
	Case Else
		li_SecurePort = 0
End Choose
ltr_Request.secureprotocol = li_SecurePort
//client_id
ls_id = sle_id2.Text
If IsNull ( ls_id ) Or Trim ( ls_id ) = '' Then
	MessageBox ( "提示", "client_id is null!" )
	Return
End If
ltr_Request.clientid = ls_id
//client_secret
ls_secret = sle_secret2.Text
If IsNull ( ls_secret ) Or Trim ( ls_secret ) = '' Then
	MessageBox ( "提示", "client_secret is null!" )
	Return
End If
ltr_Request.clientsecret = ls_secret

//scope
ls_Scope = sle_Scope2.Text
If Len ( ls_Scope ) > 0 Then
	ltr_Request.scope = ls_Scope
End If
//granttype
ltr_Request.granttype = "client_credentials"

li_rtn = loa_Client.AccessToken( ltr_Request, ltr_Response )
If li_rtn = 1 Then
	st_17.Text = "StatusCode:" + String ( ltr_Response.GetStatusCode() )
	st_18.Text = "StatusText:" + String ( ltr_Response.GetStatusText() )
	li_rtn = ltr_Response.GetBody(ls_Body)
	If li_rtn = 1 Then
		mle_3.Text = ls_Body + "~r~n" +  ltr_Response.GetHeaders()
		is_AccessToken2 = ltr_Response.GetAccessToken ( )
	Else
		mle_3.Text = "GetBody Return :" + String ( li_rtn )
	End If
Else
	mle_3.Text = "AccessToken Return :" + String ( li_rtn )
End If

li_rtn = ltr_Response.GetTokenError(ls_type, ls_description, ls_uri, ls_state)
mle_3.Text = mle_3.Text + "~r~n~r~nTokenErro:"
mle_3.Text = mle_3.Text + "~r~nType:" + ls_type
mle_3.Text = mle_3.Text + "~r~nDescription:" + ls_description
mle_3.Text = mle_3.Text + "~r~nUri:" + ls_uri
mle_3.Text = mle_3.Text + "~r~nState:" + ls_state

If IsValid ( loa_Client ) Then DesTroy ( loa_Client )


end event

type st_18 from statictext within tabpage_2
integer x = 1111
integer y = 404
integer width = 951
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "StatusText:"
boolean focusrectangle = false
end type

type st_17 from statictext within tabpage_2
integer x = 37
integer y = 404
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "StatusCode:"
boolean focusrectangle = false
end type

type sle_scope2 from singlelineedit within tabpage_2
integer x = 2683
integer y = 288
integer width = 558
integer height = 80
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "dscode dsperf"
borderstyle borderstyle = stylelowered!
end type

type st_16 from statictext within tabpage_2
integer x = 2446
integer y = 300
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "scope:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_secret2 from singlelineedit within tabpage_2
integer x = 1623
integer y = 200
integer width = 1618
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "4079f8749939446cbc81fd0c27709187"
borderstyle borderstyle = stylelowered!
end type

type st_15 from statictext within tabpage_2
integer x = 1266
integer y = 212
integer width = 347
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "client_secret:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_id2 from singlelineedit within tabpage_2
integer x = 288
integer y = 200
integer width = 946
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "367c4163ddc1427d96655cd220c6714b"
borderstyle borderstyle = stylelowered!
end type

type st_14 from statictext within tabpage_2
integer y = 212
integer width = 233
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "client_id:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_2 from dropdownlistbox within tabpage_2
integer x = 2830
integer y = 108
integer width = 411
integer height = 340
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"default","TLS1.0","TLS1.1","TLS1.2"}
borderstyle borderstyle = stylelowered!
end type

event constructor;This.selectitem( 1 )
end event

event selectionchanged;st_17.Text = "StatusCode:"
st_18.Text = "StatusText:"
mle_3.Text = ""
mle_4.Text = ""
end event

type st_13 from statictext within tabpage_2
integer x = 2382
integer y = 124
integer width = 407
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SecureProtocol:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_method2 from singlelineedit within tabpage_2
integer x = 288
integer y = 112
integer width = 384
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "POST"
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within tabpage_2
integer x = 5
integer y = 124
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Method:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_url2 from singlelineedit within tabpage_2
integer x = 288
integer y = 24
integer width = 2953
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://authserver.appeon.com/connect/token"
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within tabpage_2
integer x = 101
integer y = 36
integer width = 133
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url:"
alignment alignment = right!
boolean focusrectangle = false
end type

