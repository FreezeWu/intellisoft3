$PBExportHeader$w_mdi_encode.srw
forward
global type w_mdi_encode from window
end type
type mdi_1 from mdiclient within w_mdi_encode
end type
end forward

global type w_mdi_encode from window
integer width = 3378
integer height = 1840
boolean titlebar = true
string title = "Encode MDI Frame"
string menuname = "m_frame_encode"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_mdi_encode w_mdi_encode

on w_mdi_encode.create
if this.MenuName = "m_frame_encode" then this.MenuID = create m_frame_encode
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_mdi_encode.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_mdi_encode
long BackColor=268435456
end type

