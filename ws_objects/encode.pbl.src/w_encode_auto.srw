$PBExportHeader$w_encode_auto.srw
forward
global type w_encode_auto from w_base_auto
end type
type cb_post1 from commandbutton within w_encode_auto
end type
type cb_post2 from commandbutton within w_encode_auto
end type
type crypterobject_1 from crypterobject within w_encode_auto
end type
type coderobject_1 from coderobject within w_encode_auto
end type
end forward

shared variables
CoderObject 	sco_Coder
CrypterObject 	sco_Crypter
end variables

global type w_encode_auto from w_base_auto
string title = "w_encode_auto"
event type string ue_crypterobject_argument ( any aco_1,  ref crypterobject aco_2,  crypterobject aco_array[] )
event type string ue_coderobject_argument ( any aco_1,  ref coderobject aco_2,  coderobject aco_array[] )
cb_post1 cb_post1
cb_post2 cb_post2
crypterobject_1 crypterobject_1
coderobject_1 coderobject_1
end type
global w_encode_auto w_encode_auto

type variables
CoderObject 	ico_Coder
CrypterObject 	ico_Crypter

end variables

forward prototypes
public subroutine wf_init ()
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public subroutine wf_scriptexe2 (string as_item, boolean ab_execute)
public subroutine wf_scriptexe4 (string as_item, boolean ab_execute)
public subroutine wf_scriptexe1 (string as_item, boolean ab_execute)
public function any wf_coderobject_any_readonly (coderobject aco_1)
public function any wf_crypterobject_any_readonly (readonly crypterobject aco_1)
public function string wf_coderobject_argument (any aco_1, ref coderobject aco_2, coderobject aco_array[])
public function string wf_crypterobject_argument (any aco_1, ref crypterobject aco_2, crypterobject aco_array[])
public subroutine wf_hmac_hash (hmacalgorithm ah_hash, ref crypterobject lco_crypt, ref coderobject lco_code)
public subroutine wf_symmetricencrypt (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, operationmode ao_mode, paddingscheme ap_padding, boolean ab_decrypt)
public subroutine wf_symmetricencrypt_iv (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, operationmode ao_mode, boolean ab_decrypt)
public subroutine wf_symmetricencrypt (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, boolean ab_decrypt)
public subroutine wf_symmetricencrypt (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, operationmode ao_mode, boolean ab_decrypt)
public subroutine wf_sha_hash (shaalgorithm ah_hash, ref crypterobject lco_crypt, ref coderobject lco_code)
public subroutine wf_md5_hash (ref crypterobject lco_crypt, ref coderobject lco_code)
public subroutine wf_scriptexe3b (string as_item, boolean ab_execute)
public subroutine wf_scriptexe3 (string as_item, boolean ab_execute)
end prototypes

event type string ue_crypterobject_argument(any aco_1, ref crypterobject aco_2, crypterobject aco_array[]);//====================================================================
// Event: ue_crypterobject_argument
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        any              aco_1
// 	reference    crypterobject    aco_2
// 	value        crypterobject    aco_array[]
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-29
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_value, ls_return
CoderObject lco_Code
CrypterObject lco_Crypt

lco_Code = Create CoderObject
lco_Crypt = aco_1

If IsValid ( lco_Crypt ) Then
	ls_return += "CrypterObject Event: value Argument Success" + "~r~n"
	ls_Value = lco_Code.HexEncode ( lco_Crypt.MD5( Blob( "Pragma",EncodingANSI! )))
	If ls_Value = "F607FDCEA4127AAD4F0CDAE948A4F3F7" Then
		ls_return += "CrypterObject Event: MD5(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CrypterObject Event: MD5(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return += "CrypterObject Event: value Argument Failed" + "~r~n"
	ls_return += "CrypterObject Event: MD5(Blob('Pragma')) Failed" + "~r~n"
End If

If IsValid ( aco_2 ) Then
	ls_return += "CrypterObject Event: reference Argument Success" + "~r~n"
	ls_Value = lco_Code.HexEncode (aco_2.MD5 ( Blob("Pragma",EncodingANSI! )))
	If ls_Value = "F607FDCEA4127AAD4F0CDAE948A4F3F7" Then
		ls_return += "CrypterObject Event: reference MD5(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CrypterObject Event: reference MD5(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return+= "CrypterObject Event: reference Argument Failed" + "~r~n"
End If

If UpperBound ( aco_array ) > 0 Then
	If IsValid ( aco_array[1] ) Then
		ls_return += "CrypterObject Event: Array Argument Success" + "~r~n"
		ls_Value = lco_Code.HexEncode (aco_array[1].MD5 ( Blob("Pragma",EncodingANSI! )))
		If ls_Value = "F607FDCEA4127AAD4F0CDAE948A4F3F7" Then
			ls_return += "CrypterObject Event Array: MD5(Blob('Pragma')) Success"
		Else
			ls_return += "CrypterObject Event Array: MD5(Blob('Pragma')) Failed" 
		End If
	Else
		ls_return += "CrypterObject Event: Array Argument Failed" 
	End If	
Else	
	ls_return += "CrypterObject Event: Array Argument Failed" 
End If

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )

Return ls_return
end event

event type string ue_coderobject_argument(any aco_1, ref coderobject aco_2, coderobject aco_array[]);//====================================================================
// Event: ue_coderobject_argument
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        any            aco_1
// 	reference    coderobject    aco_2
// 	value        coderobject    aco_array[]
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-28
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_value, ls_return
CoderObject lco_Code

lco_Code = aco_1

If IsValid ( lco_Code ) Then
	ls_return += "CoderObject Event: value Argument Success" + "~r~n"
	ls_Value = lco_Code.HexEncode ( Blob( "Pragma",EncodingANSI! ))
	If ls_Value = "507261676D61" Then
		ls_return += "CoderObject Event: HexEncode(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CoderObject Event: HexEncode(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return += "CoderObject Event: value Argument Failed" + "~r~n"
	ls_return += "CoderObject Event: HexEncode(Blob('Pragma')) Failed" + "~r~n"
End If

If IsValid ( aco_2 ) Then
	ls_return += "CoderObject Event: reference Argument Success" + "~r~n"
	ls_Value = aco_2.Base64Encode ( Blob("Pragma",EncodingANSI! ))
	If ls_Value = "UHJhZ21h" Then
		ls_return += "CoderObject Event: reference Base64Encode(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CoderObject Event: reference Base64Encode(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return+= "CoderObject Event: reference Argument Failed" + "~r~n"
End If

If UpperBound ( aco_array ) > 0 Then
	If IsValid ( aco_array[1] ) Then
		ls_return += "CoderObject Event: Array Argument Success" + "~r~n"
		ls_Value = aco_array[1].HexEncode ( Blob("Pragma",EncodingANSI! ))
		If ls_Value = "507261676D61" Then
			ls_return += "CoderObject Event Array: HexEncode(Blob('Pragma')) Success"
		Else
			ls_return += "CoderObject Event Array: HexEncode(Blob('Pragma')) Failed"
		End If
	Else
		ls_return += "CoderObject Event: Array Argument Failed"
	End If	
Else	
	ls_return += "CoderObject Event: Array Argument Failed"
End If

Return ls_return
end event

public subroutine wf_init ();
//测试点列表
is_testcaselist = "P001_classic_Create,P002_classic_Event,P003_classic_Classdefinition,P004_classic_ClassName,P005_classic_TypeOf,P006_classic_Any,P007_classic_PowerObject,P008_classic_InstanceVariables,P009_classic_SharedVariables,P010_classic_GlobalVariables,P011_classic_Argument,P012_classic_Array,P012b_classic_Enume" + &
",P013_code_HexEncode,P014_code_HexDecode,P015_code_Base64Encode,P016_code_Base64Decode,P017_code_UrlEncode,P018_code_UrlDecode" + &
",P019_crypt_SymmetricEncrypt,P020_crypt_SymmetricDecrypt,P021_crypt_AsymmetricEncrypt,P022_crypt_AsymmetricDecrypt,P023_crypt_AsymmetricSign,P024_crypt_AsymmetricVerifySign,P025_crypt_AsymmetricGenerateKey,P026_crypt_MD5,P027_crypt_SHA,P028_crypt_HMAC" + &
",P029_uo_Code,P030_uo_Crypt,P031_nvo_Code,P032_nvo_Crypt"

//初始化结果集文件
is_expfile = "exp.txt"
is_realfile = "real.txt"

//清空运行值
is_realvalue = ""

//设置测试总体描述
is_testpurpose = "PB新功能,对字符串编码CoderObject对象和加解密CrypterObject对象,首先是对象的基础验证，接着是功能函数验证;非英文字符加密请参考UTF8编码值"
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
Choose Case true
	//测试标准对象的基础功能
	Case POS ( ls_item, "_classic_" ) > 0 
		wf_ScriptExe1 ( ls_item, ab_execute )
	//测试对字符编码功能
	Case POS ( ls_item, "_code_" ) > 0
		wf_ScriptExe2 ( ls_item, ab_execute )
	//测试对字符加密功能
	Case POS ( ls_item, "_crypt_" ) > 0
		wf_ScriptExe3 ( ls_item, ab_execute )
	//user object 验证用户对象的功能
	Case POS ( ls_item, "o_C" ) > 0
		wf_ScriptExe4 ( ls_item, ab_execute )
End Choose


//测试点执行结束
if ab_execute then
	wf_output("End "+ls_item,false)
end if
end subroutine

public subroutine wf_scriptexe2 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe2
//--------------------------------------------------------------------
// Description:测试对字符编码功能
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-27
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
//P013_code_HexEncode
//P014_code_HexDecode
//P015_code_Base64Encode
//P016_code_Base64Decode
//P017_code_UrlEncode
//P018_code_UrlDecode

CoderObject 	lco_Code
String 			ls_error, ls_rtn, ls_Value, ls_Null
Blob 				lb_Data, lb_Null

SetNull ( ls_Null )
SetNull ( lb_Null )
Choose Case as_item
	Case 'P013_code_HexEncode' 
		If ab_execute = True Then
			//未实例化
			ls_error = "Not Create:View error Failed"
			Try
				ls_rtn = lco_Code.HexEncode( Blob ( "test", EncodingANSI! ) )
			Catch ( throwable ex)
				ls_error = "Not Create: View error Success" + " Return:" + ex.getmessage()
			End Try
			wf_output(ls_error, False)
			
			If Not IsValid ( lco_Code ) Then
				lco_Code = Create CoderObject
			End If
			ls_rtn = lco_Code.HexEncode(Blob("test", EncodingANSI!))
			If ls_rtn = "74657374" Then
				wf_output('Create HexEncode("test") Success', False)
			Else
				wf_output('Create HexEncode("test") Failed" + " Return:' + String (ls_rtn ), False)
			End If
			//使用 HexEncode
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			
			//null
			ls_rtn = lco_Code.HexEncode(lb_Null)
			If IsNull ( ls_rtn ) Then
				wf_output('HexEncode(Null, EncodingANSI!) = Null Success' , False)
			Else
				wf_output('HexEncode(Null, EncodingANSI!) <> Null Failed ', False)
			End If
			
			ls_error = "HexEncode Data invalid length:View error Failed"
			Try
				ls_rtn = lco_Code.HexEncode( Blob ( "", EncodingANSI! ) )
			Catch ( throwable ex1)
				ls_error = "HexEncode Data invalid length: View error Success" + " Return:" + ex1.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			// !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~
			ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingANSI!))
			wf_output('HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF8!))
			wf_output('HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16LE!))
			wf_output('HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16BE!))
			wf_output('HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingANSI!))
			wf_output('HexEncode("中文测试", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingUTF8!))
			wf_output('HexEncode("中文测试", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingUTF16LE!))
			wf_output('HexEncode("中文测试", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingUTF16BE!))
			wf_output('HexEncode("中文测试", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingANSI!))
			wf_output('HexEncode("あいうえお", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingUTF8!))
			wf_output('HexEncode("あいうえお", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingUTF16LE!))
			wf_output('HexEncode("あいうえお", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingUTF16BE!))
			wf_output('HexEncode("あいうえお", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingANSI!))
			wf_output('HexEncode("üöäß", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingUTF8!))
			wf_output('HexEncode("üöäß", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingUTF16LE!))
			wf_output('HexEncode("üöäß", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingUTF16BE!))
			wf_output('HexEncode("üöäß", EncodingUTF16BE!) = ' + ls_rtn, False)
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
		Else
			wf_scriptview("//未实例化~r~n" +&
					"ls_error = ~"Not Create:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_rtn = lco_Code.HexEncode( Blob ( ~"test~", EncodingANSI! ) )~r~n" +&
					"Catch ( throwable ex)~r~n" +&
					"	ls_error = ~"Not Create: View error Success~" + ~" Return:~" + ex.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"~r~n" +&
					"If Not IsValid ( lco_Code ) Then~r~n" +&
					"	lco_Code = Create CoderObject~r~n" +&
					"End If~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"test~", EncodingANSI!))~r~n" +&
					"If ls_rtn = ~"74657374~" Then~r~n" +&
					"	wf_output(~'Create HexEncode(~"test~") Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'Create HexEncode(~"test~") Failed~" + ~" Return:~' + String (ls_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"//使用 HexEncode~r~n" +&
					"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
					"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
					"~r~n" +&
					"//null~r~n" +&
					"ls_rtn = lco_Code.HexEncode(lb_Null)~r~n" +&
					"If IsNull ( ls_rtn ) Then~r~n" +&
					"	wf_output(~'HexEncode(Null, EncodingANSI!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'HexEncode(Null, EncodingANSI!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_error = ~"HexEncode Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_rtn = lco_Code.HexEncode( Blob ( ~"~", EncodingANSI! ) )~r~n" +&
					"Catch ( throwable ex1)~r~n" +&
					"	ls_error = ~"HexEncode Data invalid length: View error Success~" + ~" Return:~" + ex1.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"// !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~r~n" +&
					"ls_Value = ~' !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~'~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingANSI!))~r~n" +&
					"wf_output(~'HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF8!))~r~n" +&
					"wf_output(~'HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16LE!))~r~n" +&
					"wf_output(~'HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16BE!))~r~n" +&
					"wf_output(~'HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
					"~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingANSI!))~r~n" +&
					"wf_output(~'HexEncode(~"中文测试~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingUTF8!))~r~n" +&
					"wf_output(~'HexEncode(~"中文测试~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingUTF16LE!))~r~n" +&
					"wf_output(~'HexEncode(~"中文测试~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingUTF16BE!))~r~n" +&
					"wf_output(~'HexEncode(~"中文测试~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
					"~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingANSI!))~r~n" +&
					"wf_output(~'HexEncode(~"あいうえお~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingUTF8!))~r~n" +&
					"wf_output(~'HexEncode(~"あいうえお~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingUTF16LE!))~r~n" +&
					"wf_output(~'HexEncode(~"あいうえお~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingUTF16BE!))~r~n" +&
					"wf_output(~'HexEncode(~"あいうえお~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
					"~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingANSI!))~r~n" +&
					"wf_output(~'HexEncode(~"üöäß~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingUTF8!))~r~n" +&
					"wf_output(~'HexEncode(~"üöäß~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingUTF16LE!))~r~n" +&
					"wf_output(~'HexEncode(~"üöäß~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
					"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingUTF16BE!))~r~n" +&
					"wf_output(~'HexEncode(~"üöäß~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
					"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n")
		End If
	Case 'P014_code_HexDecode' 
		If ab_execute = True Then
			If Not IsValid ( lco_Code ) Then
				lco_Code = Create CoderObject
			End If
			//HexDecode 
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			
			//null
			SetNull ( lb_Data )
			ls_rtn = lco_Code.HexEncode(lb_Data)
			If IsNull ( ls_rtn ) Then
				wf_output('HexEncode(Null, EncodingANSI!) = Null Success' , False)
			Else
				wf_output('HexEncode(Null, EncodingANSI!) <> Null Failed ', False)
			End If
			
			// !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~
			ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingANSI!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF8!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16LE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16BE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingANSI!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("中文测试", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingUTF8!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("中文测试", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingUTF16LE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("中文测试", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("中文测试", EncodingUTF16BE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("中文测试", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingANSI!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("あいうえお", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingUTF8!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("あいうえお", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingUTF16LE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("あいうえお", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("あいうえお", EncodingUTF16BE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("あいうえお", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingANSI!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("üöäß", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingUTF8!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("üöäß", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingUTF16LE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("üöäß", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.HexEncode(Blob("üöäß", EncodingUTF16BE!))
			lb_Data = lco_Code.HexDecode(ls_rtn)
			wf_output('HexDecode(HexEncode("üöäß", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
		Else
			wf_scriptview("If Not IsValid ( lco_Code ) Then~r~n" +&
						"lco_Code = Create CoderObject~r~n" +&
						"End If~r~n" +&
						"//HexDecode~r~n" +&
						"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
						"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
						"~r~n" +&
						"//null~r~n" +&
						"SetNull ( lb_Data )~r~n" +&
						"ls_rtn = lco_Code.HexEncode(lb_Data)~r~n" +&
						"If IsNull ( ls_rtn ) Then~r~n" +&
						"wf_output(~'HexEncode(Null, EncodingANSI!) = Null Success~' , False)~r~n" +&
						"Else~r~n" +&
						"wf_output(~'HexEncode(Null, EncodingANSI!) <> Null Failed ~', False)~r~n" +&
						"End If~r~n" +&
						"~r~n" +&
						"// !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~r~n" +&
						"ls_Value = ~' !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~'~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(ls_Value, EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"中文测试~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"中文测试~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"中文测试~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"中文测试~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"中文测试~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"あいうえお~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"あいうえお~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"あいうえお~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"あいうえお~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"あいうえお~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"üöäß~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"üöäß~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"üöäß~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.HexEncode(Blob(~"üöäß~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.HexDecode(ls_rtn)~r~n" +&
						"wf_output(~'HexDecode(HexEncode(~"üöäß~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n")
		End If
		
	Case 'P015_code_Base64Encode' 
		If ab_execute = True Then
			If Not IsValid ( lco_Code ) Then
				lco_Code = Create CoderObject
			End If
			//使用 Base64Encode
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			
			//null
			ls_rtn = lco_Code.Base64Encode(lb_Null)
			If IsNull ( ls_rtn ) Then
				wf_output('Base64Encode(Null, EncodingANSI!) = Null Success' , False)
			Else
				wf_output('Base64Encode(Null, EncodingANSI!) <> Null Failed ', False)
			End If
			
			ls_error = "Base64Encode Data invalid length:View error Failed"
			Try
				ls_rtn = lco_Code.Base64Encode( Blob ( "", EncodingANSI! ) )
			Catch ( throwable ex2)
				ls_error = "Base64Encode Data invalid length: View error Success" + " Return:" + ex2.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			// !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~
			ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingANSI!))
			wf_output('Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF8!))
			wf_output('Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16LE!))
			wf_output('Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16BE!))
			wf_output('Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingANSI!))
			wf_output('Base64Encode("中文测试", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingUTF8!))
			wf_output('Base64Encode("中文测试", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingUTF16LE!))
			wf_output('Base64Encode("中文测试", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingUTF16BE!))
			wf_output('Base64Encode("中文测试", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingANSI!))
			wf_output('Base64Encode("あいうえお", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingUTF8!))
			wf_output('Base64Encode("あいうえお", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingUTF16LE!))
			wf_output('Base64Encode("あいうえお", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingUTF16BE!))
			wf_output('Base64Encode("あいうえお", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingANSI!))
			wf_output('Base64Encode("üöäß", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingUTF8!))
			wf_output('Base64Encode("üöäß", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingUTF16LE!))
			wf_output('Base64Encode("üöäß", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingUTF16BE!))
			wf_output('Base64Encode("üöäß", EncodingUTF16BE!) = ' + ls_rtn, False)
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
		Else
			wf_scriptview("If Not IsValid ( lco_Code ) Then~r~n" +&
						"lco_Code = Create CoderObject~r~n" +&
						"End If~r~n" +&
						"//使用 Base64Encode~r~n" +&
						"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
						"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
						"~r~n" +&
						"//null~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(lb_Null)~r~n" +&
						"If IsNull ( ls_rtn ) Then~r~n" +&
						"wf_output(~'Base64Encode(Null, EncodingANSI!) = Null Success~' , False)~r~n" +&
						"Else~r~n" +&
						"wf_output(~'Base64Encode(Null, EncodingANSI!) <> Null Failed ~', False)~r~n" +&
						"End If~r~n" +&
						"~r~n" +&
						"ls_error = ~"Base64Encode Data invalid length:View error Failed~"~r~n" +&
						"Try~r~n" +&
						"ls_rtn = lco_Code.Base64Encode( Blob ( ~"~", EncodingANSI! ) )~r~n" +&
						"Catch ( throwable ex2)~r~n" +&
						"ls_error = ~"Base64Encode Data invalid length: View error Success~" + ~" Return:~" + ex2.getmessage()~r~n" +&
						"End Try~r~n" +&
						"wf_output(ls_error, False)~r~n" +&
						"ls_error = ~"~"~r~n" +&
						"~r~n" +&
						"// !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~r~n" +&
						"ls_Value = ~' !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~'~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingANSI!))~r~n" +&
						"wf_output(~'Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF8!))~r~n" +&
						"wf_output(~'Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16LE!))~r~n" +&
						"wf_output(~'Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16BE!))~r~n" +&
						"wf_output(~'Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingANSI!))~r~n" +&
						"wf_output(~'Base64Encode(~"中文测试~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingUTF8!))~r~n" +&
						"wf_output(~'Base64Encode(~"中文测试~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingUTF16LE!))~r~n" +&
						"wf_output(~'Base64Encode(~"中文测试~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingUTF16BE!))~r~n" +&
						"wf_output(~'Base64Encode(~"中文测试~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingANSI!))~r~n" +&
						"wf_output(~'Base64Encode(~"あいうえお~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingUTF8!))~r~n" +&
						"wf_output(~'Base64Encode(~"あいうえお~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingUTF16LE!))~r~n" +&
						"wf_output(~'Base64Encode(~"あいうえお~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingUTF16BE!))~r~n" +&
						"wf_output(~'Base64Encode(~"あいうえお~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingANSI!))~r~n" +&
						"wf_output(~'Base64Encode(~"üöäß~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingUTF8!))~r~n" +&
						"wf_output(~'Base64Encode(~"üöäß~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingUTF16LE!))~r~n" +&
						"wf_output(~'Base64Encode(~"üöäß~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingUTF16BE!))~r~n" +&
						"wf_output(~'Base64Encode(~"üöäß~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n")
		End If
	Case 'P016_code_Base64Decode' 
		If ab_execute = True Then
			If Not IsValid ( lco_Code ) Then
				lco_Code = Create CoderObject
			End If
			//Base64Decode 
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			
			//null
			lb_Data = lco_Code.Base64Decode(ls_Null)
			If IsNull ( lb_Data ) Then
				wf_output('Base64Decode(Null, EncodingANSI!) = Null Success' , False)
			Else
				wf_output('Base64Decode(Null, EncodingANSI!) <> Null Failed ', False)
			End If
			
			// !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~
			ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingANSI!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF8!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16LE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16BE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingANSI!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("中文测试", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingUTF8!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("中文测试", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingUTF16LE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("中文测试", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("中文测试", EncodingUTF16BE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("中文测试", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingANSI!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("あいうえお", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingUTF8!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("あいうえお", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingUTF16LE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("あいうえお", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("あいうえお", EncodingUTF16BE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("あいうえお", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingANSI!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("üöäß", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingUTF8!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("üöäß", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingUTF16LE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("üöäß", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.Base64Encode(Blob("üöäß", EncodingUTF16BE!))
			lb_Data = lco_Code.Base64Decode(ls_rtn)
			wf_output('Base64Decode(Base64Encode("üöäß", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
		Else
			wf_scriptview("If Not IsValid ( lco_Code ) Then~r~n" +&
						"lco_Code = Create CoderObject~r~n" +&
						"End If~r~n" +&
						"//Base64Decode~r~n" +&
						"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
						"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
						"~r~n" +&
						"//null~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_Null)~r~n" +&
						"If IsNull ( lb_Data ) Then~r~n" +&
						"wf_output(~'Base64Decode(Null, EncodingANSI!) = Null Success~' , False)~r~n" +&
						"Else~r~n" +&
						"wf_output(~'Base64Decode(Null, EncodingANSI!) <> Null Failed ~', False)~r~n" +&
						"End If~r~n" +&
						"~r~n" +&
						"// !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~r~n" +&
						"ls_Value = ~' !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~'~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(ls_Value, EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"中文测试~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"中文测试~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"中文测试~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"中文测试~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"中文测试~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"あいうえお~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"あいうえお~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"あいうえお~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"あいうえお~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"あいうえお~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"üöäß~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"üöäß~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"üöäß~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.Base64Encode(Blob(~"üöäß~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.Base64Decode(ls_rtn)~r~n" +&
						"wf_output(~'Base64Decode(Base64Encode(~"üöäß~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n")
		End If
	Case 'P017_code_UrlEncode' 
		If ab_execute = True Then
			If Not IsValid ( lco_Code ) Then
				lco_Code = Create CoderObject
			End If
			//使用 UrlEncode
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			
			//null
			ls_rtn = lco_Code.UrlEncode(lb_Null)
			If IsNull ( ls_rtn ) Then
				wf_output('UrlEncode(Null, EncodingANSI!) = Null Success' , False)
			Else
				wf_output('UrlEncode(Null, EncodingANSI!) <> Null Failed ', False)
			End If
			
			ls_error = "UrlEncode Data invalid length:View error Failed"
			Try
				ls_rtn = lco_Code.UrlEncode( Blob ( "", EncodingANSI! ) )
			Catch ( throwable ex3)
				ls_error = "UrlEncode Data invalid length: View error Success" + " Return:" + ex3.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			// !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~
			ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingANSI!))
			wf_output('UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingANSI!) = ' + ls_rtn , False)
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF8!))
			wf_output('UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16LE!))
			wf_output('UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16BE!))
			wf_output('UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingANSI!))
			wf_output('UrlEncode("中文测试", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingUTF8!))
			wf_output('UrlEncode("中文测试", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingUTF16LE!))
			wf_output('UrlEncode("中文测试", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingUTF16BE!))
			wf_output('UrlEncode("中文测试", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingANSI!))
			wf_output('UrlEncode("あいうえお", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingUTF8!))
			wf_output('UrlEncode("あいうえお", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingUTF16LE!))
			wf_output('UrlEncode("あいうえお", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingUTF16BE!))
			wf_output('UrlEncode("あいうえお", EncodingUTF16BE!) = ' + ls_rtn, False)
			
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingANSI!))
			wf_output('UrlEncode("üöäß", EncodingANSI!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingUTF8!))
			wf_output('UrlEncode("üöäß", EncodingUTF8!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingUTF16LE!))
			wf_output('UrlEncode("üöäß", EncodingUTF16LE!) = ' + ls_rtn, False)
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingUTF16BE!))
			wf_output('UrlEncode("üöäß", EncodingUTF16BE!) = ' + ls_rtn, False)
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
		Else
			wf_scriptview("If Not IsValid ( lco_Code ) Then~r~n" +&
						"lco_Code = Create CoderObject~r~n" +&
						"End If~r~n" +&
						"//使用 UrlEncode~r~n" +&
						"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
						"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
						"~r~n" +&
						"//null~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(lb_Null)~r~n" +&
						"If IsNull ( ls_rtn ) Then~r~n" +&
						"wf_output(~'UrlEncode(Null, EncodingANSI!) = Null Success~' , False)~r~n" +&
						"Else~r~n" +&
						"wf_output(~'UrlEncode(Null, EncodingANSI!) <> Null Failed ~', False)~r~n" +&
						"End If~r~n" +&
						"~r~n" +&
						"ls_error = ~"UrlEncode Data invalid length:View error Failed~"~r~n" +&
						"Try~r~n" +&
						"ls_rtn = lco_Code.UrlEncode( Blob ( ~"~", EncodingANSI! ) )~r~n" +&
						"Catch ( throwable ex3)~r~n" +&
						"ls_error = ~"UrlEncode Data invalid length: View error Success~" + ~" Return:~" + ex3.getmessage()~r~n" +&
						"End Try~r~n" +&
						"wf_output(ls_error, False)~r~n" +&
						"ls_error = ~"~"~r~n" +&
						"~r~n" +&
						"// !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~r~n" +&
						"ls_Value = ~' !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~'~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingANSI!))~r~n" +&
						"wf_output(~'UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingANSI!) = ~' + ls_rtn , False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF8!))~r~n" +&
						"wf_output(~'UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16LE!))~r~n" +&
						"wf_output(~'UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16BE!))~r~n" +&
						"wf_output(~'UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingANSI!))~r~n" +&
						"wf_output(~'UrlEncode(~"中文测试~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingUTF8!))~r~n" +&
						"wf_output(~'UrlEncode(~"中文测试~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingUTF16LE!))~r~n" +&
						"wf_output(~'UrlEncode(~"中文测试~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingUTF16BE!))~r~n" +&
						"wf_output(~'UrlEncode(~"中文测试~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingANSI!))~r~n" +&
						"wf_output(~'UrlEncode(~"あいうえお~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingUTF8!))~r~n" +&
						"wf_output(~'UrlEncode(~"あいうえお~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingUTF16LE!))~r~n" +&
						"wf_output(~'UrlEncode(~"あいうえお~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingUTF16BE!))~r~n" +&
						"wf_output(~'UrlEncode(~"あいうえお~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingANSI!))~r~n" +&
						"wf_output(~'UrlEncode(~"üöäß~", EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingUTF8!))~r~n" +&
						"wf_output(~'UrlEncode(~"üöäß~", EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingUTF16LE!))~r~n" +&
						"wf_output(~'UrlEncode(~"üöäß~", EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingUTF16BE!))~r~n" +&
						"wf_output(~'UrlEncode(~"üöäß~", EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n")
		End If
	Case 'P018_code_UrlDecode' 
		If ab_execute = True Then
			If Not IsValid ( lco_Code ) Then
				lco_Code = Create CoderObject
			End If
			//UrlDecode 
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			
			//null
			ls_rtn = lco_Code.UrlEncode(lb_null)
			If IsNull ( ls_rtn ) Then
				wf_output('UrlEncode(Null, EncodingANSI!) = Null Success' , False)
			Else
				wf_output('UrlEncode(Null, EncodingANSI!) <> Null Failed ', False)
			End If
			
			// !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~
			ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingANSI!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF8!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16LE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16BE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingANSI!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("中文测试", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingUTF8!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("中文测试", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingUTF16LE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("中文测试", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("中文测试", EncodingUTF16BE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("中文测试", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingANSI!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("あいうえお", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingUTF8!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("あいうえお", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingUTF16LE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("あいうえお", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("あいうえお", EncodingUTF16BE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("あいうえお", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingANSI!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("üöäß", EncodingANSI!)) = ' + String ( lb_Data, EncodingANSI! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingUTF8!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("üöäß", EncodingUTF8!)) = ' + String ( lb_Data, EncodingUTF8! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingUTF16LE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("üöäß", EncodingUTF16LE!)) = ' + String ( lb_Data, EncodingUTF16LE! ), False)
			ls_rtn = lco_Code.UrlEncode(Blob("üöäß", EncodingUTF16BE!))
			lb_Data = lco_Code.UrlDecode(ls_rtn)
			wf_output('UrlDecode(UrlEncode("üöäß", EncodingUTF16BE!)) = ' + String ( lb_Data, EncodingUTF16BE! ), False)
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
		Else
			wf_scriptview("If Not IsValid ( lco_Code ) Then~r~n" +&
						"lco_Code = Create CoderObject~r~n" +&
						"End If~r~n" +&
						"//UrlDecode~r~n" +&
						"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
						"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
						"~r~n" +&
						"//null~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(lb_null)~r~n" +&
						"If IsNull ( ls_rtn ) Then~r~n" +&
						"wf_output(~'UrlEncode(Null, EncodingANSI!) = Null Success~' , False)~r~n" +&
						"Else~r~n" +&
						"wf_output(~'UrlEncode(Null, EncodingANSI!) <> Null Failed ~', False)~r~n" +&
						"End If~r~n" +&
						"~r~n" +&
						"// !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~r~n" +&
						"ls_Value = ~' !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~'~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(ls_Value, EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~" !~"#$%&~~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"中文测试~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"中文测试~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"中文测试~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"中文测试~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"中文测试~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"あいうえお~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"あいうえお~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"あいうえお~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"あいうえお~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"あいうえお~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingANSI!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"üöäß~", EncodingANSI!)) = ~' + String ( lb_Data, EncodingANSI! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingUTF8!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"üöäß~", EncodingUTF8!)) = ~' + String ( lb_Data, EncodingUTF8! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingUTF16LE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"üöäß~", EncodingUTF16LE!)) = ~' + String ( lb_Data, EncodingUTF16LE! ), False)~r~n" +&
						"ls_rtn = lco_Code.UrlEncode(Blob(~"üöäß~", EncodingUTF16BE!))~r~n" +&
						"lb_Data = lco_Code.UrlDecode(ls_rtn)~r~n" +&
						"wf_output(~'UrlDecode(UrlEncode(~"üöäß~", EncodingUTF16BE!)) = ~' + String ( lb_Data, EncodingUTF16BE! ), False)~r~n" +&
						"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n")
		End If
		
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose
end subroutine

public subroutine wf_scriptexe4 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe4
//--------------------------------------------------------------------
// Description:验证用户对象的功能
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-27
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P029_uo_Code
//P030_uo_Crypt
//P031_nvo_Code
//P032_nvo_Crypt

String 	ls_rtn
Blob 		lb_data, lb_Return, lb_Key, lb_iv

Choose Case as_item
	Case 'P029_uo_Code' 
		If ab_execute = True Then
			//uo_Code
			u_CodeObject 		lu_code
			lu_code = Create u_CodeObject
			ls_rtn = lu_code.HexEncode(Blob("test", EncodingANSI!))
			If ls_rtn = "74657374" Then
				wf_output('u_CoderObject HexEncode("test") = "74657374" Success', False)
			Else
				wf_output('u_CoderObject HexEncode("test") Failed" + " Return:' + String (ls_rtn ), False)
			End If
			If IsValid ( lu_code ) Then DesTroy(lu_code )
		Else
			wf_scriptview("//uo_Code~r~n" +&
					"u_CodeObject 		lu_code~r~n" +&
					"lu_code = Create u_CodeObject~r~n" +&
					"ls_rtn = lu_code.HexEncode(Blob(~"test~", EncodingANSI!))~r~n" +&
					"If ls_rtn = ~"74657374~" Then~r~n" +&
					"	wf_output(~'u_CoderObject HexEncode(~"test~") = ~"74657374~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'u_CoderObject HexEncode(~"test~") Failed~" + ~" Return:~' + String (ls_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lu_code ) Then DesTroy(lu_code )~r~n")
		End If
	Case 'P030_uo_Crypt' 
		If ab_execute = True Then
			//uo_Crypt
			u_cryptObject 	lu_crypt
			lu_crypt = Create u_cryptObject
			lb_Data = Blob("test", EncodingANSI!)
			lb_Key = Blob("appeonkey1234567", EncodingANSI!)
			lb_iv = Blob("appeoniv12345678", EncodingANSI!)
			lb_Return = lu_crypt.SymmetricEncrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)
			ls_rtn = CoderObject_1.HexEncode(lb_Return)
			If ls_rtn = "5DBF0ACB81B17581C0B21F0DE8A20191" Then
				wf_output('CrypterObject_1 SymmetricEncrypt(AES!, "test", "appeonkey1234567",OperationModeECB!,"appeoniv12345678", ZerosPadding!) = "5DBF0ACB81B17581C0B21F0DE8A20191" Success', False)
			Else
				wf_output('CrypterObject_1 SymmetricEncrypt(AES!, "test", "appeonkey1234567",OperationModeECB!,"appeoniv12345678", ZerosPadding!) Failed" + " Return:' + String (ls_rtn ), False)
			End If
			If IsValid ( lu_crypt ) Then DesTroy( lu_crypt )
		Else
			wf_scriptview("//uo_Crypt~r~n" +&
					"u_cryptObject 	lu_crypt~r~n" +&
					"lu_crypt = Create u_cryptObject~r~n" +&
					"lb_Data = Blob(~"test~", EncodingANSI!)~r~n" +&
					"lb_Key = Blob(~"appeonkey1234567~", EncodingANSI!)~r~n" +&
					"lb_iv = Blob(~"appeoniv12345678~", EncodingANSI!)~r~n" +&
					"lb_Return = lu_crypt.SymmetricEncrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)~r~n" +&
					"ls_rtn = CoderObject_1.HexEncode(lb_Return)~r~n" +&
					"If ls_rtn = ~"5DBF0ACB81B17581C0B21F0DE8A20191~" Then~r~n" +&
					"	wf_output(~'CrypterObject_1 SymmetricEncrypt(AES!, ~"test~", ~"appeonkey1234567~",OperationModeECB!,~"appeoniv12345678~", ZerosPadding!) = ~"5DBF0ACB81B17581C0B21F0DE8A20191~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'CrypterObject_1 SymmetricEncrypt(AES!, ~"test~", ~"appeonkey1234567~",OperationModeECB!,~"appeoniv12345678~", ZerosPadding!) Failed~" + ~" Return:~' + String (ls_rtn ), False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lu_crypt ) Then DesTroy( lu_crypt )~r~n")
		End If
	Case 'P031_nvo_Code' 
		If ab_execute = True Then
			ls_rtn = CoderObject_1.HexEncode(Blob("test", EncodingANSI!))
			If ls_rtn = "74657374" Then
				wf_output('CoderObject_1 HexEncode("test") = "74657374" Success', False)
			Else
				wf_output('CoderObject_1 HexEncode("test") Failed" + " Return:' + String (ls_rtn ), False)
			End If
		Else
			wf_scriptview("ls_rtn = CoderObject_1.HexEncode(Blob(~"test~", EncodingANSI!))~r~n" +&
					"If ls_rtn = ~"74657374~" Then~r~n" +&
					"	wf_output(~'CoderObject_1 HexEncode(~"test~") = ~"74657374~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'CoderObject_1 HexEncode(~"test~") Failed~" + ~" Return:~' + String (ls_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P032_nvo_Crypt' 
		If ab_execute = True Then
			lb_Data = Blob("test", EncodingANSI!)
			lb_Key = Blob("appeonkey1234567", EncodingANSI!)
			lb_iv = Blob("appeoniv12345678", EncodingANSI!)
			lb_Return = CrypterObject_1.SymmetricEncrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)
			ls_rtn = CoderObject_1.HexEncode(lb_Return)
			If ls_rtn = "5DBF0ACB81B17581C0B21F0DE8A20191" Then
				wf_output('CrypterObject_1 SymmetricEncrypt(AES!, "test", "appeonkey1234567",OperationModeECB!,"appeoniv12345678", ZerosPadding!) = "5DBF0ACB81B17581C0B21F0DE8A20191" Success', False)
			Else
				wf_output('CrypterObject_1 SymmetricEncrypt(AES!, "test", "appeonkey1234567",OperationModeECB!,"appeoniv12345678", ZerosPadding!) Failed" + " Return:' + String (ls_rtn ), False)
			End If
		Else
			wf_scriptview("lb_Data = Blob(~"test~", EncodingANSI!)~r~n" +&
					"lb_Key = Blob(~"appeonkey1234567~", EncodingANSI!)~r~n" +&
					"lb_iv = Blob(~"appeoniv12345678~", EncodingANSI!)~r~n" +&
					"lb_Return = CrypterObject_1.SymmetricEncrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)~r~n" +&
					"ls_rtn = CoderObject_1.HexEncode(lb_Return)~r~n" +&
					"If ls_rtn = ~"5DBF0ACB81B17581C0B21F0DE8A20191~" Then~r~n" +&
					"	wf_output(~'CrypterObject_1 SymmetricEncrypt(AES!, ~"test~", ~"appeonkey1234567~",OperationModeECB!,~"appeoniv12345678~", ZerosPadding!) = ~"5DBF0ACB81B17581C0B21F0DE8A20191~" Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'CrypterObject_1 SymmetricEncrypt(AES!, ~"test~", ~"appeonkey1234567~",OperationModeECB!,~"appeoniv12345678~", ZerosPadding!) Failed~" + ~" Return:~' + String (ls_rtn ), False)~r~n" +&
					"End If~r~n")
		End If
End Choose
end subroutine

public subroutine wf_scriptexe1 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe1
//--------------------------------------------------------------------
// Description:测试标准对象的基础功能
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-27
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


CoderObject 	lco_CodeObject, lco_Codetmp
CrypterObject 	lco_CryptObject, lco_Crypttmp

u_CodeObject 	lu_Code, lu_Code2
u_CryptObject 	lu_Crypt, lu_Crypt2
String ls_item, ls_rtn
classdefinition lcd_tmp
ContextInformation lcx_key
Blob 		lb_temp, lb_rtn
string ls_output
CoderObject 	lco_code1, lco_code2
CoderObject 	lco_Array[5]	
CrypterObject 	lco_crypt1, lco_crypt2
CrypterObject 	lco_Array2[5]	
any 				lany_temp
str_CodeCrypt lstr_1

Choose Case as_item
	Case 'P001_classic_Create' 
		If ab_execute = True Then	
			//CoderObject
			//Create
			lb_temp = Blob ( "Appeon",  EncodingANSI! )
			lco_CodeObject = Create CoderObject
			If IsValid ( lco_CodeObject ) Then
				wf_OutPut('Local Create Success', False)
				ls_rtn = lco_CodeObject.HexEncode( lb_temp )
				wf_OutPut('lco_CodeObject.HexEncode( "Appeon" ) = ' + ls_rtn , False)
				DesTroy ( lco_CodeObject )
				If Not IsValid ( lco_CodeObject ) Then
					wf_OutPut('Local DesTroy Success', False)
				End If	
			End If
			//Create Using
			lco_CodeObject = Create Using "coderobject"
			If IsValid ( lco_CodeObject ) Then
				wf_OutPut('Create Using "coderobject" Success', False)
				If lco_CodeObject.hexencode( lb_temp ) = "417070656F6E" Then
					wf_OutPut('Create Using "coderobject" test Success', False)
				Else
					wf_OutPut('Create Using "coderobject" test Failed', False)
				End If
			Else
				wf_OutPut('Create Using "coderobject" Failed', False)
			End If
			If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )
			//userObject
			gs_values = ""
			lu_Code = Create u_CodeObject
			If IsValid ( lu_Code ) Then
				//CoderObject Constructor:1
				wf_OutPut(gs_values, False) //Constructor
				gs_values = ""
				wf_OutPut('u_CodeObject Create Success', False)
				DesTroy ( lu_Code )
				wf_OutPut(gs_values, False) //Destructor
				gs_values = ""
				If Not IsValid ( lu_Code ) Then
					wf_OutPut('u_CodeObject DesTroy Success', False)
				End If
			End If	
			//Trigger Post Event
			If Not IsValid ( lu_Code ) Then
				lu_Code = Create u_CodeObject
			End If
			//手动触发triggerevent
			gs_values = ""
			lu_Code.triggerevent( constructor!)
			//CoderObject Constructor:2
			wf_OutPut('triggerevent( constructor!):' + gs_values, False) 
			gs_values = ""
			lu_Code.triggerevent( "constructor")
			//CoderObject Constructor:3
			wf_OutPut('triggerevent( "constructor"):' + gs_values, False)
			gs_values = ""
			lu_Code.Event constructor()
			//CoderObject Constructor:4
			wf_OutPut('Event constructor():' + gs_values, False)
			gs_values = ""
			lu_Code.Event Destructor()
			wf_OutPut("Event Destructor() = " + gs_values, False) //Destructor
			gs_values = ""
			////CoderObject Constructor:5
			lu_Code.postevent( constructor!)
			cb_post1.Post Event Clicked() //Post Event
			//CoderObject Constructor:6
			lu_Code.postevent( "constructor")
			//cb_post1.Post Event Clicked() //Post Event
			
			//CrypterObject
			//Create
			gs_values = ""
			lco_CryptObject = Create CrypterObject
			If IsValid ( lco_CryptObject ) Then
				wf_OutPut('Local Create Success', False)
				lb_rtn = lco_CryptObject.MD5( lb_temp )
				ls_rtn = lu_Code.Hexencode( lb_rtn )
				wf_OutPut('lco_CodeObject.MD5( "Appeon" ) = ' + ls_rtn , False)
				DesTroy ( lco_CryptObject )
				If Not IsValid ( lco_CryptObject ) Then
					wf_OutPut('Local DesTroy Success', False)
				End If	
			End If
			//Create Using
			lco_CryptObject = Create Using "CrypterObject"
			If IsValid ( lco_CryptObject ) Then
				wf_OutPut('Create Using "crypterobject" Success', False)
				If lu_Code.Hexencode ( lco_CryptObject.MD5( lb_temp )) = "19DA6CA7729CF1BAE6A9C7EF1E776AE0" Then
					wf_OutPut('Create Using "crypterobject" test Success', False)
				Else
					wf_OutPut('Create Using "crypterobject" test Failed', False)
				End If
			Else
				wf_OutPut('Create Using "crypterobject" Failed', False)
			End If
			If IsValid ( lco_CryptObject ) Then DesTroy ( lco_CryptObject )
			//userObject
			gs_values = ""
			lu_Crypt = Create u_CryptObject
			If IsValid ( lu_Crypt ) Then
				//CrypterObject Constructor:1
				wf_OutPut(gs_values, False) //Constructor
				gs_values = ""
				wf_OutPut('u_CryptObject Create Success', False)
				DesTroy ( lu_Crypt )
				wf_OutPut(gs_values, False) //Destructor
				If Not IsValid ( lu_Crypt ) Then
					wf_OutPut('u_CryptObject DesTroy Success', False)
				End If
			End If	
			//Trigger Post Event
			If Not IsValid ( lu_Crypt ) Then
				lu_Crypt = Create u_CryptObject
			End If
			gs_values = ""
			//手动触发triggerevent
			lu_Crypt.triggerevent( constructor!)
			//CrypterObject Constructor:2
			wf_OutPut('triggerevent( constructor!):' + gs_values, False) 
			gs_values = ""
			lu_Crypt.triggerevent( "constructor")
			//CrypterObject Constructor:3
			wf_OutPut('triggerevent( "constructor"):' + gs_values, False)
			gs_values = ""
			lu_Crypt.Event constructor()
			//CrypterObject Constructor:4
			wf_OutPut('Event constructor():' + gs_values, False)
			gs_values = ""
			lu_Crypt.Event Destructor()
			wf_OutPut("Event Destructor() = " + gs_values, False) //Destructor
			gs_values = ""
			////CrypterObject Constructor:5
			lu_Crypt.postevent( constructor!)
			cb_post1.Post Event Clicked() //Post Event
			////CrypterObject Constructor:6
			lu_Crypt.postevent( "constructor")
			//cb_post1.Post Event Clicked() //Post Event
						
		Else
			wf_scriptview("//CoderObject~r~n" +&
					"//Create~r~n" +&
					"lb_temp = Blob ( ~"Appeon~",  EncodingANSI! )~r~n" +&
					"lco_CodeObject = Create CoderObject~r~n" +&
					"If IsValid ( lco_CodeObject ) Then~r~n" +&
					"	wf_OutPut(~'Local Create Success~', False)~r~n" +&
					"	ls_rtn = lco_CodeObject.HexEncode( lb_temp )~r~n" +&
					"	wf_OutPut(~'lco_CodeObject.HexEncode( ~"Appeon~" ) = ~' + ls_rtn , False)~r~n" +&
					"	DesTroy ( lco_CodeObject )~r~n" +&
					"	If Not IsValid ( lco_CodeObject ) Then~r~n" +&
					"		wf_OutPut(~'Local DesTroy Success~', False)~r~n" +&
					"	End If	~r~n" +&
					"End If~r~n" +&
					"//Create Using~r~n" +&
					"lco_CodeObject = Create Using ~"coderobject~"~r~n" +&
					"If IsValid ( lco_CodeObject ) Then~r~n" +&
					"	wf_OutPut(~'Create Using ~"coderobject~" Success~', False)~r~n" +&
					"	If lco_CodeObject.hexencode( lb_temp ) = ~"417070656F6E~" Then~r~n" +&
					"		wf_OutPut(~'Create Using ~"coderobject~" test Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'Create Using ~"coderobject~" test Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Create Using ~"coderobject~" Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )~r~n" +&
					"//userObject~r~n" +&
					"lu_Code = Create u_CodeObject~r~n" +&
					"If IsValid ( lu_Code ) Then~r~n" +&
					"	//CoderObject Constructor:1~r~n" +&
					"	wf_OutPut(gs_values, False) //Constructor~r~n" +&
					"	wf_OutPut(~'u_CodeObject Create Success~', False)~r~n" +&
					"	DesTroy ( lu_Code )~r~n" +&
					"	wf_OutPut(gs_values, False) //Destructor~r~n" +&
					"	If Not IsValid ( lu_Code ) Then~r~n" +&
					"		wf_OutPut(~'u_CodeObject DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If	~r~n" +&
					"//Trigger Post Event~r~n" +&
					"If Not IsValid ( lu_Code ) Then~r~n" +&
					"	lu_Code = Create u_CodeObject~r~n" +&
					"End If~r~n" +&
					"//手动触发triggerevent~r~n" +&
					"lu_Code.triggerevent( constructor!)~r~n" +&
					"//CoderObject Constructor:2~r~n" +&
					"wf_OutPut(~'triggerevent( constructor!):~' + gs_values, False)~r~n" +&
					"lu_Code.triggerevent( ~"constructor~")~r~n" +&
					"//CoderObject Constructor:3~r~n" +&
					"wf_OutPut(~'triggerevent( ~"constructor~"):~' + gs_values, False)~r~n" +&
					"lu_Code.Event constructor()~r~n" +&
					"//CoderObject Constructor:4~r~n" +&
					"wf_OutPut(~'Event constructor():~' + gs_values, False)~r~n" +&
					"lu_Code.Event Destructor()~r~n" +&
					"wf_OutPut(~"Event Destructor() = ~" + gs_values, False) //Destructor~r~n" +&
					"////CoderObject Constructor:5~r~n" +&
					"lu_Code.postevent( constructor!)~r~n" +&
					"cb_post1.Post Event Clicked() //Post Event~r~n" +&
					"//CoderObject Constructor:6~r~n" +&
					"lu_Code.postevent( ~"constructor~")~r~n" +&
					"//cb_post1.Post Event Clicked() //Post Event~r~n" +&
					"~r~n" +&
					"//CrypterObject~r~n" +&
					"//Create~r~n" +&
					"gs_values = ~"~"~r~n" +&
					"lco_CryptObject = Create CrypterObject~r~n" +&
					"If IsValid ( lco_CryptObject ) Then~r~n" +&
					"	wf_OutPut(~'Local Create Success~', False)~r~n" +&
					"	lb_rtn = lco_CryptObject.MD5( lb_temp )~r~n" +&
					"	ls_rtn = lu_Code.Hexencode( lb_rtn )~r~n" +&
					"	wf_OutPut(~'lco_CodeObject.MD5( ~"Appeon~" ) = ~' + ls_rtn , False)~r~n" +&
					"	DesTroy ( lco_CryptObject )~r~n" +&
					"	If Not IsValid ( lco_CryptObject ) Then~r~n" +&
					"		wf_OutPut(~'Local DesTroy Success~', False)~r~n" +&
					"	End If	~r~n" +&
					"End If~r~n" +&
					"//Create Using~r~n" +&
					"lco_CryptObject = Create Using ~"CrypterObject~"~r~n" +&
					"If IsValid ( lco_CryptObject ) Then~r~n" +&
					"	wf_OutPut(~'Create Using ~"crypterobject~" Success~', False)~r~n" +&
					"	If lu_Code.Hexencode ( lco_CryptObject.MD5( lb_temp )) = ~"19DA6CA7729CF1BAE6A9C7EF1E776AE0~" Then~r~n" +&
					"		wf_OutPut(~'Create Using ~"crypterobject~" test Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'Create Using ~"crypterobject~" test Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Create Using ~"crypterobject~" Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lco_CryptObject ) Then DesTroy ( lco_CryptObject )~r~n" +&
					"//userObject~r~n" +&
					"lu_Crypt = Create u_CryptObject~r~n" +&
					"If IsValid ( lu_Crypt ) Then~r~n" +&
					"	//CrypterObject Constructor:1~r~n" +&
					"	wf_OutPut(gs_values, False) //Constructor~r~n" +&
					"	wf_OutPut(~'u_CryptObject Create Success~', False)~r~n" +&
					"	DesTroy ( lu_Crypt )~r~n" +&
					"	wf_OutPut(gs_values, False) //Destructor~r~n" +&
					"	If Not IsValid ( lu_Crypt ) Then~r~n" +&
					"		wf_OutPut(~'u_CryptObject DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If	~r~n" +&
					"//Trigger Post Event~r~n" +&
					"If Not IsValid ( lu_Crypt ) Then~r~n" +&
					"	lu_Crypt = Create u_CryptObject~r~n" +&
					"End If~r~n" +&
					"//手动触发triggerevent~r~n" +&
					"lu_Crypt.triggerevent( constructor!)~r~n" +&
					"//CrypterObject Constructor:2~r~n" +&
					"wf_OutPut(~'triggerevent( constructor!):~' + gs_values, False)~r~n" +&
					"lu_Crypt.triggerevent( ~"constructor~")~r~n" +&
					"//CrypterObject Constructor:3~r~n" +&
					"wf_OutPut(~'triggerevent( ~"constructor~"):~' + gs_values, False)~r~n" +&
					"lu_Crypt.Event constructor()~r~n" +&
					"//CrypterObject Constructor:4~r~n" +&
					"wf_OutPut(~'Event constructor():~' + gs_values, False)~r~n" +&
					"lu_Crypt.Event Destructor()~r~n" +&
					"wf_OutPut(~"Event Destructor() = ~" + gs_values, False) //Destructor~r~n" +&
					"////CrypterObject Constructor:5~r~n" +&
					"lu_Crypt.postevent( constructor!)~r~n" +&
					"cb_post1.Post Event Clicked() //Post Event~r~n" +&
					"////CrypterObject Constructor:6~r~n" +&
					"lu_Crypt.postevent( ~"constructor~")~r~n" +&
					"//cb_post1.Post Event Clicked() //Post Event~r~n")
		End If
	
	Case 'P002_classic_Event' 
		If ab_execute = True Then	
			//CoderObject
			If Not IsValid ( lu_Code2 ) Then
				lu_Code2 = Create u_CodeObject
			End If
			//Destructor
			gs_values = ""
			lu_Code2.triggerevent( Destructor!,0,"test_appeon0")
			wf_OutPut('u_Code.triggerevent( Destructor!,0,"test_appeon0") = ' + gs_values, False)
			gs_values = ""
			lu_Code2.triggerevent( Destructor!,100,250)
			wf_OutPut('u_Code.triggerevent( Destructor!,100,250) = ' + gs_values, False)
			gs_values = ""
			//通过trigger触发自定义事件
			lu_Code2.triggerevent( "ue_triggerevent",0,"test_appeon1")
			wf_OutPut('u_Code.triggerevent( "ue_triggerevent",0,"test_appeon1" ) = ' + gs_values, False)
			gs_values = ""
			lu_Code2.triggerevent( "ue_triggerevent",100,150)
			wf_OutPut('u_Code.triggerevent( "ue_triggerevent",100,150 ) = ' + gs_values, False)
			gs_values = ""
			//通过post触发自定义事件
			lu_Code2.postevent( "ue_postevent",0,"test_appeon2")
			cb_post2.Post Event Clicked() //Post Event
			lu_Code2.postevent( "ue_postevent",100,200)
			cb_post2.Post Event Clicked() //Post Event
			lu_Code2.postevent( constructor!,0,"test_appeon3")
			cb_post2.Post Event Clicked() //Post Event
			lu_Code2.postevent( constructor!,100,300)
			cb_post2.Post Event Clicked() //Post Event
			//多写一条,防止临时变量时间到自动销毁
			lu_Code2.postevent( constructor!,100,300)
			
			//CrypterObject
			If Not IsValid ( lu_Crypt2 ) Then
				lu_Crypt2 = Create u_CryptObject
			End If
			//Destructor
			gs_values = ""
			lu_Crypt2.triggerevent( Destructor!,0,"test_appeon0")
			wf_OutPut('u_Crypt.triggerevent( Destructor!,0,"test_appeon0") = ' + gs_values, False)
			gs_values = ""
			lu_Crypt2.triggerevent( Destructor!,100,250)
			wf_OutPut('u_Crypt.triggerevent( Destructor!,100,250) = ' + gs_values, False)
			gs_values = ""
			//通过trigger触发自定义事件
			lu_Crypt2.triggerevent( "ue_triggerevent",0,"test_appeon1")
			wf_OutPut('u_Crypt.triggerevent( "ue_triggerevent",0,"test_appeon1" ) = ' + gs_values, False)
			gs_values = ""
			lu_Crypt2.triggerevent( "ue_triggerevent",100,150)
			wf_OutPut('u_Crypt.triggerevent( "ue_triggerevent",100,150 ) = ' + gs_values, False)
			gs_values = ""
			//通过post触发自定义事件
			lu_Crypt2.postevent( "ue_postevent",0,"test_appeon2")
			cb_post2.Post Event Clicked() //Post Event
			lu_Crypt2.postevent( "ue_postevent",100,200)
			cb_post2.Post Event Clicked() //Post Event
			lu_Crypt2.postevent( constructor!,0,"test_appeon3")
			cb_post2.Post Event Clicked() //Post Event
			lu_Crypt2.postevent( constructor!,100,300)
			cb_post2.Post Event Clicked() //Post Event
			//多写一条,防止临时变量时间到自动销毁
			lu_Crypt2.postevent( constructor!,100,300)
			
		Else
			wf_scriptview("//CoderObject~r~n" +&
					"If Not IsValid ( lu_Code2 ) Then~r~n" +&
					"	lu_Code2 = Create u_CodeObject~r~n" +&
					"End If~r~n" +&
					"//Destructor~r~n" +&
					"lu_Code2.triggerevent( Destructor!,0,~"test_appeon0~")~r~n" +&
					"wf_OutPut(~'u_Code.triggerevent( Destructor!,0,~"test_appeon0~") = ~' + gs_values, False)~r~n" +&
					"lu_Code2.triggerevent( Destructor!,100,250)~r~n" +&
					"wf_OutPut(~'u_Code.triggerevent( Destructor!,100,250) = ~' + gs_values, False)~r~n" +&
					"//通过trigger触发自定义事件~r~n" +&
					"lu_Code2.triggerevent( ~"ue_triggerevent~",0,~"test_appeon1~")~r~n" +&
					"wf_OutPut(~'u_Code.triggerevent( ~"ue_triggerevent~",0,~"test_appeon1~" ) = ~' + gs_values, False)~r~n" +&
					"lu_Code2.triggerevent( ~"ue_triggerevent~",100,150)~r~n" +&
					"wf_OutPut(~'u_Code.triggerevent( ~"ue_triggerevent~",100,150 ) = ~' + gs_values, False)~r~n" +&
					"//通过post触发自定义事件~r~n" +&
					"lu_Code2.postevent( ~"ue_postevent~",0,~"test_appeon2~")~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"lu_Code2.postevent( ~"ue_postevent~",100,200)~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"lu_Code2.postevent( constructor!,0,~"test_appeon3~")~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"lu_Code2.postevent( constructor!,100,300)~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"//多写一条,防止临时变量时间到自动销毁~r~n" +&
					"lu_Code2.postevent( constructor!,100,300)~r~n" +&
					"~r~n" +&
					"//CrypterObject~r~n" +&
					"If Not IsValid ( lu_Crypt2 ) Then~r~n" +&
					"	lu_Crypt2 = Create u_CryptObject~r~n" +&
					"End If~r~n" +&
					"//Destructor~r~n" +&
					"lu_Crypt2.triggerevent( Destructor!,0,~"test_appeon0~")~r~n" +&
					"wf_OutPut(~'u_Crypt.triggerevent( Destructor!,0,~"test_appeon0~") = ~' + gs_values, False)~r~n" +&
					"lu_Crypt2.triggerevent( Destructor!,100,250)~r~n" +&
					"wf_OutPut(~'u_Crypt.triggerevent( Destructor!,100,250) = ~' + gs_values, False)~r~n" +&
					"//通过trigger触发自定义事件~r~n" +&
					"lu_Crypt2.triggerevent( ~"ue_triggerevent~",0,~"test_appeon1~")~r~n" +&
					"wf_OutPut(~'u_Crypt.triggerevent( ~"ue_triggerevent~",0,~"test_appeon1~" ) = ~' + gs_values, False)~r~n" +&
					"lu_Crypt2.triggerevent( ~"ue_triggerevent~",100,150)~r~n" +&
					"wf_OutPut(~'u_Crypt.triggerevent( ~"ue_triggerevent~",100,150 ) = ~' + gs_values, False)~r~n" +&
					"//通过post触发自定义事件~r~n" +&
					"lu_Crypt2.postevent( ~"ue_postevent~",0,~"test_appeon2~")~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"lu_Crypt2.postevent( ~"ue_postevent~",100,200)~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"lu_Crypt2.postevent( constructor!,0,~"test_appeon3~")~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"lu_Crypt2.postevent( constructor!,100,300)~r~n" +&
					"cb_post2.Post Event Clicked() //Post Event~r~n" +&
					"//多写一条,防止临时变量时间到自动销毁~r~n" +&
					"lu_Crypt2.postevent( constructor!,100,300)~r~n")
		End If
	Case 'P003_classic_Classdefinition' 
		If ab_execute = True Then	
			//CoderObject
			If Not IsValid ( lco_Codetmp ) Then
				lco_Codetmp = create CoderObject
			End If
			//通过classdefinition获取对象名称
			lcd_tmp = lco_Codetmp.classdefinition
			ls_rtn = lcd_tmp.name
			wf_output("Code.classdefiniton.name="+ls_rtn,false)
			//通过服务获取公司名称
			lco_Codetmp.GetContextservice("ContextInformation", lcx_key)
			lcx_key.GetCompanyName (ls_rtn)
			wf_output("Code.GetCompanyName="+ls_rtn,false)
			If Isvalid (lco_Codetmp) then DeStroy ( lco_Codetmp )
			
			//CrypterObject
			If Not IsValid ( lco_Crypttmp ) Then
				lco_Crypttmp = create CrypterObject
			End If
			//通过classdefinition获取对象名称
			lcd_tmp = lco_Crypttmp.classdefinition
			ls_rtn = lcd_tmp.name
			wf_output("Crypt.classdefiniton.name="+ls_rtn,false)
			//通过服务获取公司名称
			lco_Crypttmp.GetContextservice("ContextInformation", lcx_key)
			lcx_key.GetCompanyName (ls_rtn)
			wf_output("Crypt.GetCompanyName="+ls_rtn,false)
			If Isvalid (lco_Crypttmp) then DesTroy ( lco_Crypttmp )
		Else
			wf_scriptview("//CoderObject~r~n" +&
					"If Not IsValid ( lco_Codetmp ) Then~r~n" +&
					"	lco_Codetmp = create CoderObject~r~n" +&
					"End If~r~n" +&
					"//通过classdefinition获取对象名称~r~n" +&
					"lcd_tmp = lco_Codetmp.classdefinition~r~n" +&
					"ls_rtn = lcd_tmp.name~r~n" +&
					"wf_output(~"Code.classdefiniton.name=~"+ls_rtn,false)~r~n" +&
					"//通过服务获取公司名称~r~n" +&
					"lco_Codetmp.GetContextservice(~"ContextInformation~", lcx_key)~r~n" +&
					"lcx_key.GetCompanyName (ls_rtn)~r~n" +&
					"wf_output(~"Code.GetCompanyName=~"+ls_rtn,false)~r~n" +&
					"If Isvalid (lco_Codetmp) then DeStroy ( lco_Codetmp )~r~n" +&
					"~r~n" +&
					"//CrypterObject~r~n" +&
					"If Not IsValid ( lco_Crypttmp ) Then~r~n" +&
					"	lco_Crypttmp = create CrypterObject~r~n" +&
					"End If~r~n" +&
					"//通过classdefinition获取对象名称~r~n" +&
					"lcd_tmp = lco_Crypttmp.classdefinition~r~n" +&
					"ls_rtn = lcd_tmp.name~r~n" +&
					"wf_output(~"Crypt.classdefiniton.name=~"+ls_rtn,false)~r~n" +&
					"//通过服务获取公司名称~r~n" +&
					"lco_Crypttmp.GetContextservice(~"ContextInformation~", lcx_key)~r~n" +&
					"lcx_key.GetCompanyName (ls_rtn)~r~n" +&
					"wf_output(~"Crypt.GetCompanyName=~"+ls_rtn,false)~r~n" +&
					"If Isvalid (lco_Crypttmp) then DesTroy ( lco_Crypttmp )~r~n")
		End If

	Case 'P004_classic_ClassName' 
		If ab_execute = True Then
			//Coder ClassName
			lco_Codetmp = Create CoderObject
			ls_rtn = lco_Codetmp.classname( )
			wf_OutPut('ClassName() = ' + ls_rtn, False)
			If IsValid ( lco_Codetmp ) Then DesTroy ( lco_Codetmp )
			//Coder userObject
			lu_Code = Create u_CodeObject
			If IsValid ( lu_Code ) Then
				ls_rtn = lu_Code.classname( )
				wf_OutPut('u_Code ClassName() = ' + ls_rtn, False)
				DesTroy ( lu_Code )				
			End If
			//Coder non UserObject getparent
			ls_rtn = CoderObject_1.getparent().classname()
			wf_OutPut('CoderObject.GetParent() = ' + ls_rtn, False)
			
			//Crypt ClassName
			lco_Crypttmp = Create CrypterObject
			ls_rtn = lco_Crypttmp.classname( )
			wf_OutPut('ClassName() = ' + ls_rtn, False)
			If IsValid ( lco_Crypttmp ) Then DesTroy ( lco_Crypttmp )
			//Crypt userObject
			lu_Crypt = Create u_CryptObject
			If IsValid ( lu_Crypt ) Then
				ls_rtn = lu_Crypt.classname( )
				wf_OutPut('u_Crypt ClassName() = ' + ls_rtn, False)
				DesTroy ( lu_Crypt )				
			End If
			//Crypt non UserObject getparent
			ls_rtn = CrypterObject_1.getparent().classname()
			wf_OutPut('CryptObject.GetParent() = ' + ls_rtn, False)
			
		Else				
			wf_scriptview("//Coder ClassName~r~n" +&
					"lco_Codetmp = Create CoderObject~r~n" +&
					"ls_rtn = lco_Codetmp.classname( )~r~n" +&
					"wf_OutPut(~'ClassName() = ~' + ls_rtn, False)~r~n" +&
					"If IsValid ( lco_Codetmp ) Then DesTroy ( lco_Codetmp )~r~n" +&
					"//Coder userObject~r~n" +&
					"lu_Code = Create u_CodeObject~r~n" +&
					"If IsValid ( lu_Code ) Then~r~n" +&
					"	ls_rtn = lu_Code.classname( )~r~n" +&
					"	wf_OutPut(~'u_Code ClassName() = ~' + ls_rtn, False)~r~n" +&
					"	DesTroy ( lu_Code )~r~n" +&
					"End If~r~n" +&
					"//Coder non UserObject getparent~r~n" +&
					"ls_rtn = CoderObject_1.getparent().classname()~r~n" +&
					"wf_OutPut(~'CoderObject.GetParent() = ~' + ls_rtn, False)~r~n" +&
					"~r~n" +&
					"//Crypt ClassName~r~n" +&
					"lco_Crypttmp = Create CrypterObject~r~n" +&
					"ls_rtn = lco_Crypttmp.classname( )~r~n" +&
					"wf_OutPut(~'ClassName() = ~' + ls_rtn, False)~r~n" +&
					"If IsValid ( lco_Crypttmp ) Then DesTroy ( lco_Crypttmp )~r~n" +&
					"//Crypt userObject~r~n" +&
					"lu_Crypt = Create u_CryptObject~r~n" +&
					"If IsValid ( lu_Crypt ) Then~r~n" +&
					"	ls_rtn = lu_Crypt.classname( )~r~n" +&
					"	wf_OutPut(~'u_Crypt ClassName() = ~' + ls_rtn, False)~r~n" +&
					"	DesTroy ( lu_Crypt )~r~n" +&
					"End If~r~n" +&
					"//Crypt non UserObject getparent~r~n" +&
					"ls_rtn = CrypterObject_1.getparent().classname()~r~n" +&
					"wf_OutPut(~'CryptObject.GetParent() = ~' + ls_rtn, False)~r~n")
		End If
	Case 'P005_classic_TypeOf' 
		If ab_execute = True Then
			//CoderObject
			lco_CodeObject = Create CoderObject
			If  lco_CodeObject.typeof() = CoderObject! then
				wf_OutPut('TypeOf() = CoderObject! Success', False)					
			Else
				wf_OutPut('TypeOf() <> CoderObject! Failed', False)
			End If
			If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )
			//userObject
			lu_Code = Create u_CodeObject
			If IsValid ( lu_Code ) Then
				If  lu_Code.typeof( ) = coderobject! Then
					wf_OutPut('lu_Code TypeOf() = CoderObject! Success', False)
				Else
					wf_OutPut('lu_Code TypeOf() <> CoderObject! Failed', False)
				End If	
				DesTroy ( lu_Code )
			End If
			//CrypterObject
			lco_CryptObject = Create CrypterObject
			If  lco_CryptObject.typeof() = CrypterObject! then
				wf_OutPut('TypeOf() = CrypterObject! Success', False)
			Else
				wf_OutPut('TypeOf() <> CrypterObject! Failed', False)
			End If
			If IsValid ( lco_CryptObject ) Then DesTroy ( lco_CryptObject )
			//userObject
			lu_Crypt = Create u_CryptObject
			If IsValid ( lu_Crypt ) Then
				If  lu_Crypt.typeof( ) = CrypterObject! Then					
					wf_OutPut('lu_Crypt TypeOf() = CrypterObject! Success', False)
				Else
					wf_OutPut('lu_Crypt TypeOf() <> CrypterObject! Failed', False)
				End If	
				DesTroy ( lu_Crypt )
			End If
			
		Else
			wf_scriptview("//CoderObject~r~n" +&
					"lco_CodeObject = Create CoderObject~r~n" +&
					"If  lco_CodeObject.typeof() = CoderObject! then~r~n" +&
					"	wf_OutPut(~'TypeOf() = CoderObject! Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'TypeOf() <> CoderObject! Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )~r~n" +&
					"//userObject~r~n" +&
					"lu_Code = Create u_CodeObject~r~n" +&
					"If IsValid ( lu_Code ) Then~r~n" +&
					"	If  lu_Code.typeof( ) = coderobject! Then~r~n" +&
					"		wf_OutPut(~'lu_Code TypeOf() = CoderObject! Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'lu_Code TypeOf() <> CoderObject! Failed~', False)~r~n" +&
					"	End If	~r~n" +&
					"	DesTroy ( lu_Code )~r~n" +&
					"End If~r~n" +&
					"//CrypterObject~r~n" +&
					"lco_CryptObject = Create CrypterObject~r~n" +&
					"If  lco_CrypterObject.typeof() = CrypterObject! then~r~n" +&
					"	wf_OutPut(~'TypeOf() = CrypterObject! Success~', False)					~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'TypeOf() <> CrypterObject! Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lco_CryptObject ) Then DesTroy ( lco_CryptObject )~r~n" +&
					"//userObject~r~n" +&
					"lu_Crypt = Create u_CryptObject~r~n" +&
					"If IsValid ( lu_Crypt ) Then~r~n" +&
					"	If  lu_Cryp.typeof( ) = CrypterObject! Then					~r~n" +&
					"		wf_OutPut(~'lu_Crypt TypeOf() = CrypterObject! Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'lu_Crypt TypeOf() <> CrypterObject! Failed~', False)~r~n" +&
					"	End If	~r~n" +&
					"	DesTroy ( lu_Crypt )~r~n" +&
					"End If~r~n")
		End If
	Case 'P006_classic_Any' 
		If ab_execute = True Then
			Any any_test, any_test2
			CoderObject lco_Code
			any_test = Create CoderObject
			lco_Code = any_test
			ls_rtn = lco_Code.classname( )
			wf_OutPut('Any ClassName() = ' + ls_rtn, False)
			If  lco_Code.typeof( ) = CoderObject! Then
				wf_OutPut('Any TypeOf() = CoderObject! Success', False)
			Else
				wf_OutPut('Any TypeOf() <> CoderObject! Failed', False)
			End If
			If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
			
			CrypterObject lco_Crypt
			any_test2 = Create CrypterObject
			lco_Crypt = any_test2
			ls_rtn = lco_Crypt.classname( )
			wf_OutPut('Any ClassName() = ' + ls_rtn, False)
			If  lco_Crypt.typeof( ) = CrypterObject! Then
				wf_OutPut('Any TypeOf() = CrypterObject! Success', False)
			Else
				wf_OutPut('Any TypeOf() <> CrypterObject! Failed', False)
			End If
			If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )
		Else
			wf_scriptview("Any any_test, any_test2~r~n" +&
					"CoderObject lco_Code~r~n" +&
					"any_test = Create CoderObject~r~n" +&
					"lco_Code = any_test~r~n" +&
					"ls_rtn = lco_Code.classname( )~r~n" +&
					"wf_OutPut(~'Any ClassName() = ~' + ls_rtn, False)~r~n" +&
					"If  lco_Code.typeof( ) = CoderObject! Then	~r~n" +&
					"	wf_OutPut(~'Any TypeOf() = CoderObject! Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Any TypeOf() <> CoderObject! Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lco_Code ) Then DesTroy ( lco_Code )~r~n" +&
					"~r~n" +&
					"CrypterObject lco_Crypt~r~n" +&
					"any_test2 = Create CrypterObject~r~n" +&
					"lco_Crypt = any_test2~r~n" +&
					"ls_rtn = lco_Crypt.classname( )~r~n" +&
					"wf_OutPut(~'Any ClassName() = ~' + ls_rtn, False)~r~n" +&
					"If  lco_Crypt.typeof( ) = CrypterObject! Then~r~n" +&
					"	wf_OutPut(~'Any TypeOf() = CrypterObject! Success~', False)~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'Any TypeOf() <> CrypterObject! Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )~r~n")

		End If
	Case 'P007_classic_PowerObject' 
		If ab_execute = True Then
			String ls_value
			//CoderObject
			lco_CodeObject = Create CoderObject
			gs_values = ""
			//OpenWithParm
			openwithparm(w_codetmp,lco_CodeObject)
			lco_CodeObject = message.powerobjectparm
			wf_OutPut('OpenWithParm: message Base64Encode(Blob("Appeon")) = '+gs_values, False)
			gs_values = ""
			//closewithreturn
			ls_value = lco_CodeObject.Base64Encode(Blob("Sybase",EncodingANSI!))
			wf_OutPut('CloseWithReturn: message Base64Encode(Blob("Sybase") = ' + ls_value, False)
			
			//CrypterObject
			lco_CryptObject = Create CrypterObject
			//OpenWithParm
			openwithparm(w_crypttmp,lco_CryptObject)
			lco_CryptObject = message.powerobjectparm
			wf_OutPut('OpenWithParm: message MD5(Blob("Appeon")) = '+gs_values, False)
			gs_values = ""
			//closewithreturn
			ls_value = lco_CodeObject.HexEncode(lco_CryptObject.MD5(Blob("Sybase",EncodingANSI!)))
			wf_OutPut('CloseWithReturn: message MD5(Blob("Sybase")) = ' + ls_value, False)
			If IsValid ( lco_CryptObject ) Then DesTroy ( lco_CryptObject )
			If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )
		Else
			wf_scriptview("String ls_value~r~n" +&
					"//CoderObject~r~n" +&
					"lco_CodeObject = Create CoderObject~r~n" +&
					"//OpenWithParm~r~n" +&
					"openwithparm(w_codetmp,lco_CodeObject)~r~n" +&
					"lco_CodeObject = message.powerobjectparm~r~n" +&
					"wf_OutPut(~'OpenWithParm: message Base64Encode(Blob(~"Appeon~")) = ~'+gs_values, False)~r~n" +&
					"//closewithreturn~r~n" +&
					"ls_value = lco_CodeObject.Base64Encode(Blob(~"Sybase~",EncodingANSI!))~r~n" +&
					"wf_OutPut(~'CloseWithReturn: message Base64Encode(Blob(~"Sybase~") = ~' + ls_value, False)~r~n" +&
					"~r~n" +&
					"//CrypterObject~r~n" +&
					"lco_CryptObject = Create CrypterObject~r~n" +&
					"//OpenWithParm~r~n" +&
					"openwithparm(w_crypttmp,lco_CryptObject)~r~n" +&
					"lco_CryptObject = message.powerobjectparm~r~n" +&
					"wf_OutPut(~'OpenWithParm: message MD5(Blob(~"Appeon~")) = ~'+gs_values, False)~r~n" +&
					"//closewithreturn~r~n" +&
					"ls_value = lco_CodeObject.HexEncode(lco_CryptObject.MD5(Blob(~"Sybase~",EncodingANSI!)))~r~n" +&
					"wf_OutPut(~'CloseWithReturn: message MD5(Blob(~"Sybase~")) = ~' + ls_value, False)~r~n" +&
					"If IsValid ( lco_CryptObject ) Then DesTroy ( lco_CryptObject )~r~n" +&
					"If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )~r~n")
		End If		
	Case 'P008_classic_InstanceVariables'
		If ab_execute = True Then
			//CoderObject Instance Variables
			ico_Coder = Create CoderObject
			If  IsValid ( ico_Coder ) Then
				wf_OutPut('CoderObject Instance Create Success', False)
				ls_value = ico_Coder.HexEncode( Blob ( "Pragma", EncodingANSI!) )
				wf_OutPut('CoderObject Instance Variables HexEncode( Blob("Pragma" )) = ' + ls_value, False)
				lco_codeObject = ico_Coder
				ls_value = lco_codeObject.Base64Encode( Blob ( "Pragma", EncodingANSI!) )
				wf_OutPut('CoderObject Local <- Instance Variables Base64Encode( Blob("Pragma" )) = ' + ls_value, False)
				DesTroy ( ico_Coder )
				If  Not IsValid ( ico_Coder ) Then						
					wf_OutPut('CoderObject Instance DesTroy Success', False)
				Else
					wf_OutPut('CoderObject Instance DesTroy Failed', False)
				End If
			Else
				wf_OutPut('CoderObject Instance Create Failed', False)
			End If 
			//CtypterObject Instance Variables
			ico_Coder = Create CoderObject
			ico_Crypter = Create CrypterObject
			If  IsValid ( ico_Crypter ) Then
				wf_OutPut('CrypterObject Instance Create Success', False)
				ls_value = ico_Coder.HexEncode( ico_Crypter.MD5(Blob( "Pragma", EncodingANSI!) ))
				wf_OutPut('CrypterObject Instance Variables MD5( Blob("Pragma" )) = ' + ls_value, False)
				lco_CryptObject = ico_Crypter
				ls_value = ico_Coder.HexEncode( ico_Crypter.SHA( SHA1!,Blob ( "Pragma", EncodingANSI!) ))
				wf_OutPut('CrypterObject Local <- Instance Variables SHA(SHA1!,Blob("Pragma" )) = ' + ls_value, False)
				DesTroy ( ico_Crypter )
				If  Not IsValid ( ico_Crypter ) Then						
					wf_OutPut('CrypterObject Instance DesTroy Success', False)
				Else
					wf_OutPut('CrypterObject Instance DesTroy Failed', False)
				End If
			Else
				wf_OutPut('CrypterObject Instance Create Failed', False)
			End If 
			If IsValid ( ico_Coder ) Then DesTroy ( ico_Coder )
		Else
			wf_scriptview("//CoderObject Instance Variables~r~n" +&
					"ico_Coder = Create CoderObject~r~n" +&
					"If  IsValid ( ico_Coder ) Then~r~n" +&
					"	wf_OutPut(~'CoderObject Instance Create Success~', False)~r~n" +&
					"	ls_value = ico_Coder.HexEncode( Blob ( ~"Pragma~", EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Instance Variables HexEncode( Blob(~"Pragma~" )) = ~' + ls_value, False)~r~n" +&
					"	lco_codeObject = ico_Coder~r~n" +&
					"	ls_value = lco_codeObject.Base64Encode( Blob ( ~"Pragma~", EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Local <- Instance Variables Base64Encode( Blob(~"Pragma~" )) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( ico_Coder )~r~n" +&
					"	If  Not IsValid ( ico_Coder ) Then						~r~n" +&
					"		wf_OutPut(~'CoderObject Instance DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'CoderObject Instance Create Failed~', False)~r~n" +&
					"End If~r~n" +&
					"//CtypterObject Instance Variables~r~n" +&
					"ico_Coder = Create CoderObject~r~n" +&
					"ico_Crypter = Create CrypterObject~r~n" +&
					"If  IsValid ( ico_Crypter ) Then~r~n" +&
					"	wf_OutPut(~'CrypterObject Instance Create Success~', False)~r~n" +&
					"	ls_value = ico_Coder.HexEncode( ico_Crypter.MD5(Blob( ~"Pragma~", EncodingANSI!) ))~r~n" +&
					"	wf_OutPut(~'CrypterObject Instance Variables MD5( Blob(~"Pragma~" )) = ~' + ls_value, False)~r~n" +&
					"	lco_CryptObject = ico_Crypter~r~n" +&
					"	ls_value = ico_Coder.HexEncode( ico_Crypter.SHA( SHA1!,Blob ( ~"Pragma~", EncodingANSI!) ))~r~n" +&
					"	wf_OutPut(~'CrypterObject Local <- Instance Variables SHA(SHA1!,Blob(~"Pragma~" )) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( ico_Crypter )~r~n" +&
					"	If  Not IsValid ( ico_Crypter ) Then						~r~n" +&
					"		wf_OutPut(~'CrypterObject Instance DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"Else~r~n" +&
					"	wf_OutPut(~'CrypterObject Instance Create Failed~', False)~r~n" +&
					"End If~r~n" +&
					"If IsValid ( ico_Coder ) Then DesTroy ( ico_Coder )~r~n")
		End If			
	Case 'P009_classic_SharedVariables'
		If ab_execute = True Then
			//CoderObject Shared Variables
			sco_Coder = Create CoderObject
			If  IsValid ( sco_Coder ) Then
				wf_OutPut('CoderObject Shared Create Success', False)
				ls_value = sco_Coder.HexEncode( Blob ( "Pragma", EncodingANSI!) )
				wf_OutPut('CoderObject Shared Variables HexEncode( Blob("Pragma" )) = ' + ls_value, False)
				//OpenWithParm 在w_tmp2中使用,关闭后共享变量依然有效
				openwithparm(w_codetmp2,sco_Coder)
				wf_OutPut('CoderObject OpenWithParm Shared Variables HexEncode(Blob("json", EncodingANSI!)) = ' + gs_values, False)
				gs_values = ""
				//close  
				ls_value = sco_Coder.Base64Encode( Blob ( "Pragma", EncodingANSI!) )
				wf_OutPut('CoderObject Close Shared Variables Base64Encode(Blob("Pragma", EncodingANSI!)) = ' + ls_value, False)
				//OpenWithParm 在w_tmp3中销毁,关闭后共享变量已经失效,（重新Create也不行？）
				openwithparm(w_codetmp3,sco_Coder)
				//close
				If Not IsValid ( sco_Coder ) Then
					wf_OutPut('CoderObject Close Shared variables and destroy is not valid = Success', False)
				Else
					wf_OutPut('CoderObject Close Shared variables and destroy is valid = Failed', False)
				End If
				//Local = Shared
				sco_Coder = Create CoderObject
				lco_CodeObject = sco_Coder
				ls_value = lco_CodeObject.HexEncode( Blob ( "Pragma", EncodingANSI!) )
				wf_OutPut('CoderObject Local <- Shared Variables HexEncode( Blob("Pragma")) = ' + ls_value, False)
				DesTroy ( sco_Coder )
				If  Not IsValid ( sco_Coder ) Then
					wf_OutPut('CoderObject Shared DesTroy Success', False)
				Else
					wf_OutPut('CoderObject Shared DesTroy Failed', False)
				End If 
			End If
			
			//CtyptObject Shared Variables
			sco_Crypter = Create CrypterObject
			If  IsValid ( sco_Crypter ) Then
				sco_Coder = Create CoderObject
				wf_OutPut('CtyptObject Shared Create Success', False)
				ls_value = sco_Coder.HexEncode( sco_Crypter.MD5( Blob ( "Pragma", EncodingANSI!) ))
				wf_OutPut('CtyptObject Shared Variables MD5( Blob("Pragma" )) = ' + ls_value, False)
				//OpenWithParm 在w_tmp2中调用,关闭后共享变量依然有效
				openwithparm(w_crypttmp2,sco_Crypter)
				wf_OutPut('CtyptObject OpenWithParm Shared Variables MD5(Blob("json", EncodingANSI!)) = ' + gs_values, False)
				gs_values = ""
				//close  
				ls_value = sco_Coder.HexEncode(sco_Crypter.SHA( Sha1!, Blob ( "Pragma", EncodingANSI!) ))
				wf_OutPut('CtyptObject Close Shared Variables SHA(Sha1!,Blob("Pragma", EncodingANSI!)) = ' + ls_value, False)
				//OpenWithParm 在w_tmp3中销毁,关闭后共享变量已经失效,（重新Create也不行？）
				openwithparm(w_crypttmp3,sco_Crypter)
				//close
				If Not IsValid ( sco_Crypter ) Then
					wf_OutPut('CtyptObject Close Shared variables and destroy is not valid = Success', False)
				Else
					wf_OutPut('CtyptObject Close Shared variables and destroy is valid = Failed', False)
				End If
				//Local = Shared
				sco_Crypter = Create CrypterObject
				lco_CryptObject = sco_Crypter
				ls_value = sco_Coder.HexEncode( lco_CryptObject.MD5( Blob ( "Pragma", EncodingANSI!) ) )
				wf_OutPut('CtyptObject Local <- Shared Variables MD5( Blob("Pragma")) = ' + ls_value, False)
				DesTroy ( sco_Crypter )
				If  Not IsValid ( sco_Crypter ) Then
					wf_OutPut('CtyptObject Shared DesTroy Success', False)
				Else
					wf_OutPut('CtyptObject Shared DesTroy Failed', False)
				End If 
				If IsValid ( sco_Coder ) Then DesTroy ( sco_Coder )
			End If
		Else
			wf_scriptview("//CoderObject Shared Variables~r~n" +&
					"sco_Coder = Create CoderObject~r~n" +&
					"If  IsValid ( sco_Coder ) Then~r~n" +&
					"	wf_OutPut(~'CoderObject Shared Create Success~', False)~r~n" +&
					"	ls_value = sco_Coder.HexEncode( Blob ( ~"Pragma~", EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Shared Variables HexEncode( Blob(~"Pragma~" )) = ~' + ls_value, False)~r~n" +&
					"	//OpenWithParm 在w_tmp2中使用,关闭后共享变量依然有效~r~n" +&
					"	openwithparm(w_codetmp2,sco_Coder)~r~n" +&
					"	wf_OutPut(~'CoderObject OpenWithParm Shared Variables HexEncode(Blob(~"json~", EncodingANSI!)) = ~' + gs_values, False)~r~n" +&
					"	//close~r~n" +&
					"	ls_value = sco_Coder.Base64Encode( Blob ( ~"Pragma~", EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Close Shared Variables Base64Encode(Blob(~"Pragma~", EncodingANSI!)) = ~' + ls_value, False)~r~n" +&
					"	//OpenWithParm 在w_tmp3中销毁,关闭后共享变量已经失效,（重新Create也不行？）~r~n" +&
					"	openwithparm(w_codetmp3,sco_Coder)~r~n" +&
					"	//close~r~n" +&
					"	If Not IsValid ( sco_Coder ) Then~r~n" +&
					"		wf_OutPut(~'CoderObject Close Shared variables and destroy is not valid = Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'CoderObject Close Shared variables and destroy is valid = Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"	//Local = Shared~r~n" +&
					"	sco_Coder = Create CoderObject~r~n" +&
					"	lco_CodeObject = sco_Coder~r~n" +&
					"	ls_value = lco_CodeObject.HexEncode( Blob ( ~"Pragma~", EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Local <- Shared Variables HexEncode( Blob(~"Pragma~")) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( sco_Coder )~r~n" +&
					"	If  Not IsValid ( sco_Coder ) Then~r~n" +&
					"		wf_OutPut(~'CoderObject Shared DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//CtyptObject Shared Variables~r~n" +&
					"sco_Crypter = Create CrypterObject~r~n" +&
					"If  IsValid ( sco_Crypter ) Then~r~n" +&
					"	sco_Coder = Create CoderObject~r~n" +&
					"	wf_OutPut(~'CtyptObject Shared Create Success~', False)~r~n" +&
					"	ls_value = sco_Coder.HexEncode( sco_Crypter.MD5( Blob ( ~"Pragma~", EncodingANSI!) ))~r~n" +&
					"	wf_OutPut(~'CtyptObject Shared Variables MD5( Blob(~"Pragma~" )) = ~' + ls_value, False)~r~n" +&
					"	//OpenWithParm 在w_tmp2中调用,关闭后共享变量依然有效~r~n" +&
					"	openwithparm(w_crypttmp2,sco_Crypter)~r~n" +&
					"	wf_OutPut(~'CtyptObject OpenWithParm Shared Variables MD5(Blob(~"json~", EncodingANSI!)) = ~' + gs_values, False)~r~n" +&
					"	//close~r~n" +&
					"	ls_value = sco_Coder.HexEncode(sco_Crypter.SHA( Sha1!, Blob ( ~"Pragma~", EncodingANSI!) ))~r~n" +&
					"	wf_OutPut(~'CtyptObject Close Shared Variables SHA(Sha1!,Blob(~"Pragma~", EncodingANSI!)) = ~' + ls_value, False)~r~n" +&
					"	//OpenWithParm 在w_tmp3中销毁,关闭后共享变量已经失效,（重新Create也不行？）~r~n" +&
					"	openwithparm(w_crypttmp3,sco_Crypter)~r~n" +&
					"	//close~r~n" +&
					"	If Not IsValid ( sco_Crypter ) Then~r~n" +&
					"		wf_OutPut(~'CtyptObject Close Shared variables and destroy is not valid = Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'CtyptObject Close Shared variables and destroy is valid = Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"	//Local = Shared~r~n" +&
					"	sco_Crypter = Create CrypterObject~r~n" +&
					"	lco_CryptObject = sco_Crypter~r~n" +&
					"	ls_value = sco_Coder.HexEncode( lco_CryptObject.MD5( Blob ( ~"Pragma~", EncodingANSI!) ) )~r~n" +&
					"	wf_OutPut(~'CtyptObject Local <- Shared Variables MD5( Blob(~"Pragma~")) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( sco_Crypter )~r~n" +&
					"	If  Not IsValid ( sco_Crypter ) Then~r~n" +&
					"		wf_OutPut(~'CtyptObject Shared DesTroy Success~', False)~r~n" +&
					"	End If~r~n" +&
					"	If IsValid ( sco_Coder ) Then DesTroy ( sco_Coder )~r~n" +&
					"End If~r~n")
		End If
	Case 'P010_classic_GlobalVariables'
		If ab_execute = True Then
			//CoderObject Global Variables
			gco_Coder = Create CoderObject
			If  IsValid ( gco_Coder ) Then
				wf_OutPut('CoderObject Global Create Success', False)
				ls_value = gco_Coder.HexEncode( Blob ( "Pragma",EncodingANSI!) )
				wf_OutPut('CoderObject Global Variables HexEncode(Blob("Pragma",EncodingANSI!)) = ' + ls_value, False)
				lco_CodeObject = gco_Coder
				ls_value = lco_CodeObject.Base64Encode( Blob ( "Pragma",EncodingANSI!) )
				wf_OutPut('CoderObject Local <- Global Variables Base64Encode(Blob("Pragma",EncodingANSI!)) = ' + ls_value, False)
				DesTroy ( gco_Coder )
				If  Not IsValid ( gco_Coder ) Then
					wf_OutPut('CoderObject Global DesTroy Success', False)
				Else
					wf_OutPut('CoderObject Global DesTroy Failed', False)
				End If
			End If
			
			//CrypterObject Global Variables
			gco_Crypter = Create CrypterObject
			If  IsValid ( gco_Crypter ) Then
				gco_Coder = Create CoderObject
				wf_OutPut('CrypterObject Global Create Success', False)
				ls_value = gco_Coder.HexEncode( gco_Crypter.MD5(Blob ( "Pragma",EncodingANSI!) ))
				wf_OutPut('CrypterObject Global Variables MD5(Blob("Pragma",EncodingANSI!)) = ' + ls_value, False)
				lco_CryptObject = gco_Crypter
				ls_value = gco_Coder.HexEncode( lco_CryptObject.SHA(SHA1!,Blob ( "Pragma",EncodingANSI!) ))
				wf_OutPut('CrypterObject Local <- Global Variables SHA(SHA1!,Blob("Pragma",EncodingANSI!)) = ' + ls_value, False)
				DesTroy ( gco_Crypter )
				If  Not IsValid ( gco_Crypter ) Then
					wf_OutPut('CrypterObject Global DesTroy Success', False)
				Else
					wf_OutPut('CrypterObject Global DesTroy Failed', False)
				End If
				If IsValid ( gco_Coder ) Then DesTroy ( gco_Coder )
			End If
		Else
			wf_scriptview("//CoderObject Global Variables~r~n" +&
					"gco_Coder = Create CoderObject~r~n" +&
					"If  IsValid ( gco_Coder ) Then~r~n" +&
					"	wf_OutPut(~'CoderObject Global Create Success~', False)~r~n" +&
					"	ls_value = gco_Coder.HexEncode( Blob ( ~"Pragma~",EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Global Variables HexEncode(Blob(~"Pragma~",EncodingANSI!)) = ~' + ls_value, False)~r~n" +&
					"	lco_CodeObject = gco_Coder~r~n" +&
					"	ls_value = lco_CodeObject.Base64Encode( Blob ( ~"Pragma~",EncodingANSI!) )~r~n" +&
					"	wf_OutPut(~'CoderObject Local <- Global Variables Base64Encode(Blob(~"Pragma~",EncodingANSI!)) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( gco_Coder )~r~n" +&
					"	If  Not IsValid ( gco_Coder ) Then~r~n" +&
					"		wf_OutPut(~'CoderObject Global DesTroy Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'CoderObject Global DesTroy Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//CrypterObject Global Variables~r~n" +&
					"gco_Crypter = Create CrypterObject~r~n" +&
					"If  IsValid ( gco_Crypter ) Then~r~n" +&
					"	gco_Coder = Create CoderObject~r~n" +&
					"	wf_OutPut(~'CrypterObject Global Create Success~', False)~r~n" +&
					"	ls_value = gco_Coder.HexEncode( gco_Crypter.MD5(Blob ( ~"Pragma~",EncodingANSI!) ))~r~n" +&
					"	wf_OutPut(~'CrypterObject Global Variables MD5(Blob(~"Pragma~",EncodingANSI!)) = ~' + ls_value, False)~r~n" +&
					"	lco_CryptObject = gco_Crypter~r~n" +&
					"	ls_value = gco_Coder.HexEncode( lco_CryptObject.SHA(SHA1!,Blob ( ~"Pragma~",EncodingANSI!) ))~r~n" +&
					"	wf_OutPut(~'CrypterObject Local <- Global Variables SHA(SHA1!,Blob(~"Pragma~",EncodingANSI!)) = ~' + ls_value, False)~r~n" +&
					"	DesTroy ( gco_Crypter )~r~n" +&
					"	If  Not IsValid ( gco_Crypter ) Then~r~n" +&
					"		wf_OutPut(~'CrypterObject Global DesTroy Success~', False)~r~n" +&
					"	Else~r~n" +&
					"		wf_OutPut(~'CrypterObject Global DesTroy Failed~', False)~r~n" +&
					"	End If~r~n" +&
					"	If IsValid ( gco_Coder ) Then DesTroy ( gco_Coder )~r~n" +&
					"End If~r~n")
		End If			
	Case 'P011_classic_Argument'
		If ab_execute = True Then
			//Argument
			//CoderObject
			lco_code1 = Create CoderObject
			lco_code2 = Create CoderObject
			lco_Array[1] = Create CoderObject
			
			//any类型reference,Value，数组参数传递窗口函数
			// Arguments:
			// 	value        	any           		aco_1
			// 	reference    CoderObject    	aco_2
			// 	value        	CoderObject    	aco_array[]
			lany_temp = lco_code1
			ls_output = wf_CoderObject_Argument( lany_temp, lco_code2, lco_Array)
			wf_OutPut(ls_output, False)
			
			//reference,Value，数组参数传递窗口事件
			// Arguments:
			// 	value        CoderObject    aco_1
			// 	reference    CoderObject    aco_2
			// 	value        CoderObject    aco_array[]
			
			ls_output = Event ue_CoderObject_Argument( lany_temp,lco_code2,lco_Array )
			wf_OutPut(ls_output, False)
			
			lstr_1.code_1 = lco_code1
			lstr_1.code_array = lco_Array
			
			//reference,Value，数组和结构体参数传递全局函数
			// Arguments:
			// 	value        CoderObject        	aco_1
			// 	reference    CoderObject      	aco_2
			// 	value        str_CodeCrypt    		astr_1
			// 	value        CoderObject        	aco_array[]
			ls_output = f_CoderObject_argument ( lco_code1, lco_code2, lstr_1, lco_Array ) 
			wf_OutPut(ls_output, False)
			
			gstr_1.code_1 = lco_code1
			gstr_1.code_array = lco_Array
			ls_output = f_CoderObject_argument ( lco_code1, lco_code2, gstr_1, lco_Array ) 
			wf_OutPut(ls_output, False)
			
			//readonly传递，并返回Any类型		
			 lco_Array[2] = wf_coderobject_any_readonly ( lco_code1 )
			 If  IsValid ( lco_Array[2] ) Then
				wf_OutPut("CoderObject From Return Any Success", False)	
				ls_value = lco_Array[2].HexEncode( Blob("Pragma",EncodingANSI! ) )
				wf_OutPut('CoderObject From Return Any HexEncode("Pragma") = ' + ls_value, False)
				//readonly
				ls_value = lco_Array[2].HexEncode( Blob("readonly",EncodingANSI! ) )
				wf_OutPut('readonly CoderObject From Return Any HexEncode("readonly") = ' + ls_value, False)
			End If
			
			If  IsValid ( lco_code2 ) Then DesTroy ( lco_code2 )
			If  IsValid ( lco_Array[1] ) Then DesTroy ( lco_Array[1] )
						
			//CrypterObject
			lco_Crypt1 = Create CrypterObject
			lco_Crypt2 = Create CrypterObject
			lco_Array2[1] = Create CrypterObject
			
			//any类型reference,Value，数组参数传递窗口函数
			// Arguments:
			// 	value        	any           		aco_1
			// 	reference    CrypterObject    	aco_2
			// 	value        	CrypterObject    	aco_array[]
			lany_temp = lco_Crypt1
			ls_output = wf_CrypterObject_Argument( lany_temp, lco_Crypt2, lco_Array2)
			wf_OutPut(ls_output, False)
			
			//reference,Value，数组参数传递窗口事件
			// Arguments:
			// 	value        CrypterObject    aco_1
			// 	reference    CrypterObject    aco_2
			// 	value        CrypterObject    aco_array[]
			ls_output = Event ue_CrypterObject_Argument( lany_temp,lco_Crypt2,lco_Array2 )
			wf_OutPut(ls_output, False)
			
			lstr_1.Crypt_1 = lco_crypt1
			lstr_1.Crypt_array = lco_Array2
			//reference,Value，数组和结构体参数传递全局函数
			// Arguments:
			// 	value        CrypterObject        	aco_1
			// 	reference    CrypterObject        aco_2
			// 	value        str_CodeCrypt    		astr_1
			// 	value        CrypterObject        	aco_array[]
			ls_output = f_CrypterObject_argument ( lco_Crypt1, lco_Crypt2, lstr_1, lco_Array2 ) 
			wf_OutPut(ls_output, False)
			
			gstr_1.crypt_1 = lco_crypt1
			gstr_1.crypt_array = lco_Array2
			
			ls_output = f_CrypterObject_argument ( lco_crypt1, lco_crypt2, gstr_1, lco_Array2 ) 
			wf_OutPut(ls_output, False)
			
			//readonly传递，并返回Any类型		
			 lco_Array2[2] = wf_Crypterobject_any_readonly ( lco_Crypt1 )
			 If  IsValid ( lco_Array2[2] ) Then
				wf_OutPut("CrypterObject From Return Any Success", False)	
				ls_value = lco_code1.HexEncode(lco_Array2[2].MD5( Blob("Pragma",EncodingANSI! ) ))
				wf_OutPut('CrypterObject From Return Any MD5("Pragma") = ' + ls_value, False)
				//readonly
				ls_value = lco_code1.HexEncode(lco_Array2[2].MD5( Blob("readonly",EncodingANSI! ) ))
				wf_OutPut('readonly CrypterObject From Return Any MD5("readonly") = ' + ls_value, False)
			End If
			
			If  IsValid ( lco_code1 ) Then DesTroy ( lco_code1 )
			If  IsValid ( lco_Array[2] ) Then DesTroy ( lco_Array[2] )
			If  IsValid ( lco_Crypt1 ) Then DesTroy ( lco_Crypt1 )
			If  IsValid ( lco_Crypt2 ) Then DesTroy ( lco_Crypt2 )
			If  IsValid ( lco_Array2[1] ) Then DesTroy ( lco_Array2[1] )
			If  IsValid ( lco_Array2[2] ) Then DesTroy ( lco_Array2[2] )
			
		Else
			wf_scriptview("//Argument~r~n" +&
					"string ls_output~r~n" +&
					"CoderObject 	lco_code1, lco_code2~r~n" +&
					"CoderObject 	lco_Array[5]	~r~n" +&
					"CrypterObject 	lco_crypt1, lco_crypt2~r~n" +&
					"CrypterObject 	lco_Array2[5]	~r~n" +&
					"any 				lany_temp~r~n" +&
					"str_CodeCrypt lstr_1~r~n" +&
					"~r~n" +&
					"//CoderObject~r~n" +&
					"lco_code1 = Create CoderObject~r~n" +&
					"lco_code2 = Create CoderObject~r~n" +&
					"lco_Array[1] = Create CoderObject~r~n" +&
					"~r~n" +&
					"//any类型reference,Value，数组参数传递窗口函数~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        	any           		aco_1~r~n" +&
					"// 	reference    CoderObject    	aco_2~r~n" +&
					"// 	value        	CoderObject    	aco_array[]~r~n" +&
					"lany_temp = lco_code1~r~n" +&
					"ls_output = wf_CoderObject_Argument( lany_temp, lco_code2, lco_Array)~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"//reference,Value，数组参数传递窗口事件~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        CoderObject    aco_1~r~n" +&
					"// 	reference    CoderObject    aco_2~r~n" +&
					"// 	value        CoderObject    aco_array[]~r~n" +&
					"~r~n" +&
					"ls_output = Event ue_CoderObject_Argument( lany_temp,lco_code2,lco_Array )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"lstr_1.code_1 = lco_code1~r~n" +&
					"lstr_1.code_array = lco_Array~r~n" +&
					"~r~n" +&
					"//reference,Value，数组和结构体参数传递全局函数~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        CoderObject        	aco_1~r~n" +&
					"// 	reference    CoderObject      	aco_2~r~n" +&
					"// 	value        str_CodeCrypt    		astr_1~r~n" +&
					"// 	value        CoderObject        	aco_array[]~r~n" +&
					"ls_output = f_CoderObject_argument ( lco_code1, lco_code2, lstr_1, lco_Array )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"gstr_1.code_1 = lco_code1~r~n" +&
					"gstr_1.code_array = lco_Array~r~n" +&
					"ls_output = f_CoderObject_argument ( lco_code1, lco_code2, gstr_1, lco_Array )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"//readonly传递，并返回Any类型		~r~n" +&
					" lco_Array[2] = wf_coderobject_any_readonly ( lco_code1 )~r~n" +&
					" If  IsValid ( lco_Array[2] ) Then~r~n" +&
					"	wf_OutPut(~"CoderObject From Return Any Success~", False)	~r~n" +&
					"	ls_value = lco_Array[2].HexEncode( Blob(~"Pragma~",EncodingANSI! ) )~r~n" +&
					"	wf_OutPut(~'CoderObject From Return Any HexEncode(~"Pragma~") = ~' + ls_value, False)~r~n" +&
					"	//readonly~r~n" +&
					"	ls_value = lco_Array[2].HexEncode( Blob(~"readonly~",EncodingANSI! ) )~r~n" +&
					"	wf_OutPut(~'readonly CoderObject From Return Any HexEncode(~"readonly~") = ~' + ls_value, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"If  IsValid ( lco_code2 ) Then DesTroy ( lco_code2 )~r~n" +&
					"If  IsValid ( lco_Array[1] ) Then DesTroy ( lco_Array[1] )~r~n" +&
					"			~r~n" +&
					"//CrypterObject~r~n" +&
					"lco_Crypt1 = Create CrypterObject~r~n" +&
					"lco_Crypt2 = Create CrypterObject~r~n" +&
					"lco_Array2[1] = Create CrypterObject~r~n" +&
					"~r~n" +&
					"//any类型reference,Value，数组参数传递窗口函数~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        	any           		aco_1~r~n" +&
					"// 	reference    CrypterObject    	aco_2~r~n" +&
					"// 	value        	CrypterObject    	aco_array[]~r~n" +&
					"lany_temp = lco_Crypt1~r~n" +&
					"ls_output = wf_CrypterObject_Argument( lany_temp, lco_Crypt2, lco_Array2)~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"//reference,Value，数组参数传递窗口事件~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        CrypterObject    aco_1~r~n" +&
					"// 	reference    CrypterObject    aco_2~r~n" +&
					"// 	value        CrypterObject    aco_array[]~r~n" +&
					"ls_output = Event ue_CrypterObject_Argument( lany_temp,lco_Crypt2,lco_Array2 )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"lstr_1.Crypt_1 = lco_crypt1~r~n" +&
					"lstr_1.Crypt_array = lco_Array2~r~n" +&
					"//reference,Value，数组和结构体参数传递全局函数~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value        CrypterObject        	aco_1~r~n" +&
					"// 	reference    CrypterObject        aco_2~r~n" +&
					"// 	value        str_CodeCrypt    		astr_1~r~n" +&
					"// 	value        CrypterObject        	aco_array[]~r~n" +&
					"ls_output = f_CrypterObject_argument ( lco_Crypt1, lco_Crypt2, lstr_1, lco_Array2 )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"gstr_1.crypt_1 = lco_crypt1~r~n" +&
					"gstr_1.crypt_array = lco_Array2~r~n" +&
					"~r~n" +&
					"ls_output = f_CrypterObject_argument ( lco_crypt1, lco_crypt2, gstr_1, lco_Array2 )~r~n" +&
					"wf_OutPut(ls_output, False)~r~n" +&
					"~r~n" +&
					"//readonly传递，并返回Any类型~r~n" +&
					" lco_Array2[2] = wf_Crypterobject_any_readonly ( lco_Crypt1 )~r~n" +&
					" If  IsValid ( lco_Array2[2] ) Then~r~n" +&
					"	wf_OutPut(~"CrypterObject From Return Any Success~", False)	~r~n" +&
					"	ls_value = lco_code1.HexEncode(lco_Array2[2].MD5( Blob(~"Pragma~",EncodingANSI! ) ))~r~n" +&
					"	wf_OutPut(~'CrypterObject From Return Any MD5(~"Pragma~") = ~' + ls_value, False)~r~n" +&
					"	//readonly~r~n" +&
					"	ls_value = lco_code1.HexEncode(lco_Array2[2].MD5( Blob(~"readonly~",EncodingANSI! ) ))~r~n" +&
					"	wf_OutPut(~'readonly CrypterObject From Return Any MD5(~"readonly~") = ~' + ls_value, False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"If  IsValid ( lco_code1 ) Then DesTroy ( lco_code1 )~r~n" +&
					"If  IsValid ( lco_Array[2] ) Then DesTroy ( lco_Array[2] )~r~n" +&
					"If  IsValid ( lco_Crypt1 ) Then DesTroy ( lco_Crypt1 )~r~n" +&
					"If  IsValid ( lco_Crypt2 ) Then DesTroy ( lco_Crypt2 )~r~n" +&
					"If  IsValid ( lco_Array2[1] ) Then DesTroy ( lco_Array2[1] )~r~n" +&
					"If  IsValid ( lco_Array2[2] ) Then DesTroy ( lco_Array2[2] )~r~n")
		End If			
	Case 'P012_classic_Array' 
		If ab_execute = True Then				
			Long ll_I
			//CoderObject 固定数组
			For ll_I = 1 to 5
				lco_Array[ll_I] = Create CoderObject
				If  IsValid ( lco_Array[ll_I] ) Then
					wf_OutPut("CoderObject_Array["+String ( ll_I )+"] Create Success", False)
					wf_OutPut("CoderObject_Array["+String ( ll_I )+'] HexEncode("Pragma") = ' + lco_Array[ll_I].HexEncode( Blob ( "Pragma",EncodingANSI!) ), False)					
					DesTroy ( lco_Array[ll_I] )					
					If  Not IsValid ( lco_Array[ll_I] ) Then
						wf_OutPut("CoderObject_Array["+String ( ll_I )+"] DesTroy Success", False)
					End If 
				End If 					
			Next
			//CoderObject 非固定数组
			CoderObject 	lco_Array3[]
			For ll_I = 1 to 3
				lco_Array3[ll_I] = Create CoderObject
				If  IsValid ( lco_Array3[ll_I] ) Then
					wf_OutPut("CoderObject_Array["+String ( ll_I )+"] Create Success", False)
					wf_OutPut("CoderObject_Array["+String ( ll_I )+'] HexEncode("Pragma") = ' + lco_Array3[ll_I].HexEncode( Blob("Pragma",EncodingANSI!) ), False)
					
					DesTroy ( lco_Array3[ll_I] )					
					If  Not IsValid ( lco_Array3[ll_I] ) Then
						wf_OutPut("CoderObject_Array["+String ( ll_I )+"] DesTroy Success", False)
					End If
				End If 					
			Next
			
			//CrypterObject 固定数组
			If Not IsValid ( lco_CodeObject ) Then
				lco_CodeObject = Create CoderObject
			End If
			For ll_I = 1 to 5
				lco_Array2[ll_I] = Create CrypterObject
				If  IsValid ( lco_Array2[ll_I] ) Then
					wf_OutPut("CrypterObject_Array["+String ( ll_I )+"] Create Success", False)
					wf_OutPut("CrypterObject_Array["+String ( ll_I )+'] MD5("Pragma") = ' + lco_CodeObject.HexEncode(lco_Array2[ll_I].MD5( Blob ( "Pragma",EncodingANSI!)) ), False)
					DesTroy ( lco_Array2[ll_I] )
					If  Not IsValid ( lco_Array2[ll_I] ) Then
						wf_OutPut("CrypterObject_Array["+String ( ll_I )+"] DesTroy Success", False)
					End If
				End If
			Next
			//CrypterObject 非固定数组
			CrypterObject 	lco_Array4[]
			For ll_I = 1 to 3
				lco_Array4[ll_I] = Create CrypterObject
				If  IsValid ( lco_Array4[ll_I] ) Then
					wf_OutPut("CrypterObject_Array["+String ( ll_I )+"] Create Success", False)
					wf_OutPut("CrypterObject_Array["+String ( ll_I )+'] MD5("Pragma") = ' + lco_CodeObject.HexEncode(lco_Array4[ll_I].MD5( Blob("Pragma",EncodingANSI!)) ), False)
					
					DesTroy ( lco_Array4[ll_I] )
					If  Not IsValid ( lco_Array4[ll_I] ) Then
						wf_OutPut("CrypterObject_Array["+String ( ll_I )+"] DesTroy Success", False)
					End If
				End If
			Next
			If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )
		Else
			wf_scriptview("Long ll_I~r~n" +&
					"//CoderObject 固定数组~r~n" +&
					"For ll_I = 1 to 5~r~n" +&
					"	lco_Array[ll_I] = Create CoderObject~r~n" +&
					"	If  IsValid ( lco_Array[ll_I] ) Then~r~n" +&
					"		wf_OutPut(~"CoderObject_Array[~"+String ( ll_I )+~"] Create Success~", False)~r~n" +&
					"		wf_OutPut(~"CoderObject_Array[~"+String ( ll_I )+~'] HexEncode(~"Pragma~") = ~' + lco_Array[ll_I].HexEncode( Blob ( ~"Pragma~",EncodingANSI!) ), False)					~r~n" +&
					"		DesTroy ( lco_Array[ll_I] )~r~n" +&
					"		If  Not IsValid ( lco_Array[ll_I] ) Then~r~n" +&
					"			wf_OutPut(~"CoderObject_Array[~"+String ( ll_I )+~"] DesTroy Success~", False)~r~n" +&
					"		End If~r~n" +&
					"	End If~r~n" +&
					"Next~r~n" +&
					"//CoderObject 非固定数组~r~n" +&
					"CoderObject 	lco_Array3[]~r~n" +&
					"For ll_I = 1 to 3~r~n" +&
					"	lco_Array3[ll_I] = Create CoderObject~r~n" +&
					"	If  IsValid ( lco_Array3[ll_I] ) Then~r~n" +&
					"		wf_OutPut(~"CoderObject_Array[~"+String ( ll_I )+~"] Create Success~", False)~r~n" +&
					"		wf_OutPut(~"CoderObject_Array[~"+String ( ll_I )+~'] HexEncode(~"Pragma~") = ~' + lco_Array3[ll_I].HexEncode( Blob(~"Pragma~",EncodingANSI!) ), False)~r~n" +&
					"		~r~n" +&
					"		DesTroy ( lco_Array3[ll_I] )~r~n" +&
					"		If  Not IsValid ( lco_Array3[ll_I] ) Then~r~n" +&
					"			wf_OutPut(~"CoderObject_Array[~"+String ( ll_I )+~"] DesTroy Success~", False)~r~n" +&
					"		End If~r~n" +&
					"	End If~r~n" +&
					"Next~r~n" +&
					"~r~n" +&
					"//CrypterObject 固定数组~r~n" +&
					"If Not IsValid ( lco_CodeObject ) Then~r~n" +&
					"	lco_CodeObject = Create CoderObject~r~n" +&
					"End If~r~n" +&
					"For ll_I = 1 to 5~r~n" +&
					"	lco_Array2[ll_I] = Create CrypterObject~r~n" +&
					"	If  IsValid ( lco_Array2[ll_I] ) Then~r~n" +&
					"		wf_OutPut(~"CrypterObject_Array[~"+String ( ll_I )+~"] Create Success~", False)~r~n" +&
					"		wf_OutPut(~"CrypterObject_Array[~"+String ( ll_I )+~'] MD5(~"Pragma~") = ~' + lco_CodeObject.HexEncode(lco_Array2[ll_I].MD5( Blob ( ~"Pragma~",EncodingANSI!)) ), False)~r~n" +&
					"		DesTroy ( lco_Array2[ll_I] )~r~n" +&
					"		If  Not IsValid ( lco_Array2[ll_I] ) Then~r~n" +&
					"			wf_OutPut(~"CrypterObject_Array[~"+String ( ll_I )+~"] DesTroy Success~", False)~r~n" +&
					"		End If~r~n" +&
					"	End If~r~n" +&
					"Next~r~n" +&
					"//CrypterObject 非固定数组~r~n" +&
					"CrypterObject 	lco_Array4[]~r~n" +&
					"For ll_I = 1 to 3~r~n" +&
					"	lco_Array4[ll_I] = Create CrypterObject~r~n" +&
					"	If  IsValid ( lco_Array4[ll_I] ) Then~r~n" +&
					"		wf_OutPut(~"CrypterObject_Array[~"+String ( ll_I )+~"] Create Success~", False)~r~n" +&
					"		wf_OutPut(~"CrypterObject_Array[~"+String ( ll_I )+~'] MD5(~"Pragma~") = ~' + lco_CodeObject.HexEncode(lco_Array4[ll_I].MD5( Blob(~"Pragma~",EncodingANSI!)) ), False)~r~n" +&
					"		~r~n" +&
					"		DesTroy ( lco_Array4[ll_I] )~r~n" +&
					"		If  Not IsValid ( lco_Array4[ll_I] ) Then~r~n" +&
					"			wf_OutPut(~"CrypterObject_Array[~"+String ( ll_I )+~"] DesTroy Success~", False)~r~n" +&
					"		End If~r~n" +&
					"	End If~r~n" +&
					"Next~r~n" +&
					"If IsValid ( lco_CodeObject ) Then DesTroy ( lco_CodeObject )~r~n")
		End If	
	Case "P012b_classic_Enume"
		If ab_execute = True Then
			//新增枚举类型的默认值
			wf_OutPut("新增枚举类型的默认值", False)
			//SymmetricAlgorithm
			SymmetricAlgorithm 	lsa_Enume
			Choose case lsa_Enume
				Case AES!
					wf_OutPut("SymmetricAlgorithm default:AES!", False)
				Case DES!
					wf_OutPut("SymmetricAlgorithm default:DES!", False)
				Case TDES!
					wf_OutPut("SymmetricAlgorithm default:TDES!", False)
				Case DESX!
					wf_OutPut("SymmetricAlgorithm default:DESX!", False)
			End Choose
			//OperationMode
			OperationMode 	lom_Enume
			Choose case lom_Enume
				Case OperationModeECB!
					wf_OutPut("OperationMode default:OperationModeECB!", False)
				Case OperationModeCBC!
					wf_OutPut("OperationMode default:OperationModeCBC!", False)
				Case OperationModeCFB!
					wf_OutPut("OperationMode default:OperationModeCFB!", False)
				Case OperationModeOFB!
					wf_OutPut("OperationMode default:OperationModeOFB!", False)
				Case OperationModeCTR!
					wf_OutPut("OperationMode default:OperationModeCTR!", False)
			End Choose
			//PaddingScheme
			PaddingScheme 	lps_Enume
			Choose case lps_Enume
				Case NoPadding!
					wf_OutPut("PaddingScheme default:NoPadding!", False)
				Case ZerosPadding!
					wf_OutPut("PaddingScheme default:ZerosPadding!", False)
				Case PKCSPadding!
					wf_OutPut("PaddingScheme default:PKCSPadding!", False)
				Case OneAndZerosPadding!
					wf_OutPut("PaddingScheme default:OneAndZerosPadding!", False)
				Case DefaultPadding!
					wf_OutPut("PaddingScheme default:DefaultPadding!", False)
			End Choose
			//AsymmetricAlgorithm
			AsymmetricAlgorithm 	laa_Enume
			Choose case laa_Enume
				Case RSA!
					wf_OutPut("AsymmetricAlgorithm default:RSA!", False)
				Case DSA!
					wf_OutPut("AsymmetricAlgorithm default:DSA!", False)
				Case Rabin!
					wf_OutPut("AsymmetricAlgorithm default:Rabin!", False)
			End Choose
			//SHAAlgorithm
			SHAAlgorithm 	lshaa_Enume
			Choose case lshaa_Enume
				Case SHA1!
					wf_OutPut("SHAAlgorithm default:SHA1!", False)
				Case SHA224!
					wf_OutPut("SHAAlgorithm default:SHA224!", False)
				Case SHA256!
					wf_OutPut("SHAAlgorithm default:SHA256!", False)
				Case SHA384!
					wf_OutPut("SHAAlgorithm default:SHA384!", False)
				Case SHA512!
					wf_OutPut("SHAAlgorithm default:SHA512!", False)
				Case SHA3_224!
					wf_OutPut("SHAAlgorithm default:SHA3_224!", False)
				Case SHA3_256!
					wf_OutPut("SHAAlgorithm default:SHA3_256!", False)
				Case SHA3_384!
					wf_OutPut("SHAAlgorithm default:SHA3_384!", False)
				Case SHA3_512!
					wf_OutPut("SHAAlgorithm default:SHA3_512!", False)
			End Choose
			//HMACAlgorithm
			HMACAlgorithm 	lhmaca_Enume
			Choose case lhmaca_Enume
				Case HMACMD5!
					wf_OutPut("HMACAlgorithm default:HMACMD5!", False)
				Case HMACSHA1!
					wf_OutPut("HMACAlgorithm default:HMACSHA1!", False)
				Case HMACSHA224!
					wf_OutPut("HMACAlgorithm default:HMACSHA224!", False)
				Case HMACSHA256!
					wf_OutPut("HMACAlgorithm default:HMACSHA256!", False)
				Case HMACSHA384!
					wf_OutPut("HMACAlgorithm default:HMACSHA384!", False)
				Case HMACSHA512!
					wf_OutPut("HMACAlgorithm default:HMACSHA512!", False)
			End Choose
		Else
			wf_scriptview("//新增枚举类型的默认值~r~n" +&
					"wf_OutPut(~"新增枚举类型的默认值~", False)~r~n" +&
					"//SymmetricAlgorithm~r~n" +&
					"SymmetricAlgorithm 	lsa_Enume~r~n" +&
					"Choose case lsa_Enume~r~n" +&
					"	Case AES!~r~n" +&
					"		wf_OutPut(~"SymmetricAlgorithm default:AES!~", False)~r~n" +&
					"	Case DES!~r~n" +&
					"		wf_OutPut(~"SymmetricAlgorithm default:DES!~", False)~r~n" +&
					"	Case TDES!~r~n" +&
					"		wf_OutPut(~"SymmetricAlgorithm default:TDES!~", False)~r~n" +&
					"	Case DESX!~r~n" +&
					"		wf_OutPut(~"SymmetricAlgorithm default:DESX!~", False)~r~n" +&
					"End Choose~r~n" +&
					"//OperationMode~r~n" +&
					"OperationMode 	lom_Enume~r~n" +&
					"Choose case lom_Enume~r~n" +&
					"	Case OperationModeECB!~r~n" +&
					"		wf_OutPut(~"OperationMode default:OperationModeECB!~", False)~r~n" +&
					"	Case OperationModeCBC!~r~n" +&
					"		wf_OutPut(~"OperationMode default:OperationModeCBC!~", False)~r~n" +&
					"	Case OperationModeCFB!~r~n" +&
					"		wf_OutPut(~"OperationMode default:OperationModeCFB!~", False)~r~n" +&
					"	Case OperationModeOFB!~r~n" +&
					"		wf_OutPut(~"OperationMode default:OperationModeOFB!~", False)~r~n" +&
					"	Case OperationModeCTR!~r~n" +&
					"		wf_OutPut(~"OperationMode default:OperationModeCTR!~", False)~r~n" +&
					"End Choose~r~n" +&
					"//PaddingScheme~r~n" +&
					"PaddingScheme 	lps_Enume~r~n" +&
					"Choose case lps_Enume~r~n" +&
					"	Case NoPadding!~r~n" +&
					"		wf_OutPut(~"PaddingScheme default:NoPadding!~", False)~r~n" +&
					"	Case ZerosPadding!~r~n" +&
					"		wf_OutPut(~"PaddingScheme default:ZerosPadding!~", False)~r~n" +&
					"	Case PKCSPadding!~r~n" +&
					"		wf_OutPut(~"PaddingScheme default:PKCSPadding!~", False)~r~n" +&
					"	Case OneAndZerosPadding!~r~n" +&
					"		wf_OutPut(~"PaddingScheme default:OneAndZerosPadding!~", False)~r~n" +&
					"	Case DefaultPadding!~r~n" +&
					"		wf_OutPut(~"PaddingScheme default:DefaultPadding!~", False)~r~n" +&
					"End Choose~r~n" +&
					"//AsymmetricAlgorithm~r~n" +&
					"AsymmetricAlgorithm 	laa_Enume~r~n" +&
					"Choose case laa_Enume~r~n" +&
					"	Case RSA!~r~n" +&
					"		wf_OutPut(~"AsymmetricAlgorithm default:RSA!~", False)~r~n" +&
					"	Case DSA!~r~n" +&
					"		wf_OutPut(~"AsymmetricAlgorithm default:DSA!~", False)~r~n" +&
					"	Case Rabin!~r~n" +&
					"		wf_OutPut(~"AsymmetricAlgorithm default:Rabin!~", False)~r~n" +&
					"End Choose~r~n" +&
					"//SHAAlgorithm~r~n" +&
					"SHAAlgorithm 	lshaa_Enume~r~n" +&
					"Choose case lshaa_Enume~r~n" +&
					"	Case SHA1!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA1!~", False)~r~n" +&
					"	Case SHA224!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA224!~", False)~r~n" +&
					"	Case SHA256!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA256!~", False)~r~n" +&
					"	Case SHA384!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA384!~", False)~r~n" +&
					"	Case SHA512!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA512!~", False)~r~n" +&
					"	Case SHA3_224!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA3_224!~", False)~r~n" +&
					"	Case SHA3_256!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA3_256!~", False)~r~n" +&
					"	Case SHA3_384!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA3_384!~", False)~r~n" +&
					"	Case SHA3_512!~r~n" +&
					"		wf_OutPut(~"SHAAlgorithm default:SHA3_512!~", False)~r~n" +&
					"End Choose~r~n" +&
					"//HMACAlgorithm~r~n" +&
					"HMACAlgorithm 	lhmaca_Enume~r~n" +&
					"Choose case lhmaca_Enume~r~n" +&
					"	Case HMACMD5!~r~n" +&
					"		wf_OutPut(~"HMACAlgorithm default:HMACMD5!~", False)~r~n" +&
					"	Case HMACSHA1!~r~n" +&
					"		wf_OutPut(~"HMACAlgorithm default:HMACSHA1!~", False)~r~n" +&
					"	Case HMACSHA224!~r~n" +&
					"		wf_OutPut(~"HMACAlgorithm default:HMACSHA224!~", False)~r~n" +&
					"	Case HMACSHA256!~r~n" +&
					"		wf_OutPut(~"HMACAlgorithm default:HMACSHA256!~", False)~r~n" +&
					"	Case HMACSHA384!~r~n" +&
					"		wf_OutPut(~"HMACAlgorithm default:HMACSHA384!~", False)~r~n" +&
					"	Case HMACSHA512!~r~n" +&
					"		wf_OutPut(~"HMACAlgorithm default:HMACSHA512!~", False)~r~n" +&
					"End Choose~r~n")
		End If
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose
end subroutine

public function any wf_coderobject_any_readonly (coderobject aco_1);//====================================================================
// Function: wf_coderobject_any_readonly
//--------------------------------------------------------------------
// Description:通过any转换返回用户对象
//--------------------------------------------------------------------
// Arguments:
// 	readonly    coderobject    aco_1
//--------------------------------------------------------------------
// Returns:  any
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-29
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

any 	lany_temp
String 	ls_return

//使用后通过any返回
ls_return = aco_1.HexEncode( Blob ( "abc", EncodingANSI! ) )

lany_temp = aco_1

Return lany_temp
end function

public function any wf_crypterobject_any_readonly (readonly crypterobject aco_1);//====================================================================
// Function: wf_crypterobject_any_readonly
//--------------------------------------------------------------------
// Description: 作为只读参数传递
//--------------------------------------------------------------------
// Arguments:
// 	readonly    crypterobject    aco_1
//--------------------------------------------------------------------
// Returns:  any
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-29
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

any 	lany_temp
String 	ls_return

//使用后通过any返回
ls_return = String ( aco_1.MD5( Blob ( "abc", EncodingANSI! ) ) )

lany_temp = aco_1

Return lany_temp
end function

public function string wf_coderobject_argument (any aco_1, ref coderobject aco_2, coderobject aco_array[]);//====================================================================
// Function: wf_coderobject_argument
//--------------------------------------------------------------------
// Description:any、ref、value参数传递
//--------------------------------------------------------------------
// Arguments:
// 	value        any            aco_1
// 	reference    coderobject    aco_2
// 	value        coderobject    aco_array[]
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-28
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_value, ls_return
CoderObject lco_Code

lco_Code = aco_1

If IsValid ( lco_Code ) Then
	ls_return += "CoderObject Functions: value Argument Success" + "~r~n"
	ls_Value = lco_Code.HexEncode ( Blob( "Pragma",EncodingANSI! ))
	If ls_Value = "507261676D61" Then
		ls_return += "CoderObject Functions: HexEncode(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CoderObject Functions: HexEncode(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return += "CoderObject Functions: value Argument Failed" + "~r~n"
	ls_return += "CoderObject Functions: HexEncode(Blob('Pragma')) Failed" + "~r~n"
End If

If IsValid ( aco_2 ) Then
	ls_return += "CoderObject Functions: reference Argument Success" + "~r~n"
	ls_Value = aco_2.Base64Encode ( Blob("Pragma",EncodingANSI! ))
	If ls_Value = "UHJhZ21h" Then
		ls_return += "CoderObject Functions: reference Base64Encode(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CoderObject Functions: reference Base64Encode(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return+= "CoderObject Functions: reference Argument Failed" + "~r~n"
End If

If UpperBound ( aco_array ) > 0 Then
	If IsValid ( aco_array[1] ) Then
		ls_return += "CoderObject Functions: Array Argument Success" + "~r~n"
		ls_Value = aco_array[1].HexEncode ( Blob("Pragma",EncodingANSI! ))
		If ls_Value = "507261676D61" Then
			ls_return += "CoderObject Functions Array: HexEncode(Blob('Pragma')) Success"
		Else
			ls_return += "CoderObject Functions Array: HexEncode(Blob('Pragma')) Failed"
		End If
	Else
		ls_return += "CoderObject Functions: Array Argument Failed"
	End If	
Else	
	ls_return += "CoderObject Functions: Array Argument Failed"
End If

Return ls_return
end function

public function string wf_crypterobject_argument (any aco_1, ref crypterobject aco_2, crypterobject aco_array[]);//====================================================================
// Function: wf_crypterobject_argument
//--------------------------------------------------------------------
// Description:any、Ref、Value参数传递
//--------------------------------------------------------------------
// Arguments:
// 	value        any              aco_1
// 	reference    crypterobject    aco_2
// 	value        crypterobject    aco_array[]
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-29
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_value, ls_return
CoderObject lco_Code
CrypterObject lco_Crypt

lco_Code = Create CoderObject
lco_Crypt = aco_1

If IsValid ( lco_Crypt ) Then
	ls_return += "CrypterObject Functions: value Argument Success" + "~r~n"
	ls_Value = lco_Code.HexEncode ( lco_Crypt.MD5( Blob( "Pragma",EncodingANSI! )))
	If ls_Value = "F607FDCEA4127AAD4F0CDAE948A4F3F7" Then
		ls_return += "CrypterObject Functions: MD5(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CrypterObject Functions: MD5(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return += "CrypterObject Functions: value Argument Failed" + "~r~n"
	ls_return += "CrypterObject Functions: MD5(Blob('Pragma')) Failed" + "~r~n"
End If

If IsValid ( aco_2 ) Then
	ls_return += "CrypterObject Functions: reference Argument Success" + "~r~n"
	ls_Value = lco_Code.HexEncode (aco_2.MD5 ( Blob("Pragma",EncodingANSI! )))
	If ls_Value = "F607FDCEA4127AAD4F0CDAE948A4F3F7" Then
		ls_return += "CrypterObject Functions: reference MD5(Blob('Pragma')) Success" + "~r~n"
	Else
		ls_return += "CrypterObject Functions: reference MD5(Blob('Pragma')) Failed" + "~r~n"
	End If
Else
	ls_return+= "CrypterObject Functions: reference Argument Failed" + "~r~n"
End If

If UpperBound ( aco_array ) > 0 Then
	If IsValid ( aco_array[1] ) Then
		ls_return += "CrypterObject Functions: Array Argument Success" + "~r~n"
		ls_Value = lco_Code.HexEncode (aco_array[1].MD5 ( Blob("Pragma",EncodingANSI! )))
		If ls_Value = "F607FDCEA4127AAD4F0CDAE948A4F3F7" Then
			ls_return += "CrypterObject Functions Array: MD5(Blob('Pragma')) Success"
		Else
			ls_return += "CrypterObject Functions Array: MD5(Blob('Pragma')) Failed"
		End If
	Else
		ls_return += "CrypterObject Functions: Array Argument Failed"
	End If	
Else	
	ls_return += "CrypterObject Functions: Array Argument Failed"
End If

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )

Return ls_return
end function

public subroutine wf_hmac_hash (hmacalgorithm ah_hash, ref crypterobject lco_crypt, ref coderobject lco_code);//====================================================================
// Function: wf_HMAC_HASH
//--------------------------------------------------------------------
// Description:HMAC摘要哈希值测试,ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	value        hashalgorithm    ah_hash
// 	reference    crypterobject    lco_crypt
// 	reference    coderobject      lco_code
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-10
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 	ls_Value, ls_hash, ls_Key
Blob 		lb_Data, lb_return, lb_Key, lb_Key2

ls_Key = "appeonkey"
lb_Key = Blob ( ls_Key, EncodingUTF8! )

Choose Case ah_hash
	Case HMACMD5!
		ls_hash = "HMACMD5"
	Case HMACSHA1!
		ls_hash = "HMACSHA1"
	Case HMACSHA224!
		ls_hash = "HMACSHA224"
	Case HMACSHA256!
		ls_hash = "HMACSHA256"
	Case HMACSHA384!
		ls_hash = "HMACSHA384"
	Case HMACSHA512!
		ls_hash = "HMACSHA512"
End Choose

ls_Value = '' //空字符串 & key空
lb_Key2 = Blob(ls_Value, EncodingANSI!)
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""ANSI,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""ANSI,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_Key2 = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""UTF8,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""UTF8,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_Key2 = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""UTF16LE,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""UTF16LE,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_Key2 = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""UTF16BE,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""UTF16BE,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = '' //空字符串 & Key = appeonkey
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""ANSI,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""ANSI,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""UTF8,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""UTF8,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""UTF16LE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""UTF16LE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,""UTF16BE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,""UTF16BE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'Appeon' //英文 Appeon & key= ""
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_Key2 = Blob("", EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"ANSI,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"ANSI,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_Key2 = Blob("", EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF8,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF8,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_Key2 = Blob("", EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16LE,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16LE,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_Key2 = Blob("", EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key2)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16BE,"") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16BE,"") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

//Key = "appeonkey"
ls_Value = 'Appeon' //英文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"ANSI,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"ANSI,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF8,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF8,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16LE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16LE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16BE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"Appeon"UTF16BE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = '中文测试' //中文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"中文测试"ANSI,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"中文测试"ANSI,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"中文测试"UTF8,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"中文测试"UTF8,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"中文测试"UTF16LE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"中文测试"UTF16LE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"中文测试"UTF16BE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"中文测试"UTF16BE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'あいうえお' //日文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"あいうえお"ANSI,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"あいうえお"ANSI,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"あいうえお"UTF8,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"あいうえお"UTF8,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"あいうえお"UTF16LE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"あいうえお"UTF16LE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"あいうえお"UTF16BE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"あいうえお"UTF16BE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'üöäß' //德语特殊字符
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"üöäß"ANSI,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"üöäß"ANSI,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"üöäß"UTF8,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"üöäß"UTF8,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"üöäß"UTF16LE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"üöäß"UTF16LE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!,"üöäß"UTF16BE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!,"üöäß"UTF16BE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~' //英文所有字符
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"ANSI,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"ANSI,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF8,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF8,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16LE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16LE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.HMAC(ah_hash,lb_Data, lb_Key)
If Len(lb_return) > 0 Then
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16BE,"appeonkey") = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('HMAC('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16BE,"appeonkey") Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

end subroutine

public subroutine wf_symmetricencrypt (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, operationmode ao_mode, paddingscheme ap_padding, boolean ab_decrypt);//====================================================================
// Function: wf_symmetricencrypt
//--------------------------------------------------------------------
// Description:非对称加密 ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	value    symmetricalgorithm    aa_alg
// 	value    coderobject           lco_code
// 	value    crypterobject         lco_crypt
// 	value    operationmode         ao_mode
// 	value    paddingscheme         ap_padding
// 	value    boolean               ab_decrypt
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 		ls_error, ls_rtn, ls_Value, ls_Mode, ls_Padding, ls_Msg, ls_bit, ls_alg
Blob 			lb_Data, lb_key, lb_iv, lb_Return, lb_Decrypt
String			ls_bits[]
Long 			ll_I

Choose Case ao_mode
	Case OperationModeECB!
		ls_Mode = "ECB"
	Case OperationModeCBC!
		ls_Mode = "CBC"
	Case OperationModeCFB!
		ls_Mode = "CFB"
	Case OperationModeOFB!
		ls_Mode = "OFB"
	Case OperationModeCTR!
		ls_Mode = "CTR"
End Choose

Choose Case ap_padding
	Case NoPadding!
		ls_Padding = "No"
	Case ZerosPadding!
		ls_Padding = "Zeros"
	Case PKCSPadding!
		ls_Padding = "PKCS"
	Case OneAndZerosPadding!
		ls_Padding = "OneAndZeros"
	Case DefaultPadding!
		ls_Padding = "Default"
End Choose

Choose Case aa_alg
	Case AES!
		ls_alg = "AES"
	Case DES!
		ls_alg = "DES"
	Case TDES!
		ls_alg = "TDES"
	Case DESX!
		ls_alg = "DESX"
	Case Blowfish!
		ls_alg = "Blowfish"
End Choose

//SymmetricEncrypt
//留意中文，日文，德文特殊字符：ü,ö,ä,ß
//字符编码Ansi、utf8、uft16le和utf16BE
//ao_mode,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!
//NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!

//key. Blob specifying the secret key. 
//The length of the secret key can be 128 bits、192 bits、256 bits with AES.
//The length of the secret key must be 64 bits with DES.
//The length of the secret key can be 128 bits、192 bits with TDES.
//The length of the secret key must be 192 bits with DESX.
//The length of the secret key can be 32 bits~448 bits with Blowfish.
Choose Case aa_alg
	Case AES!
		//128bit = 16位, 192bit=24位, 256bit=32位
		ls_bits = {'128bit','192bit','256bit'}
	Case DES!
		//64bit = 8位
		ls_bits = {'64bit'}
	Case TDES!
		//128bit = 16位, 192bit=24位
		ls_bits = {'128bit','192bit'}
	Case DESX!
		//192bit=24位
		ls_bits = {'192bit'}
	Case Blowfish!
		//32~448bit=4~56位
		ls_bits = {'32bit','128bit','448bit'}
End Choose

//循环支持的bit
For ll_I = 1 To UpperBound ( ls_bits )
	ls_bit = ls_bits[ll_i]
	
	//根据bit设置key长度
	Choose Case ls_bit
		Case '32bit'
			lb_Key = Blob ( "appe", EncodingANSI! )
			lb_IV = Blob( "appe", EncodingANSI! )
		Case '64bit'
			lb_Key = Blob ( "appeonke", EncodingANSI! )
			lb_IV = Blob( "appeoniv", EncodingANSI! )
		Case '128bit'
			lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
			lb_IV = Blob( "appeoniv12345678", EncodingUTF8! )
		Case '192bit'
			lb_Key = Blob ( "appeonkey123456712345678", EncodingANSI! )
			lb_IV = Blob( "appeoniv1234567812345678", EncodingANSI! )
		Case '256bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678", EncodingANSI! )
			lb_IV = Blob( "appeoniv123456781234567812345678", EncodingANSI! )
		Case '448bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678appeonkey123456712345678", EncodingANSI! )
			lb_IV = Blob( "appeoniv123456781234567812345678appeoniv1234567812345678", EncodingANSI! )
	End Choose
	
	//英文所有字符
	ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
		End If
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
		End If
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//Appeon
	ls_Value = 'Appeon'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//中文
	ls_Value = '中文测试'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//日文
	ls_Value = 'あいうえお'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//德语特殊字符
	ls_Value = 'üöäß'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv, ap_padding)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv, ap_padding)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+','+string(ls_padding)+') for EncodingUTF16BE! = ' + ls_rtn
	End If
Next //End For

wf_output( ls_Msg, False)



end subroutine

public subroutine wf_symmetricencrypt_iv (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, operationmode ao_mode, boolean ab_decrypt);//====================================================================
// Function: wf_symmetricencrypt
//--------------------------------------------------------------------
// Description:非对称加密 带iv参数 ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	value    symmetricalgorithm    aa_alg
// 	value    coderobject           lco_code
// 	value    crypterobject         lco_crypt
// 	value    operationmode         ao_mode
// 	value    boolean               ab_decrypt
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12-------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 		ls_error, ls_rtn, ls_Value, ls_Mode, ls_Msg, ls_bit, ls_alg
Blob 			lb_Data, lb_key, lb_iv, lb_Return, lb_Decrypt
String			ls_bits[]
Long 			ll_I

Choose Case ao_mode
	Case OperationModeECB!
		ls_Mode = "ECB"
	Case OperationModeCBC!
		ls_Mode = "CBC"
	Case OperationModeCFB!
		ls_Mode = "CFB"
	Case OperationModeOFB!
		ls_Mode = "OFB"
	Case OperationModeCTR!
		ls_Mode = "CTR"
End Choose

Choose Case aa_alg
	Case AES!
		ls_alg = "AES"
	Case DES!
		ls_alg = "DES"
	Case TDES!
		ls_alg = "TDES"
	Case DESX!
		ls_alg = "DESX"
	Case Blowfish!
		ls_alg = "Blowfish"
End Choose

//SymmetricEncrypt
//留意中文，日文，德文特殊字符：ü,ö,ä,ß
//字符编码Ansi、utf8、uft16le和utf16BE
//ao_mode,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!

//key. Blob specifying the secret key. 
//The length of the secret key can be 128 bits、192 bits、256 bits with AES.
//The length of the secret key must be 64 bits with DES.
//The length of the secret key can be 128 bits、192 bits with TDES.
//The length of the secret key must be 192 bits with DESX.
//The length of the secret key can be 32 bits~448 bits with Blowfish.
Choose Case aa_alg
	Case AES!
		//128bit = 16位, 192bit=24位, 256bit=32位
		ls_bits = {'128bit','192bit','256bit'}
	Case DES!
		//64bit = 8位
		ls_bits = {'64bit'}
	Case TDES!
		//128bit = 16位, 192bit=24位
		ls_bits = {'128bit','192bit'}
	Case DESX!
		//192bit=24位
		ls_bits = {'192bit'}
	Case Blowfish!
		//32~448bit=4~56位
		ls_bits = {'32bit','128bit','448bit'}
End Choose

//循环支持的bit
For ll_I = 1 To UpperBound ( ls_bits )
	ls_bit = ls_bits[ll_i]
	
	//根据bit设置key长度
	Choose Case ls_bit
		Case '32bit'
			lb_Key = Blob ( "appe", EncodingANSI! )
			lb_IV = Blob( "appe", EncodingANSI! )
		Case '64bit'
			lb_Key = Blob ( "appeonke", EncodingANSI! )
			lb_IV = Blob( "appeoniv", EncodingANSI! )
		Case '128bit'
			lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
			lb_IV = Blob( "appeoniv12345678", EncodingUTF8! )
		Case '192bit'
			lb_Key = Blob ( "appeonkey123456712345678", EncodingANSI! )
			lb_IV = Blob( "appeoniv1234567812345678", EncodingANSI! )
		Case '256bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678", EncodingANSI! )
			lb_IV = Blob( "appeoniv123456781234567812345678", EncodingANSI! )
		Case '448bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678appeonkey123456712345678", EncodingANSI! )
			lb_IV = Blob( "appeoniv123456781234567812345678appeoniv1234567812345678", EncodingANSI! )
	End Choose
	
	//英文所有字符
	ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		End If
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		End If
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//Appeon
	ls_Value = 'Appeon'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//中文
	ls_Value = '中文测试'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//日文
	ls_Value = 'あいうえお'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//德语特殊字符
	ls_Value = 'üöäß'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode,lb_iv)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode,lb_iv)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+',lb_iv'+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
Next //End For

wf_output( ls_Msg, False)



end subroutine

public subroutine wf_symmetricencrypt (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, boolean ab_decrypt);//====================================================================
// Function: wf_symmetricencrypt
//--------------------------------------------------------------------
// Description:非对称加密 ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	value    symmetricalgorithm    aa_alg
// 	value    coderobject           lco_code
// 	value    crypterobject         lco_crypt
// 	value    operationmode         ao_mode
// 	value    boolean               ab_decrypt
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 		ls_error, ls_rtn, ls_Value, ls_Msg, ls_bit, ls_alg
Blob 			lb_Data, lb_key, lb_Return, lb_Decrypt
String			ls_bits[]
Long 			ll_I


Choose Case aa_alg
	Case AES!
		ls_alg = "AES"
	Case DES!
		ls_alg = "DES"
	Case TDES!
		ls_alg = "TDES"
	Case DESX!
		ls_alg = "DESX"
	Case Blowfish!
		ls_alg = "Blowfish"
End Choose

//SymmetricEncrypt
//留意中文，日文，德文特殊字符：ü,ö,ä,ß
//字符编码Ansi、utf8、uft16le和utf16BE
//ao_mode,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!

//key. Blob specifying the secret key. 
//The length of the secret key can be 128 bits、192 bits、256 bits with AES.
//The length of the secret key must be 64 bits with DES.
//The length of the secret key can be 128 bits、192 bits with TDES.
//The length of the secret key must be 192 bits with DESX.
//The length of the secret key can be 32 bits~448 bits with Blowfish.
Choose Case aa_alg
	Case AES!
		//128bit = 16位, 192bit=24位, 256bit=32位
		ls_bits = {'128bit','192bit','256bit'}
	Case DES!
		//64bit = 8位
		ls_bits = {'64bit'}
	Case TDES!
		//128bit = 16位, 192bit=24位
		ls_bits = {'128bit','192bit'}
	Case DESX!
		//192bit=24位
		ls_bits = {'192bit'}
	Case Blowfish!
		//32~448bit=4~56位
		ls_bits = {'32bit','128bit','448bit'}
End Choose

//循环支持的bit
For ll_I = 1 To UpperBound ( ls_bits )
	ls_bit = ls_bits[ll_i]
	
	//根据bit设置key长度
	Choose Case ls_bit
		Case '32bit'
			lb_Key = Blob ( "appe", EncodingANSI! )
		Case '64bit'
			lb_Key = Blob ( "appeonke", EncodingANSI! )
		Case '128bit'
			lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		Case '192bit'
			lb_Key = Blob ( "appeonkey123456712345678", EncodingANSI! )
		Case '256bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678", EncodingANSI! )
		Case '448bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678appeonkey123456712345678", EncodingANSI! )
	End Choose
	
	//英文所有字符
	ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
		End If
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
		End If
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//Appeon
	ls_Value = 'Appeon'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//中文
	ls_Value = '中文测试'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//日文
	ls_Value = 'あいうえお'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//德语特殊字符
	ls_Value = 'üöäß'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
Next //End For

wf_output( ls_Msg, False)



end subroutine

public subroutine wf_symmetricencrypt (symmetricalgorithm aa_alg, coderobject lco_code, crypterobject lco_crypt, operationmode ao_mode, boolean ab_decrypt);//====================================================================
// Function: wf_symmetricencrypt
//--------------------------------------------------------------------
// Description:非对称加密 ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	value    symmetricalgorithm    aa_alg
// 	value    coderobject           lco_code
// 	value    crypterobject         lco_crypt
// 	value    operationmode         ao_mode
// 	value    boolean               ab_decrypt
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 		ls_error, ls_rtn, ls_Value, ls_Mode, ls_Msg, ls_bit, ls_alg
Blob 			lb_Data, lb_key, lb_Return, lb_Decrypt
String			ls_bits[]
Long 			ll_I

Choose Case ao_mode
	Case OperationModeECB!
		ls_Mode = "ECB"
	Case OperationModeCBC!
		ls_Mode = "CBC"
	Case OperationModeCFB!
		ls_Mode = "CFB"
	Case OperationModeOFB!
		ls_Mode = "OFB"
	Case OperationModeCTR!
		ls_Mode = "CTR"
End Choose

Choose Case aa_alg
	Case AES!
		ls_alg = "AES"
	Case DES!
		ls_alg = "DES"
	Case TDES!
		ls_alg = "TDES"
	Case DESX!
		ls_alg = "DESX"
	Case Blowfish!
		ls_alg = "Blowfish"
End Choose

//SymmetricEncrypt
//留意中文，日文，德文特殊字符：ü,ö,ä,ß
//字符编码Ansi、utf8、uft16le和utf16BE
//ao_mode,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!

//key. Blob specifying the secret key. 
//The length of the secret key can be 128 bits、192 bits、256 bits with AES.
//The length of the secret key must be 64 bits with DES.
//The length of the secret key can be 128 bits、192 bits with TDES.
//The length of the secret key must be 192 bits with DESX.
//The length of the secret key can be 32 bits~448 bits with Blowfish.
Choose Case aa_alg
	Case AES!
		//128bit = 16位, 192bit=24位, 256bit=32位
		ls_bits = {'128bit','192bit','256bit'}
	Case DES!
		//64bit = 8位
		ls_bits = {'64bit'}
	Case TDES!
		//128bit = 16位, 192bit=24位
		ls_bits = {'128bit','192bit'}
	Case DESX!
		//192bit=24位
		ls_bits = {'192bit'}
	Case Blowfish!
		//32~448bit=4~56位
		ls_bits = {'32bit','128bit','448bit'}
End Choose

//循环支持的bit
For ll_I = 1 To UpperBound ( ls_bits )
	ls_bit = ls_bits[ll_i]
	
	//根据bit设置key长度
	Choose Case ls_bit
		Case '32bit'
			lb_Key = Blob ( "appe", EncodingANSI! )
		Case '64bit'
			lb_Key = Blob ( "appeonke", EncodingANSI! )
		Case '128bit'
			lb_Key = Blob ( "appeonkey1234567", EncodingUTF8! )
		Case '192bit'
			lb_Key = Blob ( "appeonkey123456712345678", EncodingANSI! )
		Case '256bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678", EncodingANSI! )
		Case '448bit'
			lb_Key = Blob ( "appeonkey12345671234567812345678appeonkey123456712345678", EncodingANSI! )
	End Choose
	
	//英文所有字符
	ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		End If
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		If ll_I = 1 Then
			ls_Msg = 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		Else
			ls_Msg += '~r~nSymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
		End If
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" + 'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//Appeon
	ls_Value = 'Appeon'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//中文
	ls_Value = '中文测试'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//日文
	ls_Value = 'あいうえお'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
	
	//德语特殊字符
	ls_Value = 'üöäß'
	lb_Data = Blob(ls_Value, EncodingANSI!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingANSI!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingANSI! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF8!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF8!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF8! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16LE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16LE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16LE! = ' + ls_rtn
	End If
	lb_Data = Blob(ls_Value, EncodingUTF16BE!)
	lb_Return = lco_Crypt.SymmetricEncrypt( aa_alg, lb_Data, lb_Key,ao_mode)
	If Not ab_decrypt Then
		ls_rtn = lco_Code.Base64Encode(lb_Return)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricEncrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	Else
		lb_Decrypt = lco_Crypt.SymmetricDecrypt( aa_alg, lb_Return, lb_Key,ao_mode)
		ls_rtn = String(lb_Decrypt, EncodingUTF16BE!)
		ls_Msg = ls_Msg + "~r~n" +'SymmetricDecrypt('+ls_alg+',"'+string(ls_Value)+'",lb_Key,'+string(ls_mode)+' ' + ls_bit+') for EncodingUTF16BE! = ' + ls_rtn
	End If
Next //End For

wf_output( ls_Msg, False)



end subroutine

public subroutine wf_sha_hash (shaalgorithm ah_hash, ref crypterobject lco_crypt, ref coderobject lco_code);//====================================================================
// Function: wf_sha_utf8
//--------------------------------------------------------------------
// Description:SHA 摘要哈希值 ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	value        hashalgorithm    ah_hash
// 	reference    crypterobject    lco_crypt
// 	reference    coderobject      lco_code
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-10
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 	ls_Value, ls_hash
Blob 		lb_Data, lb_return

Choose Case ah_hash
	Case SHA1!
		ls_hash = "SHA1"
	Case SHA224!
		ls_hash = "SHA224"
	Case SHA256!
		ls_hash = "SHA256"
	Case SHA384!
		ls_hash = "SHA384"
	Case SHA512!
		ls_hash = "SHA512"
	Case SHA3_224!
		ls_hash = "SHA3_224"
	Case SHA3_256!
		ls_hash = "SHA3_256"
	Case SHA3_384!
		ls_hash = "SHA3_384"
	Case SHA3_512!
		ls_hash = "SHA3_512"
End Choose

ls_Value = '' //空字符串
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,""ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,""ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,""UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,""UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,""UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,""UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,""UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,""UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'Appeon' //英文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"Appeon"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"Appeon"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"Appeon"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"Appeon"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"Appeon"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"Appeon"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"Appeon"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"Appeon"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = '中文测试' //中文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"中文测试"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"中文测试"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"中文测试"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"中文测试"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"中文测试"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"中文测试"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"中文测试"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"中文测试"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'あいうえお' //日文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"あいうえお"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"あいうえお"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"あいうえお"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"あいうえお"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"あいうえお"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"あいうえお"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"あいうえお"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"あいうえお"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'üöäß' //德语特殊字符
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"üöäß"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"üöäß"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"üöäß"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"üöäß"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"üöäß"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"üöäß"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!,"üöäß"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!,"üöäß"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~' //英文所有字符
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.SHA(ah_hash,lb_Data)
If Len(lb_return) > 0 Then
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('SHA('+ls_hash+'!," !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

end subroutine

public subroutine wf_md5_hash (ref crypterobject lco_crypt, ref coderobject lco_code);//====================================================================
// Function: wf_md5_hash
//--------------------------------------------------------------------
// Description:MD5摘要哈希值测试 ANSI、UTF8、UTF16LE、UTF16BE四种字符集
//--------------------------------------------------------------------
// Arguments:
// 	reference    crypterobject    lco_crypt
// 	reference    coderobject      lco_code
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String 	ls_Value
Blob 		lb_Data, lb_return


ls_Value = '' //空字符串
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(""ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(""ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(""UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(""UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(""UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(""UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(""UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(""UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'Appeon' //英文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("Appeon"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("Appeon"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("Appeon"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("Appeon"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("Appeon"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("Appeon"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("Appeon"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("Appeon"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = '中文测试' //中文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("中文测试"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("中文测试"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("中文测试"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("中文测试"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("中文测试"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("中文测试"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("中文测试"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("中文测试"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'あいうえお' //日文
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("あいうえお"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("あいうえお"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("あいうえお"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("あいうえお"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("あいうえお"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("あいうえお"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("あいうえお"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("あいうえお"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = 'üöäß' //德语特殊字符
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("üöäß"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("üöäß"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("üöäß"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("üöäß"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("üöäß"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("üöäß"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5("üöäß"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5("üöäß"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

ls_Value = ' !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~' //英文所有字符
lb_Data = Blob(ls_Value, EncodingANSI!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"ANSI) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"ANSI) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF8!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF8) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF8) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16LE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16LE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16LE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If
lb_Data = Blob(ls_Value, EncodingUTF16BE!)
lb_return = lco_Crypt.MD5(lb_Data)
If Len(lb_return) > 0 Then
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16BE) = ' + lco_code.HexEncode( lb_return) , False)
Else
	wf_output('MD5(" !"#$%&~'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~~"UTF16BE) Failed! Return:' + String(lb_return,EncodingANSI!) , False)
End If

end subroutine

public subroutine wf_scriptexe3b (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe3
//--------------------------------------------------------------------
// Description: 测试对字符加密功能
//--------------------------------------------------------------------
// Arguments:
// 	value  string   as_item
// 	value  boolean  ab_execute
//--------------------------------------------------------------------
// Returns: (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-27
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P019_crypt_SymmetricEncrypt
//P020_crypt_SymmetricDecrypt
//P021_crypt_AsymmetricEncrypt
//P022_crypt_AsymmetricDecrypt
//P023_crypt_AsymmetricSign
//P024_crypt_AsymmetricVerifySign
//P025_crypt_AsymmetricGenerateKey
//P026_crypt_MD5
//P027_crypt_SHA
//P028_crypt_HMAC

CoderObject 	lco_Code
CrypterObject 	lco_Crypt, lco_Crypt2
String 			ls_error, ls_rtn, ls_Value
Blob 				lb_Data, lb_key, lb_iv, lb_Return, lb_Null, lb_privKey, lb_pubKey, lb_encrypt, lb_sign
Long 				ll_i, ll_ii, ll_iii
Integer 			li_len, li_return, li_null


SHAAlgorithm 			sha_null
HMACAlgorithm 		HMAC_null

SetNull ( lb_Null )
SetNull ( li_null )
SetNull ( sha_null )
SetNull ( HMAC_null )

If Not IsValid ( lco_Code ) Then
	lco_Code = Create CoderObject
End If
If Not IsValid ( lco_Crypt ) Then
	lco_Crypt = Create CrypterObject
End If

Choose Case as_item
	
	Case 'P026_crypt_MD5' 
		If ab_execute = True Then
			//MD5
			//null
			lb_return = lco_Crypt.MD5(lb_Null)
			If IsNull ( lb_return ) Then
				wf_output('MD5(Null) = Null Success' , False)
			Else
				wf_output('MD5(Null) <> Null Failed ', False)
			End If
			
			//正常测试
			// Function: wf_md5_hash
			// Arguments:
			// 	reference    crypterobject    lco_crypt
			// 	reference    coderobject      lco_code
			wf_md5_hash(lco_crypt,lco_code)
		Else
			wf_scriptview("//MD5~r~n" +&
					"//null~r~n" +&
					"lb_return = lco_Crypt.MD5(lb_Null)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'MD5(Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'MD5(Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"// Function: wf_md5_hash~r~n" +&
					"// Arguments:~r~n" +&
					"// 	reference    crypterobject    lco_crypt~r~n" +&
					"// 	reference    coderobject      lco_code~r~n" +&
					"wf_md5_hash(lco_crypt,lco_code)~r~n")
		End If
	Case 'P027_crypt_SHA' 
		If ab_execute = True Then
			//SHA
			//null
			lb_return = lco_Crypt.SHA(SHA_Null,lb_Data)
			If IsNull ( lb_return ) Then
				wf_output('SHA(Null,Data) = Null Success' , False)
			Else
				wf_output('SHA(Null,Data) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.SHA(SHA1!,lb_Null)
			If IsNull ( lb_return ) Then
				wf_output('SHA(SHA1!,Null) = Null Success' , False)
			Else
				wf_output('SHA(SHA1!,Null) <> Null Failed ', False)
			End If
			// Function: wf_SHA_Hash
			//--------------------------------------------------------------------
			// Description:
			//--------------------------------------------------------------------
			// Arguments:
			// 	value    HashAlgorithm    ah_Hash
			// 	reference    crypterobject    lco_crypt
			// 	reference    coderobject      lco_code
			
			//正常测试 
			//SHA1
			wf_SHA_Hash( SHA1!,lco_crypt, lco_code )
			//SHA224
			wf_SHA_Hash( SHA224!,lco_crypt, lco_code )
			//SHA256
			wf_SHA_Hash( SHA256!,lco_crypt, lco_code)
			//SHA384
			wf_SHA_Hash( SHA384!,lco_crypt, lco_code)
			//SHA512
			wf_SHA_Hash( SHA512!,lco_crypt, lco_code)
			//SHA3_224
			wf_SHA_Hash( SHA3_224!,lco_crypt, lco_code)
			//SHA3_256
			wf_SHA_Hash( SHA3_256!,lco_crypt, lco_code)
			//SHA3_384
			wf_SHA_Hash( SHA3_384!,lco_crypt, lco_code)
			//SHA3_512
			wf_SHA_Hash( SHA3_512!,lco_crypt, lco_code)
		Else
			wf_scriptview("//SHA~r~n" +&
					"//null~r~n" +&
					"lb_return = lco_Crypt.SHA(SHA_Null,lb_Data)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'SHA(Null,Data) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SHA(Null,Data) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.SHA(SHA1!,lb_Null)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'SHA(SHA1!,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SHA(SHA1!,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"// Function: wf_SHA_Hash~r~n" +&
					"//--------------------------------------------------------------------~r~n" +&
					"// Description:~r~n" +&
					"//--------------------------------------------------------------------~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value    HashAlgorithm    ah_Hash~r~n" +&
					"// 	reference    crypterobject    lco_crypt~r~n" +&
					"// 	reference    coderobject      lco_code~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//SHA1~r~n" +&
					"wf_SHA_Hash( SHA1!,lco_crypt, lco_code )~r~n" +&
					"//SHA224~r~n" +&
					"wf_SHA_Hash( SHA224!,lco_crypt, lco_code )~r~n" +&
					"//SHA256~r~n" +&
					"wf_SHA_Hash( SHA256!,lco_crypt, lco_code)~r~n" +&
					"//SHA384~r~n" +&
					"wf_SHA_Hash( SHA384!,lco_crypt, lco_code)~r~n" +&
					"//SHA512~r~n" +&
					"wf_SHA_Hash( SHA512!,lco_crypt, lco_code)~r~n" +&
					"//SHA3_224~r~n" +&
					"wf_SHA_Hash( SHA3_224!,lco_crypt, lco_code)~r~n" +&
					"//SHA3_256~r~n" +&
					"wf_SHA_Hash( SHA3_256!,lco_crypt, lco_code)~r~n" +&
					"//SHA3_384~r~n" +&
					"wf_SHA_Hash( SHA3_384!,lco_crypt, lco_code)~r~n" +&
					"//SHA3_512~r~n" +&
					"wf_SHA_Hash( SHA3_512!,lco_crypt, lco_code)~r~n")
		End If
	Case 'P028_crypt_HMAC' 
		If ab_execute = True Then
			//HMAC
			//null
			lb_Key = Blob( "appeonkey", EncodingUTF8! )
			lb_data = Blob( "test", EncodingUTF8! )
			lb_return = lco_Crypt.HMAC(HMAC_null,lb_Data, lb_Key)
			If IsNull ( lb_return ) Then
				wf_output('HMAC(Null,Data,lb_Key) = Null Success' , False)
			Else
				wf_output('HMAC(Null,Data,lb_Key) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.HMAC(HMACMD5!,lb_Null, lb_Key)
			If IsNull ( lb_return ) Then
				wf_output('HMAC(HMACMD5!,Null, lb_Key) = Null Success' , False)
			Else
				wf_output('HMAC(HMACMD5!,Null, lb_Key) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.HMAC(HMACMD5!,lb_data,lb_Null)
			If IsNull ( lb_return ) Then
				wf_output('HMAC(HMACMD5!,lb_data, Null) = Null Success' , False)
			Else
				wf_output('HMAC(HMACMD5!,lb_data, Null) <> Null Failed ', False)
			End If
			
			// Function: wf_HMAC_Hash
			//--------------------------------------------------------------------
			// Description:
			//--------------------------------------------------------------------
			// Arguments:
			// 	value    HashAlgorithm    ah_Hash
			// 	reference    crypterobject    lco_crypt
			// 	reference    coderobject      lco_code
			
			//正常测试 
			//HMACMD5
			wf_HMAC_Hash( HMACMD5!,lco_crypt, lco_code )
			//HMACSHA1
			wf_HMAC_Hash( HMACSHA1!,lco_crypt, lco_code )
			//HMACSHA224
			wf_HMAC_Hash( HMACSHA224!,lco_crypt, lco_code)
			//HMACSHA256
			wf_HMAC_Hash( HMACSHA256!,lco_crypt, lco_code)
			//HMACSHA384
			wf_HMAC_Hash( HMACSHA384!,lco_crypt, lco_code)
			//HMACSHA512
			wf_HMAC_Hash( HMACSHA512!,lco_crypt, lco_code)
		Else
			wf_scriptview("//HMAC~r~n" +&
					"//null~r~n" +&
					"lb_Key = Blob( ~"appeonkey~", EncodingUTF8! )~r~n" +&
					"lb_data = Blob( ~"test~", EncodingUTF8! )~r~n" +&
					"lb_return = lco_Crypt.HMAC(HMAC_null,lb_Data, lb_Key)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'HMAC(Null,Data,lb_Key) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'HMAC(Null,Data,lb_Key) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.HMAC(HMACMD5!,lb_Null, lb_Key)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'HMAC(HMACMD5!,Null, lb_Key) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'HMAC(HMACMD5!,Null, lb_Key) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.HMAC(HMACMD5!,lb_data,lb_Null)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'HMAC(HMACMD5!,lb_data, Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'HMAC(HMACMD5!,lb_data, Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"// Function: wf_HMAC_Hash~r~n" +&
					"//--------------------------------------------------------------------~r~n" +&
					"// Description:~r~n" +&
					"//--------------------------------------------------------------------~r~n" +&
					"// Arguments:~r~n" +&
					"// 	value    HashAlgorithm    ah_Hash~r~n" +&
					"// 	reference    crypterobject    lco_crypt~r~n" +&
					"// 	reference    coderobject      lco_code~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//HMACMD5~r~n" +&
					"wf_HMAC_Hash( HMACMD5!,lco_crypt, lco_code )~r~n" +&
					"//HMACSHA1~r~n" +&
					"wf_HMAC_Hash( HMACSHA1!,lco_crypt, lco_code )~r~n" +&
					"//HMACSHA224~r~n" +&
					"wf_HMAC_Hash( HMACSHA224!,lco_crypt, lco_code)~r~n" +&
					"//HMACSHA256~r~n" +&
					"wf_HMAC_Hash( HMACSHA256!,lco_crypt, lco_code)~r~n" +&
					"//HMACSHA384~r~n" +&
					"wf_HMAC_Hash( HMACSHA384!,lco_crypt, lco_code)~r~n" +&
					"//HMACSHA512~r~n" +&
					"wf_HMAC_Hash( HMACSHA512!,lco_crypt, lco_code)~r~n")
		End If
		
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )


end subroutine

public subroutine wf_scriptexe3 (string as_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe3
//--------------------------------------------------------------------
// Description: 测试对字符加密功能
//--------------------------------------------------------------------
// Arguments:
// 	value  string   as_item
// 	value  boolean  ab_execute
//--------------------------------------------------------------------
// Returns: (None)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-03-27
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//P019_crypt_SymmetricEncrypt
//P020_crypt_SymmetricDecrypt
//P021_crypt_AsymmetricEncrypt
//P022_crypt_AsymmetricDecrypt
//P023_crypt_AsymmetricSign
//P024_crypt_AsymmetricVerifySign
//P025_crypt_AsymmetricGenerateKey
//P026_crypt_MD5
//P027_crypt_SHA
//P028_crypt_HMAC

CoderObject 	lco_Code
CrypterObject 	lco_Crypt, lco_Crypt2
String 			ls_error, ls_rtn, ls_Value
Blob 				lb_Data, lb_key, lb_iv, lb_Return, lb_Null, lb_privKey, lb_pubKey, lb_encrypt, lb_sign
Long 				ll_i, ll_ii, ll_iii
Integer 			li_len, li_return, li_null

symmetricalgorithm    alg_null
operationmode         Operation_null
paddingscheme 		Pad_null
AsymmetricAlgorithm 	asalg_null
SHAAlgorithm 			sha_null
HMACAlgorithm 		HMAC_null

SetNull ( lb_Null )
SetNull ( li_null )
SetNull ( alg_null )
SetNull ( Operation_null )
SetNull ( Pad_null )
SetNull ( asalg_null )
SetNull ( sha_null )
SetNull ( HMAC_null )

If Not IsValid ( lco_Code ) Then
	lco_Code = Create CoderObject
End If
If Not IsValid ( lco_Crypt ) Then
	lco_Crypt = Create CrypterObject
End If
lb_Key = Blob ( "appeonkey1234567", EncodingANSI! )
lb_IV = Blob( "appeoniv", EncodingANSI! )
symmetricalgorithm 	ls_alg[]={AES!,DES!,TDES!,DESX!,Blowfish!}
operationmode 		lo_mode[] = {OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!}
paddingscheme 		ap_padding[] = {NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!}

Choose Case as_item
	Case 'P019_crypt_SymmetricEncrypt' 
		If ab_execute = True Then
			//SymmetricEncrypt
			//留意中文，日文，德文特殊字符：ü,ö,ä,ß
			//字符编码Ansi、utf8、uft16le和utf16BE
			//AES!,DES!,TDES!,DESX!,Blowfish!			
			//OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!
			//NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!
			
			//未实例化
			ls_error = "Not Create:View error Failed"
			Try
				lb_Return = lco_Crypt2.SymmetricEncrypt(AES!, Blob("test",EncodingANSI!), lb_Key,OperationModeECB!,lb_iv, NoPadding!)
			Catch ( throwable ex11)
				ls_error = "Not Create: View error Success" + " Return:" + ex11.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//null
			lb_Return = lco_Crypt.SymmetricEncrypt(alg_null, lb_Data, lb_Key)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(Null, Data, lb_Key) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(Null, Data, lb_Key) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key,OperationModeECB!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_data, lb_Key,Operation_null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, Data, lb_Key,Null) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, Data, lb_Key,Null) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv,Pad_null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!,Null) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!,Null) <> Null Failed ', False)
			End If
			
			ls_Value = 'test'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null) <> Null Failed ', False)
			End If	
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null,OperationModeECB!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!) <> Null Failed ', False)
			End If	
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) <> Null Failed ', False)
			End If	
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv, NoPadding!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ', False)
			End If	
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null, NoPadding!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) = Null Success' , False)
			Else
				wf_output('SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) <> Null Failed ', False)
			End If
				
			//异常测试
			//1.参数类型不匹配
			ls_error = "Not Match:View error Failed"
			Try
				ls_Value = 'test'
				lb_Data = Blob(ls_Value, EncodingANSI!)
				lb_Return = lco_Crypt.SymmetricEncrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!)
			Catch ( throwable ex)
				ls_error = "Not Match: View error Success" + " Return:" + ex.getmessage()
			End Try
			wf_output(ls_error, False)
			//2.key位数不足
			lb_Key = Blob ( "ap", EncodingANSI! )
			ls_error = "Key invalid length:View error Failed"
			Try
				ls_Value = 'test'
				lb_Data = Blob(ls_Value, EncodingANSI!)
				lb_Return = lco_Crypt.SymmetricEncrypt( DES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)
			Catch ( throwable ex1)
				ls_error = "Key invalid length: View error Success" + " Return:" + ex1.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			//3.内容为空
			lb_Key = Blob ( "appeonkey1234567", EncodingANSI! )
			ls_error = "SymmetricEncrypt Data invalid length:View error Failed"
			Try
				ls_Value = ''
				lb_Data = Blob(ls_Value, EncodingANSI!)
				lb_Return = lco_Crypt.SymmetricEncrypt( TDES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)
			Catch ( throwable ex2aa)
				ls_error = "SymmetricEncrypt Data invalid length: View error Success" + " Return:" + ex2aa.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//ls_alg[]={AES!,DES!,TDES!,DESX!,Blowfish!}
			//lo_mode[] = {OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!}
			//ap_padding[] = {NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!}
			
			 For ll_i = 1 To UpperBound(ls_alg)
				wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt, False ) //第一个重载函数
				//symmetricalgorithm
				For ll_ii = 1 To UpperBound(lo_mode)
					wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], False ) //第二个重载函数
					wf_SymmetricEncrypt_iv( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], False ) //第三个重载函数
					//operationmode
					For ll_iii = 1 To UpperBound(ap_padding)
						//ZerosPadding!、PKCSPadding!、OneAndZerosPadding! can be used with ECB and CBC operation mode.
						//NoPadding!、ZerosPadding! can be used with CFB、OFB and CTR operation mode.
						//OperationModeECB (不包含NoPadding )
						//OperationModeCBC (不包含NoPadding )
						If ( lo_mode[ll_ii] = OperationModeECB! Or lo_mode[ll_ii] = OperationModeCBC! ) And ap_padding[ll_iii] = NoPadding! Then 
							Continue
						End If
						//OperationModeCFB (不包含PKCSPadding,OneAndZerosPadding)
						//OperationModeOFB (不包含PKCSPadding,OneAndZerosPadding)
						//OperationModeCTR (不包含PKCSPadding,OneAndZerosPadding)
						If ( lo_mode[ll_ii] = OperationModeCFB! Or lo_mode[ll_ii] = OperationModeOFB! Or lo_mode[ll_ii] = OperationModeCTR!) And &
							(ap_padding[ll_iii] = PKCSPadding! Or ap_padding[ll_iii] = OneAndZerosPadding! Or ap_padding[ll_iii] = ZerosPadding!) Then 
							Continue
						End If
						Try
							// wf_SymmetricEncrypt
							// Arguments:
							// 	value    symmetricalgorithm    aa_alg
							// 	value    coderobject           lco_code
							// 	value    crypterobject         lco_crypt
							// 	value    operationmode         ao_mode
							// 	value    paddingscheme         ap_padding
							// 	value    boolean               ab_decrypt
							wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], ap_padding[ll_iii], False ) //第四个重载函数
						Catch ( throwable ex2)
							ls_error = "Key invalid length: View error Success" + " Return:" + ex2.getmessage()
						End Try
						If Len ( ls_error ) > 0 Then
							wf_output(ls_error, False)
							ls_error = ""
						End If
					Next
				Next
			Next
			//注:TDES加密与在线加密结果不一致,但PB自己可以解密
			//DESX 在线加密没有找到

		Else
			wf_scriptview("//SymmetricEncrypt~r~n" +&
					"//留意中文，日文，德文特殊字符：ü,ö,ä,ß~r~n" +&
					"//字符编码Ansi、utf8、uft16le和utf16BE~r~n" +&
					"//AES!,DES!,TDES!,DESX!,Blowfish!			~r~n" +&
					"//OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!~r~n" +&
					"//NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!~r~n" +&
					"~r~n" +&
					"//未实例化~r~n" +&
					"ls_error = ~"Not Create:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	lb_Return = lco_Crypt2.SymmetricEncrypt(AES!, Blob(~"test~",EncodingANSI!), lb_Key,OperationModeECB!,lb_iv, NoPadding!)~r~n" +&
					"Catch ( throwable ex11)~r~n" +&
					"	ls_error = ~"Not Create: View error Success~" + ~" Return:~" + ex11.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//null~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(alg_null, lb_Data, lb_Key)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(Null, Data, lb_Key) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(Null, Data, lb_Key) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key,OperationModeECB!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_data, lb_Key,Operation_null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Data, lb_Key,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Data, lb_Key,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv,Pad_null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_Value = ~'test~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null,OperationModeECB!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv, NoPadding!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null, NoPadding!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricEncrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"	~r~n" +&
					"//异常测试~r~n" +&
					"//1.参数类型不匹配~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_Value = ~'test~'~r~n" +&
					"	lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"	lb_Return = lco_Crypt.SymmetricEncrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!)~r~n" +&
					"Catch ( throwable ex)~r~n" +&
					"	ls_error = ~"Not Match: View error Success~" + ~" Return:~" + ex.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"//2.key位数不足~r~n" +&
					"lb_Key = Blob ( ~"ap~", EncodingANSI! )~r~n" +&
					"ls_error = ~"Key invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_Value = ~'test~'~r~n" +&
					"	lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"	lb_Return = lco_Crypt.SymmetricEncrypt( DES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)~r~n" +&
					"Catch ( throwable ex1)~r~n" +&
					"	ls_error = ~"Key invalid length: View error Success~" + ~" Return:~" + ex1.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"//3.内容为空~r~n" +&
					"lb_Key = Blob ( ~"appeonkey1234567~", EncodingANSI! )~r~n" +&
					"ls_error = ~"SymmetricEncrypt Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_Value = ~'~'~r~n" +&
					"	lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"	lb_Return = lco_Crypt.SymmetricEncrypt( TDES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)~r~n" +&
					"Catch ( throwable ex2aa)~r~n" +&
					"	ls_error = ~"SymmetricEncrypt Data invalid length: View error Success~" + ~" Return:~" + ex2aa.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//ls_alg[]={AES!,DES!,TDES!,DESX!,Blowfish!}~r~n" +&
					"//lo_mode[] = {OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!}~r~n" +&
					"//ap_padding[] = {NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!}~r~n" +&
					"~r~n" +&
					" For ll_i = 1 To UpperBound(ls_alg)~r~n" +&
					"	wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt, False ) //第一个重载函数~r~n" +&
					"	//symmetricalgorithm~r~n" +&
					"	For ll_ii = 1 To UpperBound(lo_mode)~r~n" +&
					"		wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], False ) //第二个重载函数~r~n" +&
					"		wf_SymmetricEncrypt_iv( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], False ) //第三个重载函数~r~n" +&
					"		//operationmode~r~n" +&
					"		For ll_iii = 1 To UpperBound(ap_padding)~r~n" +&
					"			//ZerosPadding!、PKCSPadding!、OneAndZerosPadding! can be used with ECB and CBC operation mode.~r~n" +&
					"			//NoPadding!、ZerosPadding! can be used with CFB、OFB and CTR operation mode.~r~n" +&
					"			//OperationModeECB (不包含NoPadding )~r~n" +&
					"			//OperationModeCBC (不包含NoPadding )~r~n" +&
					"			If ( lo_mode[ll_ii] = OperationModeECB! Or lo_mode[ll_ii] = OperationModeCBC! ) And ap_padding[ll_iii] = NoPadding! Then~r~n" +&
					"				Continue~r~n" +&
					"			End If~r~n" +&
					"			//OperationModeCFB (不包含PKCSPadding,OneAndZerosPadding)~r~n" +&
					"			//OperationModeOFB (不包含PKCSPadding,OneAndZerosPadding)~r~n" +&
					"			//OperationModeCTR (不包含PKCSPadding,OneAndZerosPadding)~r~n" +&
					"			If ( lo_mode[ll_ii] = OperationModeCFB! Or lo_mode[ll_ii] = OperationModeOFB! Or lo_mode[ll_ii] = OperationModeCTR!) And &~r~n" +&
					"				(ap_padding[ll_iii] = PKCSPadding! Or ap_padding[ll_iii] = OneAndZerosPadding!) Then~r~n" +&
					"				Continue~r~n" +&
					"			End If~r~n" +&
					"			Try~r~n" +&
					"				// wf_SymmetricEncrypt~r~n" +&
					"				// Arguments:~r~n" +&
					"				// 	value    symmetricalgorithm    aa_alg~r~n" +&
					"				// 	value    coderobject           lco_code~r~n" +&
					"				// 	value    crypterobject         lco_crypt~r~n" +&
					"				// 	value    operationmode         ao_mode~r~n" +&
					"				// 	value    paddingscheme         ap_padding~r~n" +&
					"				// 	value    boolean               ab_decrypt~r~n" +&
					"				wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], ap_padding[ll_iii], False ) //第四个重载函数~r~n" +&
					"			Catch ( throwable ex2)~r~n" +&
					"				ls_error = ~"Key invalid length: View error Success~" + ~" Return:~" + ex2.getmessage()~r~n" +&
					"			End Try~r~n" +&
					"			If Len ( ls_error ) > 0 Then~r~n" +&
					"				wf_output(ls_error, False)~r~n" +&
					"				ls_error = ~"~"~r~n" +&
					"			End If~r~n" +&
					"		Next~r~n" +&
					"	Next~r~n" +&
					"Next~r~n" +&
					"//注:TDES加密与在线加密结果不一致,但PB自己可以解密~r~n" +&
					"//DESX 在线加密没有找到~r~n")
		End If
	Case 'P020_crypt_SymmetricDecrypt' 
		If ab_execute = True Then
			//SymmetricDecrypt
			//null
			lb_Return = lco_Crypt.SymmetricDecrypt(alg_null, lb_Null, lb_Key)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(Null, Data, lb_Key) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(Null, Data, lb_Key) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key,OperationModeECB!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_data, lb_Key,Operation_null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, Data, lb_Key,Null) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, Data, lb_Key,Null) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, Pad_Null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, Null) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, Null) <> Null Failed ', False)
			End If
			
			ls_Value = 'test'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null) <> Null Failed ', False)
			End If	
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null,OperationModeECB!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!) <> Null Failed ', False)
			End If	
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) <> Null Failed ', False)
			End If	
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv, NoPadding!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ', False)
			End If	
			
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) <> Null Failed ', False)
			End If
			lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null, NoPadding!)
			If IsNull ( lb_Return ) Then
				wf_output('SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) = Null Success' , False)
			Else
				wf_output('SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) <> Null Failed ', False)
			End If
				
			//异常测试
			//1.参数类型不匹配
			ls_error = "Not Match:View error Failed"
			Try
				ls_Value = 'test'
				lb_Data = Blob(ls_Value, EncodingANSI!)
				lb_Return = lco_Crypt.SymmetricDecrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!)
			Catch ( throwable ex1a)
				ls_error = "Not Match: View error Success" + " Return:" + ex1a.getmessage()
			End Try
			wf_output(ls_error, False)
			//2.key位数不足
			lb_Key = Blob ( "appeonkey", EncodingANSI! )
			ls_error = "Key invalid length:View error Failed"
			Try
				ls_Value = 'test'
				lb_Data = Blob(ls_Value, EncodingANSI!)
				lb_Return = lco_Crypt.SymmetricDecrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)
			Catch ( throwable ex1b)
				ls_error = "Key invalid length: View error Success" + " Return:" + ex1b.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			//3.Data 为空
			lb_Key = Blob ( "appeonkey1234567", EncodingANSI! )
			ls_error = "Data invalid length:View error Failed"
			Try
				ls_Value = ''
				lb_Data = Blob(ls_Value, EncodingANSI!)
				lb_Return = lco_Crypt.SymmetricDecrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)
			Catch ( throwable ex1bb)
				ls_error = "Data invalid length: View error Success" + " Return:" + ex1bb.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//ls_alg[]={AES!,DES!,TDES!,DESX!,Blowfish!}
			//lo_mode[] = {OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!}
			//ap_padding[] = {NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!}
			 For ll_i = 1 To UpperBound(ls_alg)
				wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt, True ) //第一个重载函数
				//symmetricalgorithm
				For ll_ii = 1 To UpperBound(lo_mode)
					wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], True ) //第二个重载函数
					wf_SymmetricEncrypt_iv( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], True ) //第三个重载函数
					//operationmode
					For ll_iii = 1 To UpperBound(ap_padding)
						//ZerosPadding!、PKCSPadding!、OneAndZerosPadding! can be used with ECB and CBC operation mode.
						//NoPadding!、ZerosPadding! can be used with CFB、OFB and CTR operation mode.
						//OperationModeECB (不包含NoPadding )
						//OperationModeCBC (不包含NoPadding )
						If ( lo_mode[ll_ii] = OperationModeECB! Or lo_mode[ll_ii] = OperationModeCBC! ) And ap_padding[ll_iii] = NoPadding! Then 
							Continue
						End If
						//OperationModeCFB (不包含PKCSPadding,OneAndZerosPadding)
						//OperationModeOFB (不包含PKCSPadding,OneAndZerosPadding)
						//OperationModeCTR (不包含PKCSPadding,OneAndZerosPadding)
						If ( lo_mode[ll_ii] = OperationModeCFB! Or lo_mode[ll_ii] = OperationModeOFB! Or lo_mode[ll_ii] = OperationModeCTR!) And &
							(ap_padding[ll_iii] = PKCSPadding! Or ap_padding[ll_iii] = OneAndZerosPadding! Or ap_padding[ll_iii] = ZerosPadding!) Then 
							Continue
						End If
						
						Try
							// wf_SymmetricEncrypt
							// Arguments:
							// 	value    symmetricalgorithm    aa_alg
							// 	value    coderobject           lco_code
							// 	value    crypterobject         lco_crypt
							// 	value    operationmode         ao_mode
							// 	value    paddingscheme         ap_padding
							// 	value    boolean               ab_decrypt
							wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], ap_padding[ll_iii], True )
						Catch ( throwable ex2a)
							ls_error = "Key invalid length: View error Success" + " Return:" + ex2a.getmessage()
						End Try
						If Len ( ls_error ) > 0 Then
							wf_output(ls_error, False)
							ls_error = ""
						End If
					Next
				Next
			Next
		Else
			wf_scriptview("//SymmetricDecrypt~r~n" +&
					"//null~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(alg_null, lb_Null, lb_Key)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(Null, Data, lb_Key) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(Null, Data, lb_Key) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key,OperationModeECB!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_data, lb_Key,Operation_null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Data, lb_Key,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Data, lb_Key,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Null, lb_Key,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, Pad_Null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, Data, lb_Key,OperationModeECB!,lb_iv, Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"ls_Value = ~'test~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null,OperationModeECB!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Null,OperationModeECB!,lb_iv, NoPadding!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, Null,OperationModeECB!,lb_iv, NoPadding!) <> Null Failed ~', False)~r~n" +&
					"End If	~r~n" +&
					"~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_Return = lco_Crypt.SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,lb_Null, NoPadding!)~r~n" +&
					"If IsNull ( lb_Return ) Then~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'SymmetricDecrypt(AES!, lb_Data, lb_Key,OperationModeECB!,Null, NoPadding!) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"	~r~n" +&
					"//异常测试~r~n" +&
					"//1.参数类型不匹配~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_Value = ~'test~'~r~n" +&
					"	lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"	lb_Return = lco_Crypt.SymmetricDecrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, NoPadding!)~r~n" +&
					"Catch ( throwable ex1a)~r~n" +&
					"	ls_error = ~"Not Match: View error Success~" + ~" Return:~" + ex1a.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"//2.key位数不足~r~n" +&
					"lb_Key = Blob ( ~"appeonkey~", EncodingANSI! )~r~n" +&
					"ls_error = ~"Key invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_Value = ~'test~'~r~n" +&
					"	lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"	lb_Return = lco_Crypt.SymmetricDecrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)~r~n" +&
					"Catch ( throwable ex1b)~r~n" +&
					"	ls_error = ~"Key invalid length: View error Success~" + ~" Return:~" + ex1b.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"//3.Data 为空~r~n" +&
					"lb_Key = Blob ( ~"appeonkey1234567~", EncodingANSI! )~r~n" +&
					"ls_error = ~"Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	ls_Value = ~'~'~r~n" +&
					"	lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"	lb_Return = lco_Crypt.SymmetricDecrypt( AES!, lb_Data, lb_Key,OperationModeECB!,lb_iv, ZerosPadding!)~r~n" +&
					"Catch ( throwable ex1bb)~r~n" +&
					"	ls_error = ~"Data invalid length: View error Success~" + ~" Return:~" + ex1bb.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//ls_alg[]={AES!,DES!,TDES!,DESX!,Blowfish!}~r~n" +&
					"//lo_mode[] = {OperationModeECB!,OperationModeCBC!,OperationModeCFB!,OperationModeOFB!,OperationModeCTR!}~r~n" +&
					"//ap_padding[] = {NoPadding!,ZerosPadding!,PKCSPadding!,OneAndZerosPadding!,DefaultPadding!}~r~n" +&
					" For ll_i = 1 To UpperBound(ls_alg)~r~n" +&
					"	wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt, True ) //第一个重载函数~r~n" +&
					"	//symmetricalgorithm~r~n" +&
					"	For ll_ii = 1 To UpperBound(lo_mode)~r~n" +&
					"		wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], True ) //第二个重载函数~r~n" +&
					"		wf_SymmetricEncrypt_iv( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], True ) //第三个重载函数~r~n" +&
					"		//operationmode~r~n" +&
					"		For ll_iii = 1 To UpperBound(ap_padding)~r~n" +&
					"			//ZerosPadding!、PKCSPadding!、OneAndZerosPadding! can be used with ECB and CBC operation mode.~r~n" +&
					"			//NoPadding!、ZerosPadding! can be used with CFB、OFB and CTR operation mode.~r~n" +&
					"			//OperationModeECB (不包含NoPadding )~r~n" +&
					"			//OperationModeCBC (不包含NoPadding )~r~n" +&
					"			If ( lo_mode[ll_ii] = OperationModeECB! Or lo_mode[ll_ii] = OperationModeCBC! ) And ap_padding[ll_iii] = NoPadding! Then~r~n" +&
					"				Continue~r~n" +&
					"			End If~r~n" +&
					"			//OperationModeCFB (不包含PKCSPadding,OneAndZerosPadding)~r~n" +&
					"			//OperationModeOFB (不包含PKCSPadding,OneAndZerosPadding)~r~n" +&
					"			//OperationModeCTR (不包含PKCSPadding,OneAndZerosPadding)~r~n" +&
					"			If ( lo_mode[ll_ii] = OperationModeCFB! Or lo_mode[ll_ii] = OperationModeOFB! Or lo_mode[ll_ii] = OperationModeCTR!) And &~r~n" +&
					"				(ap_padding[ll_iii] = PKCSPadding! Or ap_padding[ll_iii] = OneAndZerosPadding!) Then~r~n" +&
					"				Continue~r~n" +&
					"			End If~r~n" +&
					"			~r~n" +&
					"			Try~r~n" +&
					"				// wf_SymmetricEncrypt~r~n" +&
					"				// Arguments:~r~n" +&
					"				// 	value    symmetricalgorithm    aa_alg~r~n" +&
					"				// 	value    coderobject           lco_code~r~n" +&
					"				// 	value    crypterobject         lco_crypt~r~n" +&
					"				// 	value    operationmode         ao_mode~r~n" +&
					"				// 	value    paddingscheme         ap_padding~r~n" +&
					"				// 	value    boolean               ab_decrypt~r~n" +&
					"				wf_SymmetricEncrypt( ls_alg[ll_i], lco_Code,lco_Crypt,lo_mode[ll_ii], ap_padding[ll_iii], True )~r~n" +&
					"			Catch ( throwable ex2a)~r~n" +&
					"				ls_error = ~"Key invalid length: View error Success~" + ~" Return:~" + ex2a.getmessage()~r~n" +&
					"			End Try~r~n" +&
					"			If Len ( ls_error ) > 0 Then~r~n" +&
					"				wf_output(ls_error, False)~r~n" +&
					"				ls_error = ~"~"~r~n" +&
					"			End If~r~n" +&
					"		Next~r~n" +&
					"	Next~r~n" +&
					"Next~r~n")
		End If
	Case 'P021_crypt_AsymmetricEncrypt' 
		If ab_execute = True Then
			//AsymmetricEncrypt
			//null
			ls_Value = 'test'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_return = lco_Crypt.AsymmetricEncrypt(asalg_null, lb_Data,lb_pubKey)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricEncrypt(Null, Data,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricEncrypt(Null, Data,lb_pubKey) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_Null,lb_pubKey)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricEncrypt(RSA!, Null,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, Null,lb_pubKey) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_Null)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricEncrypt(RSA!, lb_data,Null) = Null Success' , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, lb_data,Null) <> Null Failed ', False)
			End If
			
			//异常测试
			//参数不匹配
			ls_error = "Not Match:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricEncrypt(DSA!, lb_data,lb_pubKey)
			Catch ( throwable ex1d)
				ls_error = "AsymmetricEncrypt Not Match Return:" + ex1d.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			//Data invalid length
			ls_error = "Data invalid length:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricEncrypt(DSA!, Blob("",EncodingANSI!),lb_pubKey)
			Catch ( throwable ex1dd)
				ls_error = "AsymmetricEncrypt Data invalid length Return:" + ex1dd.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//RSA //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			//RSA 最大长度22位密文测试
			ls_Value = 'AppeonAppeonAppeonAppe'
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			Try
				lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
				If Len(lb_return) > 0 Then
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonApp"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
				Else
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonApp"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
				End If
			Catch ( throwable ex2dd)
				ls_error = "AsymmetricEncrypt Data length 22,lb_pubKey("+string(li_len)+" Return:" + ex2dd.getmessage()
				wf_output( ls_error, False )
			End Try
			//RSA 最大长度22位 + 1密文测试
			ls_Value = 'AppeonAppeonAppeonAppe1'
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			Try
				lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
				If Len(lb_return) > 0 Then
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppe1"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
				Else
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppe1"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
				End If
			Catch ( throwable ex2add)
				ls_error = "AsymmetricEncrypt Data length 23,lb_pubKey("+string(li_len)+" Return:" + ex2add.getmessage()
				wf_output( ls_error, False )
			End Try
			
			li_len = 1024 //中文
			ls_Value = '中文测试'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "中文测试"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "中文测试"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			//RSA 最大长度86位密文测试
			ls_Value = 'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe'
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			Try
				lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
				If Len(lb_return) > 0 Then
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
				Else
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
				End If
			Catch ( throwable ex3dd)
				ls_error = "AsymmetricEncrypt Data length 86,lb_pubKey("+string(li_len)+" Return:" + ex3dd.getmessage()
				wf_output( ls_error, False )
			End Try
			//RSA 最大长度86位 + 1密文测试
			ls_Value = 'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe1'
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			Try
				lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
				If Len(lb_return) > 0 Then
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe1"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
				Else
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe1"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
				End If
			Catch ( throwable ex3add)
				ls_error = "AsymmetricEncrypt Data length 87,lb_pubKey("+string(li_len)+" Return:" + ex3add.getmessage()
				wf_output( ls_error, False )
			End Try
			
			li_len = 2048 //日文
			ls_Value = 'あいうえお'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			//RSA 最大长度214位密文测试
			ls_Value = 'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppetgeeasdfdaddAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppe'
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			Try
				lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
				If Len(lb_return) > 0 Then
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeon....214"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
				Else
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeon....214"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
				End If
			Catch ( throwable ex3cdd)
				ls_error = "AsymmetricEncrypt Data length 214,lb_pubKey("+string(li_len)+" Return:" + ex3cdd.getmessage()
				wf_output( ls_error, False )
			End Try
			//RSA 最大长度214位 + 1密文测试
			ls_Value = 'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppetgeeasdfdaddAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppe1'
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			Try
				lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
				If Len(lb_return) > 0 Then
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeon....215"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
				Else
					wf_output('AsymmetricEncrypt(RSA!, "AppeonAppeonAppeonAppeon....215"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
				End If
			Catch ( throwable ex3ddd)
				ls_error = "AsymmetricEncrypt Data length 215,lb_pubKey("+string(li_len)+" Return:" + ex3ddd.getmessage()
				wf_output( ls_error, False )
			End Try
			
			li_len = 4096 //德语特殊字符
			ls_Value = 'üöäß'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(RSA!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(RSA!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			//Rabin //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 1024 //中文
			ls_Value = '中文测试'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "中文测试"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "中文测试"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 2048 //日文
			ls_Value = 'あいうえお'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 4096 //德语特殊字符
			ls_Value = 'üöäß'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricEncrypt(Rabin!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) = ' + lco_code.Base64Encode( lb_return ) , False)
			Else
				wf_output('AsymmetricEncrypt(Rabin!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If

		Else
			wf_scriptview("//AsymmetricEncrypt~r~n" +&
					"//null~r~n" +&
					"ls_Value = ~'test~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(asalg_null, lb_Data,lb_pubKey)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Null, Data,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Null, Data,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_Null,lb_pubKey)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, Null,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, Null,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_Null)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, lb_data,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, lb_data,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//异常测试~r~n" +&
					"//参数不匹配~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(DSA!, lb_data,lb_pubKey)~r~n" +&
					"Catch ( throwable ex1d)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Not Match Return:~" + ex1d.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"//Data invalid length~r~n" +&
					"ls_error = ~"Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(DSA!, Blob(~"~",EncodingANSI!),lb_pubKey)~r~n" +&
					"Catch ( throwable ex1dd)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data invalid length Return:~" + ex1dd.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//RSA //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"//RSA 最大长度22位密文测试~r~n" +&
					"ls_Value = ~'AppeonAppeonAppeonAppe~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"Try~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"	If Len(lb_return) > 0 Then~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonApp~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonApp~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"	End If~r~n" +&
					"Catch ( throwable ex2dd)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data length 22,lb_pubKey(~"+string(li_len)+~" Return:~" + ex2dd.getmessage()~r~n" +&
					"	wf_output( ls_error, False )~r~n" +&
					"End Try~r~n" +&
					"//RSA 最大长度22位 + 1密文测试~r~n" +&
					"ls_Value = ~'AppeonAppeonAppeonAppe1~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"Try~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"	If Len(lb_return) > 0 Then~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppe1~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppe1~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"	End If~r~n" +&
					"Catch ( throwable ex2add)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data length 23,lb_pubKey(~"+string(li_len)+~" Return:~" + ex2add.getmessage()~r~n" +&
					"	wf_output( ls_error, False )~r~n" +&
					"End Try~r~n" +&
					"~r~n" +&
					"li_len = 1024 //中文~r~n" +&
					"ls_Value = ~'中文测试~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"中文测试~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"中文测试~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"//RSA 最大长度86位密文测试~r~n" +&
					"ls_Value = ~'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"Try~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"	If Len(lb_return) > 0 Then~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"	End If~r~n" +&
					"Catch ( throwable ex3dd)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data length 86,lb_pubKey(~"+string(li_len)+~" Return:~" + ex3dd.getmessage()~r~n" +&
					"	wf_output( ls_error, False )~r~n" +&
					"End Try~r~n" +&
					"//RSA 最大长度86位 + 1密文测试~r~n" +&
					"ls_Value = ~'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe1~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"Try~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"	If Len(lb_return) > 0 Then~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe1~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppe1~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"	End If~r~n" +&
					"Catch ( throwable ex3add)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data length 87,lb_pubKey(~"+string(li_len)+~" Return:~" + ex3add.getmessage()~r~n" +&
					"	wf_output( ls_error, False )~r~n" +&
					"End Try~r~n" +&
					"~r~n" +&
					"li_len = 2048 //日文~r~n" +&
					"ls_Value = ~'あいうえお~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"//RSA 最大长度214位密文测试~r~n" +&
					"ls_Value = ~'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppetgeeasdfdaddAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppe~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"Try~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"	If Len(lb_return) > 0 Then~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeon....214~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeon....214~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"	End If~r~n" +&
					"Catch ( throwable ex3cdd)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data length 214,lb_pubKey(~"+string(li_len)+~" Return:~" + ex3cdd.getmessage()~r~n" +&
					"	wf_output( ls_error, False )~r~n" +&
					"End Try~r~n" +&
					"//RSA 最大长度214位 + 1密文测试~r~n" +&
					"ls_Value = ~'AppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppetgeeasdfdaddAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppeAppeonAppeonAppeonAppeonAppeonAppeonAppeonAppe1~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"Try~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"	If Len(lb_return) > 0 Then~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeon....215~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"	Else~r~n" +&
					"		wf_output(~'AsymmetricEncrypt(RSA!, ~"AppeonAppeonAppeonAppeon....215~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"	End If~r~n" +&
					"Catch ( throwable ex3ddd)~r~n" +&
					"	ls_error = ~"AsymmetricEncrypt Data length 215,lb_pubKey(~"+string(li_len)+~" Return:~" + ex3ddd.getmessage()~r~n" +&
					"	wf_output( ls_error, False )~r~n" +&
					"End Try~r~n" +&
					"~r~n" +&
					"li_len = 4096 //德语特殊字符~r~n" +&
					"ls_Value = ~'üöäß~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(RSA!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//Rabin //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 1024 //中文~r~n" +&
					"ls_Value = ~'中文测试~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"中文测试~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"中文测试~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048 //日文~r~n" +&
					"ls_Value = ~'あいうえお~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096 //德语特殊字符~r~n" +&
					"ls_Value = ~'üöäß~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricEncrypt(Rabin!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P022_crypt_AsymmetricDecrypt' 
		If ab_execute = True Then
			//AsymmetricDecrypt
			//null
			ls_Value = 'test'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_return = lco_Crypt.AsymmetricDecrypt(asalg_Null, lb_Data,lb_pubKey)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricDecrypt(Null, Data,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricDecrypt(Null, Data,lb_pubKey) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_Null,lb_pubKey)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricDecrypt(RSA!, Null,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, Null,lb_pubKey) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_data,lb_Null)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricDecrypt(RSA!, lb_data,Null) = Null Success' , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, lb_data,Null) <> Null Failed ', False)
			End If
			
			//异常测试
			//参数不匹配
			ls_error = "Not Match:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricDecrypt(DSA!, lb_data,lb_pubKey)
			Catch ( throwable ex1e)
				ls_error = "AsymmetricDecrypt Not Match Return:" + ex1e.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			ls_error = "Not Match:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_data,lb_pubKey)
			Catch ( throwable ex2e)
				ls_error = "AsymmetricDecrypt Not Match Return:" + ex2e.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			ls_error = "Data invalid length:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricDecrypt(DSA!, Blob("",EncodingANSI!),lb_pubKey)
			Catch ( throwable ex2ee)
				ls_error = "AsymmetricDecrypt Data invalid length Return:" + ex2ee.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//RSA //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) = ' +  String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) = ' +  String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			//错误的privKey
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "Appeon"UTF8,error lb_privKey('+string(li_len)+')) = ' +  String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "Appeon"UTF8,error lb_privKey('+string(li_len)+')) Return:' + String ( lb_return,EncodingUTF8! ), False)
			End If
			
			li_len = 1024 //中文
			ls_Value = '中文测试'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 2048 //日文
			ls_Value = 'あいうえお'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 4096 //德语特殊字符
			ls_Value = 'üöäß'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(RSA!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(RSA!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			//Rabin //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) = ' +  String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) = ' +  String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 1024 //中文
			ls_Value = '中文测试'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 2048 //日文
			ls_Value = 'あいうえお'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 4096 //德语特殊字符
			ls_Value = 'üöäß'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingANSI! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricDecrypt(Rabin!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) = ' + String(lb_return, EncodingUTF8! ) , False)
			Else
				wf_output('AsymmetricDecrypt(Rabin!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
		Else
			wf_scriptview("//AsymmetricDecrypt~r~n" +&
					"//null~r~n" +&
					"ls_Value = ~'test~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(asalg_Null, lb_Data,lb_pubKey)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Null, Data,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Null, Data,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_Null,lb_pubKey)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, Null,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, Null,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_data,lb_Null)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, lb_data,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, lb_data,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//异常测试~r~n" +&
					"//参数不匹配~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricDecrypt(DSA!, lb_data,lb_pubKey)~r~n" +&
					"Catch ( throwable ex1e)~r~n" +&
					"	ls_error = ~"AsymmetricDecrypt Not Match Return:~" + ex1e.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"Catch ( throwable ex2e)~r~n" +&
					"	ls_error = ~"AsymmetricDecrypt Not Match Return:~" + ex2e.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"ls_error = ~"Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricDecrypt(DSA!, Blob(~"~",EncodingANSI!),lb_pubKey)~r~n" +&
					"Catch ( throwable ex2ee)~r~n" +&
					"	ls_error = ~"AsymmetricDecrypt Data invalid length Return:~" + ex2ee.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//RSA //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//错误的privKey~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"Appeon~"UTF8,error lb_privKey(~'+string(li_len)+~')) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"Appeon~"UTF8,error lb_privKey(~'+string(li_len)+~')) Return:~' + String ( lb_return,EncodingUTF8! ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 1024 //中文~r~n" +&
					"ls_Value = ~'中文测试~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048 //日文~r~n" +&
					"ls_Value = ~'あいうえお~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096 //德语特殊字符~r~n" +&
					"ls_Value = ~'üöäß~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(RSA!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//Rabin //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 1024 //中文~r~n" +&
					"ls_Value = ~'中文测试~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048 //日文~r~n" +&
					"ls_Value = ~'あいうえお~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096 //德语特殊字符~r~n" +&
					"ls_Value = ~'üöäß~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingANSI! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' + String(lb_return, EncodingUTF8! ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricDecrypt(Rabin!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P023_crypt_AsymmetricSign' 
		If ab_execute = True Then
			//AsymmetricSign
			//null
			ls_Value = 'test'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			lb_return = lco_Crypt.AsymmetricSign(asalg_Null, lb_Null,lb_privKey)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricSign(Null, Data,lb_privKey) = Null Success' , False)
			Else
				wf_output('AsymmetricSign(Null, Data,lb_privKey) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_Null,lb_privKey)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricSign(RSA!, Null,lb_privKey) = Null Success' , False)
			Else
				wf_output('AsymmetricSign(RSA!, Null,lb_privKey) <> Null Failed ', False)
			End If
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_Null)
			If IsNull ( lb_return ) Then
				wf_output('AsymmetricSign(RSA!, lb_data,Null) = Null Success' , False)
			Else
				wf_output('AsymmetricSign(RSA!, lb_data,Null) <> Null Failed ', False)
			End If
			
			//异常测试
			//参数不匹配
			ls_error = "Not Match:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_pubKey)
			Catch ( throwable ex3e)
				ls_error = "AsymmetricSign Not Match Return:" + ex3e.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			//Data invalid length
			ls_error = "Data invalid length:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_return = lco_Crypt.AsymmetricSign(RSA!, Blob("",EncodingANSI!),lb_pubKey)
			Catch ( throwable ex3ee)
				ls_error = "AsymmetricSign Data invalid length Return:" + ex3ee.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//RSA //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 1024
			ls_Value = '中文测试' //中文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 2048
			ls_Value = 'あいうえお' //日文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 4096
			ls_Value = 'üöäß' //德语特殊字符
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(RSA!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(RSA!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			//DSA //英文
			li_len = 1024
			ls_Value = '中文测试' //中文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(DSA!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(DSA!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(DSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(DSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 2048
			ls_Value = 'あいうえお' //日文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(DSA!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(DSA!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(DSA!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(DSA!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			//Rabin //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "Appeon"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "Appeon"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 1024
			ls_Value = '中文测试' //中文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "中文测试"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 2048
			ls_Value = 'あいうえお' //日文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "あいうえお"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "あいうえお"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			
			li_len = 4096
			ls_Value = 'üöäß' //德语特殊字符
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "üöäß"ANSI,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			If Len(lb_return) > 0 Then
				wf_output('AsymmetricSign(Rabin!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) = ' +  lco_code.Base64Encode(lb_return) , False)
			Else
				wf_output('AsymmetricSign(Rabin!, "üöäß"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' + String ( lb_return ), False)
			End If
		Else
			wf_scriptview("//AsymmetricSign~r~n" +&
					"//null~r~n" +&
					"ls_Value = ~'test~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(asalg_Null, lb_Null,lb_privKey)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Null, Data,lb_privKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Null, Data,lb_privKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_Null,lb_privKey)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, Null,lb_privKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, Null,lb_privKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_Null)~r~n" +&
					"If IsNull ( lb_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, lb_data,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, lb_data,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//异常测试~r~n" +&
					"//参数不匹配~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_pubKey)~r~n" +&
					"Catch ( throwable ex3e)~r~n" +&
					"	ls_error = ~"AsymmetricSign Not Match Return:~" + ex3e.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"//Data invalid length~r~n" +&
					"ls_error = ~"Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_return = lco_Crypt.AsymmetricSign(RSA!, Blob(~"~",EncodingANSI!),lb_pubKey)~r~n" +&
					"Catch ( throwable ex3ee)~r~n" +&
					"	ls_error = ~"AsymmetricSign Data invalid length Return:~" + ex3ee.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//RSA //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 1024~r~n" +&
					"ls_Value = ~'中文测试~' //中文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048~r~n" +&
					"ls_Value = ~'あいうえお~' //日文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096~r~n" +&
					"ls_Value = ~'üöäß~' //德语特殊字符~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(RSA!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//DSA //英文~r~n" +&
					"li_len = 1024~r~n" +&
					"ls_Value = ~'中文测试~' //中文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048~r~n" +&
					"ls_Value = ~'あいうえお~' //日文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(DSA!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//Rabin //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"Appeon~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"Appeon~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 1024~r~n" +&
					"ls_Value = ~'中文测试~' //中文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"中文测试~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048~r~n" +&
					"ls_Value = ~'あいうえお~' //日文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"あいうえお~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"あいうえお~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096~r~n" +&
					"ls_Value = ~'üöäß~' //德语特殊字符~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"üöäß~"ANSI,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"If Len(lb_return) > 0 Then~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  lco_code.Base64Encode(lb_return) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricSign(Rabin!, ~"üöäß~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' + String ( lb_return ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P024_crypt_AsymmetricVerifySign' 
		If ab_execute = True Then
			//AsymmetricVerifySign
			//null
			ls_Value = 'test'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(asalg_Null, lb_Null,lb_pubKey, lb_sign)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricVerifySign(Null, Data,lb_pubKey,lb_sign) = Null Success' , False)
			Else
				wf_output('AsymmetricVerifySign(Null, Data,lb_pubKey,lb_sign) <> Null Failed ', False)
			End If
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_Null,lb_pubKey, lb_sign)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricVerifySign(RSA!, Null,lb_pubKey,lb_sign) = Null Success' , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, Null,lb_pubKey,lb_sign) <> Null Failed ', False)
			End If
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_Null,lb_sign)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricVerifySign(RSA!, lb_data,Null,lb_sign) = Null Success' , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, lb_data,Null,lb_sign) <> Null Failed ', False)
			End If
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_Null)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,Null) = Null Success' , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,Null) <> Null Failed ', False)
			End If
			
			//异常测试
			//参数不匹配
			ls_error = "Not Match:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
				li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			Catch ( throwable ex4e)
				ls_error = "AsymmetricSign Not Match Return:" + ex4e.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			//Data invalid length
			ls_error = "Data invalid length:View error Failed"
			Try
				li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
				lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
				li_return = lco_Crypt.AsymmetricVerifySign(DSA!, Blob("",EncodingUTF8!),lb_pubKey,lb_sign)
			Catch ( throwable ex4ee)
				ls_error = "AsymmetricSign Data invalid length Return:" + ex4ee.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//RSA //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) = ' + String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) = ' + String ( li_return ), False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			//错误的pubkey
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "Appeon"UTF8,Error lb_pubKey('+string(li_len)+')) = ' + String ( li_return ), False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "Appeon"UTF8,Error lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			
			li_len = 1024
			ls_Value = '中文测试' //中文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) = ' +   String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			
			li_len = 2048
			ls_Value = 'あいうえお' //日文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			
			li_len = 4096
			ls_Value = 'üöäß' //德语特殊字符
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(RSA!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(RSA!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			
			//DSA //英文
			li_len = 1024
			ls_Value = '中文测试' //中文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(DSA!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) = ' +   String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(DSA!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(DSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(DSA!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			
			li_len = 2048
			ls_Value = 'あいうえお' //日文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(DSA!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(DSA!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(DSA!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(DSA!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
		
			//Rabin //英文
			li_len = 512
			ls_Value = 'Appeon'
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) = ' + String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "Appeon"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) = ' + String ( li_return ), False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "Appeon"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
						
			li_len = 1024
			ls_Value = '中文测试' //中文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) = ' +   String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "中文测试"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' + String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "中文测试"UTF8,lb_privKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			
			li_len = 2048
			ls_Value = 'あいうえお' //日文
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "あいうえお"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "あいうえお"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			
			li_len = 4096
			ls_Value = 'üöäß' //德语特殊字符
			lb_Data = Blob(ls_Value, EncodingANSI!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "üöäß"ANSI,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
			lb_Data = Blob(ls_Value, EncodingUTF8!)
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
			If li_return = 1 Then
				wf_output('AsymmetricVerifySign(Rabin!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) = ' +  String ( li_return ) , False)
			Else
				wf_output('AsymmetricVerifySign(Rabin!, "üöäß"UTF8,lb_pubKey('+string(li_len)+')) Failed Return:' +  String ( li_return ), False)
			End If
		Else
			wf_scriptview("//AsymmetricVerifySign~r~n" +&
					"//null~r~n" +&
					"ls_Value = ~'test~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(asalg_Null, lb_Null,lb_pubKey, lb_sign)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Null, Data,lb_pubKey,lb_sign) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Null, Data,lb_pubKey,lb_sign) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_Null,lb_pubKey, lb_sign)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, Null,lb_pubKey,lb_sign) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, Null,lb_pubKey,lb_sign) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_Null,lb_sign)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, lb_data,Null,lb_sign) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, lb_data,Null,lb_sign) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_Null)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//异常测试~r~n" +&
					"//参数不匹配~r~n" +&
					"ls_error = ~"Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"	li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"Catch ( throwable ex4e)~r~n" +&
					"	ls_error = ~"AsymmetricSign Not Match Return:~" + ex4e.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"//Data invalid length~r~n" +&
					"ls_error = ~"Data invalid length:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"	lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"	li_return = lco_Crypt.AsymmetricVerifySign(DSA!, Blob(~"~",EncodingUTF8!),lb_pubKey,lb_sign)~r~n" +&
					"Catch ( throwable ex4ee)~r~n" +&
					"	ls_error = ~"AsymmetricSign Data invalid length Return:~" + ex4ee.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//RSA //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + String ( li_return ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"//错误的pubkey~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"Appeon~"UTF8,Error lb_pubKey(~'+string(li_len)+~')) = ~' + String ( li_return ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"Appeon~"UTF8,Error lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 1024~r~n" +&
					"ls_Value = ~'中文测试~' //中文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +   String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048~r~n" +&
					"ls_Value = ~'あいうえお~' //日文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096~r~n" +&
					"ls_Value = ~'üöäß~' //德语特殊字符~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(RSA!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//DSA //英文~r~n" +&
					"li_len = 1024~r~n" +&
					"ls_Value = ~'中文测试~' //中文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +   String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048~r~n" +&
					"ls_Value = ~'あいうえお~' //日文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(DSA!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//Rabin //英文~r~n" +&
					"li_len = 512~r~n" +&
					"ls_Value = ~'Appeon~'~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' + String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"Appeon~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' + String ( li_return ), False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"Appeon~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"			~r~n" +&
					"li_len = 1024~r~n" +&
					"ls_Value = ~'中文测试~' //中文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +   String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"中文测试~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"中文测试~"UTF8,lb_privKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 2048~r~n" +&
					"ls_Value = ~'あいうえお~' //日文~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"あいうえお~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"あいうえお~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"li_len = 4096~r~n" +&
					"ls_Value = ~'üöäß~' //德语特殊字符~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingANSI!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"üöäß~"ANSI,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"lb_Data = Blob(ls_Value, EncodingUTF8!)~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
					"li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) = ~' +  String ( li_return ) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricVerifySign(Rabin!, ~"üöäß~"UTF8,lb_pubKey(~'+string(li_len)+~')) Failed Return:~' +  String ( li_return ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P025_crypt_AsymmetricGenerateKey' 
		If ab_execute = True Then
			//AsymmetricGenerateKey
			//null
			li_return = lco_Crypt.AsymmetricGenerateKey(asalg_Null, 1024, lb_privKey,lb_pubKey)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricGenerateKey(Null, 1024, lb_privKey,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricGenerateKey(Null, 1024, lb_privKey,lb_pubKey) <> Null Failed ', False)
			End If
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_Null, lb_privKey,lb_pubKey)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricGenerateKey(RSA!, Null, lb_privKey,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, Null, lb_privKey,lb_pubKey) <> Null Failed ', False)
			End If
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_Null,lb_pubKey)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricGenerateKey(RSA!, 1024, Null,lb_pubKey) = Null Success' , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 1024, Null,lb_pubKey) <> Null Failed ', False)
			End If
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_Null)
			If IsNull ( li_return ) Then
				wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,Null) = Null Success' , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,Null) <> Null Failed ', False)
			End If
			
			//异常测试
			//参数len长度为0
			ls_error = "AsymmetricGenerateKey Not Match:View error Failed"
			Try
				li_len = 0
				lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			Catch ( throwable ex1g)
				ls_error = "AsymmetricGenerateKey Not Match Return:" + ex1g.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			ls_error = "AsymmetricGenerateKey Not Match:View error Failed"
			Try
				li_len = 1
				lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			Catch ( throwable ex2g)
				ls_error = "AsymmetricGenerateKey Not Match For RSA Return:" + ex2g.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			ls_error = "AsymmetricGenerateKey Not Match:View error Failed"
			Try
				li_len = 16
				lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			Catch ( throwable ex3g)
				ls_error = "AsymmetricGenerateKey Not Match For DSA Return:" + ex3g.getmessage()
			End Try
			wf_output(ls_error, False)
			ls_error = ""
			
			//正常测试
			//RSA
			li_len = 16
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(RSA!, 16, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 16, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 512
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 1024
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 2048
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 4096
			li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(RSA!, 4096, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(RSA!, 4096, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			
			//DSA
			li_len = 1024
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 2048
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 3072
			li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(DSA!, 3072, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(DSA!, 3072, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			
			//Rabin
			li_len = 16
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(Rabin!, 16, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(Rabin!, 16, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 512
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 1024
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 2048
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
			li_len = 4096
			li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)
			If li_return = 1 Then
				wf_output('AsymmetricGenerateKey(Rabin!, 4096, lb_privKey,lb_pubKey) = 1 Success' , False)
				wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
				wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
			Else
				wf_output('AsymmetricGenerateKey(Rabin!, 4096, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
			End If
		Else
			wf_scriptview("//AsymmetricGenerateKey~r~n" +&
					"//null~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(asalg_Null, 1024, lb_privKey,lb_pubKey)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Null, 1024, lb_privKey,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Null, 1024, lb_privKey,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_Null, lb_privKey,lb_pubKey)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, Null, lb_privKey,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, Null, lb_privKey,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_Null,lb_pubKey)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 1024, Null,lb_pubKey) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 1024, Null,lb_pubKey) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_Null)~r~n" +&
					"If IsNull ( li_return ) Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,Null) = Null Success~' , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,Null) <> Null Failed ~', False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//异常测试~r~n" +&
					"//参数len长度为0~r~n" +&
					"ls_error = ~"AsymmetricGenerateKey Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_len = 0~r~n" +&
					"	lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"Catch ( throwable ex1g)~r~n" +&
					"	ls_error = ~"AsymmetricGenerateKey Not Match Return:~" + ex1g.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"ls_error = ~"AsymmetricGenerateKey Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_len = 1~r~n" +&
					"	lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"Catch ( throwable ex2g)~r~n" +&
					"	ls_error = ~"AsymmetricGenerateKey Not Match For RSA Return:~" + ex2g.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"ls_error = ~"AsymmetricGenerateKey Not Match:View error Failed~"~r~n" +&
					"Try~r~n" +&
					"	li_len = 16~r~n" +&
					"	lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"Catch ( throwable ex3g)~r~n" +&
					"	ls_error = ~"AsymmetricGenerateKey Not Match For DSA Return:~" + ex3g.getmessage()~r~n" +&
					"End Try~r~n" +&
					"wf_output(ls_error, False)~r~n" +&
					"ls_error = ~"~"~r~n" +&
					"~r~n" +&
					"//正常测试~r~n" +&
					"//RSA~r~n" +&
					"li_len = 16~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 16, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 16, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 512~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 1024~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 2048~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 4096~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 4096, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(RSA!, 4096, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//DSA~r~n" +&
					"li_len = 1024~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 2048~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 3072~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(DSA!, 3072, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(DSA!, 3072, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"~r~n" +&
					"//Rabin~r~n" +&
					"li_len = 16~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 16, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 16, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 512~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 1024~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 2048~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n" +&
					"li_len = 4096~r~n" +&
					"li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, li_len, lb_privKey,lb_pubKey)~r~n" +&
					"If li_return = 1 Then~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 4096, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
					"	wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
					"	wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
					"Else~r~n" +&
					"	wf_output(~'AsymmetricGenerateKey(Rabin!, 4096, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
					"End If~r~n")
		End If
	Case 'P026_crypt_MD5' 
		wf_scriptexe3b( as_item, ab_execute)
	Case 'P027_crypt_SHA' 
		wf_scriptexe3b( as_item, ab_execute)
	Case 'P028_crypt_HMAC' 
		wf_scriptexe3b( as_item, ab_execute)
	Case Else	
	 	MessageBox("Error","This Point Not Coding",Exclamation!)
End Choose

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )


end subroutine

on w_encode_auto.create
int iCurrent
call super::create
this.cb_post1=create cb_post1
this.cb_post2=create cb_post2
this.crypterobject_1=create crypterobject_1
this.coderobject_1=create coderobject_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_post1
this.Control[iCurrent+2]=this.cb_post2
end on

on w_encode_auto.destroy
call super::destroy
destroy(this.cb_post1)
destroy(this.cb_post2)
destroy(this.crypterobject_1)
destroy(this.coderobject_1)
end on

type dw_compare from w_base_auto`dw_compare within w_encode_auto
end type

type st_desc from w_base_auto`st_desc within w_encode_auto
end type

type cb_compare from w_base_auto`cb_compare within w_encode_auto
end type

type mle_output from w_base_auto`mle_output within w_encode_auto
end type

type cb_close from w_base_auto`cb_close within w_encode_auto
end type

type cb_clear from w_base_auto`cb_clear within w_encode_auto
end type

type cb_result from w_base_auto`cb_result within w_encode_auto
end type

type cb_exe from w_base_auto`cb_exe within w_encode_auto
end type

type cb_auto from w_base_auto`cb_auto within w_encode_auto
end type

type mle_script from w_base_auto`mle_script within w_encode_auto
end type

type lb_testcase from w_base_auto`lb_testcase within w_encode_auto
end type

type mle_desc from w_base_auto`mle_desc within w_encode_auto
boolean hscrollbar = false
end type

type gb_desc from w_base_auto`gb_desc within w_encode_auto
end type

type gb_testcase from w_base_auto`gb_testcase within w_encode_auto
end type

type gb_script from w_base_auto`gb_script within w_encode_auto
end type

type gb_output from w_base_auto`gb_output within w_encode_auto
end type

type cb_post1 from commandbutton within w_encode_auto
boolean visible = false
integer x = 2853
integer y = 212
integer width = 229
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;wf_OutPut(gs_values, False) //Post Event
end event

type cb_post2 from commandbutton within w_encode_auto
boolean visible = false
integer x = 2853
integer y = 340
integer width = 229
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;wf_OutPut( gs_values, False) //Post Event

end event

type crypterobject_1 from crypterobject within w_encode_auto descriptor "pb_nvo" = "true" 
end type

on crypterobject_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on crypterobject_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

type coderobject_1 from coderobject within w_encode_auto descriptor "pb_nvo" = "true" 
end type

on coderobject_1.create
call super::create
TriggerEvent( this, "constructor" )
end on

on coderobject_1.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

