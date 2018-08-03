$PBExportHeader$encode.sra
$PBExportComments$Generated Application Object
forward
global type encode from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
CoderObject 	gco_Coder
CrypterObject 	gco_Crypter

String 		gs_values
str_CodeCrypt 	gstr_1
String gs_Post = "CoderObject Post Event Failed"
String gs_Post2 = "CrypterObject Post Event Failed"
end variables

global type encode from application
string appname = "encode"
end type
global encode encode

on encode.create
appname="encode"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on encode.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//Open ( w_encode )
//Open ( w_encode_manu )
Open(w_mdi_encode)
end event

