$PBExportHeader$w_base_manu.srw
forward
global type w_base_manu from w_base
end type
type lb_parm from listbox within w_base_manu
end type
type mle_scriptview from multilineedit within w_base_manu
end type
type mle_detail from multilineedit within w_base_manu
end type
type cb_close from commandbutton within w_base_manu
end type
type cb_help from statictext within w_base_manu
end type
type mle_des from multilineedit within w_base_manu
end type
type cb_execute from commandbutton within w_base_manu
end type
type cb_clear from commandbutton within w_base_manu
end type
type cb_set from commandbutton within w_base_manu
end type
type mle_parm from multilineedit within w_base_manu
end type
type ddlb_parm from dropdownlistbox within w_base_manu
end type
type cb_export from statictext within w_base_manu
end type
type mle_output from multilineedit within w_base_manu
end type
type lb_testcase from listbox within w_base_manu
end type
type gb_testcase from groupbox within w_base_manu
end type
type gb_output from groupbox within w_base_manu
end type
type gb_parm from groupbox within w_base_manu
end type
type gb_des from groupbox within w_base_manu
end type
type gb_detail from groupbox within w_base_manu
end type
type gb_scriptview from groupbox within w_base_manu
end type
end forward

global type w_base_manu from w_base
integer width = 4416
integer height = 2304
string title = "base_manu"
windowstate windowstate = maximized!
event ue_postopen ( )
lb_parm lb_parm
mle_scriptview mle_scriptview
mle_detail mle_detail
cb_close cb_close
cb_help cb_help
mle_des mle_des
cb_execute cb_execute
cb_clear cb_clear
cb_set cb_set
mle_parm mle_parm
ddlb_parm ddlb_parm
cb_export cb_export
mle_output mle_output
lb_testcase lb_testcase
gb_testcase gb_testcase
gb_output gb_output
gb_parm gb_parm
gb_des gb_des
gb_detail gb_detail
gb_scriptview gb_scriptview
end type
global w_base_manu w_base_manu

type variables
public:
string is_testcaselist  //Testcase测试列表，不同的testcase以","分割
string is_parmlist      //Testcase的参数列表，不同参数以","分割
end variables

forward prototypes
public function string wf_help ()
public subroutine wf_output (string as_msg, boolean ab_clear)
public subroutine wf_des (string as_msg)
public function integer wf_additem (powerobject ap_object, string as_list)
public subroutine wf_init ()
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public subroutine wf_scriptview (string as_script)
public subroutine wf_showscript (boolean ab_showdetail, boolean ab_showview)
public subroutine wf_testcase_desc (string as_testcase)
public subroutine wf_parm_setdefault (string as_parm)
public subroutine wf_parm_setvalue ()
end prototypes

event ue_postopen();//需要异步触发的脚本，可以写入到该事件下


//初始化mdi的help信息
if isvalid(w_mdi) then
	w_mdi.setmicrohelp(this.title)
end if
end event

public function string wf_help ();//====================================================================
// 
//   function name : wf_help
//
//   Description:
//	                 输出help信息，供cb_help调用，在子对象中重写该函数
//				   
//
//   Argument：(None)
//				   
//
//   Return ：  (string)
//
//   Modify Date：2018-01-30
//====================================================================


string ls_help=''


return ls_help
end function

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
	mle_detail.text = ""
end if
mle_output.text += as_msg+"~r~n"

//同时加入detail
mle_detail.text += as_msg+"~r~n"

end subroutine

public subroutine wf_des (string as_msg);//====================================================================
// 
//   function name : wf_des
//
//   Description:
//	                将描述信息输出到description下
//				   
//
//   Argument：
//				   string  as_msg   要展示的描述信息
//		          	   
//
//   Return ：  (None)
//
//   Modify Date：2018-01-31
//====================================================================
//判断参数的合法性
if isnull(as_msg) or trim(as_msg) = '' then
	return
end if

mle_des.text = as_msg
end subroutine

public function integer wf_additem (powerobject ap_object, string as_list);//====================================================================
// 
//   function name : wf_additem
//
//   Description:
//	                将相应的数据插入到ddlb或listbox
//				   
//
//   Argument：
//				   powerobject  ap_object   listobject 或dropdownlistbox
//		            string as_list  以逗号分割的字符串		   
//
//   Return ：  (integer)
//                     1，succeed
//                    -1，failed
//
//   Modify Date：2018-01-31
//====================================================================

long  ll_loop,ll_item,ll_int
string ls_item[] //将传入的字符串根据逗号拆分到该数组变量中
listbox lb_tmp
dropdownlistbox  lddlb_tmp

//参数合法性判断
if not isvalid(ap_object) then
	return -1
end if
if isnull(as_list) or trim(as_list) = '' then
	return -1
end if

//将数据转化为数组
ieon_resize.of_stringtoarray( as_list, ls_item,",")

choose case ap_object.typeof()
	case listbox!
		lb_tmp = ap_object
		lb_tmp.reset()
		for ll_loop = 1 to upperbound(ls_item)
			lb_tmp.additem(ls_item[ll_loop])
		next
	case dropdownlistbox!
		lddlb_tmp = ap_object
		lddlb_tmp.reset()
		for ll_loop = 1 to upperbound(ls_item)
			lddlb_tmp.additem(ls_item[ll_loop])
		next
end choose

return 1



end function

public subroutine wf_init ();//====================================================================
// 
//   function name : wf_init
//
//   Description:
//	                 初始化Testcase列表，在子对象中重写该函数
//				   
//
//   Argument：(None)
//				   
//
//   Return ：  (string)
//
//   Modify Date：2018-01-30
//====================================================================

//初始化函数列表,多个函数通过逗号分割
is_testcaselist = "test1,test2,test3"
wf_additem(lb_testcase,is_testcaselist)
end subroutine

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//====================================================================
// 
//   function name : wf_scriptexe
//
//   Description:
//	                执行各个测试点，子对象需要重写该函数
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

mle_scriptview.Text += as_script + "~r~n"


end subroutine

public subroutine wf_showscript (boolean ab_showdetail, boolean ab_showview);//====================================================================
// 
//   function name : wf_showscript
//
//   Description:
//	                是否展示脚本区
//				   
//
//   Argument：
//				   Boolean  ab_showdetail   true,展示detail；false,不展示detail
//                   Booealn  ab_showview   true,展示view；false,不展示view
//		          	   
//
//   Return ：  (None)
//
//   Modify Date：2018-01-31
//====================================================================
//判断参数
if isnull(ab_showview) or isnull(ab_showdetail) then
	return
end if

//控制控件
gb_detail.visible = ab_showdetail
mle_detail.visible = ab_showdetail
gb_scriptview.visible = ab_showview
mle_scriptview.visible = ab_showview

end subroutine

public subroutine wf_testcase_desc (string as_testcase);//====================================================================
// 
//   function name : wf_testcase_desc
//
//   Description:
//	                在测试用例列表中调用该函数，输出各测试点的相关描述信息，子对象中重写该方法
//				   
//
//   Argument：
//				   string  as_testcase   测试点名称
//		          	   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-05
//====================================================================
string ls_desc   //测试点相关的描述信息
//判断参数的合法性
if isnull(as_testcase) or trim(as_testcase) = '' then
	return
end if
//匹配各测试点
choose case as_testcase
	case "test1"
		ls_desc = "测试用例，用例测试classname函数"
		is_parmlist = "parm1,parm2,parm3"  //测试参数列表
	case else
		//
end choose

//输出描述信息
if trim(ls_desc)<>'' then
	wf_des(ls_desc)
end if



end subroutine

public subroutine wf_parm_setdefault (string as_parm);//====================================================================
// 
//   function name : wf_parm_setdefault
//
//   Description:
//	                设置部分参数的默认值
//				   
//
//   Argument：
//				   string  as_parm   参数名称
//		          	   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-05
//====================================================================
string ls_default   //测试的默认可供测试数据
//判断参数的合法性
if isnull(as_parm) or trim(as_parm) = '' then
	return
end if
//匹配相应的参数列表
choose case as_parm
	case "parm1"
		ls_default = "value1,value2,value3"
	case else
		//
end choose

//将默认数据输出到参数数据列表
if trim(ls_default)<>'' then
	wf_additem(lb_parm,ls_default)
end if



end subroutine

public subroutine wf_parm_setvalue ();//====================================================================
// 
//   function name : wf_parm_setvalue
//
//   Description:
//	                设置参数的具体数值
//				   
//
//   Argument：(None)
//				   
//		          	   
//
//   Return ：  (None)
//
//   Modify Date：2018-03-05
//====================================================================
string ls_parm  //参数名程
string ls_value //参数值

//获取测试数据
ls_parm = ddlb_parm.text
ls_value = mle_parm.text

//匹配相应的测试参数
choose case ls_parm
	case "parm1"
		//---------设置数据到相应的实例变量
	case else
		//
		
end choose

//输出设置的参数值信息
wf_output(ls_parm+" was set to be "+ls_value,false)

end subroutine

on w_base_manu.create
int iCurrent
call super::create
this.lb_parm=create lb_parm
this.mle_scriptview=create mle_scriptview
this.mle_detail=create mle_detail
this.cb_close=create cb_close
this.cb_help=create cb_help
this.mle_des=create mle_des
this.cb_execute=create cb_execute
this.cb_clear=create cb_clear
this.cb_set=create cb_set
this.mle_parm=create mle_parm
this.ddlb_parm=create ddlb_parm
this.cb_export=create cb_export
this.mle_output=create mle_output
this.lb_testcase=create lb_testcase
this.gb_testcase=create gb_testcase
this.gb_output=create gb_output
this.gb_parm=create gb_parm
this.gb_des=create gb_des
this.gb_detail=create gb_detail
this.gb_scriptview=create gb_scriptview
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_parm
this.Control[iCurrent+2]=this.mle_scriptview
this.Control[iCurrent+3]=this.mle_detail
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_help
this.Control[iCurrent+6]=this.mle_des
this.Control[iCurrent+7]=this.cb_execute
this.Control[iCurrent+8]=this.cb_clear
this.Control[iCurrent+9]=this.cb_set
this.Control[iCurrent+10]=this.mle_parm
this.Control[iCurrent+11]=this.ddlb_parm
this.Control[iCurrent+12]=this.cb_export
this.Control[iCurrent+13]=this.mle_output
this.Control[iCurrent+14]=this.lb_testcase
this.Control[iCurrent+15]=this.gb_testcase
this.Control[iCurrent+16]=this.gb_output
this.Control[iCurrent+17]=this.gb_parm
this.Control[iCurrent+18]=this.gb_des
this.Control[iCurrent+19]=this.gb_detail
this.Control[iCurrent+20]=this.gb_scriptview
end on

on w_base_manu.destroy
call super::destroy
destroy(this.lb_parm)
destroy(this.mle_scriptview)
destroy(this.mle_detail)
destroy(this.cb_close)
destroy(this.cb_help)
destroy(this.mle_des)
destroy(this.cb_execute)
destroy(this.cb_clear)
destroy(this.cb_set)
destroy(this.mle_parm)
destroy(this.ddlb_parm)
destroy(this.cb_export)
destroy(this.mle_output)
destroy(this.lb_testcase)
destroy(this.gb_testcase)
destroy(this.gb_output)
destroy(this.gb_parm)
destroy(this.gb_des)
destroy(this.gb_detail)
destroy(this.gb_scriptview)
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
//向下拉伸控件
ieon_resize.of_setflag(gb_testcase,"0002")
ieon_resize.of_setflag(lb_testcase,"0002")
ieon_resize.of_setflag(gb_des,"0002")
ieon_resize.of_setflag(mle_des,"0002")

//向下平移，向右延伸
ieon_resize.of_setflag(gb_output,"0220")
ieon_resize.of_setflag(mle_output,"0220")
ieon_resize.of_setflag(gb_scriptview,"0220")
ieon_resize.of_setflag(mle_scriptview,"0220")

//向下向右拉伸
ieon_resize.of_setflag(gb_detail,"0022")
ieon_resize.of_setflag(mle_detail,"0022")

//向下平移的控件
ieon_resize.of_setflag(gb_parm,"0200")
ieon_resize.of_setflag(lb_parm,"0200")
ieon_resize.of_setflag(ddlb_parm,"0200")
ieon_resize.of_setflag(mle_parm,"0200")
ieon_resize.of_setflag(cb_set,"0200")
ieon_resize.of_setflag(cb_clear,"0200")
ieon_resize.of_setflag(cb_execute,"0200")
ieon_resize.of_setflag(cb_close,"0200")

//向下向左平移的控件
ieon_resize.of_setflag(cb_export,"2200")
ieon_resize.of_setflag(cb_help,"2200")
end event

event close;call super::close;//删除临时产生的文件
if fileexists("tmp.log") then
	filedelete("tmp.log")
end if


//重新初始化mdi的help信息
if isvalid(w_mdi) then
	w_mdi.setmicrohelp("Ready")
end if
end event

event open;call super::open;//初始化函数列表
wf_init()

//触发异步事件
this.postevent( "ue_postopen")



end event

type lb_parm from listbox within w_base_manu
integer x = 1198
integer y = 896
integer width = 1454
integer height = 536
integer taborder = 50
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

event selectionchanged;//选择参数以后，自动将参数赋值到mle控件

//判断参数
if index = 0 then
	return
end if

mle_parm.text = this.text(index)


//自动执行
cb_set.triggerevent(clicked!)
end event

type mle_scriptview from multilineedit within w_base_manu
boolean visible = false
integer x = 2720
integer y = 924
integer width = 1632
integer height = 880
integer taborder = 40
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

type mle_detail from multilineedit within w_base_manu
boolean visible = false
integer x = 2711
integer y = 80
integer width = 1650
integer height = 716
integer taborder = 40
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

type cb_close from commandbutton within w_base_manu
integer x = 2336
integer y = 1672
integer width = 320
integer height = 132
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_help from statictext within w_base_manu
integer x = 4187
integer y = 2072
integer width = 142
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "?"
alignment alignment = center!
boolean border = true
long bordercolor = 8421504
boolean focusrectangle = false
end type

event clicked;//====================================================================
// 
//   event name : clicked
//
//   Description:
//	                 将help信息输出到TXT，以便用户查看
//				  
//
//   Argument：(None)
//				   
//
//   Return ：  (long)
//
//   Modify Date：2018-01-30
//====================================================================
string ls_file   //临时文件名
long ll_return
long ll_file                //书写文件时使用的句柄
string ls_help

ls_file = "tmp.log"

//将输出信息保存到选择的文件中
ll_file = fileopen(ls_file,streammode!,write!,shared!,replace!,encodingutf8!)

ls_help = wf_help()
filewrite(ll_file,ls_help)

//关闭文件
fileclose(ll_file)

//if appeongetclienttype() <> "MOBILD" then
//	//查看help文件
//	run("Notepad.exe "+ls_file)
//else
//	//移动设备下不支持记事本
//	openwithparm(w_show_detail,ls_help)
//end if



end event

type mle_des from multilineedit within w_base_manu
integer x = 1184
integer y = 84
integer width = 1454
integer height = 600
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

type cb_execute from commandbutton within w_base_manu
integer x = 1952
integer y = 1672
integer width = 320
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Exe"
end type

event clicked;//执行当前选择的测试点

integer  li_item

li_item = lb_testcase.selectedindex( )
//清空script
mle_scriptview.text = ""

wf_scriptexe(li_item,false)
wf_scriptexe(li_item,true)
end event

type cb_clear from commandbutton within w_base_manu
integer x = 1573
integer y = 1672
integer width = 320
integer height = 132
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Clear"
end type

event clicked;//清空参数和输出列表
mle_parm.text = ""
mle_output.text = ""
mle_detail.text = ""

end event

type cb_set from commandbutton within w_base_manu
integer x = 1193
integer y = 1672
integer width = 320
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Set"
end type

event clicked;//设置参数值
wf_parm_setvalue()
end event

type mle_parm from multilineedit within w_base_manu
integer x = 1198
integer y = 1440
integer width = 1454
integer height = 212
integer taborder = 40
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

type ddlb_parm from dropdownlistbox within w_base_manu
integer x = 1193
integer y = 780
integer width = 1458
integer height = 488
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//选择参数后，清空参数信息
mle_parm.text = ""
lb_parm.reset()

//设置参数的事例列表
if index = 0 then return
wf_parm_setdefault(this.text(index))
end event

type cb_export from statictext within w_base_manu
integer x = 4187
integer y = 1928
integer width = 142
integer height = 124
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "..."
alignment alignment = center!
boolean border = true
long bordercolor = 8421504
boolean focusrectangle = false
end type

event clicked;//====================================================================
// 
//   event name : clicked
//
//   Description:
//	                 将output信息输出到TXT，以便用户查看
//				  
//
//   Argument：(None)
//				   
//
//   Return ：  (long)
//
//   Modify Date：2018-01-30
//====================================================================
string ls_file,ls_path   //另存的文件名和路径
long ll_return
long ll_file                //书写文件时使用的句柄
string ls_output

//由用户选择要保存的文件名
ll_return = getfilesavename("Save to file",ls_path,ls_file,"TXT","Text(*.txt),*.txt")
if ll_return <> 1 then
	return //没有选择到合适的文件
end if

//将输出信息保存到选择的文件中
ll_file = fileopen(ls_path,streammode!,write!,shared!,replace!,encodingutf8!)

ls_output = mle_output.text
filewrite(ll_file,ls_output)

//关闭文件
fileclose(ll_file)

//if appeongetclienttype() <> "MOBILD" then
//	//打开文件查看
//	run("Notepad.exe "+ls_path)
//else
//	//移动设备下不支持记事本
//	openwithparm(w_show_detail,ls_output)
//end if



end event

type mle_output from multilineedit within w_base_manu
integer x = 27
integer y = 1916
integer width = 4123
integer height = 260
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type lb_testcase from listbox within w_base_manu
integer x = 14
integer y = 84
integer width = 1125
integer height = 1724
integer taborder = 20
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

event doubleclicked;//双击时执行双击的测试点
if index > 0 then
	wf_scriptexe(index,true)
end if
end event

event selectionchanged;//切换测试点时，清楚参数列表和参数信息

//清空描述信息
mle_des.text=""

//清空输出信息
mle_output.text = ""
mle_detail.text = ""

//清空参数列表
mle_parm.text = ""
ddlb_parm.reset()

//清空实例变量
is_parmlist = ""

//清空scriptview
mle_scriptview.text = ""

//默认不展示detail和script
wf_showscript(false,false)

//输出测试点相关信息
if index = 0 then return
wf_testcase_desc(this.text(index))

//输出测试点预览信息
wf_scriptexe(index,false)

//将测试点参数输出到参数列表
if trim(is_parmlist) <> '' then
	wf_additem(ddlb_parm,is_parmlist)
	ddlb_parm.event selectionchanged( 1)
	ddlb_parm.selectitem(1)
end if

end event

type gb_testcase from groupbox within w_base_manu
integer width = 1157
integer height = 1840
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TestCase"
end type

type gb_output from groupbox within w_base_manu
integer x = 5
integer y = 1836
integer width = 4366
integer height = 360
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut"
end type

type gb_parm from groupbox within w_base_manu
integer x = 1170
integer y = 700
integer width = 1504
integer height = 1136
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parm"
end type

type gb_des from groupbox within w_base_manu
integer x = 1166
integer width = 1509
integer height = 700
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Description"
end type

type gb_detail from groupbox within w_base_manu
boolean visible = false
integer x = 2693
integer width = 1682
integer height = 812
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detail"
end type

type gb_scriptview from groupbox within w_base_manu
boolean visible = false
integer x = 2693
integer y = 832
integer width = 1682
integer height = 1000
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ScriptView"
end type

