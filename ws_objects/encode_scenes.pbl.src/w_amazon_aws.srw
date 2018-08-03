$PBExportHeader$w_amazon_aws.srw
forward
global type w_amazon_aws from window
end type
type sle_sign from singlelineedit within w_amazon_aws
end type
type st_11 from statictext within w_amazon_aws
end type
type st_10 from statictext within w_amazon_aws
end type
type st_9 from statictext within w_amazon_aws
end type
type mle_authorization from multilineedit within w_amazon_aws
end type
type cb_3 from commandbutton within w_amazon_aws
end type
type mle_sign2 from multilineedit within w_amazon_aws
end type
type cb_2 from commandbutton within w_amazon_aws
end type
type sle_method from singlelineedit within w_amazon_aws
end type
type mle_sign1 from multilineedit within w_amazon_aws
end type
type cb_1 from commandbutton within w_amazon_aws
end type
type sle_request from singlelineedit within w_amazon_aws
end type
type sle_service from singlelineedit within w_amazon_aws
end type
type sle_region from singlelineedit within w_amazon_aws
end type
type sle_date from singlelineedit within w_amazon_aws
end type
type sle_datetime from singlelineedit within w_amazon_aws
end type
type sle_password from singlelineedit within w_amazon_aws
end type
type sle_username from singlelineedit within w_amazon_aws
end type
type st_8 from statictext within w_amazon_aws
end type
type st_7 from statictext within w_amazon_aws
end type
type st_6 from statictext within w_amazon_aws
end type
type st_5 from statictext within w_amazon_aws
end type
type st_4 from statictext within w_amazon_aws
end type
type st_3 from statictext within w_amazon_aws
end type
type st_2 from statictext within w_amazon_aws
end type
type sle_url from singlelineedit within w_amazon_aws
end type
type st_1 from statictext within w_amazon_aws
end type
end forward

global type w_amazon_aws from window
integer width = 3666
integer height = 1896
boolean titlebar = true
string title = "Amazon AWS"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_sign sle_sign
st_11 st_11
st_10 st_10
st_9 st_9
mle_authorization mle_authorization
cb_3 cb_3
mle_sign2 mle_sign2
cb_2 cb_2
sle_method sle_method
mle_sign1 mle_sign1
cb_1 cb_1
sle_request sle_request
sle_service sle_service
sle_region sle_region
sle_date sle_date
sle_datetime sle_datetime
sle_password sle_password
sle_username sle_username
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
sle_url sle_url
st_1 st_1
end type
global w_amazon_aws w_amazon_aws

forward prototypes
public subroutine wf_replace (ref string as_string, string as_str)
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

on w_amazon_aws.create
this.sle_sign=create sle_sign
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.mle_authorization=create mle_authorization
this.cb_3=create cb_3
this.mle_sign2=create mle_sign2
this.cb_2=create cb_2
this.sle_method=create sle_method
this.mle_sign1=create mle_sign1
this.cb_1=create cb_1
this.sle_request=create sle_request
this.sle_service=create sle_service
this.sle_region=create sle_region
this.sle_date=create sle_date
this.sle_datetime=create sle_datetime
this.sle_password=create sle_password
this.sle_username=create sle_username
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.sle_url=create sle_url
this.st_1=create st_1
this.Control[]={this.sle_sign,&
this.st_11,&
this.st_10,&
this.st_9,&
this.mle_authorization,&
this.cb_3,&
this.mle_sign2,&
this.cb_2,&
this.sle_method,&
this.mle_sign1,&
this.cb_1,&
this.sle_request,&
this.sle_service,&
this.sle_region,&
this.sle_date,&
this.sle_datetime,&
this.sle_password,&
this.sle_username,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.sle_url,&
this.st_1}
end on

on w_amazon_aws.destroy
destroy(this.sle_sign)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.mle_authorization)
destroy(this.cb_3)
destroy(this.mle_sign2)
destroy(this.cb_2)
destroy(this.sle_method)
destroy(this.mle_sign1)
destroy(this.cb_1)
destroy(this.sle_request)
destroy(this.sle_service)
destroy(this.sle_region)
destroy(this.sle_date)
destroy(this.sle_datetime)
destroy(this.sle_password)
destroy(this.sle_username)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_url)
destroy(this.st_1)
end on

type sle_sign from singlelineedit within w_amazon_aws
integer x = 553
integer y = 1332
integer width = 2725
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_11 from statictext within w_amazon_aws
integer x = 46
integer y = 1528
integer width = 421
integer height = 56
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

type st_10 from statictext within w_amazon_aws
integer x = 46
integer y = 1344
integer width = 421
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Signature"
boolean focusrectangle = false
end type

type st_9 from statictext within w_amazon_aws
integer x = 46
integer y = 1000
integer width = 421
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Signdata"
boolean focusrectangle = false
end type

type mle_authorization from multilineedit within w_amazon_aws
integer x = 553
integer y = 1424
integer width = 2725
integer height = 264
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

type cb_3 from commandbutton within w_amazon_aws
integer x = 41
integer y = 1220
integer width = 699
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3.生成签名和Authorization"
end type

event clicked;String 	ls_Date, ls_datetime, ls_Region, ls_Service, ls_Request, ls_Method
String 	ls_sign2, ls_sign
Long 		ll_pos
String 	ls_kSecret, ls_kDate, ls_kRegion, ls_kService, ls_kSigning
Blob 		lb_kSecret, lb_kDate, lb_kRegion, lb_kService, lb_kSigning, lb_sign
String 	ls_AccessKey, ls_SecretKey, ls_Authorization

//获取
ls_Date = sle_date.Text
ls_datetime = sle_datetime.text
ls_Region = sle_region.Text
ls_Service = sle_service.Text
ls_Request = sle_request.Text
ls_sign2 = mle_sign2.Text

If Len( ls_sign2 ) <=0 Then
	MessageBox ( "Tip", "signdata is null" )
	Return
End If

CoderObject 	lco_Code
CrypterObject 	lco_Crypt

lco_Code = Create CoderObject
lco_Crypt = Create CrypterObject

//删除~r
wf_replace(ls_sign2,"~r")

ls_AccessKey = sle_username.Text
ls_SecretKey = sle_password.Text
ls_Region = sle_Region.Text
ls_Service = sle_Service.Text
ls_Request = sle_Request.Text

//获取签名串
ls_kSecret = "AWS4" + ls_SecretKey
lb_kSecret = Blob (ls_kSecret,EncodingUTF8! )

lb_kDate = lco_Crypt.HMAC( HMACSHA256!, Blob(ls_Date,EncodingUTF8!), lb_kSecret)
//ls_kDate = Lower(lco_Code.HexEncode(lb_kDate))

lb_kRegion =lco_Crypt.HMAC( HMACSHA256!, Blob(ls_Region,EncodingUTF8!), lb_kDate)
//ls_kRegion = Lower(lco_Code.HexEncode(lb_kRegion))

lb_kService = lco_Crypt.HMAC( HMACSHA256!, Blob(ls_Service,EncodingUTF8!), lb_kRegion)
//ls_kService = Lower(lco_Code.HexEncode(lb_kService))

lb_kSigning = lco_Crypt.HMAC( HMACSHA256!, Blob(ls_Request,EncodingUTF8!), lb_kService)
//ls_kSigning = Lower(lco_Code.HexEncode(lb_kSigning))

lb_sign = lco_Crypt.HMAC( HMACSHA256!, Blob(ls_sign2,EncodingUTF8!), lb_kSigning)
ls_sign = Lower(lco_Code.HexEncode(lb_sign))

sle_sign.Text = ls_sign

ls_Authorization = "AWS4-HMAC-SHA256 Credential="+ls_AccessKey+ &
	"/"+ls_Date+"/"+ls_Region+"/"+ls_Service+"/"+ls_Request+", SignedHeaders=content-type;host;x-amz-date, Signature=" + ls_sign

mle_authorization.Text = ls_Authorization
  
If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )

end event

type mle_sign2 from multilineedit within w_amazon_aws
integer x = 553
integer y = 896
integer width = 2725
integer height = 264
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_amazon_aws
integer x = 41
integer y = 896
integer width = 480
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.生成待签名数据"
end type

event clicked;String 	ls_Date, ls_datetime, ls_Region, ls_Service, ls_Request, ls_Method
String 	ls_sign1, ls_sign2
Long 		ll_pos
//获取X-Amz-Data时间戳
ls_Date = sle_date.Text
ls_datetime = sle_datetime.text
ls_Region = sle_region.Text
ls_Service = sle_service.Text
ls_Request = sle_request.Text
ls_sign1 = mle_sign1.Text

If Len( ls_sign1 ) <=0 Then
	MessageBox ( "Tip", "Date is null" )
	Return
End If

CoderObject 	lco_Code
CrypterObject 	lco_Crypt

lco_Code = Create CoderObject
lco_Crypt = Create CrypterObject

//删除~r
wf_replace(ls_sign1,"~r")

ls_sign2 = "AWS4-HMAC-SHA256" + "~r~n"+ &
	ls_datetime + "~r~n" + &
	ls_date + "/" + ls_region + "/" + ls_service + "/" + ls_request + "~r~n" + &
	Lower(lco_Code.HexEncode(lco_Crypt.SHA( SHA256!, Blob(ls_sign1,EncodingUTF8!))))
	
mle_sign2.Text = ls_sign2
  
If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )

end event

type sle_method from singlelineedit within w_amazon_aws
integer x = 2821
integer y = 60
integer width = 261
integer height = 84
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "GET"
borderstyle borderstyle = stylelowered!
end type

type mle_sign1 from multilineedit within w_amazon_aws
integer x = 1280
integer y = 348
integer width = 1998
integer height = 536
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

type cb_1 from commandbutton within w_amazon_aws
integer x = 951
integer y = 344
integer width = 320
integer height = 92
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.刷新date"
end type

event clicked;String 	ls_url, ls_parm,ls_host, ls_date, ls_datetime, ls_Method, ls_sign1
Time 		lt_time
//获取X-Amz-Data时间戳
ls_Date = String(today(),"yyyyMMdd")
sle_date.Text = ls_Date
lt_time =  RelativeTime(now(), -(8*60*60)) //格林时间
ls_datetime = ls_Date + "T" + String(  lt_time,"hhmmss" ) + "Z"
sle_datetime.text = ls_datetime
ls_url = sle_url.Text
ls_parm = Mid( ls_url, pos( ls_url, "com" ) )
ls_parm = Replace( ls_parm,1,3, "" )
ls_host = Mid(  ls_url, pos( ls_url, "//" ) + 2 )
ls_host = Mid(  ls_host, 1,pos( ls_host,"com" ) + 2 )
ls_Method = sle_Method.Text

ls_sign1 = ls_Method + "~r~n" + &
	ls_parm + "~r~n~r~n" + &
	"content-type:application/x-www-form-urlencoded" + "~r~n" + &
	"host:" + ls_host + "~r~n" + "x-amz-date:" + ls_datetime + "~r~n~r~n" + &
	"content-type;host;x-amz-date"+"~r~n" + &
	"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

mle_sign1.Text = ls_sign1

end event

type sle_request from singlelineedit within w_amazon_aws
integer x = 361
integer y = 732
integer width = 585
integer height = 84
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "aws4_request"
borderstyle borderstyle = stylelowered!
end type

type sle_service from singlelineedit within w_amazon_aws
integer x = 361
integer y = 636
integer width = 585
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "execute-api"
borderstyle borderstyle = stylelowered!
end type

type sle_region from singlelineedit within w_amazon_aws
integer x = 361
integer y = 540
integer width = 585
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "us-east-1"
borderstyle borderstyle = stylelowered!
end type

type sle_date from singlelineedit within w_amazon_aws
integer x = 361
integer y = 444
integer width = 585
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_datetime from singlelineedit within w_amazon_aws
integer x = 361
integer y = 348
integer width = 585
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_password from singlelineedit within w_amazon_aws
integer x = 361
integer y = 252
integer width = 2450
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "6tf/0wrPqifqSuyCdlqU1WldIzr5aPxypBN3FEhD"
borderstyle borderstyle = stylelowered!
end type

type sle_username from singlelineedit within w_amazon_aws
integer x = 361
integer y = 156
integer width = 2450
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "AKIAJYFCS5HBXOIGWCEA"
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_amazon_aws
integer x = 46
integer y = 744
integer width = 215
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Request"
boolean focusrectangle = false
end type

type st_7 from statictext within w_amazon_aws
integer x = 46
integer y = 648
integer width = 187
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Service"
boolean focusrectangle = false
end type

type st_6 from statictext within w_amazon_aws
integer x = 46
integer y = 552
integer width = 178
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Region"
boolean focusrectangle = false
end type

type st_5 from statictext within w_amazon_aws
integer x = 46
integer y = 456
integer width = 128
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
boolean focusrectangle = false
end type

type st_4 from statictext within w_amazon_aws
integer x = 46
integer y = 360
integer width = 302
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "X-Amz-Date"
boolean focusrectangle = false
end type

type st_3 from statictext within w_amazon_aws
integer x = 46
integer y = 264
integer width = 265
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "SecretKey"
boolean focusrectangle = false
end type

type st_2 from statictext within w_amazon_aws
integer x = 46
integer y = 168
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
string text = "AccessKey"
boolean focusrectangle = false
end type

type sle_url from singlelineedit within w_amazon_aws
integer x = 361
integer y = 60
integer width = 2450
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "https://hk1egzaeia.execute-api.us-east-1.amazonaws.com/appeon/pets"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_amazon_aws
integer x = 46
integer y = 72
integer width = 105
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Url"
boolean focusrectangle = false
end type

