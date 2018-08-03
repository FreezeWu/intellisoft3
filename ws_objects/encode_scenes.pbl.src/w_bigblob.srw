$PBExportHeader$w_bigblob.srw
forward
global type w_bigblob from window
end type
type tab_1 from tab within w_bigblob
end type
type tabpage_1 from userobject within tab_1
end type
type st_21 from statictext within tabpage_1
end type
type st_20 from statictext within tabpage_1
end type
type md5_2 from singlelineedit within tabpage_1
end type
type md5_1 from singlelineedit within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type st_6 from statictext within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type sle_1 from singlelineedit within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type ddlb_1 from dropdownlistbox within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type p_2 from picture within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type p_1 from picture within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_21 st_21
st_20 st_20
md5_2 md5_2
md5_1 md5_1
st_5 st_5
st_6 st_6
st_4 st_4
st_3 st_3
sle_1 sle_1
cb_2 cb_2
ddlb_1 ddlb_1
cb_1 cb_1
p_2 p_2
st_2 st_2
st_1 st_1
p_1 p_1
end type
type tabpage_2 from userobject within tab_1
end type
type md5_4 from singlelineedit within tabpage_2
end type
type st_23 from statictext within tabpage_2
end type
type md5_3 from singlelineedit within tabpage_2
end type
type st_22 from statictext within tabpage_2
end type
type cb_5 from commandbutton within tabpage_2
end type
type sle_3 from singlelineedit within tabpage_2
end type
type st_12 from statictext within tabpage_2
end type
type cb_4 from commandbutton within tabpage_2
end type
type ddlb_2 from dropdownlistbox within tabpage_2
end type
type st_11 from statictext within tabpage_2
end type
type st_10 from statictext within tabpage_2
end type
type st_9 from statictext within tabpage_2
end type
type st_8 from statictext within tabpage_2
end type
type cb_3 from commandbutton within tabpage_2
end type
type sle_2 from singlelineedit within tabpage_2
end type
type st_7 from statictext within tabpage_2
end type
type tabpage_2 from userobject within tab_1
md5_4 md5_4
st_23 st_23
md5_3 md5_3
st_22 st_22
cb_5 cb_5
sle_3 sle_3
st_12 st_12
cb_4 cb_4
ddlb_2 ddlb_2
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
cb_3 cb_3
sle_2 sle_2
st_7 st_7
end type
type tabpage_3 from userobject within tab_1
end type
type md5_6 from singlelineedit within tabpage_3
end type
type md5_aa from statictext within tabpage_3
end type
type md5_5 from singlelineedit within tabpage_3
end type
type st_24 from statictext within tabpage_3
end type
type st_19 from statictext within tabpage_3
end type
type mle_2 from multilineedit within tabpage_3
end type
type st_18 from statictext within tabpage_3
end type
type st_17 from statictext within tabpage_3
end type
type mle_1 from multilineedit within tabpage_3
end type
type cb_6 from commandbutton within tabpage_3
end type
type ddlb_3 from dropdownlistbox within tabpage_3
end type
type st_16 from statictext within tabpage_3
end type
type st_15 from statictext within tabpage_3
end type
type st_14 from statictext within tabpage_3
end type
type st_13 from statictext within tabpage_3
end type
type tabpage_3 from userobject within tab_1
md5_6 md5_6
md5_aa md5_aa
md5_5 md5_5
st_24 st_24
st_19 st_19
mle_2 mle_2
st_18 st_18
st_17 st_17
mle_1 mle_1
cb_6 cb_6
ddlb_3 ddlb_3
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
end type
type tab_1 from tab within w_bigblob
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_bigblob from window
integer width = 3534
integer height = 2376
boolean titlebar = true
string title = "BigBlob"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_bigblob w_bigblob

forward prototypes
public subroutine wf_replace (ref string as_string, string as_str, string as_rep)
end prototypes

public subroutine wf_replace (ref string as_string, string as_str, string as_rep);Long 		ll_pos, ls_befor
ls_befor = 0
do while true
	ll_pos = pos(as_string,as_str)
	if ll_pos > ls_befor then
		as_string = Replace(as_string,ll_pos,Len(as_str), as_rep)
		ls_befor = ll_pos + Len(as_rep) - Len(as_str)
	else
		exit
	end if
loop
end subroutine

on w_bigblob.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_bigblob.destroy
destroy(this.tab_1)
end on

event open;tab_1.tabpage_3.mle_1.Text = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~' + &
"~r~n这是简体字" + &
"~r~n這是繁體字"+ &
"~r~nこれは日本語です"+ &
"~r~n이것은 한국어이다"+ &
"~r~nهذه هي العربية"+ &
"~r~nDas ist Deutsch"+ &
"~r~nC'est français"+ &
"~r~nЭто русский"+ &
"~r~nTämä on suomalaista"+ &
"~r~nĐây là người việt nam"+ &
"~r~nQuesto è italiano"+ &
"~r~nΑυτό είναι ελληνικό"
end event

type tab_1 from tab within w_bigblob
integer x = 23
integer y = 24
integer width = 3406
integer height = 2228
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
tabpage_3 tabpage_3
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 124
integer width = 3369
integer height = 2088
long backcolor = 67108864
string text = "Picture"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_21 st_21
st_20 st_20
md5_2 md5_2
md5_1 md5_1
st_5 st_5
st_6 st_6
st_4 st_4
st_3 st_3
sle_1 sle_1
cb_2 cb_2
ddlb_1 ddlb_1
cb_1 cb_1
p_2 p_2
st_2 st_2
st_1 st_1
p_1 p_1
end type

on tabpage_1.create
this.st_21=create st_21
this.st_20=create st_20
this.md5_2=create md5_2
this.md5_1=create md5_1
this.st_5=create st_5
this.st_6=create st_6
this.st_4=create st_4
this.st_3=create st_3
this.sle_1=create sle_1
this.cb_2=create cb_2
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.p_2=create p_2
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.st_21,&
this.st_20,&
this.md5_2,&
this.md5_1,&
this.st_5,&
this.st_6,&
this.st_4,&
this.st_3,&
this.sle_1,&
this.cb_2,&
this.ddlb_1,&
this.cb_1,&
this.p_2,&
this.st_2,&
this.st_1,&
this.p_1}
end on

on tabpage_1.destroy
destroy(this.st_21)
destroy(this.st_20)
destroy(this.md5_2)
destroy(this.md5_1)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.ddlb_1)
destroy(this.cb_1)
destroy(this.p_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
end on

type st_21 from statictext within tabpage_1
integer x = 558
integer y = 2020
integer width = 169
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "MD5:"
boolean focusrectangle = false
end type

type st_20 from statictext within tabpage_1
integer x = 558
integer y = 1016
integer width = 169
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "MD5:"
boolean focusrectangle = false
end type

type md5_2 from singlelineedit within tabpage_1
integer x = 731
integer y = 2012
integer width = 2574
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type md5_1 from singlelineedit within tabpage_1
integer x = 731
integer y = 1008
integer width = 2574
integer height = 76
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within tabpage_1
integer x = 23
integer y = 316
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "3.对比前后是否一致"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_1
integer x = 23
integer y = 224
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "2.选择加密方式后点加解密"
boolean focusrectangle = false
end type

type st_4 from statictext within tabpage_1
integer x = 23
integer y = 136
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "1.选择一张图片"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_1
integer y = 440
integer width = 151
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "类型"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within tabpage_1
integer x = 727
integer y = 4
integer width = 2249
integer height = 76
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within tabpage_1
integer x = 146
integer y = 552
integer width = 507
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.加解密"
end type

event clicked;String 	ls_Type, ls_File, ls_rtn
Long 		ll_file, ll_rtn
Blob 		lb_Data, lb_Data2, lb_Key, lb_IV, lb_Return
CoderObject 		lco_Code
CrypterObject 		lco_Crypt
Encoding 			eRet

ls_File = sle_1.Text
If IsNull ( ls_File ) Or Trim ( ls_File ) = "" Then
	MessageBox ( "提示", "请选择图片!" )
	Return
End If

eRet = FileEncoding(ls_file)//根据文件编码获取
ll_file = FileOpen(ls_file, StreamMode!, Read!, LockWrite!, Replace!, eRet) //打开图片文档
If ll_file > 0 Then
	ll_rtn = FileReadex( ll_file, lb_Data ) //读取图片到blob变量
	FileClose ( ll_file ) //关闭文档
	If ll_rtn <= 0 then
		MessageBox ( "提示", "读取图片失败!" )
		Return
	End If
Else
	MessageBox ( "提示", "文件打开失败!" )
	Return
End If

lco_Code = Create CoderObject
lco_Crypt = Create CrypterObject

//lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
lb_IV = Blob( "appeoniv", EncodingUTF8! )
ls_Type = ddlb_1.text

Choose Case ls_type
	Case "Url"
		//Blob to Url String
		ls_rtn = lco_Code.UrlEncode(lb_Data)
		//Url String to Blob
		lb_Data2 = lco_Code.UrlDecode( ls_rtn )
		p_2.SetPicture( lb_Data2 )
	Case "Hex"
		//Blob to Hex String
		ls_rtn = lco_Code.HexEncode(lb_Data)
		//Hex String to Blob
		lb_Data2 = lco_Code.HexDecode( ls_rtn )
		p_2.SetPicture( lb_Data2 )
	Case "Base64"
		//Blob to Base64 String
		ls_rtn = lco_Code.Base64Encode(lb_Data)
		//Base64 String to Blob
		lb_Data2 = lco_Code.Base64Decode( ls_rtn )
		p_2.SetPicture( lb_Data2 )
	Case "AES"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(AES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		p_2.SetPicture( lb_Data2 )
	Case "DES"
		lb_Key = Blob ( "appeonke", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(DES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(DES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		p_2.SetPicture( lb_Data2 )
	Case "TDES"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(TDES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(TDES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		p_2.SetPicture( lb_Data2 )
	Case "DESX"
		lb_Key = Blob ( "appeonkey123456712345678", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(DESX!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(DESX!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		p_2.SetPicture( lb_Data2 )
	Case "Blowfish"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(Blowfish!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(Blowfish!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		p_2.SetPicture( lb_Data2 )
End Choose

lb_Return = lco_Crypt.MD5( lb_data )
Md5_1.Text = lco_Code.HexEncode( lb_Return )
lb_Return = lco_Crypt.MD5( lb_data2 )
Md5_2.Text = lco_Code.HexEncode( lb_Return )

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )
end event

type ddlb_1 from dropdownlistbox within tabpage_1
integer x = 151
integer y = 432
integer width = 489
integer height = 476
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Hex","Base64","Url","AES","DES","TDES","DESX","Blowfish"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.selectitem( 1)

end event

event selectionchanged;p_2.PictureName = "white.jpg"
Md5_1.Text = ""
Md5_2.Text = ""
end event

type cb_1 from commandbutton within tabpage_1
integer x = 3013
integer width = 297
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.browse"
end type

event clicked;String 	ls_path, ls_file
Long 		ll_return

ll_return = getfileopenname("Select IMG File",ls_path,ls_file,"*.bmp;*.jpg;*.jpeg;*.png;","IMG File(*.bmp;*.jpg;*.jpeg;*.png;),*.bmp;*.jpg;*.jpeg;*.png;")

If ll_Return > 0 Then
	sle_1.Text = ls_path
	tab_1.tabpage_1.p_1.pictureName = ls_path
End IF
end event

type p_2 from picture within tabpage_1
integer x = 731
integer y = 1096
integer width = 2574
integer height = 912
string picturename = "white.jpg"
boolean border = true
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_1
integer x = 343
integer y = 1104
integer width = 375
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "加密且解密后:"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 503
integer y = 4
integer width = 215
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "加密前:"
boolean focusrectangle = false
end type

type p_1 from picture within tabpage_1
integer x = 731
integer y = 88
integer width = 2574
integer height = 912
boolean border = true
boolean focusrectangle = false
end type

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 124
integer width = 3369
integer height = 2088
long backcolor = 67108864
string text = " File "
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
md5_4 md5_4
st_23 st_23
md5_3 md5_3
st_22 st_22
cb_5 cb_5
sle_3 sle_3
st_12 st_12
cb_4 cb_4
ddlb_2 ddlb_2
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
cb_3 cb_3
sle_2 sle_2
st_7 st_7
end type

on tabpage_2.create
this.md5_4=create md5_4
this.st_23=create st_23
this.md5_3=create md5_3
this.st_22=create st_22
this.cb_5=create cb_5
this.sle_3=create sle_3
this.st_12=create st_12
this.cb_4=create cb_4
this.ddlb_2=create ddlb_2
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.cb_3=create cb_3
this.sle_2=create sle_2
this.st_7=create st_7
this.Control[]={this.md5_4,&
this.st_23,&
this.md5_3,&
this.st_22,&
this.cb_5,&
this.sle_3,&
this.st_12,&
this.cb_4,&
this.ddlb_2,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.cb_3,&
this.sle_2,&
this.st_7}
end on

on tabpage_2.destroy
destroy(this.md5_4)
destroy(this.st_23)
destroy(this.md5_3)
destroy(this.st_22)
destroy(this.cb_5)
destroy(this.sle_3)
destroy(this.st_12)
destroy(this.cb_4)
destroy(this.ddlb_2)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.cb_3)
destroy(this.sle_2)
destroy(this.st_7)
end on

type md5_4 from singlelineedit within tabpage_2
integer x = 731
integer y = 1196
integer width = 2574
integer height = 76
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_23 from statictext within tabpage_2
integer x = 558
integer y = 1204
integer width = 169
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "MD5:"
boolean focusrectangle = false
end type

type md5_3 from singlelineedit within tabpage_2
integer x = 731
integer y = 92
integer width = 2574
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_22 from statictext within tabpage_2
integer x = 558
integer y = 100
integer width = 169
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "MD5:"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within tabpage_2
integer x = 3013
integer y = 1100
integer width = 311
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3.compare"
end type

event clicked;//使用compare工具比较期望值
string ls_beyond,ls_key[], ls_real, ls_exp
long ll_rtn

ls_real = sle_2.Text
If IsNull ( ls_Real ) Or Trim ( ls_real ) = "" Then Return
ls_exp = sle_3.Text
If IsNull ( ls_exp ) Or Trim ( ls_exp ) = "" Then
	MessageBox ( "提示", "新文件没有生成!" )
	Return
End If

//从注册表获取compare的执行路局
ll_rtn = Registryget("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\BeyondCompare.Snapshot\shell\open\command","",regstring!,ls_beyond)
if pos(ls_beyond,"%1") > 0 then
	ls_beyond = mid(ls_beyond,1,pos(ls_beyond,"%1") - 2)
end if

//通过compare工具比较结果
run(ls_beyond +' "'+ls_real+'" "'+ls_exp+'"')
end event

type sle_3 from singlelineedit within tabpage_2
integer x = 727
integer y = 1104
integer width = 2249
integer height = 76
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

type st_12 from statictext within tabpage_2
integer x = 343
integer y = 1104
integer width = 375
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "加密且解密后:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within tabpage_2
integer x = 146
integer y = 552
integer width = 507
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.加解密"
end type

event clicked;String 	ls_Type, ls_rtn, ls_Path, ls_Path_new
Long 		ll_file, ll_rtn
Blob 		lb_Data, lb_Data2, lb_Key, lb_IV, lb_Return
CoderObject 		lco_Code
CrypterObject 		lco_Crypt
Encoding 			eRet

ls_Path = sle_2.Text
If IsNull ( ls_Path ) Or Trim ( ls_Path ) = "" Then
	MessageBox ( "提示", "请选择图片!" )
	Return
End If
eRet = FileEncoding(ls_Path)//根据文件编码获取
ll_file = FileOpen(ls_Path, StreamMode!, Read!, LockWrite!, Replace!, eRet) //打开文档
If ll_file > 0 Then
	ll_rtn = FileReadex( ll_file, lb_Data ) //读取文档到blob变量
	FileClose ( ll_file ) //关闭文档
	If ll_rtn <= 0 then
		MessageBox ( "提示", "读取文件失败!" )
		Return
	End If
Else
	MessageBox ( "提示", "文件打开失败!" )
	Return
End If

lco_Code = Create CoderObject
lco_Crypt = Create CrypterObject

//lb_Key = Blob ( "appeonkey1234567", EncodingANSI! )
lb_IV = Blob( "appeoniv", EncodingANSI! )
ls_Type = ddlb_2.text

Choose Case ls_type
	Case "Url"
		//Blob to Url String
		ls_rtn = lco_Code.UrlEncode(lb_Data)
		//Url String to Blob
		lb_Data2 = lco_Code.UrlDecode( ls_rtn )
	Case "Hex"
		//Blob to Hex String
		ls_rtn = lco_Code.HexEncode(lb_Data)
		//Hex String to Blob
		lb_Data2 = lco_Code.HexDecode( ls_rtn )
		
	Case "Base64"
		//Blob to Base64 String
		ls_rtn = lco_Code.Base64Encode(lb_Data)
		//Base64 String to Blob
		lb_Data2 = lco_Code.Base64Decode( ls_rtn )
		
	Case "AES"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(AES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "DES"
		lb_Key = Blob ( "appeonke", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(DES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(DES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "TDES"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(TDES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(TDES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "DESX"
		lb_Key = Blob ( "appeonkey123456712345678", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(DESX!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(DESX!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "Blowfish"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(Blowfish!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(Blowfish!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
End Choose

lb_Return = lco_Crypt.MD5( lb_data )
Md5_3.Text = lco_Code.HexEncode( lb_Return )
lb_Return = lco_Crypt.MD5( lb_data2 )
Md5_4.Text = lco_Code.HexEncode( lb_Return )

//保存新的文件
ls_Path_new = ls_Path
wf_replace(ls_Path_new,".","_2.")

ll_file = FileOpen(ls_Path_new, StreamMode!, Write!, LockReadWrite!, Replace!,eRet) //打开文档
If ll_file > 0 Then
	ll_rtn = FileWriteex( ll_file, lb_Data2 ) //blob变量写到文档
	FileClose(ll_file)
	If ll_rtn > 0 Then
		sle_3.Text = ls_Path_new
	Else
		MessageBox ( "提示", "文件写入失败!" )
	End If
Else
	MessageBox ( "提示", "文件写入失败!" )
End If

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )
end event

type ddlb_2 from dropdownlistbox within tabpage_2
integer x = 151
integer y = 432
integer width = 489
integer height = 476
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
string item[] = {"Hex","Base64","Url","AES","DES","TDES","DESX","Blowfish"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.selectitem( 1)

end event

event selectionchanged;sle_3.Text = ""
md5_3.Text = ""
md5_4.Text = ""
end event

type st_11 from statictext within tabpage_2
integer y = 440
integer width = 151
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "类型"
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_2
integer x = 23
integer y = 316
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "3.对比新旧文件是否一致"
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_2
integer x = 23
integer y = 224
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "2.选择加密方式后点加解密"
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_2
integer x = 23
integer y = 136
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "1.选择一个文件"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within tabpage_2
integer x = 3013
integer width = 297
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1.browse"
end type

event clicked;String 	ls_path, ls_file
Long 		ll_return

ll_return = getfileopenname("Select File",ls_path,ls_file,"*.*","All File(*.*),*.*")

If ll_Return > 0 Then
	sle_2.Text = ls_path
End IF
end event

type sle_2 from singlelineedit within tabpage_2
integer x = 727
integer y = 4
integer width = 2249
integer height = 76
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within tabpage_2
integer x = 503
integer y = 4
integer width = 215
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "加密前:"
boolean focusrectangle = false
end type

type tabpage_3 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 124
integer width = 3369
integer height = 2088
long backcolor = 67108864
string text = "String"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
md5_6 md5_6
md5_aa md5_aa
md5_5 md5_5
st_24 st_24
st_19 st_19
mle_2 mle_2
st_18 st_18
st_17 st_17
mle_1 mle_1
cb_6 cb_6
ddlb_3 ddlb_3
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
end type

on tabpage_3.create
this.md5_6=create md5_6
this.md5_aa=create md5_aa
this.md5_5=create md5_5
this.st_24=create st_24
this.st_19=create st_19
this.mle_2=create mle_2
this.st_18=create st_18
this.st_17=create st_17
this.mle_1=create mle_1
this.cb_6=create cb_6
this.ddlb_3=create ddlb_3
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.Control[]={this.md5_6,&
this.md5_aa,&
this.md5_5,&
this.st_24,&
this.st_19,&
this.mle_2,&
this.st_18,&
this.st_17,&
this.mle_1,&
this.cb_6,&
this.ddlb_3,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13}
end on

on tabpage_3.destroy
destroy(this.md5_6)
destroy(this.md5_aa)
destroy(this.md5_5)
destroy(this.st_24)
destroy(this.st_19)
destroy(this.mle_2)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.mle_1)
destroy(this.cb_6)
destroy(this.ddlb_3)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
end on

type md5_6 from singlelineedit within tabpage_3
integer x = 727
integer y = 2016
integer width = 2574
integer height = 76
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type md5_aa from statictext within tabpage_3
integer x = 553
integer y = 2024
integer width = 169
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "MD5:"
boolean focusrectangle = false
end type

type md5_5 from singlelineedit within tabpage_3
integer x = 727
integer y = 972
integer width = 2574
integer height = 76
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_24 from statictext within tabpage_3
integer x = 553
integer y = 980
integer width = 169
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "MD5:"
boolean focusrectangle = false
end type

type st_19 from statictext within tabpage_3
integer x = 155
integer y = 1364
integer width = 462
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "比较结果："
boolean focusrectangle = false
end type

type mle_2 from multilineedit within tabpage_3
integer x = 718
integer y = 1056
integer width = 2647
integer height = 960
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_18 from statictext within tabpage_3
integer x = 343
integer y = 1104
integer width = 375
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "加密且解密后:"
boolean focusrectangle = false
end type

type st_17 from statictext within tabpage_3
integer x = 503
integer y = 4
integer width = 215
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "加密前:"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within tabpage_3
integer x = 718
integer y = 12
integer width = 2647
integer height = 960
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within tabpage_3
integer x = 146
integer y = 552
integer width = 507
integer height = 100
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2.加解密"
end type

event clicked;String 	ls_Type, ls_rtn,ls_String, ls_String2
Long 		ll_file, ll_rtn
Blob 		lb_Data, lb_Data2, lb_Key, lb_IV, lb_Return
CoderObject 		lco_Code
CrypterObject 		lco_Crypt
Encoding 			eRet

ls_String = mle_1.Text
If IsNull ( ls_String ) OR Trim ( ls_String ) = "" Then
	MessageBox ( "提示","请复制粘贴需要加解密的文本!" )
	Return 
End If

//把加密的文本转为UTF8的Blob
lb_Data = Blob ( ls_String, EncodingUTF8! )

lco_Code = Create CoderObject
lco_Crypt = Create CrypterObject

lb_IV = Blob( "appeoniv", EncodingANSI! )
ls_Type = ddlb_3.text

Choose Case ls_type
	Case "Url"
		//Blob to Url String
		ls_rtn = lco_Code.UrlEncode(lb_Data)
		//Url String to Blob
		lb_Data2 = lco_Code.UrlDecode( ls_rtn )
	Case "Hex"
		//Blob to Hex String
		ls_rtn = lco_Code.HexEncode(lb_Data)
		//Hex String to Blob
		lb_Data2 = lco_Code.HexDecode( ls_rtn )
		
	Case "Base64"
		//Blob to Base64 String
		ls_rtn = lco_Code.Base64Encode(lb_Data)
		//Base64 String to Blob
		lb_Data2 = lco_Code.Base64Decode( ls_rtn )
		
	Case "AES"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(AES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "DES"
		lb_Key = Blob ( "appeonke", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(DES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(DES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "TDES"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(TDES!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(TDES!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "DESX"
		lb_Key = Blob ( "appeonkey123456712345678", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(DESX!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(DESX!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
	Case "Blowfish"
		lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		//Blob to Base64 String
		lb_Return = lco_Crypt.SymmetricEncrypt(Blowfish!, lb_Data, lb_Key,OperationModeECB!,lb_iv)
		//Base64 String to Blob
		lb_Data2 = lco_Crypt.SymmetricDecrypt(Blowfish!, lb_Return, lb_Key,OperationModeECB!,lb_iv)
		
End Choose

lb_Return = lco_Crypt.MD5( lb_data )
Md5_5.Text = lco_Code.HexEncode( lb_Return )
lb_Return = lco_Crypt.MD5( lb_data2 )
Md5_6.Text = lco_Code.HexEncode( lb_Return )

//输出新的文本
ls_String2 = String ( lb_Data2, EncodingUTF8! )
mle_2.Text = ls_String2

If ls_String2 = ls_String Then
	st_19.Text = "比较结果：相同"
	st_19.Textcolor = RGB ( 0,255,0 )
Else
	st_19.Text = "比较结果：不相同"
	st_19.Textcolor = RGB ( 255,0,0 )
End If


If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )
end event

type ddlb_3 from dropdownlistbox within tabpage_3
integer x = 151
integer y = 432
integer width = 489
integer height = 476
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Hex","Base64","Url","AES","DES","TDES","DESX","Blowfish"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.selectitem( 1)

end event

event selectionchanged;mle_2.Text = ""
st_19.Text = "比较结果："
st_19.Textcolor = RGB(0,0,0)
md5_5.Text = ""
md5_6.Text = ""
end event

type st_16 from statictext within tabpage_3
integer y = 440
integer width = 151
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "类型"
boolean focusrectangle = false
end type

type st_15 from statictext within tabpage_3
integer x = 23
integer y = 316
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "3.对比上下文本是否一致"
boolean focusrectangle = false
end type

type st_14 from statictext within tabpage_3
integer x = 23
integer y = 224
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "2.选择加密方式后点加解密"
boolean focusrectangle = false
end type

type st_13 from statictext within tabpage_3
integer x = 23
integer y = 136
integer width = 663
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "1.复制粘贴需要加密的文本"
boolean focusrectangle = false
end type

