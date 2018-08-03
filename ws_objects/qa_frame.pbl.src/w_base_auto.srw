$PBExportHeader$w_base_auto.srw
forward
global type w_base_auto from w_base
end type
type dw_compare from datawindow within w_base_auto
end type
type st_desc from statictext within w_base_auto
end type
type cb_compare from commandbutton within w_base_auto
end type
type mle_output from multilineedit within w_base_auto
end type
type cb_close from commandbutton within w_base_auto
end type
type cb_clear from commandbutton within w_base_auto
end type
type cb_result from commandbutton within w_base_auto
end type
type cb_exe from commandbutton within w_base_auto
end type
type cb_auto from commandbutton within w_base_auto
end type
type mle_script from multilineedit within w_base_auto
end type
type lb_testcase from listbox within w_base_auto
end type
type mle_desc from multilineedit within w_base_auto
end type
type gb_desc from groupbox within w_base_auto
end type
type gb_testcase from groupbox within w_base_auto
end type
type gb_script from groupbox within w_base_auto
end type
type gb_output from groupbox within w_base_auto
end type
end forward

global type w_base_auto from w_base
integer width = 3374
integer height = 2492
string title = "auto_frame"
windowstate windowstate = maximized!
event ue_runall ( )
dw_compare dw_compare
st_desc st_desc
cb_compare cb_compare
mle_output mle_output
cb_close cb_close
cb_clear cb_clear
cb_result cb_result
cb_exe cb_exe
cb_auto cb_auto
mle_script mle_script
lb_testcase lb_testcase
mle_desc mle_desc
gb_desc gb_desc
gb_testcase gb_testcase
gb_script gb_script
gb_output gb_output
end type
global w_base_auto w_base_auto

type variables
string is_testcaselist  //Testcase测试列表，不同的testcase以","分割
string is_testpurpose //案例测试目的描述
string is_realfile,is_expfile  //自动化结果存放的文件
string is_realvalue  //用于记录时时的运行结果
end variables

forward prototypes
public function integer wf_additem (string as_testitem)
public subroutine wf_description ()
public subroutine wf_output (string as_msg, boolean ab_clear)
public subroutine wf_scriptview (string as_script)
public subroutine wf_init ()
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public function integer wf_saveresult (string as_result)
end prototypes

event ue_runall();//====================================================================
// 
//   event name : ue_runall
//
//   Description:
//	                自动化执行所有测试点
//
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-08
//====================================================================
integer i  //循环参数

//循环执行所有测试点
for i = 1 to lb_testcase.TotalItems()
     mle_script.text = ''
	 lb_testcase.selectitem(i)
	 wf_ScriptExe(i, false)
	 wf_ScriptExe(i, true)	
	 is_realvalue += mle_output.text
next

//将结果记录到txt中
wf_saveresult(is_realvalue)


end event

public function integer wf_additem (string as_testitem);//====================================================================
// 
//   function name : wf_additem
//
//   Description:
//	                将相应的测试点加入到测试点列表
//				   
//
//   Argument：
//				   string as_testitem  以逗号分割的字符串
//		            		   
//
//   Return ：  (integer)
//                     1，succeed
//                    -1，failed
//
//   Modify Date：2018-01-31
//====================================================================
//判断参数
if isnull(as_testitem) or trim(as_testitem) = "" then
	return -1
end if

//将测试点加入到listbox
string ls_testcase[]
long ll_loop
ieon_resize.of_stringtoarray(as_testitem,ls_testcase,",")

for ll_loop = 1 to upperbound(ls_testcase)
	lb_testcase.additem(ls_testcase[ll_loop])
next

return 1
end function

public subroutine wf_description ();//====================================================================
// 
//   function name : wf_description
//
//   Description:
//	                 初始化自动化案例的描述信息
//				   
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-08
//====================================================================

mle_desc.text  = "1.Test Window : "
mle_desc.text +=  Classname() + "~r~n" //This Must be the First output
mle_desc.text += "2.Testing Purpose : " // This must include
mle_desc.text +=  is_testpurpose+"~r~n" 
end subroutine

public subroutine wf_output (string as_msg, boolean ab_clear);//====================================================================
// 
//   function name : wf_output
//
//   Description:
//	                将输出信息输出到output下展示
//				   
//
//   Argument：
//				   string  as_msg   要输出的output信息
//		            boolean ab_clear  是否情况原有的输出信息，True-清空；False-保留		   
//
//   Return ：  (None)
//
//   Modify Date：2018-01-31
//====================================================================

//判断参数的合法性
if isnull(as_msg) or trim(as_msg) = '' then
	return
end if

if ab_clear then
	mle_output.text = ''	
end if
mle_output.text += as_msg+"~r~n"



end subroutine

public subroutine wf_scriptview (string as_script);//====================================================================
// 
//   function name : wf_scriptview
//
//   Description:
//	                将脚本信息输出到scriptview下
//				   
//
//   Argument：
//				   string  as_script   脚本描述信息
//		          	   
//
//   Return ：  (None)
//
//   Modify Date：2018-02-01
//====================================================================
//判断参数的合法性
if isnull(as_script) or trim(as_script) = '' then
	return
end if

mle_script.Text += as_script + "~r~n"


end subroutine

public subroutine wf_init ();//====================================================================
// 
//   function name : wf_init
//
//   Description:
//	                 初始化自动化案例所有变量信息
//				   
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-08
//====================================================================

//测试点列表
is_testcaselist = "test1,test2"

//初始化结果集文件
is_expfile = "exp.txt"
is_realfile = "real.txt"

//清空运行值
is_realvalue = ""

//设置测试总体描述
is_testpurpose = ""
end subroutine

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//====================================================================
// 
//   function name : wf_scriptexe
//
//   Description:
//	                执行各个测试点
//				   
//
//   Argument：
//				   integer  ai_item    Testcase中的测试点序号
//		            boolean ab_execute  是执行还是预览代码  
//
//   Return ：  (None)
//
//   Modify Date：2018-01-31
//====================================================================
string ls_item,ls_value

//判断参数的合法性
if ai_item <= 0 then 
	return
end if

//获取测试点名称
ls_item = lb_testcase.text(ai_item)

//记录输出日志的起点
if ab_execute then
	wf_output("Begin "+ls_item,true)
end if

//执行相对性的测试点代码
choose case ls_item
	case "test1"
		if ab_execute then
			//举例测试classname
			ls_value = this.classname( )
			wf_output("this.classname() = "+ls_value,false)
		else
			wf_scriptview('//举例测试classname   ')
			wf_scriptview('ls_value = this.classname( )   ')
			wf_scriptview('wf_output("this.classname() = "+ls_value,false)   ')
		end if
	case else
		messagebox("Info","测试点"+ls_item+"没有维护代码")
end choose

//测试点执行结束
if ab_execute then
	wf_output("End "+ls_item,false)
end if
end subroutine

public function integer wf_saveresult (string as_result);//====================================================================
// 
//   function name : wf_saveresult
//
//   Description:
//	                将时时的运行结果存入到文件中，方便结果比较
//				   
//
//   Argument：
//				   string as_result  测试点运行的实际结果
//		            		   
//
//   Return ：  (integer)
//                     1，succeed
//                    -1，failed
//
//   Modify Date：2018-01-31
//====================================================================
//判断参数
if isnull(as_result) or trim(as_result) = "" then
	return -1
end if

//将结果记录到时时文件中
long ll_file //文件句柄

//如果已存在同名文件，先删除
if fileexists(is_realfile) then
	filedelete(is_realfile)
end if

//打开文件，并写入测试结果
ll_file = fileopen(is_realfile,textmode!,write!,shared!,replace!,encodingutf8!)
if ll_file <= 0 then
	return -1
end if
filewriteex(ll_file,as_result)

//关闭文件，返回成功
fileclose(ll_file)
return 1
end function

on w_base_auto.create
int iCurrent
call super::create
this.dw_compare=create dw_compare
this.st_desc=create st_desc
this.cb_compare=create cb_compare
this.mle_output=create mle_output
this.cb_close=create cb_close
this.cb_clear=create cb_clear
this.cb_result=create cb_result
this.cb_exe=create cb_exe
this.cb_auto=create cb_auto
this.mle_script=create mle_script
this.lb_testcase=create lb_testcase
this.mle_desc=create mle_desc
this.gb_desc=create gb_desc
this.gb_testcase=create gb_testcase
this.gb_script=create gb_script
this.gb_output=create gb_output
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_compare
this.Control[iCurrent+2]=this.st_desc
this.Control[iCurrent+3]=this.cb_compare
this.Control[iCurrent+4]=this.mle_output
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_clear
this.Control[iCurrent+7]=this.cb_result
this.Control[iCurrent+8]=this.cb_exe
this.Control[iCurrent+9]=this.cb_auto
this.Control[iCurrent+10]=this.mle_script
this.Control[iCurrent+11]=this.lb_testcase
this.Control[iCurrent+12]=this.mle_desc
this.Control[iCurrent+13]=this.gb_desc
this.Control[iCurrent+14]=this.gb_testcase
this.Control[iCurrent+15]=this.gb_script
this.Control[iCurrent+16]=this.gb_output
end on

on w_base_auto.destroy
call super::destroy
destroy(this.dw_compare)
destroy(this.st_desc)
destroy(this.cb_compare)
destroy(this.mle_output)
destroy(this.cb_close)
destroy(this.cb_clear)
destroy(this.cb_result)
destroy(this.cb_exe)
destroy(this.cb_auto)
destroy(this.mle_script)
destroy(this.lb_testcase)
destroy(this.mle_desc)
destroy(this.gb_desc)
destroy(this.gb_testcase)
destroy(this.gb_script)
destroy(this.gb_output)
end on

event ue_setflag;call super::ue_setflag;//====================================================================
// 
//   event name : ue_setflag
//
//   Description:
//	                 自定义resize控件逻辑，resize通过字符串控制
//				   "1111" 分别对应"X","Y","Width","Height"
//                   X/Y:0 - Keeps unchanged; 1 - Changes proportionally; 2 - Moves to right horizontally.
//                   width: 0 - Keeps unchanged; 1 - Changes proportionally; 2 - Extends to right horizontally; 
//                             3 - Extends to left horizontally; 4 - Extends to right edge; 5 - Extends to left edge.
//                  Height: 0 - Keeps unchanged; 1 - Changes proportionally; 2 - Extends down vertically; 
//					         3 - Extends up vertically; 4 - Extends to the bottom; 5 - Extends to the top.
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-01-30
//====================================================================
//保持不变
ieon_resize.of_setflag(gb_desc,"0000")
ieon_resize.of_setflag(mle_desc,"0000")
//向下拉伸
ieon_resize.of_setflag(gb_testcase,"0002")
ieon_resize.of_setflag(lb_testcase,"0002")
//向右拉伸
ieon_resize.of_setflag(gb_script,"0020")
ieon_resize.of_setflag(mle_script,"0020")
ieon_resize.of_setflag(dw_compare,"0020")
//向下向右拉伸
ieon_resize.of_setflag(gb_output,"0022")
ieon_resize.of_setflag(mle_output,"0022")
//向右延伸
ieon_resize.of_setflag(cb_auto,"2000")
ieon_resize.of_setflag(cb_exe,"2000")
ieon_resize.of_setflag(cb_compare,"2000")
ieon_resize.of_setflag(cb_result,"2000")
ieon_resize.of_setflag(cb_clear,"2000")
ieon_resize.of_setflag(cb_close,"2000")
ieon_resize.of_setflag(st_desc,"2000")

end event

event open;call super::open;//初始化测试点列表信息
wf_init()  
wf_additem(is_testcaselist)

//初始化测试案例描述信息
wf_description()

//初始化提醒信息
st_desc.text = "自动执行保存结果以后，可以单独执行，而后点击compare比较"
end event

type dw_compare from datawindow within w_base_auto
boolean visible = false
integer x = 1394
integer y = 84
integer width = 1362
integer height = 988
integer taborder = 40
boolean titlebar = true
string title = "Compare"
string dataobject = "d_compare"
boolean controlmenu = true
boolean maxbox = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type st_desc from statictext within w_base_auto
integer x = 2834
integer y = 36
integer width = 453
integer height = 460
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_compare from commandbutton within w_base_auto
integer x = 2821
integer y = 1504
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Compare"
end type

event clicked;//获取期望值和实际值，并通过datawindow展示
string ls_exp,ls_real,ls_expall
string ls_testcase,ls_start,ls_end
long ll_index,ll_start,ll_end
long ll_file

//获取实际值
ls_real = mle_output.text
if len(trim(ls_real)) = 0 then
	messagebox("warning","请先单独执行一个测试点",exclamation!)
	return
end if

//获取当前测试点
ll_index = lb_testcase.selectedindex()
ls_testcase = lb_testcase.text(ll_index)

//读取所有期望值信息
ll_file = fileopen(is_expfile,textmode!,read!)
filereadex(ll_file,ls_expall)
fileclose(ll_file)

//截取数据
ls_start = "begin "+ls_testcase
ll_start = pos(ls_expall,ls_start)
if ll_start = 0 then
	messagebox("Failed","在期望值中未找到"+ls_testcase+"的相关信息")
end if
ls_expall = mid(ls_expall,ll_start)
ls_end = "end "+ls_testcase
ll_end = pos(ls_expall,ls_end)+len(ls_end) - 1
ls_exp = mid(ls_expall,1,ll_end) 

//展示数据
dw_compare.visible=true
dw_compare.reset()
dw_compare.insertrow(0)
dw_compare.setitem(1,"s_real",ls_real)
dw_compare.setitem(1,"s_exp",ls_exp)






end event

type mle_output from multilineedit within w_base_auto
integer x = 1390
integer y = 1180
integer width = 1371
integer height = 1172
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_close from commandbutton within w_base_auto
integer x = 2821
integer y = 2084
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;//退出当前窗体
close(parent)
end event

type cb_clear from commandbutton within w_base_auto
integer x = 2821
integer y = 1796
integer width = 457
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;//清楚输出和预览区
mle_output.text = ""
mle_script.text = ""
end event

type cb_result from commandbutton within w_base_auto
integer x = 2821
integer y = 928
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Result"
end type

event clicked;//比较测试结果
string ls_pass
ls_pass = is_expfile +","+is_realfile

openwithparm(w_viewresult,ls_pass)
end event

type cb_exe from commandbutton within w_base_auto
integer x = 2821
integer y = 1220
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute"
end type

event clicked;//执行单个测试点
long ll_index

//获取当前测试点
ll_index = lb_testcase.selectedindex()

//判断是否选择了要执行的测试点
IF not  ll_index> 0 THEN
	MessageBox("Warning","Please select a test item")
	return 
END IF

//预览并执行当前测试点
mle_script.text = ''
wf_Scriptexe(ll_index,False)
wf_Scriptexe(ll_index,True)
end event

type cb_auto from commandbutton within w_base_auto
integer x = 2821
integer y = 636
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "AutoExe"
end type

event clicked;//重新初始化实际值
is_realvalue = ""

//自动执行所有测试点
parent.event ue_runall()

end event

type mle_script from multilineedit within w_base_auto
integer x = 1390
integer y = 84
integer width = 1371
integer height = 984
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type lb_testcase from listbox within w_base_auto
integer x = 18
integer y = 1176
integer width = 1321
integer height = 1180
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//判断参数
if index = 0 then
	return 
end if

//清空script和output信息
mle_output.text = ""
mle_script.text = ""

//预览代码的执行
wf_scriptexe(this.selectitem(index),false)
end event

event doubleclicked;//判断参数
if index = 0 then
	return
end if

//执行当前测试点
wf_Scriptexe(this.selectedindex(),True)
end event

type mle_desc from multilineedit within w_base_auto
integer x = 18
integer y = 84
integer width = 1326
integer height = 988
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_desc from groupbox within w_base_auto
integer width = 1367
integer height = 1092
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Description"
end type

type gb_testcase from groupbox within w_base_auto
integer y = 1100
integer width = 1367
integer height = 1272
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Testcase"
end type

type gb_script from groupbox within w_base_auto
integer x = 1371
integer width = 1413
integer height = 1092
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Scriptview"
end type

type gb_output from groupbox within w_base_auto
integer x = 1371
integer y = 1100
integer width = 1413
integer height = 1272
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output"
end type

