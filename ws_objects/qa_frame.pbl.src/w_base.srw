$PBExportHeader$w_base.srw
forward
global type w_base from window
end type
end forward

global type w_base from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "base"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_setflag ( )
end type
global w_base w_base

type variables
eon_appeon_resize  ieon_resize
end variables

event ue_setflag();//====================================================================
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

end event

event open;ieon_resize = create eon_appeon_resize


//递归初始化控件
ieon_resize.of_init(this,true)

//自定义控件resize逻辑
event ue_setflag()
end event

on w_base.create
end on

on w_base.destroy
end on

event resize;//判断resize对象是否合法
if not isvalid(ieon_resize) then
	return
end if
//递归resize所有控件
ieon_resize.of_resize(this,newwidth,newheight,true)
end event

event close;//销毁实例变量
destroy ieon_resize
end event

