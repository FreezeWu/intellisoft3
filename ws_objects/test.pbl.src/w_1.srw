$PBExportHeader$w_1.srw
forward
global type w_1 from window
end type
type dw_1 from datawindow within w_1
end type
type rte_1 from richtextedit within w_1
end type
end forward

global type w_1 from window
integer width = 3566
integer height = 1648
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
rte_1 rte_1
end type
global w_1 w_1

on w_1.create
this.dw_1=create dw_1
this.rte_1=create rte_1
this.Control[]={this.dw_1,&
this.rte_1}
end on

on w_1.destroy
destroy(this.dw_1)
destroy(this.rte_1)
end on

type dw_1 from datawindow within w_1
integer x = 379
integer y = 792
integer width = 1458
integer height = 588
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rte_1 from richtextedit within w_1
integer x = 366
integer y = 64
integer width = 1458
integer height = 572
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

