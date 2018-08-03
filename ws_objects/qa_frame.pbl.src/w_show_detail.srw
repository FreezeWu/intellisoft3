$PBExportHeader$w_show_detail.srw
forward
global type w_show_detail from window
end type
type cb_1 from commandbutton within w_show_detail
end type
type mle_des from multilineedit within w_show_detail
end type
end forward

global type w_show_detail from window
integer width = 2971
integer height = 1840
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
mle_des mle_des
end type
global w_show_detail w_show_detail

on w_show_detail.create
this.cb_1=create cb_1
this.mle_des=create mle_des
this.Control[]={this.cb_1,&
this.mle_des}
end on

on w_show_detail.destroy
destroy(this.cb_1)
destroy(this.mle_des)
end on

event open;//主要用于移动设备下展示详细信息

string ls_msg

//接收传递的展示信息
ls_msg = message.stringparm

mle_des.text = ls_msg
end event

type cb_1 from commandbutton within w_show_detail
integer x = 1097
integer y = 1628
integer width = 457
integer height = 132
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
end type

event clicked;close(parent)
end event

type mle_des from multilineedit within w_show_detail
integer width = 2962
integer height = 1604
integer taborder = 10
integer textsize = -12
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

