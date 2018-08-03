$PBExportHeader$w_viewresult.srw
forward
global type w_viewresult from w_base
end type
type cb_close from commandbutton within w_viewresult
end type
type cb_compare from commandbutton within w_viewresult
end type
type cb_update from commandbutton within w_viewresult
end type
type mle_expect from multilineedit within w_viewresult
end type
type mle_real from multilineedit within w_viewresult
end type
type gb_real from groupbox within w_viewresult
end type
type gb_expect from groupbox within w_viewresult
end type
end forward

global type w_viewresult from w_base
integer width = 3776
integer height = 1888
string title = "ViewResult"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_close cb_close
cb_compare cb_compare
cb_update cb_update
mle_expect mle_expect
mle_real mle_real
gb_real gb_real
gb_expect gb_expect
end type
global w_viewresult w_viewresult

type variables
string is_real,is_exp
end variables

forward prototypes
public subroutine wf_getvalue ()
end prototypes

public subroutine wf_getvalue ();//====================================================================
// 
//   function name : wf_getvalue
//
//   Description:
//	                从文件中获取期望值和实际值
//				   
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-08
//====================================================================
long ll_exp,ll_real
string ls_exp,ls_real

//获取实际值数据
ll_real = fileopen(is_real,textmode!,read!)
filereadex(ll_real,ls_real)
mle_real.text = ls_real
fileclose(ll_real)


//获取期望值数据
ll_exp = fileopen(is_exp,textmode!,read!)
filereadex(ll_exp,ls_exp)
mle_expect.text = ls_exp
fileclose(ll_exp)
end subroutine

on w_viewresult.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_compare=create cb_compare
this.cb_update=create cb_update
this.mle_expect=create mle_expect
this.mle_real=create mle_real
this.gb_real=create gb_real
this.gb_expect=create gb_expect
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_compare
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.mle_expect
this.Control[iCurrent+5]=this.mle_real
this.Control[iCurrent+6]=this.gb_real
this.Control[iCurrent+7]=this.gb_expect
end on

on w_viewresult.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_compare)
destroy(this.cb_update)
destroy(this.mle_expect)
destroy(this.mle_real)
destroy(this.gb_real)
destroy(this.gb_expect)
end on

event open;call super::open;string ls_message
ls_message = message.stringparm
is_real = mid(ls_message,pos(ls_message,",")+1)
is_exp = mid(ls_message,1,pos(ls_message,",") - 1)

wf_getvalue()
end event

type cb_close from commandbutton within w_viewresult
integer x = 2318
integer y = 1636
integer width = 457
integer height = 128
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_compare from commandbutton within w_viewresult
integer x = 1577
integer y = 1640
integer width = 457
integer height = 128
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Compare"
end type

event clicked;//使用compare工具比较期望值
string ls_beyond,ls_key[]
long ll_rtn

//从注册表获取compare的执行路局
ll_rtn = Registryget("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\BeyondCompare.Snapshot\shell\open\command","",regstring!,ls_beyond)
if pos(ls_beyond,"%1") > 0 then
	ls_beyond = mid(ls_beyond,1,pos(ls_beyond,"%1") - 2)
end if

//通过compare工具比较结果
run(ls_beyond +' "'+is_real+'" "'+is_exp+'"')


end event

type cb_update from commandbutton within w_viewresult
integer x = 791
integer y = 1640
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Updateexp"
end type

event clicked;long ll_exp
string ls_exp

//弹出对话框，由用户确认是否更新
if messagebox("Question","Are you sure to update expvale?",question!,yesno!,1) = 2 then return

//根据实际值更新期望值
ls_exp = mle_real.text
ll_exp = fileopen(is_exp,textmode!,write!,shared!,replace!,encodingutf8!)
filewriteex(ll_exp,ls_exp)
mle_expect.text = ls_exp
fileclose(ll_exp)
end event

type mle_expect from multilineedit within w_viewresult
integer x = 1870
integer y = 96
integer width = 1851
integer height = 1472
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_real from multilineedit within w_viewresult
integer x = 18
integer y = 92
integer width = 1787
integer height = 1484
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_real from groupbox within w_viewresult
integer width = 1829
integer height = 1608
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "RealValue"
end type

type gb_expect from groupbox within w_viewresult
integer x = 1833
integer width = 1906
integer height = 1608
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ExpectValue"
end type

