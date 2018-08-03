$PBExportHeader$encode_scenes.sra
$PBExportComments$Generated Application Object
forward
global type encode_scenes from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type encode_scenes from application
string appname = "encode_scenes"
end type
global encode_scenes encode_scenes

on encode_scenes.create
appname="encode_scenes"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on encode_scenes.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open( w_main )
end event

