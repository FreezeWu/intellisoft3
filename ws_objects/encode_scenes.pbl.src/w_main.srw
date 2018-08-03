$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_8 from commandbutton within w_main
end type
type cb_6 from commandbutton within w_main
end type
type cbx_1 from checkbox within w_main
end type
type cb_7 from commandbutton within w_main
end type
type cb_5 from commandbutton within w_main
end type
type cb_4 from commandbutton within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 1399
integer height = 1328
boolean titlebar = true
string title = "PB Encode Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_8 cb_8
cb_6 cb_6
cbx_1 cbx_1
cb_7 cb_7
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_main w_main

on w_main.create
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cbx_1=create cbx_1
this.cb_7=create cb_7
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_8,&
this.cb_6,&
this.cbx_1,&
this.cb_7,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_main.destroy
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cbx_1)
destroy(this.cb_7)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

type cb_8 from commandbutton within w_main
integer x = 402
integer y = 1032
integer width = 567
integer height = 100
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OAuth2.0"
end type

event clicked;Open( w_appeon )
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cb_6 from commandbutton within w_main
integer x = 402
integer y = 912
integer width = 567
integer height = 100
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Sign/VerifySign"
end type

event clicked;Open ( w_asymmetricsign )
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cbx_1 from checkbox within w_main
integer x = 434
integer y = 60
integer width = 507
integer height = 72
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "打开后关闭主菜单"
boolean checked = true
end type

type cb_7 from commandbutton within w_main
integer x = 402
integer y = 792
integer width = 567
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "RSA Encode/Decode"
end type

event clicked;Open(w_asymmetric)
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cb_5 from commandbutton within w_main
integer x = 434
integer y = 672
integer width = 507
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Encode BigBlob"
end type

event clicked;Open ( w_bigblob )
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cb_4 from commandbutton within w_main
integer x = 325
integer y = 432
integer width = 722
integer height = 100
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT(RS256 RS384 RS512)"
end type

event clicked;Open ( w_jwt_rs )
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cb_3 from commandbutton within w_main
integer x = 320
integer y = 312
integer width = 736
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "JWT(HS256 HS384 HS512)"
end type

event clicked;Open ( w_jwt_hs )
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cb_2 from commandbutton within w_main
integer x = 434
integer y = 552
integer width = 507
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Encode Memory"
end type

event clicked;Open ( w_memory )
If cbx_1.checked Then
	Close ( parent )
End If
end event

type cb_1 from commandbutton within w_main
integer x = 434
integer y = 192
integer width = 507
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Amazon AWS"
end type

event clicked;Open ( w_amazon_aws )
If cbx_1.checked Then
	Close ( parent )
End If
end event

