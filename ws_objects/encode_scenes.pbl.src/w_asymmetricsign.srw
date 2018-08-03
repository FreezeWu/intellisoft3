$PBExportHeader$w_asymmetricsign.srw
forward
global type w_asymmetricsign from window
end type
type cb_1 from commandbutton within w_asymmetricsign
end type
type st_2 from statictext within w_asymmetricsign
end type
type mle_2 from multilineedit within w_asymmetricsign
end type
type st_4 from statictext within w_asymmetricsign
end type
type mle_privkey from multilineedit within w_asymmetricsign
end type
type mle_pubkey from multilineedit within w_asymmetricsign
end type
type st_11 from statictext within w_asymmetricsign
end type
type st_3 from statictext within w_asymmetricsign
end type
type mle_5 from multilineedit within w_asymmetricsign
end type
type st_1 from statictext within w_asymmetricsign
end type
type mle_1 from multilineedit within w_asymmetricsign
end type
end forward

global type w_asymmetricsign from window
integer width = 3666
integer height = 1896
boolean titlebar = true
string title = "Sign/VerifySign"
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
st_4 st_4
mle_privkey mle_privkey
mle_pubkey mle_pubkey
st_11 st_11
st_3 st_3
mle_5 mle_5
st_1 st_1
mle_1 mle_1
end type
global w_asymmetricsign w_asymmetricsign

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

on w_asymmetricsign.create
this.cb_1=create cb_1
this.st_2=create st_2
this.mle_2=create mle_2
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
this.st_4,&
this.mle_privkey,&
this.mle_pubkey,&
this.st_11,&
this.st_3,&
this.mle_5,&
this.st_1,&
this.mle_1}
end on

on w_asymmetricsign.destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.mle_2)
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



mle_pubkey.Text = "MIIBtjCCASsGByqGSM44BAEwggEeAoGBANTUCYVDAuBGts/+YRKmRvitNK/Oqn0i" + &
"1gKcEmpieGDh5hbVExCmg2lnqK8kIGH/5dU+pcoMKgJNbRCVggTFm/Gtx8IChbir" + &
"bboioOankOSfVNFbYA/m5XIyWJxpTaDt3rmZpGN/dvcNK/fzEu8jX1hp+iOOlLcc" + &
"BBWjBRPRvc1ZAhUAjGewdGMVMDkNHExlQvtfyvJ+MdcCgYAGAmRXx1vCoweuTp9/" + &
"M8gEC8jjVCVBF7A0l+DUwxH3q7PfA2E4kVA8ey3FSpqUv1cKa4wL3xmnzn16iChI" + &
"1Vk0utMRo8K4r68PJLy2BAAAgu4JC9C1/Fh4WqAX6jWur+6SwxpuKZKQ7muj9BoG" + &
"CWT5FrBLhDDSMdZ1y6yrmdMT5gOBhAACgYB1hJz53k7RJpQwC1IAIg9LjDelz3BG" + &
"TLsujMZlJLBCOnMdH5xHFTBx9TjxKOMuZLAjqZFhaYE7av1zDjLm+BY0LQdpMuPD" + &
"CgC967lbf8XhUNwI/p4pVZ0WBCZsBTx/sRJkS08xqbwCSSNQeuwriv2l3KidiKDN" + &
"t43Cf9ioAuAYqA=="


mle_privkey.Text = "MIIBSgIBADCCASsGByqGSM44BAEwggEeAoGBANTUCYVDAuBGts/+YRKmRvitNK/O&
qn0i1gKcEmpieGDh5hbVExCmg2lnqK8kIGH/5dU+pcoMKgJNbRCVggTFm/Gtx8IC&
hbirbboioOankOSfVNFbYA/m5XIyWJxpTaDt3rmZpGN/dvcNK/fzEu8jX1hp+iOO&
lLccBBWjBRPRvc1ZAhUAjGewdGMVMDkNHExlQvtfyvJ+MdcCgYAGAmRXx1vCoweu&
Tp9/M8gEC8jjVCVBF7A0l+DUwxH3q7PfA2E4kVA8ey3FSpqUv1cKa4wL3xmnzn16&
iChI1Vk0utMRo8K4r68PJLy2BAAAgu4JC9C1/Fh4WqAX6jWur+6SwxpuKZKQ7muj&
9BoGCWT5FrBLhDDSMdZ1y6yrmdMT5gQWAhRd8Ovy8/7zSHvYmlyvIPBFddcfiw=="
end event

type cb_1 from commandbutton within w_asymmetricsign
integer x = 407
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
string text = " Sign/VerSign"
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
	lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
	If Len(lb_return) > 0 Then
		mle_5.Text = lco_code.Base64Encode( lb_return )
	Else
		Messagebox ( "fail",  String ( lb_return ) )
	End If
Catch(Throwable ex)
	mle_5.Text = ex.GetMessage()
End Try

Try
	li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_return)
	If li_return = 1 Then
		mle_2.Text = String(li_return) 
	Else
		Messagebox ( "fail",  String ( li_return ) )
	End If
Catch(Throwable ex1)
	mle_2.Text = ex1.GetMessage()
End Try

end event

type st_2 from statictext within w_asymmetricsign
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
string text = "VerSign"
boolean focusrectangle = false
end type

type mle_2 from multilineedit within w_asymmetricsign
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

type st_4 from statictext within w_asymmetricsign
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

type mle_privkey from multilineedit within w_asymmetricsign
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

type mle_pubkey from multilineedit within w_asymmetricsign
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

type st_11 from statictext within w_asymmetricsign
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
string text = "Sign"
boolean focusrectangle = false
end type

type st_3 from statictext within w_asymmetricsign
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

type mle_5 from multilineedit within w_asymmetricsign
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

type st_1 from statictext within w_asymmetricsign
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

type mle_1 from multilineedit within w_asymmetricsign
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

