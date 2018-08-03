$PBExportHeader$w_encode_manu.srw
forward
global type w_encode_manu from w_base_manu
end type
end forward

global type w_encode_manu from w_base_manu
string title = "w_encode_manu"
end type
global w_encode_manu w_encode_manu

type variables
string 	is_value, is_type, is_Parm
end variables

forward prototypes
public subroutine wf_init ()
public subroutine wf_testcase_desc (string as_testcase)
public subroutine wf_parm_setdefault (string as_parm)
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public subroutine wf_parm_setvalue ()
public function string wf_help ()
end prototypes

public subroutine wf_init ();//====================================================================
// Function: wf_init
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//初始化函数列表,多个函数通过逗号分割

is_testcaselist = "P001_HexEncode,P002_HexDecode,P003_Base64Encode,P004_Base64Decode,P005_UrlEncode,P006_UrlDecode" + &
",P007_SymmetricEncrypt,P008_SymmetricDecrypt,P009_AsymmetricEncrypt,P010_AsymmetricDecrypt,P011_AsymmetricSign,P012_AsymmetricVerifySign,P013_AsymmetricGenerateKey,P014_MD5,P015_SHA,P016_HMAC" 
wf_additem(lb_testcase,is_testcaselist)
end subroutine

public subroutine wf_testcase_desc (string as_testcase);

//作用：初始化测试点描述和参数信息
string ls_item
string ls_desc=''  //测试点的描述信息

ls_item = as_testcase
is_type = ""
is_Parm = ""
is_parmlist = ""
//添加描述信息和具体参数
choose case ls_item
	case "P001_HexEncode"
		wf_showscript(true,true)
		ls_desc = "十六进制编码"+"~r~n"
		ls_desc += "语法:String HexEncode(Blob variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "HexEncode(EncodingANSI!),HexEncode(EncodingUTF8!),HexEncode(EncodingUTF16LE!),HexEncode(EncodingUTF16BE!)"
	case "P002_HexDecode"
		wf_showscript(true,true)
		ls_desc = "十六进制解码"+"~r~n"
		ls_desc += "语法:Blob HexDecode(String variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "HexDecode(EncodingUTF8!)"
	case "P003_Base64Encode"
		wf_showscript(true,true)
		ls_desc = "Base64编码"+"~r~n"
		ls_desc += "语法:String Base64Encode(Blob variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "Base64Encode(EncodingANSI!),Base64Encode(EncodingUTF8!),Base64Encode(EncodingUTF16LE!),Base64Encode(EncodingUTF16BE!)"
	case "P004_Base64Decode"
		wf_showscript(true,true)
		ls_desc = "Base64解码"+"~r~n"
		ls_desc += "语法:Blob Base64Decode(String variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "Base64Decode(EncodingUTF8!)"
	case "P005_UrlEncode"
		wf_showscript(true,true)
		ls_desc = "URL编码"+"~r~n"
		ls_desc += "语法:String UrlEncode(Blob variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "UrlEncode(EncodingANSI!),UrlEncode(EncodingUTF8!),UrlEncode(EncodingUTF16LE!),UrlEncode(EncodingUTF16BE!)"
	case "P006_UrlDecode"
		wf_showscript(true,true)
		ls_desc = "URL解码"+"~r~n"
		ls_desc += "语法:Blob UrlDecode(String variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "UrlDecode(EncodingUTF8!)"
	case "P007_SymmetricEncrypt"
		wf_showscript(true,true)
		ls_desc = "对称加密"+"~r~n"
		ls_desc += "语法:Blob SymmetricEncrypt(SymmetricAlgorithm algorithm, Blob variable, Blob key{, OperationMode operationmode{, Blob iv{, PaddingScheme padding}}})" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		ls_desc += "匹配太多,约定为:64bit(DES!,Blowfish),128bit(AES!,TDES!),192bit(DESX!)" +"~r~n"
		ls_desc += "64bit Key = 'appeonke'" +"~r~n"
		ls_desc += "64bit IV = 'appeoniv'" +"~r~n"
		ls_desc += "128bit Key = 'appeonkey1234567'" +"~r~n"
		ls_desc += "128bit IV = 'appeoniv12345678'" +"~r~n"
		ls_desc += "192bit Key = 'appeonkey123456712345678'" +"~r~n"
		ls_desc += "192bit IV = 'appeoniv1234567812345678'" +"~r~n"
		is_parmlist = 	"SymmetricEncrypt(AES!ECB!ZerosPadding!),SymmetricEncrypt(AES!CBC!ZerosPadding!),SymmetricEncrypt(AES!CFB!NoPadding!),SymmetricEncrypt(AES!OFB!NoPadding!),SymmetricEncrypt(AES!CTR!NoPadding!)," + &
							"SymmetricEncrypt(DES!ECB!ZerosPadding!),SymmetricEncrypt(DES!CBC!ZerosPadding!),SymmetricEncrypt(DES!CFB!NoPadding!),SymmetricEncrypt(DES!OFB!NoPadding!),SymmetricEncrypt(DES!CTR!NoPadding!)," + &
							"SymmetricEncrypt(TDES!ECB!ZerosPadding!),SymmetricEncrypt(TDES!CBC!ZerosPadding!),SymmetricEncrypt(TDES!CFB!NoPadding!),SymmetricEncrypt(TDES!OFB!NoPadding!),SymmetricEncrypt(TDES!CTR!NoPadding!)," + &
							"SymmetricEncrypt(DESX!ECB!ZerosPadding!),SymmetricEncrypt(DESX!CBC!ZerosPadding!),SymmetricEncrypt(DESX!CFB!NoPadding!),SymmetricEncrypt(DESX!OFB!NoPadding!),SymmetricEncrypt(DESX!CTR!NoPadding!)," + &
							"SymmetricEncrypt(Blowfish!ECB!ZerosPadding!),SymmetricEncrypt(Blowfish!CBC!ZerosPadding!),SymmetricEncrypt(Blowfish!CFB!NoPadding!),SymmetricEncrypt(Blowfish!OFB!NoPadding!),SymmetricEncrypt(Blowfish!CTR!NoPadding!)"
	case "P008_SymmetricDecrypt"
		wf_showscript(true,true)
		ls_desc = "对称解密"+"~r~n"
		ls_desc += "语法:Blob SymmetricDecrypt(SymmetricAlgorithm algorithm, Blob variable, Blob key{, OperationMode operationmode{, Blob iv{, PaddingScheme padding}}})" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		ls_desc += "匹配太多,约定为:先加密后解密,64bit(DES!,Blowfish),128bit(AES!,TDES!),192bit(DESX!)" +"~r~n"
		ls_desc += "64bit Key = 'appeonke'" +"~r~n"
		ls_desc += "64bit IV = 'appeoniv'" +"~r~n"
		ls_desc += "128bit Key = 'appeonkey1234567'" +"~r~n"
		ls_desc += "128bit IV = 'appeoniv12345678'" +"~r~n"
		ls_desc += "192bit Key = 'appeonkey123456712345678'" +"~r~n"
		ls_desc += "192bit IV = 'appeoniv1234567812345678'" +"~r~n"
		is_parmlist = 	"SymmetricDecrypt(AES!ECB!ZerosPadding!),SymmetricDecrypt(AES!CBC!ZerosPadding!),SymmetricDecrypt(AES!CFB!NoPadding!),SymmetricDecrypt(AES!OFB!NoPadding!),SymmetricDecrypt(AES!CTR!NoPadding!)," + &
							"SymmetricDecrypt(DES!ECB!ZerosPadding!),SymmetricDecrypt(DES!CBC!ZerosPadding!),SymmetricDecrypt(DES!CFB!NoPadding!),SymmetricDecrypt(DES!OFB!NoPadding!),SymmetricDecrypt(DES!CTR!NoPadding!)," + &
							"SymmetricDecrypt(TDES!ECB!ZerosPadding!),SymmetricDecrypt(TDES!CBC!ZerosPadding!),SymmetricDecrypt(TDES!CFB!NoPadding!),SymmetricDecrypt(TDES!OFB!NoPadding!),SymmetricDecrypt(TDES!CTR!NoPadding!)," + &
							"SymmetricDecrypt(DESX!ECB!ZerosPadding!),SymmetricDecrypt(DESX!CBC!ZerosPadding!),SymmetricDecrypt(DESX!CFB!NoPadding!),SymmetricDecrypt(DESX!OFB!NoPadding!),SymmetricDecrypt(DESX!CTR!NoPadding!)," + &
							"SymmetricDecrypt(Blowfish!ECB!ZerosPadding!),SymmetricDecrypt(Blowfish!CBC!ZerosPadding!),SymmetricDecrypt(Blowfish!CFB!NoPadding!),SymmetricDecrypt(Blowfish!OFB!NoPadding!),SymmetricDecrypt(Blowfish!CTR!NoPadding!)"
	case "P009_AsymmetricEncrypt"
		wf_showscript(true,true)
		ls_desc = "非对称加密,用公钥加密"+"~r~n"
		ls_desc += "语法:Blob AsymmetricEncrypt(AsymmetricAlgorithm algorithm, Blob variable, Blob pubKey)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		ls_desc += "长度:512,1024,2048" +"~r~n"
		ls_desc += "对应明文长度:22,86,214" +"~r~n"
		is_parmlist = "AsymmetricEncrypt(RSA!512),AsymmetricEncrypt(RSA!1024),AsymmetricEncrypt(RSA!2048),AsymmetricEncrypt(Rabin!512),AsymmetricEncrypt(Rabin!1024),AsymmetricEncrypt(Rabin!2048)"
	case "P010_AsymmetricDecrypt"
		wf_showscript(true,true)
		ls_desc = "非对称解密,先用公钥加密,后用私钥解密"+"~r~n"
		ls_desc += "语法:Blob AsymmetricDecrypt(AsymmetricAlgorithm algorithm, Blob variable, Blob privKey)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		ls_desc += "长度:512,1024,2048" +"~r~n"
		is_parmlist = "AsymmetricDecrypt(RSA!512),AsymmetricDecrypt(RSA!1024),AsymmetricDecrypt(RSA!2048),AsymmetricDecrypt(Rabin!512),AsymmetricDecrypt(Rabin!1024),AsymmetricDecrypt(Rabin!2048)"
	case "P011_AsymmetricSign"
		wf_showscript(true,true)
		ls_desc = "非对称签名,用私钥签名"+"~r~n"
		ls_desc += "语法:Blob AsymmetricSign(AsymmetricAlgorithm algorithm, Blob variable, Blob privKey)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		ls_desc += "长度:512,1024,2048" +"~r~n"
		is_parmlist = "AsymmetricSign(RSA!512),AsymmetricSign(RSA!1024),AsymmetricSign(RSA!2048),AsymmetricSign(DSA!1024),AsymmetricSign(DSA!2048),AsymmetricSign(Rabin!512),AsymmetricSign(Rabin!1024),AsymmetricSign(Rabin!2048)"
	case "P012_AsymmetricVerifySign"
		wf_showscript(true,true)
		ls_desc = "非对称签名验证,用私钥签名,用公钥验证"+"~r~n"
		ls_desc += "语法:Integer AsymmetricVerifySign(AsymmetricAlgorithm algorithm, Blob variable, Blob pubKey, Blob sign)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		ls_desc += "长度:512,1024,2048" +"~r~n"
		is_parmlist = "AsymmetricVerifySign(RSA!512),AsymmetricVerifySign(RSA!1024),AsymmetricVerifySign(RSA!2048),AsymmetricVerifySign(DSA!1024),AsymmetricVerifySign(DSA!2048),AsymmetricVerifySign(Rabin!512),AsymmetricVerifySign(Rabin!1024),AsymmetricVerifySign(Rabin!2048)"
	case "P013_AsymmetricGenerateKey"
		wf_showscript(true,true)
		ls_desc = "获取密码对(私钥/公钥)"+"~r~n"
		ls_desc += "语法:Integer AsymmetricGenerateKey(AsymmetricAlgorithm algorithm, Integer len, ref Blob privKey, ref Blob pubKey)" +"~r~n"
		ls_desc += "长度:16以上,512,1024,2048,4096" +"~r~n"
		ls_desc += "注意:DSA模式1024,2048长度成功,其他长度PB崩溃" +"~r~n"
		is_parmlist = "AsymmetricGenerateKey(RSA!),AsymmetricGenerateKey(DSA!),AsymmetricGenerateKey(Rabin!)"
	case "P014_MD5"
		wf_showscript(true,true)
		ls_desc = "MD5哈希值"+"~r~n"
		ls_desc += "语法:Blob MD5(Blob variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "MD5(EncodingANSI!),MD5(EncodingUTF8!),MD5(EncodingUTF16LE!),MD5(EncodingUTF16BE!)"
	case "P015_SHA"
		wf_showscript(true,true)
		ls_desc = "SHA哈希值"+"~r~n"
		ls_desc += "语法:Blob SHA(SHAAlgorithm algorithm, Blob variable)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "SHA(SHA1!),SHA(SHA224!),SHA(SHA256!),SHA(SHA384!),SHA(SHA512!),SHA(SHA3_224!),SHA(SHA3_256!),SHA(SHA3_384!),SHA(SHA3_512!)"
	case "P016_HMAC"
		wf_showscript(true,true)
		ls_desc = "HMAC哈希值"+"~r~n"
		ls_desc += "语法:Blob HMAC(HMACAlgorithm algorithm, Blob variable, Blob key)" +"~r~n"
		ls_desc += "注意:非英文字符以UTF8为准" +"~r~n"
		is_parmlist = "HMAC(HMACMD5!key('')),HMAC(HMACSHA1!key('')),HMAC(HMACSHA224!key('')),HMAC(HMACSHA256!key('')),HMAC(HMACSHA384!key('')),HMAC(HMACSHA512!key('key')),HMAC(HMACMD5!key('key')),HMAC(HMACSHA1!key('key')),HMAC(HMACSHA224!key('key')),HMAC(HMACSHA256!key('key')),HMAC(HMACSHA384!key('key')),HMAC(HMACSHA512!key('key'))"
	case else
		
		
end choose

//输出描述信息
if trim(ls_desc)<>'' then
	wf_des(ls_desc)
end if

//添加参数列表
lb_parm.reset()
ddlb_parm.reset()
if trim(is_parmlist) <> '' then
	wf_additem(ddlb_parm,is_parmlist)
	ddlb_parm.event selectionchanged( 1)
	ddlb_parm.selectitem(1)
end if
end subroutine

public subroutine wf_parm_setdefault (string as_parm);//====================================================================
// Function: wf_parm_setdefault
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_parm
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_default   //测试的默认可供测试数据
//判断参数的合法性
if isnull(as_parm) or trim(as_parm) = '' then
	return
end if
//匹配相应的参数列表
choose case as_parm
	case "HexEncode(EncodingANSI!)","HexEncode(EncodingUTF8!)","HexEncode(EncodingUTF16LE!)","HexEncode(EncodingUTF16BE!)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	case "Base64Encode(EncodingANSI!)","Base64Encode(EncodingUTF8!)","Base64Encode(EncodingUTF16LE!)","Base64Encode(EncodingUTF16BE!)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	case "UrlEncode(EncodingANSI!)","UrlEncode(EncodingUTF8!)","UrlEncode(EncodingUTF16LE!)","UrlEncode(EncodingUTF16BE!)"
		ls_default = "https://www.appeon.com/Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "MD5(EncodingANSI!)","MD5(EncodingUTF8!)","MD5(EncodingUTF16LE!)","MD5(EncodingUTF16BE!)"
		ls_default = ",Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "SHA(SHA1!)","SHA(SHA224!)","SHA(SHA256!)","SHA(SHA384!)","SHA(SHA512!)","SHA(SHA3_224!)","SHA(SHA3_256!)","SHA(SHA3_384!)","SHA(SHA3_512!)"
		ls_default = ",Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	case "HMAC(HMACMD5!key(''))","HMAC(HMACSHA1!key(''))","HMAC(HMACSHA224!key(''))","HMAC(HMACSHA256!key(''))","HMAC(HMACSHA384!key(''))","HMAC(HMACSHA512!key('key'))","HMAC(HMACMD5!key('key'))","HMAC(HMACSHA1!key('key'))","HMAC(HMACSHA224!key('key'))","HMAC(HMACSHA256!key('key'))","HMAC(HMACSHA384!key('key'))","HMAC(HMACSHA512!key('key'))"
		ls_default = ",Appeon,中文测试,あいうえお,üöäß,The quick brown fox jumps over the lazy dog,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	case "SymmetricEncrypt(AES!ECB!ZerosPadding!)","SymmetricEncrypt(AES!CBC!ZerosPadding!)","SymmetricEncrypt(AES!CFB!NoPadding!)","SymmetricEncrypt(AES!OFB!NoPadding!)","SymmetricEncrypt(AES!CTR!NoPadding!)",  &
			"SymmetricEncrypt(DES!ECB!ZerosPadding!)","SymmetricEncrypt(DES!CBC!ZerosPadding!)","SymmetricEncrypt(DES!CFB!NoPadding!)","SymmetricEncrypt(DES!OFB!NoPadding!)","SymmetricEncrypt(DES!CTR!NoPadding!)",  &
			"SymmetricEncrypt(TDES!ECB!ZerosPadding!)","SymmetricEncrypt(TDES!CBC!ZerosPadding!)","SymmetricEncrypt(TDES!CFB!NoPadding!)","SymmetricEncrypt(TDES!OFB!NoPadding!)","SymmetricEncrypt(TDES!CTR!NoPadding!)" ,&
			"SymmetricEncrypt(DESX!ECB!ZerosPadding!)","SymmetricEncrypt(DESX!CBC!ZerosPadding!)","SymmetricEncrypt(DESX!CFB!NoPadding!)","SymmetricEncrypt(DESX!OFB!NoPadding!)","SymmetricEncrypt(DESX!CTR!NoPadding!)",  &
			"SymmetricEncrypt(Blowfish!ECB!ZerosPadding!)","SymmetricEncrypt(Blowfish!CBC!ZerosPadding!)","SymmetricEncrypt(Blowfish!CFB!NoPadding!)","SymmetricEncrypt(Blowfish!OFB!NoPadding!)","SymmetricEncrypt(Blowfish!CTR!NoPadding!)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	case "SymmetricDecrypt(AES!ECB!ZerosPadding!)","SymmetricDecrypt(AES!CBC!ZerosPadding!)","SymmetricDecrypt(AES!CFB!NoPadding!)","SymmetricDecrypt(AES!OFB!NoPadding!)","SymmetricDecrypt(AES!CTR!NoPadding!)",  &
			"SymmetricDecrypt(DES!ECB!ZerosPadding!)","SymmetricDecrypt(DES!CBC!ZerosPadding!)","SymmetricDecrypt(DES!CFB!NoPadding!)","SymmetricDecrypt(DES!OFB!NoPadding!)","SymmetricDecrypt(DES!CTR!NoPadding!)",  &
			"SymmetricDecrypt(TDES!ECB!ZerosPadding!)","SymmetricDecrypt(TDES!CBC!ZerosPadding!)","SymmetricDecrypt(TDES!CFB!NoPadding!)","SymmetricDecrypt(TDES!OFB!NoPadding!)","SymmetricDecrypt(TDES!CTR!NoPadding!)" ,&
			"SymmetricDecrypt(DESX!ECB!ZerosPadding!)","SymmetricDecrypt(DESX!CBC!ZerosPadding!)","SymmetricDecrypt(DESX!CFB!NoPadding!)","SymmetricDecrypt(DESX!OFB!NoPadding!)","SymmetricDecrypt(DESX!CTR!NoPadding!)",  &
			"SymmetricDecrypt(Blowfish!ECB!ZerosPadding!)","SymmetricDecrypt(Blowfish!CBC!ZerosPadding!)","SymmetricDecrypt(Blowfish!CFB!NoPadding!)","SymmetricDecrypt(Blowfish!OFB!NoPadding!)","SymmetricDecrypt(Blowfish!CTR!NoPadding!)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "AsymmetricGenerateKey(RSA!)","AsymmetricGenerateKey(Rabin!)"
		ls_default = "512,1024,2048,4096"
	Case "AsymmetricGenerateKey(DSA!)"
		ls_default = "1024,2048"
	Case "AsymmetricEncrypt(RSA!512)","AsymmetricEncrypt(RSA!1024)","AsymmetricEncrypt(RSA!2048)","AsymmetricEncrypt(Rabin!512)","AsymmetricEncrypt(Rabin!1024)","AsymmetricEncrypt(Rabin!2048)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "AsymmetricDecrypt(RSA!512)","AsymmetricDecrypt(RSA!1024)","AsymmetricDecrypt(RSA!2048)","AsymmetricDecrypt(Rabin!512)","AsymmetricDecrypt(Rabin!1024)","AsymmetricDecrypt(Rabin!2048)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "AsymmetricSign(RSA!512)","AsymmetricSign(RSA!1024)","AsymmetricSign(RSA!2048)","AsymmetricSign(DSA!1024)","AsymmetricSign(DSA!2048)","AsymmetricSign(Rabin!512)","AsymmetricSign(Rabin!1024)","AsymmetricSign(Rabin!2048)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "AsymmetricVerifySign(RSA!512)","AsymmetricVerifySign(RSA!1024)","AsymmetricVerifySign(RSA!2048)","AsymmetricVerifySign(DSA!1024)","AsymmetricVerifySign(DSA!2048)","AsymmetricVerifySign(Rabin!512)","AsymmetricVerifySign(Rabin!1024)","AsymmetricVerifySign(Rabin!2048)"
		ls_default = "Appeon,中文测试,あいうえお,üöäß,이것은 한국어이다,هذه هي العربية,Das ist Deutsch,C'est français,Это русский,Tämä on suomalaista,Đây là người việt nam,Questo è italiano,Αυτό είναι ελληνικό"
	Case "HexDecode(EncodingUTF8!)"
		ls_default = "417070656F6E,C3BCC3B6C3A4C39F,E38182E38184E38186E38188E3818A,E4B8ADE69687E6B58BE8AF95"
	Case "Base64Decode(EncodingUTF8!)"
		ls_default = "QXBwZW9u,5Lit5paH5rWL6K+V,44GC44GE44GG44GI44GK,w7zDtsOkw58="
	Case "UrlDecode(EncodingUTF8!)"
		ls_default = "https%3A%2F%2Fwww.appeon.com%2FAppeon,%C3%BC%C3%B6%C3%A4%C3%9F,%E3%81%82%E3%81%84%E3%81%86%E3%81%88%E3%81%8A,%E4%B8%AD%E6%96%87%E6%B5%8B%E8%AF%95"
	case else
		ls_default = as_parm
end choose

//将默认数据输出到参数数据列表
if trim(ls_default)<>'' then
	wf_additem(lb_parm,ls_default)
end if
end subroutine

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//====================================================================
// Function: wf_scriptexe
//--------------------------------------------------------------------
// Description:run script (Encoding:ANSI\UTF8\UTF16LE\UTF16BE)
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    ai_item
// 	value    boolean    ab_execute
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string 	ls_item,ls_value, ls_rtn
long 		ll_Len
Integer 	li_return
Blob 		lb_Data, lb_return, lb_key, lb_iv, lb_privKey, lb_pubKey,lb_encrypt,lb_sign
CoderObject 	lco_Code
CrypterObject 	lco_Crypt

lco_Code = Create CoderObject
lco_Crypt = Create CrypterObject

//判断参数的合法性
if ai_item <= 0 then 
	return
end if

//获取测试点名称
ls_item = lb_testcase.text(ai_item)

if ab_execute then
	//记录输出日志的起点
	wf_output("Begin "+ls_item,true)
end if


//执行相对性的测试点代码
Choose Case ls_item
	Case 'P001_HexEncode' //16进制编码
		If ab_execute = True Then
			Try
				//4种字符集的编码
				Choose Case is_type 
					Case "HexEncode(EncodingANSI!)"
						ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingANSI!))
						wf_output('HexEncode(Blob("'+is_Parm+'"), EncodingANSI!) = ' + ls_rtn, False)
					Case "HexEncode(EncodingUTF8!)"
						ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingUTF8!))
						wf_output('HexEncode(Blob("'+is_Parm+'"), EncodingUTF8!) = ' + ls_rtn, False)
					Case "HexEncode(EncodingUTF16LE!)"
						ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingUTF16LE!))
						wf_output('HexEncode(Blob("'+is_Parm+'"), EncodingUTF16LE!) = ' + ls_rtn, False)
					Case "HexEncode(EncodingUTF16BE!)"
						ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingUTF16BE!))
						wf_output('HexEncode(Blob("'+is_Parm+'"), EncodingUTF16BE!) = ' + ls_rtn, False)
				End Choose
			Catch ( throwable e001)
				wf_output(e001.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
						"Case ~"HexEncode(EncodingANSI!)~"~r~n" +&
						"	ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingANSI!))~r~n" +&
						"	wf_output(~'HexEncode(Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"HexEncode(EncodingUTF8!)~"~r~n" +&
						"	ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'HexEncode(Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"HexEncode(EncodingUTF16LE!)~"~r~n" +&
						"	ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingUTF16LE!))~r~n" +&
						"	wf_output(~'HexEncode(Blob(~"~'+is_Parm+~'~"), EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"HexEncode(EncodingUTF16BE!)~"~r~n" +&
						"	ls_rtn = lco_Code.HexEncode(Blob(is_Parm, EncodingUTF16BE!))~r~n" +&
						"	wf_output(~'HexEncode(Blob(~"~'+is_Parm+~'~"), EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"End Choose~r~n")
		End If
	
	Case 'P002_HexDecode' //16进制解码
		If ab_execute = True Then
			Try
				//只测试UTF8的解码
				lb_Data = lco_Code.HexDecode(is_Parm)
				wf_output('HexDecode("'+is_Parm+'") = ' + String(lb_Data,EncodingUTF8!), False)
			Catch ( throwable e002)
				wf_output(e002.getmessage(), False)
			End Try
		Else
			wf_scriptview("lb_Data = lco_Code.HexDecode(is_Parm)~r~n" +&
					"wf_output(~'HexDecode(~"~'+is_Parm+~'~") = ~' + String(lb_Data,EncodingUTF8!), False)~r~n")
		End If
	Case 'P003_Base64Encode' 
		If ab_execute = True Then
			Try
				//Base64编码,四种字符集测试
				Choose Case is_type
					Case "Base64Encode(EncodingANSI!)"
						ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingANSI!))
						wf_output('Base64Encode(Blob("'+is_Parm+'"), EncodingANSI!) = ' + ls_rtn, False)
					Case "Base64Encode(EncodingUTF8!)"
						ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingUTF8!))
						wf_output('Base64Encode(Blob("'+is_Parm+'"), EncodingUTF8!) = ' + ls_rtn, False)
					Case "Base64Encode(EncodingUTF16LE!)"
						ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingUTF16LE!))
						wf_output('Base64Encode(Blob("'+is_Parm+'"), EncodingUTF16LE!) = ' + ls_rtn, False)
					Case "Base64Encode(EncodingUTF16BE!)"
						ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingUTF16BE!))
						wf_output('Base64Encode(Blob("'+is_Parm+'"), EncodingUTF16BE!) = ' + ls_rtn, False)
				End Choose
			Catch ( throwable e003)
				wf_output(e003.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
						"Case ~"Base64Encode(EncodingANSI!)~"~r~n" +&
						"	ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingANSI!))~r~n" +&
						"	wf_output(~'Base64Encode(Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"Base64Encode(EncodingUTF8!)~"~r~n" +&
						"	ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'Base64Encode(Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"Base64Encode(EncodingUTF16LE!)~"~r~n" +&
						"	ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingUTF16LE!))~r~n" +&
						"	wf_output(~'Base64Encode(Blob(~"~'+is_Parm+~'~"), EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"Base64Encode(EncodingUTF16BE!)~"~r~n" +&
						"	ls_rtn = lco_Code.Base64Encode(Blob(is_Parm, EncodingUTF16BE!))~r~n" +&
						"	wf_output(~'Base64Encode(Blob(~"~'+is_Parm+~'~"), EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"End Choose~r~n")
		End If
	Case 'P004_Base64Decode' 
		//Base64解码,只测试UTF8字符集
		If ab_execute = True Then
			Try
				lb_Data = lco_Code.Base64Decode(is_Parm)
				wf_output('Base64Decode("'+is_Parm+'") = ' + String(lb_Data,EncodingUTF8!), False)
			Catch ( throwable e004)
				wf_output(e004.getmessage(), False)
			End Try
		Else
			wf_scriptview("lb_Data = lco_Code.Base64Decode(is_Parm)~r~n" +&
					"wf_output(~'Base64Decode(~"~'+is_Parm+~'~") = ~' + String(lb_Data,EncodingUTF8!), False)~r~n")
		End If
	Case 'P005_UrlEncode' 
		//URL编码 四种字符集编码
		If ab_execute = True Then
			Try
				Choose Case is_type
					Case "UrlEncode(EncodingANSI!)"
						ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingANSI!))
						wf_output('UrlEncode(Blob("'+is_Parm+'"), EncodingANSI!) = ' + ls_rtn, False)
					Case "UrlEncode(EncodingUTF8!)"
						ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingUTF8!))
						wf_output('UrlEncode(Blob("'+is_Parm+'"), EncodingUTF8!) = ' + ls_rtn, False)
					Case "UrlEncode(EncodingUTF16LE!)"
						ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingUTF16LE!))
						wf_output('UrlEncode(Blob("'+is_Parm+'"), EncodingUTF16LE!) = ' + ls_rtn, False)
					Case "UrlEncode(EncodingUTF16BE!)"
						ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingUTF16BE!))
						wf_output('UrlEncode(Blob("'+is_Parm+'"), EncodingUTF16BE!) = ' + ls_rtn, False)
				End Choose
			Catch ( throwable e005)
				wf_output(e005.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
						"Case ~"UrlEncode(EncodingANSI!)~"~r~n" +&
						"	ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingANSI!))~r~n" +&
						"	wf_output(~'UrlEncode(Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"UrlEncode(EncodingUTF8!)~"~r~n" +&
						"	ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'UrlEncode(Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"UrlEncode(EncodingUTF16LE!)~"~r~n" +&
						"	ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingUTF16LE!))~r~n" +&
						"	wf_output(~'UrlEncode(Blob(~"~'+is_Parm+~'~"), EncodingUTF16LE!) = ~' + ls_rtn, False)~r~n" +&
						"Case ~"UrlEncode(EncodingUTF16BE!)~"~r~n" +&
						"	ls_rtn = lco_Code.UrlEncode(Blob(is_Parm, EncodingUTF16BE!))~r~n" +&
						"	wf_output(~'UrlEncode(Blob(~"~'+is_Parm+~'~"), EncodingUTF16BE!) = ~' + ls_rtn, False)~r~n" +&
						"End Choose~r~n")
		End If
	Case 'P006_UrlDecode' 
		//URL解码,UTF8字符集解码
		If ab_execute = True Then
			Try
				lb_Data = lco_Code.UrlDecode(is_Parm)
				wf_output('UrlDecode("'+is_Parm+'") = ' + String(lb_Data,EncodingUTF8!), False)
			Catch ( throwable e006)
				wf_output(e006.getmessage(), False)
			End Try
		Else
			wf_scriptview("lb_Data = lco_Code.UrlDecode(is_Parm)~r~n" +&
					"wf_output(~'UrlDecode(~"~'+is_Parm+~'~") = ~' + String(lb_Data,EncodingUTF8!), False)~r~n")
		End If
	Case 'P007_SymmetricEncrypt' 
		//对称加密,AES/DES/TDES/DESX/BLOWFISH
		If ab_execute = True Then
			Try
				//不同加密模式key和iv长度要求不同
				Choose case true
					Case Pos(is_type,"AES!") > 0
						lb_Key = Blob ( "appeonkey1234567",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv12345678",  EncodingUTF8!)
					Case Pos(is_type,"DES!") > 0 And Pos(is_type,"TDES!") <= 0
						lb_Key = Blob ( "appeonke",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv",  EncodingUTF8!)
					Case Pos(is_type,"TDES!") > 0
						lb_Key = Blob ( "appeonkey1234567",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv12345678",  EncodingUTF8!)
					Case Pos(is_type,"DESX!") > 0
						lb_Key = Blob ( "appeonkey123456712345678",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv1234567812345678",  EncodingUTF8!)
					Case Pos(is_type,"Blowfish!") > 0
						lb_Key = Blob ( "appeonke",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv",  EncodingUTF8!)
				End Choose
				//不同加密模式,不同操作模式对UTF8字符集加密
				Choose case is_type
					Case "SymmetricEncrypt(AES!ECB!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(AES!CBC!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(AES!CFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(AES!OFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(AES!CTR!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DES!ECB!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DES!CBC!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DES!CFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DES!OFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DES!CTR!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_KeyCTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(TDES!ECB!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(TDES!CBC!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(TDES!CFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(TDES!OFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(TDES!CTR!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DESX!ECB!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DESX!CBC!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DESX!CFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DESX!OFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(DESX!CTR!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(Blowfish!ECB!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(Blowfish!CBC!ZerosPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(Blowfish!CFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(Blowfish!OFB!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
					Case "SymmetricEncrypt(Blowfish!CTR!NoPadding!)"
						lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Return), False)
				End Choose
			Catch ( throwable e007)
				wf_output(e007.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose case true~r~n" +&
							"Case Pos(is_type,~"AES!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonkey1234567~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv12345678~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"DES!~") > 0 And Pos(is_type,~"TDES!~") <= 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonke~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"TDES!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonkey1234567~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv12345678~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"DESX!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonkey123456712345678~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv1234567812345678~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"Blowfish!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonke~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv~",  EncodingUTF8!)~r~n" +&
							"End Choose~r~n" +&
							"//不同加密模式,不同操作模式对UTF8字符集加密~r~n" +&
							"Choose case is_type~r~n" +&
							"Case ~"SymmetricEncrypt(AES!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(AES!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(AES!CFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(AES!OFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(AES!CTR!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DES!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DES!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DES!CFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DES!OFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DES!CTR!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_KeyCTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(TDES!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(TDES!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(TDES!CFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(TDES!OFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(TDES!CTR!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DESX!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DESX!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DESX!CFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DESX!OFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(DESX!CTR!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(Blowfish!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(Blowfish!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(Blowfish!CFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(Blowfish!OFB!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"Case ~"SymmetricEncrypt(Blowfish!CTR!NoPadding!)~"~r~n" +&
							"	lb_return = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Return), False)~r~n" +&
							"End Choose~r~n")
		End If
	Case 'P008_SymmetricDecrypt' 
		//对称解密,AES/DES/TDES/DESX/BLOWFISH
		If ab_execute = True Then
			Try
				//不同解密模式key和iv长度要求不同
				//由于种类太多,现测试为:先加密后解密
				Choose case true
					Case Pos(is_type,"AES!") > 0
						lb_Key = Blob ( "appeonkey1234567",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv12345678",  EncodingUTF8!)
					Case Pos(is_type,"DES!") > 0 And Pos(is_type,"TDES!") <= 0
						lb_Key = Blob ( "appeonke",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv",  EncodingUTF8!)
					Case Pos(is_type,"TDES!") > 0
						lb_Key = Blob ( "appeonkey1234567",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv12345678",  EncodingUTF8!)
					Case Pos(is_type,"DESX!") > 0
						lb_Key = Blob ( "appeonkey123456712345678",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv1234567812345678",  EncodingUTF8!)
					Case Pos(is_type,"Blowfish!") > 0
						lb_Key = Blob ( "appeonke",  EncodingUTF8!)
						lb_iv = Blob ( "appeoniv",  EncodingUTF8!)
				End Choose
				Choose case is_type
					Case "SymmetricDecrypt(AES!ECB!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(AES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(AES!CBC!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(AES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(AES!CFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(AES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(AES!OFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(AES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,OFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(AES!CTR!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(AES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(AES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CTR!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DES!ECB!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(DES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DES!CBC!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(DES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DES!CFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(DES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DES!OFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(DES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,OFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DES!CTR!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(DES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CTR!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(TDES!ECB!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(TDES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(TDES!CBC!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(TDES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(TDES!CFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(TDES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(TDES!OFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(TDES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,OFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(TDES!CTR!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(TDES!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(TDES!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CTR!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DESX!ECB!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(DESX!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DESX!CBC!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(DESX!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DESX!CFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(DESX!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DESX!OFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(DESX!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,OFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(DESX!CTR!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(DESX!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(DESX!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CTR!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(Blowfish!ECB!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(Blowfish!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,ECB!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(Blowfish!CBC!ZerosPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)
						wf_output('SymmetricDecrypt(Blowfish!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CBC!,lb_iv,ZerosPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(Blowfish!CFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(Blowfish!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_KeyCFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(Blowfish!OFB!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(Blowfish!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,OFB!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
					Case "SymmetricDecrypt(Blowfish!CTR!NoPadding!)"
						lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricEncrypt(Blowfish!,Blob("'+is_Parm+'"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ' + lco_Code.Base64Encode(lb_Data), False)
						lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)
						wf_output('SymmetricDecrypt(Blowfish!,"'+ lco_Code.Base64Encode(lb_Data) +'",lb_Key,CTR!,lb_iv,NoPadding!) = ' + string(lb_return,EncodingUTF8!), False)
				End Choose
			Catch ( throwable e008)
				wf_output(e008.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose case true~r~n" +&
							"Case Pos(is_type,~"AES!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonkey1234567~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv12345678~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"DES!~") > 0 And Pos(is_type,~"TDES!~") <= 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonke~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"TDES!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonkey1234567~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv12345678~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"DESX!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonkey123456712345678~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv1234567812345678~",  EncodingUTF8!)~r~n" +&
							"Case Pos(is_type,~"Blowfish!~") > 0~r~n" +&
							"	lb_Key = Blob ( ~"appeonke~",  EncodingUTF8!)~r~n" +&
							"	lb_iv = Blob ( ~"appeoniv~",  EncodingUTF8!)~r~n" +&
							"End Choose~r~n" +&
							"Choose case is_type~r~n" +&
							"Case ~"SymmetricDecrypt(AES!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(AES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(AES!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(AES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(AES!CFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(AES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(AES!OFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(AES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,OFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(AES!CTR!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(AES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(AES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(AES!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(AES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CTR!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DES!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DES!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DES!CFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DES!OFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,OFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DES!CTR!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DES!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CTR!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(TDES!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(TDES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(TDES!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(TDES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(TDES!CFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(TDES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(TDES!OFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(TDES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,OFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(TDES!CTR!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(TDES!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(TDES!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(TDES!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(TDES!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CTR!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DESX!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DESX!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DESX!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DESX!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DESX!CFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DESX!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DESX!OFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DESX!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,OFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(DESX!CTR!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(DESX!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(DESX!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(DESX!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(DESX!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CTR!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(Blowfish!ECB!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeECB!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(Blowfish!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,ECB!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(Blowfish!CBC!ZerosPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeCBC!,lb_iv,ZerosPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(Blowfish!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CBC!,lb_iv,ZerosPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(Blowfish!CFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeCFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(Blowfish!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_KeyCFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(Blowfish!OFB!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,OFB!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeOFB!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(Blowfish!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,OFB!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"Case ~"SymmetricDecrypt(Blowfish!CTR!NoPadding!)~"~r~n" +&
							"	lb_Data = lco_Crypt.SymmetricEncrypt(Blowfish!,Blob(is_Parm, EncodingUTF8!),lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricEncrypt(Blowfish!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!,lb_Key,CTR!,lb_iv,NoPadding!) = ~' + lco_Code.Base64Encode(lb_Data), False)~r~n" +&
							"	lb_return = lco_Crypt.SymmetricDecrypt(Blowfish!,lb_Data,lb_Key,OperationModeCTR!,lb_iv,NoPadding!)~r~n" +&
							"	wf_output(~'SymmetricDecrypt(Blowfish!,~"~'+ lco_Code.Base64Encode(lb_Data) +~'~",lb_Key,CTR!,lb_iv,NoPadding!) = ~' + string(lb_return,EncodingUTF8!), False)~r~n" +&
							"End Choose~r~n")
		End If
	Case 'P009_AsymmetricEncrypt' 
		//非对称加密 RSA/Rabin
		If ab_execute = True Then
			TRy
				Choose Case is_type
					Case "AsymmetricEncrypt(RSA!512)"
						//获取512bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行RSA加密,显示密文的Base64编码
							lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricEncrypt(RSA!,"'+is_parm+'",lb_pubKey(512)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricEncrypt(RSA!, "'+is_parm+'",lb_pubKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricEncrypt(RSA!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行RSA加密,显示密文的Base64编码
							lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricEncrypt(RSA!,"'+is_parm+'",lb_pubKey(1024)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricEncrypt(RSA!, "'+is_parm+'",lb_pubKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricEncrypt(RSA!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行RSA加密,显示密文的Base64编码
							lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricEncrypt(RSA!,"'+is_parm+'",lb_pubKey(2048)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricEncrypt(RSA!, "'+is_parm+'",lb_pubKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricEncrypt(Rabin!512)"
						//获取512bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行Rabin加密,显示密文的Base64编码
							lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricEncrypt(Rabin!,"'+is_parm+'",lb_pubKey(512)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricEncrypt(Rabin!, "'+is_parm+'",lb_pubKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricEncrypt(Rabin!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行Rabin加密,显示密文的Base64编码
							lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricEncrypt(Rabin!,"'+is_parm+'",lb_pubKey(1024)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricEncrypt(Rabin!, "'+is_parm+'",lb_pubKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricEncrypt(Rabin!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行Rabin加密,显示密文的Base64编码
							lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricEncrypt(Rabin!,"'+is_parm+'",lb_pubKey(2048)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricEncrypt(Rabin!, "'+is_parm+'",lb_pubKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
				End Choose
			Catch ( throwable ex0)
				wf_output(ex0.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
							"Case ~"AsymmetricEncrypt(RSA!512)~"~r~n" +&
							"	//获取512bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行RSA加密,显示密文的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(RSA!,~"~'+is_parm+~'~",lb_pubKey(512)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(RSA!, ~"~'+is_parm+~'~",lb_pubKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricEncrypt(RSA!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行RSA加密,显示密文的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(RSA!,~"~'+is_parm+~'~",lb_pubKey(1024)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(RSA!, ~"~'+is_parm+~'~",lb_pubKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricEncrypt(RSA!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行RSA加密,显示密文的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(RSA!,~"~'+is_parm+~'~",lb_pubKey(2048)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(RSA!, ~"~'+is_parm+~'~",lb_pubKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricEncrypt(Rabin!512)~"~r~n" +&
							"	//获取512bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行Rabin加密,显示密文的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(Rabin!,~"~'+is_parm+~'~",lb_pubKey(512)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(Rabin!, ~"~'+is_parm+~'~",lb_pubKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricEncrypt(Rabin!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行Rabin加密,显示密文的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(Rabin!,~"~'+is_parm+~'~",lb_pubKey(1024)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(Rabin!, ~"~'+is_parm+~'~",lb_pubKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricEncrypt(Rabin!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行Rabin加密,显示密文的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(Rabin!,~"~'+is_parm+~'~",lb_pubKey(2048)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricEncrypt(Rabin!, ~"~'+is_parm+~'~",lb_pubKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"End Choose~r~n")
		End If
	Case 'P010_AsymmetricDecrypt' 
		//非对称界面,用公钥加密后,再用私钥界面
		If ab_execute = True Then
			TRy
				Choose Case is_type
					Case "AsymmetricDecrypt(RSA!512)"
						//获取5128bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行RSA加密,显示密文的Base64编码,再用公钥加密
							lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
							wf_output('AsymmetricEncrypt(RSA!,"'+is_parm+'",lb_pubKey(512)) = ' + lco_code.Base64Encode( lb_encrypt ) , False)
							lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricDecrypt(RSA!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(512)) = ' +  String(lb_return, EncodingUTF8! ) , False)
							Else
								wf_output('AsymmetricDecrypt(RSA!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricDecrypt(RSA!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行RSA加密,显示密文的Base64编码,再用公钥加密
							lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
							wf_output('AsymmetricEncrypt(RSA!,"'+is_parm+'",lb_pubKey(1024)) = ' + lco_code.Base64Encode( lb_encrypt ) , False)
							lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricDecrypt(RSA!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(1024)) = ' +  String(lb_return, EncodingUTF8! ) , False)
							Else
								wf_output('AsymmetricDecrypt(RSA!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricDecrypt(RSA!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行RSA加密,显示密文的Base64编码,再用公钥加密
							lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)
							wf_output('AsymmetricEncrypt(RSA!,"'+is_parm+'",lb_pubKey(2048)) = ' + lco_code.Base64Encode( lb_encrypt ) , False)
							lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricDecrypt(RSA!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(2048)) = ' +  String(lb_return, EncodingUTF8! ) , False)
							Else
								wf_output('AsymmetricDecrypt(RSA!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricDecrypt(Rabin!512)"
						//获取512bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行Rabin加密,显示密文的Base64编码,再用公钥加密
							lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
							wf_output('AsymmetricEncrypt(Rabin!,"'+is_parm+'",lb_pubKey(512)) = ' + lco_code.Base64Encode( lb_encrypt ) , False)
							lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricDecrypt(Rabin!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(512)) = ' +  String(lb_return, EncodingUTF8! ) , False)
							Else
								wf_output('AsymmetricDecrypt(Rabin!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricDecrypt(Rabin!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行Rabin加密,显示密文的Base64编码,再用公钥加密
							lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
							wf_output('AsymmetricEncrypt(Rabin!,"'+is_parm+'",lb_pubKey(1024)) = ' + lco_code.Base64Encode( lb_encrypt ) , False)
							lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricDecrypt(Rabin!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(1024)) = ' +  String(lb_return, EncodingUTF8! ) , False)
							Else
								wf_output('AsymmetricDecrypt(Rabin!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricDecrypt(Rabin!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用公钥进行Rabin加密,显示密文的Base64编码,再用公钥加密
							lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)
							wf_output('AsymmetricEncrypt(Rabin!,"'+is_parm+'",lb_pubKey(2048)) = ' + lco_code.Base64Encode( lb_encrypt ) , False)
							lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricDecrypt(Rabin!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(2048)) = ' +  String(lb_return, EncodingUTF8! ) , False)
							Else
								wf_output('AsymmetricDecrypt(Rabin!, "'+lco_code.Base64Encode( lb_encrypt )+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
				End Choose
			Catch ( throwable ex3)
				wf_output(ex3.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
							"Case ~"AsymmetricDecrypt(RSA!512)~"~r~n" +&
							"	//获取5128bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行RSA加密,显示密文的Base64编码,再用公钥加密~r~n" +&
							"		lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
							"		wf_output(~'AsymmetricEncrypt(RSA!,~"~'+is_parm+~'~",lb_pubKey(512)) = ~' + lco_code.Base64Encode( lb_encrypt ) , False)~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(RSA!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(512)) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(RSA!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricDecrypt(RSA!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行RSA加密,显示密文的Base64编码,再用公钥加密~r~n" +&
							"		lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
							"		wf_output(~'AsymmetricEncrypt(RSA!,~"~'+is_parm+~'~",lb_pubKey(1024)) = ~' + lco_code.Base64Encode( lb_encrypt ) , False)~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(RSA!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(1024)) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(RSA!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricDecrypt(RSA!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行RSA加密,显示密文的Base64编码,再用公钥加密~r~n" +&
							"		lb_encrypt = lco_Crypt.AsymmetricEncrypt(RSA!, lb_data,lb_pubKey)~r~n" +&
							"		wf_output(~'AsymmetricEncrypt(RSA!,~"~'+is_parm+~'~",lb_pubKey(2048)) = ~' + lco_code.Base64Encode( lb_encrypt ) , False)~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricDecrypt(RSA!, lb_encrypt,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(RSA!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(2048)) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(RSA!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricDecrypt(Rabin!512)~"~r~n" +&
							"	//获取512bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行Rabin加密,显示密文的Base64编码,再用公钥加密~r~n" +&
							"		lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
							"		wf_output(~'AsymmetricEncrypt(Rabin!,~"~'+is_parm+~'~",lb_pubKey(512)) = ~' + lco_code.Base64Encode( lb_encrypt ) , False)~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(Rabin!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(512)) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(Rabin!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricDecrypt(Rabin!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行Rabin加密,显示密文的Base64编码,再用公钥加密~r~n" +&
							"		lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
							"		wf_output(~'AsymmetricEncrypt(Rabin!,~"~'+is_parm+~'~",lb_pubKey(1024)) = ~' + lco_code.Base64Encode( lb_encrypt ) , False)~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(Rabin!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(1024)) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(Rabin!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricDecrypt(Rabin!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用公钥进行Rabin加密,显示密文的Base64编码,再用公钥加密~r~n" +&
							"		lb_encrypt = lco_Crypt.AsymmetricEncrypt(Rabin!, lb_data,lb_pubKey)~r~n" +&
							"		wf_output(~'AsymmetricEncrypt(Rabin!,~"~'+is_parm+~'~",lb_pubKey(2048)) = ~' + lco_code.Base64Encode( lb_encrypt ) , False)~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricDecrypt(Rabin!, lb_encrypt,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(Rabin!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(2048)) = ~' +  String(lb_return, EncodingUTF8! ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricDecrypt(Rabin!, ~"~'+lco_code.Base64Encode( lb_encrypt )+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"End Choose~r~n")
		End If
	Case 'P011_AsymmetricSign' 
		//非对称签名
		If ab_execute = True Then
			TRy
				Choose Case is_type
					Case "AsymmetricSign(RSA!512)"
						//获取512bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行RSA签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(RSA!,"'+is_parm+'",lb_privKey(512)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(RSA!, "'+is_parm+'",lb_privKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(RSA!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行RSA签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(RSA!,"'+is_parm+'",lb_privKey(1024)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(RSA!, "'+is_parm+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(RSA!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行RSA签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(RSA!,"'+is_parm+'",lb_privKey(2048)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(RSA!, "'+is_parm+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(DSA!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行DSA签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(DSA!,"'+is_parm+'",lb_privKey(1024)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(DSA!, "'+is_parm+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(DSA!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行DSA签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(DSA!,"'+is_parm+'",lb_privKey(2048)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(DSA!, "'+is_parm+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(Rabin!512)"
						//获取512bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行Rabin签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(Rabin!,"'+is_parm+'",lb_privKey(512)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(Rabin!, "'+is_parm+'",lb_privKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(Rabin!1024)"
						//获取1024bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行Rabin签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(Rabin!,"'+is_parm+'",lb_privKey(1024)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(Rabin!, "'+is_parm+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricSign(Rabin!2048)"
						//获取2048bit密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							//用私钥进行Rabin签名,显示签名的Base64编码
							lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
							If Len(lb_return) > 0 Then
								wf_output('AsymmetricSign(Rabin!,"'+is_parm+'",lb_privKey(2048)) = ' + lco_code.Base64Encode( lb_return ) , False)
							Else
								wf_output('AsymmetricSign(Rabin!, "'+is_parm+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
				End Choose
			Catch ( throwable ex0a)
				wf_output(ex0a.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
							"Case ~"AsymmetricSign(RSA!512)~"~r~n" +&
							"	//获取512bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行RSA签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!,~"~'+is_parm+~'~",lb_privKey(512)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!, ~"~'+is_parm+~'~",lb_privKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(RSA!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行RSA签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!,~"~'+is_parm+~'~",lb_privKey(1024)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!, ~"~'+is_parm+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(RSA!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行RSA签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!,~"~'+is_parm+~'~",lb_privKey(2048)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!, ~"~'+is_parm+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(DSA!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行DSA签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!,~"~'+is_parm+~'~",lb_privKey(1024)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!, ~"~'+is_parm+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(DSA!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行DSA签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!,~"~'+is_parm+~'~",lb_privKey(2048)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!, ~"~'+is_parm+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(Rabin!512)~"~r~n" +&
							"	//获取512bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行Rabin签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!,~"~'+is_parm+~'~",lb_privKey(512)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!, ~"~'+is_parm+~'~",lb_privKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(Rabin!1024)~"~r~n" +&
							"	//获取1024bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行Rabin签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!,~"~'+is_parm+~'~",lb_privKey(1024)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!, ~"~'+is_parm+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricSign(Rabin!2048)~"~r~n" +&
							"	//获取2048bit密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		//用私钥进行Rabin签名,显示签名的Base64编码~r~n" +&
							"		lb_return = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_return) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!,~"~'+is_parm+~'~",lb_privKey(2048)) = ~' + lco_code.Base64Encode( lb_return ) , False)~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!, ~"~'+is_parm+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"End Choose~r~n")
		End If
	Case 'P012_AsymmetricVerifySign' 
		//非对称签名验证
		If ab_execute = True Then
			TRy
				Choose Case is_type
					Case "AsymmetricVerifySign(RSA!512)"
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(RSA!,"'+is_parm+'",lb_privKey(512)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(RSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(512)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(RSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(512)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(RSA!, "'+is_parm+'",lb_privKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(RSA!1024)"
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(RSA!,"'+is_parm+'",lb_privKey(1024)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(RSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(1024)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(RSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(1024)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(RSA!, "'+is_parm+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(RSA!2048)"
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(RSA!,"'+is_parm+'",lb_privKey(2048)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(RSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(2048)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(RSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(2048)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(RSA!, "'+is_parm+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(DSA!1024)"
						li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(DSA!,"'+is_parm+'",lb_privKey(1024)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(DSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(1024)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(DSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(1024)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(DSA!, "'+is_parm+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(DSA!2048)"
						li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(DSA!,"'+is_parm+'",lb_privKey(2048)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(DSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(2048)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(DSA!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(2048)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(DSA!, "'+is_parm+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(Rabin!512)"
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(Rabin!,"'+is_parm+'",lb_privKey(512)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(Rabin!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(512)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(Rabin!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(512)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(Rabin!, "'+is_parm+'",lb_privKey(512)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(Rabin!1024)"
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(Rabin!,"'+is_parm+'",lb_privKey(1024)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(Rabin!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(1024)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(Rabin!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(1024)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(Rabin!, "'+is_parm+'",lb_privKey(1024)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricVerifySign(Rabin!2048)"
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
							lb_Data = Blob(is_parm, EncodingUTF8!)
							lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)
							If Len(lb_sign) > 0 Then
								wf_output('AsymmetricSign(Rabin!,"'+is_parm+'",lb_privKey(2048)) = ' + lco_code.Base64Encode( lb_sign ) , False)
								li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)
								If li_return = 1 Then
									wf_output('AsymmetricVerifySign(Rabin!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(2048)) = ' +   String ( li_return ) + " Success" , False)
								Else
									wf_output('AsymmetricVerifySign(Rabin!, "'+lco_code.Base64Encode( lb_sign )+'",lb_pubKey(2048)) Failed Return:' + String ( li_return ), False)
								End If
							Else
								wf_output('AsymmetricSign(Rabin!, "'+is_parm+'",lb_privKey(2048)) Failed Return:' + String ( lb_return ), False)
							End If
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
				End Choose
			Catch ( throwable ex0b)
				wf_output(ex0b.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
							"Case ~"AsymmetricVerifySign(RSA!512)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!,~"~'+is_parm+~'~",lb_privKey(512)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(RSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(512)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(RSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(512)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!, ~"~'+is_parm+~'~",lb_privKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(RSA!1024)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!,~"~'+is_parm+~'~",lb_privKey(1024)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(RSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(1024)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(RSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(1024)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!, ~"~'+is_parm+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(RSA!2048)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(RSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!,~"~'+is_parm+~'~",lb_privKey(2048)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(RSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(RSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(2048)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(RSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(2048)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(RSA!, ~"~'+is_parm+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(RSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(DSA!1024)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!,~"~'+is_parm+~'~",lb_privKey(1024)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(DSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(1024)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(DSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(1024)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!, ~"~'+is_parm+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(DSA!2048)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(DSA!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!,~"~'+is_parm+~'~",lb_privKey(2048)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(DSA!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(DSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(2048)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(DSA!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(2048)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(DSA!, ~"~'+is_parm+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(DSA!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(Rabin!512)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!,~"~'+is_parm+~'~",lb_privKey(512)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(Rabin!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(512)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(Rabin!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(512)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!, ~"~'+is_parm+~'~",lb_privKey(512)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 512, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(Rabin!1024)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!,~"~'+is_parm+~'~",lb_privKey(1024)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(Rabin!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(1024)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(Rabin!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(1024)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!, ~"~'+is_parm+~'~",lb_privKey(1024)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 1024, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"Case ~"AsymmetricVerifySign(Rabin!2048)~"~r~n" +&
							"	li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey)~r~n" +&
							"	If li_return = 1 Then~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
							"		wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
							"		wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
							"		lb_Data = Blob(is_parm, EncodingUTF8!)~r~n" +&
							"		lb_sign = lco_Crypt.AsymmetricSign(Rabin!, lb_data,lb_privKey)~r~n" +&
							"		If Len(lb_sign) > 0 Then~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!,~"~'+is_parm+~'~",lb_privKey(2048)) = ~' + lco_code.Base64Encode( lb_sign ) , False)~r~n" +&
							"			li_return = lco_Crypt.AsymmetricVerifySign(Rabin!, lb_data,lb_pubKey,lb_sign)~r~n" +&
							"			If li_return = 1 Then~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(Rabin!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(2048)) = ~' +   String ( li_return ) + ~" Success~" , False)~r~n" +&
							"			Else~r~n" +&
							"				wf_output(~'AsymmetricVerifySign(Rabin!, ~"~'+lco_code.Base64Encode( lb_sign )+~'~",lb_pubKey(2048)) Failed Return:~' + String ( li_return ), False)~r~n" +&
							"			End If~r~n" +&
							"		Else~r~n" +&
							"			wf_output(~'AsymmetricSign(Rabin!, ~"~'+is_parm+~'~",lb_privKey(2048)) Failed Return:~' + String ( lb_return ), False)~r~n" +&
							"		End If~r~n" +&
							"	Else~r~n" +&
							"		wf_output(~'AsymmetricGenerateKey(Rabin!, 2048, lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
							"	End If~r~n" +&
							"End Choose~r~n")
		End If
	Case 'P013_AsymmetricGenerateKey' 
		//生成密钥对
		If ab_execute = True Then
			If Not IsNumber ( is_parm ) Then
				MessageBox ( "Tip", "The parameter is not a number, please check!" )
				Return
			End If
			Try
				ll_Len = Long (is_parm)
				Choose Case is_type
					Case "AsymmetricGenerateKey(RSA!)"
						//生成RSA密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, ll_len, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(RSA!, '+String(ll_len)+', lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
						Else
							wf_output('AsymmetricGenerateKey(RSA!, '+String(ll_len)+', lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricGenerateKey(DSA!)"
						//生成DSA密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, ll_len, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(DSA!, '+String(ll_len)+', lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
						Else
							wf_output('AsymmetricGenerateKey(DSA!, '+String(ll_len)+', lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
					Case "AsymmetricGenerateKey(Rabin!)"
						//生成Rabin密钥对,并输出显示公钥和私钥Base64编码
						li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, ll_len, lb_privKey,lb_pubKey)
						If li_return = 1 Then
							wf_output('AsymmetricGenerateKey(Rabin!, '+String(ll_len)+', lb_privKey,lb_pubKey) = 1 Success' , False)
							wf_output('privKey:' + lco_code.Base64Encode( lb_privKey) , False)
							wf_output('pubKey:' + lco_code.Base64Encode( lb_pubKey) , False)
						Else
							wf_output('AsymmetricGenerateKey(Rabin!, '+String(ll_len)+', lb_privKey,lb_pubKey) <> 1 Failed Return:' + String ( li_return ), False)
						End If
				End Choose
			Catch ( throwable ex1)
				wf_output(ex1.getmessage(), False)
			End Try
		Else
			wf_scriptview("If Not IsNumber ( is_parm ) Then~r~n" +&
						"MessageBox ( ~"Tip~", ~"The parameter is not a number, please check!~" )~r~n" +&
						"Return~r~n" +&
						"End If~r~n" +&
						"Try~r~n" +&
						"ll_Len = Long (is_parm)~r~n" +&
						"Choose Case is_type~r~n" +&
						"	Case ~"AsymmetricGenerateKey(RSA!)~"~r~n" +&
						"		//生成RSA密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
						"		li_return = lco_Crypt.AsymmetricGenerateKey(RSA!, ll_len, lb_privKey,lb_pubKey)~r~n" +&
						"		If li_return = 1 Then~r~n" +&
						"			wf_output(~'AsymmetricGenerateKey(RSA!, ~'+String(ll_len)+~', lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
						"			wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
						"			wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
						"		Else~r~n" +&
						"			wf_output(~'AsymmetricGenerateKey(RSA!, ~'+String(ll_len)+~', lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
						"		End If~r~n" +&
						"	Case ~"AsymmetricGenerateKey(DSA!)~"~r~n" +&
						"		//生成DSA密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
						"		li_return = lco_Crypt.AsymmetricGenerateKey(DSA!, ll_len, lb_privKey,lb_pubKey)~r~n" +&
						"		If li_return = 1 Then~r~n" +&
						"			wf_output(~'AsymmetricGenerateKey(DSA!, ~'+String(ll_len)+~', lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
						"			wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
						"			wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
						"		Else~r~n" +&
						"			wf_output(~'AsymmetricGenerateKey(DSA!, ~'+String(ll_len)+~', lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
						"		End If~r~n" +&
						"	Case ~"AsymmetricGenerateKey(Rabin!)~"~r~n" +&
						"		//生成Rabin密钥对,并输出显示公钥和私钥Base64编码~r~n" +&
						"		li_return = lco_Crypt.AsymmetricGenerateKey(Rabin!, ll_len, lb_privKey,lb_pubKey)~r~n" +&
						"		If li_return = 1 Then~r~n" +&
						"			wf_output(~'AsymmetricGenerateKey(Rabin!, ~'+String(ll_len)+~', lb_privKey,lb_pubKey) = 1 Success~' , False)~r~n" +&
						"			wf_output(~'privKey:~' + lco_code.Base64Encode( lb_privKey) , False)~r~n" +&
						"			wf_output(~'pubKey:~' + lco_code.Base64Encode( lb_pubKey) , False)~r~n" +&
						"		Else~r~n" +&
						"			wf_output(~'AsymmetricGenerateKey(Rabin!, ~'+String(ll_len)+~', lb_privKey,lb_pubKey) <> 1 Failed Return:~' + String ( li_return ), False)~r~n" +&
						"		End If~r~n" +&
						"End Choose~r~n" +&
						"Catch ( throwable ex1)~r~n" +&
						"wf_output(ex1.getmessage(), False)~r~n" +&
						"End Try~r~n")
		End If
	Case 'P014_MD5' 
		//MD5 摘要哈希值
		If ab_execute = True Then
			Try
				Choose Case is_type
					Case "MD5(EncodingANSI!)"
						lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingANSI!))
						wf_output('MD5(Blob("'+is_Parm+'"), EncodingANSI!) = ' + lco_code.HexEncode( lb_return), False)
					Case "MD5(EncodingUTF8!)"
						lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingUTF8!))
						wf_output('MD5(Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "MD5(EncodingUTF16LE!)"
						lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingUTF16LE!))
						wf_output('MD5(Blob("'+is_Parm+'"), EncodingUTF16LE!) = ' + lco_code.HexEncode( lb_return), False)
					Case "MD5(EncodingUTF16BE!)"
						lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingUTF16BE!))
						wf_output('MD5(Blob("'+is_Parm+'"), EncodingUTF16BE!) = ' + lco_code.HexEncode( lb_return), False)
				End Choose
			Catch ( throwable ex2)
				wf_output(ex2.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
						"Case ~"MD5(EncodingANSI!)~"~r~n" +&
						"	lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingANSI!))~r~n" +&
						"	wf_output(~'MD5(Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"MD5(EncodingUTF8!)~"~r~n" +&
						"	lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'MD5(Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"MD5(EncodingUTF16LE!)~"~r~n" +&
						"	lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingUTF16LE!))~r~n" +&
						"	wf_output(~'MD5(Blob(~"~'+is_Parm+~'~"), EncodingUTF16LE!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"MD5(EncodingUTF16BE!)~"~r~n" +&
						"	lb_return = lco_Crypt.MD5(Blob(is_Parm, EncodingUTF16BE!))~r~n" +&
						"	wf_output(~'MD5(Blob(~"~'+is_Parm+~'~"), EncodingUTF16BE!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"End Choose~r~n")
		End If
	Case 'P015_SHA' 
		//SHA1,SHA2,SHA3 摘要哈希值
		If ab_execute = True Then
			Try
				Choose Case is_type
					Case "SHA(SHA1!)"
						lb_return = lco_Crypt.SHA(SHA1!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA1!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA224!)"
						lb_return = lco_Crypt.SHA(SHA224!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA224!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA256!)"
						lb_return = lco_Crypt.SHA(SHA256!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA256!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA384!)"
						lb_return = lco_Crypt.SHA(SHA384!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA384!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA512!)"
						lb_return = lco_Crypt.SHA(SHA512!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA512!,Blob("'+is_Parm+'"), EncodingANSI!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA3_224!)"
						lb_return = lco_Crypt.SHA(SHA3_224!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA3_224!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA3_256!)"
						lb_return = lco_Crypt.SHA(SHA3_256!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA3_256!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA3_384!)"
						lb_return = lco_Crypt.SHA(SHA3_384!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA3_384!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "SHA(SHA3_512!)"
						lb_return = lco_Crypt.SHA(SHA3_512!,Blob(is_Parm, EncodingUTF8!))
						wf_output('SHA(SHA3_512!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
				End Choose
			Catch ( throwable ex4)
				wf_output(ex4.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
						"Case ~"SHA(SHA1!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA1!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA1!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA224!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA224!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA224!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA256!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA256!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA256!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA384!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA384!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA384!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA512!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA512!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA512!,Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA3_224!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA3_224!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA3_224!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA3_256!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA3_256!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA3_256!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA3_384!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA3_384!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA3_384!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"Case ~"SHA(SHA3_512!)~"~r~n" +&
						"	lb_return = lco_Crypt.SHA(SHA3_512!,Blob(is_Parm, EncodingUTF8!))~r~n" +&
						"	wf_output(~'SHA(SHA3_512!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
						"End Choose~r~n")
		End If
	Case 'P016_HMAC' 
		//HMAC 摘要哈希值
		If ab_execute = True Then
			Try
				Choose Case is_type
					Case "HMAC(HMACMD5!key(''))","HMAC(HMACSHA1!key(''))","HMAC(HMACSHA224!key(''))","HMAC(HMACSHA256!key(''))","HMAC(HMACSHA384!key(''))"
						lb_Key = Blob( "", EncodingUTF8! )
					Case "HMAC(HMACSHA512!key('key'))","HMAC(HMACMD5!key('key'))","HMAC(HMACSHA1!key('key'))","HMAC(HMACSHA224!key('key'))","HMAC(HMACSHA256!key('key'))","HMAC(HMACSHA384!key('key'))","HMAC(HMACSHA512!key('key'))"
						lb_Key = Blob( "key", EncodingUTF8! )
				End Choose
				Choose Case is_type
						Case "HMAC(HMACMD5!key(''))"
						lb_return = lco_Crypt.HMAC(HMACMD5!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACMD5!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA1!key(''))"
						lb_return = lco_Crypt.HMAC(HMACSHA1!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA1!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA224!key(''))"
						lb_return = lco_Crypt.HMAC(HMACSHA224!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA224!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA256!key(''))"
						lb_return = lco_Crypt.HMAC(HMACSHA256!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA256!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA384!key(''))"
						lb_return = lco_Crypt.HMAC(HMACSHA384!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA384!,Blob("'+is_Parm+'"), EncodingANSI!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA512!key(''))"
						lb_return = lco_Crypt.HMAC(HMACSHA512!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA512!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACMD5!key('key'))"
						lb_return = lco_Crypt.HMAC(HMACMD5!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACMD5!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA1!key('key'))"
						lb_return = lco_Crypt.HMAC(HMACSHA1!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA1!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA224!key('key'))"
						lb_return = lco_Crypt.HMAC(HMACSHA224!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA224!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA256!key('key'))"
						lb_return = lco_Crypt.HMAC(HMACSHA256!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA256!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA384!key('key'))"
						lb_return = lco_Crypt.HMAC(HMACSHA384!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA384!,Blob("'+is_Parm+'"), EncodingANSI!) = ' + lco_code.HexEncode( lb_return), False)
					Case "HMAC(HMACSHA512!key('key'))"
						lb_return = lco_Crypt.HMAC(HMACSHA512!,Blob(is_Parm, EncodingUTF8!),lb_Key)
						wf_output('HMAC(HMACSHA512!,Blob("'+is_Parm+'"), EncodingUTF8!) = ' + lco_code.HexEncode( lb_return), False)
				End Choose
			Catch ( throwable ex5)
				wf_output(ex5.getmessage(), False)
			End Try
		Else
			wf_scriptview("Choose Case is_type~r~n" +&
							"Case ~"HMAC(HMACMD5!key(~'~'))~",~"HMAC(HMACSHA1!key(~'~'))~",~"HMAC(HMACSHA224!key(~'~'))~",~"HMAC(HMACSHA256!key(~'~'))~",~"HMAC(HMACSHA384!key(~'~'))~"~r~n" +&
							"	lb_Key = Blob( ~"~", EncodingUTF8! )~r~n" +&
							"Case ~"HMAC(HMACSHA512!key(~'key~'))~",~"HMAC(HMACMD5!key(~'key~'))~",~"HMAC(HMACSHA1!key(~'key~'))~",~"HMAC(HMACSHA224!key(~'key~'))~",~"HMAC(HMACSHA256!key(~'key~'))~",~"HMAC(HMACSHA384!key(~'key~'))~",~"HMAC(HMACSHA512!key(~'key~'))~"~r~n" +&
							"	lb_Key = Blob( ~"key~", EncodingUTF8! )~r~n" +&
							"End Choose~r~n" +&
							"Choose Case is_type~r~n" +&
							"	Case ~"HMAC(HMACMD5!key(~'~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACMD5!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACMD5!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA1!key(~'~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA1!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA1!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA224!key(~'~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA224!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA224!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA256!key(~'~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA256!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA256!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA384!key(~'~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA384!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA384!,Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA512!key(~'~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA512!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA512!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACMD5!key(~'key~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACMD5!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACMD5!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA1!key(~'key~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA1!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA1!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA224!key(~'key~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA224!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA224!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA256!key(~'key~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA256!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA256!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA384!key(~'key~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA384!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA384!,Blob(~"~'+is_Parm+~'~"), EncodingANSI!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"Case ~"HMAC(HMACSHA512!key(~'key~'))~"~r~n" +&
							"	lb_return = lco_Crypt.HMAC(HMACSHA512!,Blob(is_Parm, EncodingUTF8!),lb_Key)~r~n" +&
							"	wf_output(~'HMAC(HMACSHA512!,Blob(~"~'+is_Parm+~'~"), EncodingUTF8!) = ~' + lco_code.HexEncode( lb_return), False)~r~n" +&
							"End Choose~r~n")
		End If
	Case Else	
	 	messagebox("Info","测试点"+ls_item+"没有维护代码")
End Choose

//记录日志的结束点
if ab_execute then
	wf_output("End "+ls_item,false)
end if

If IsValid ( lco_Code ) Then DesTroy ( lco_Code )
If IsValid ( lco_Crypt ) Then DesTroy ( lco_Crypt )

end subroutine

public subroutine wf_parm_setvalue ();//====================================================================
// Function: wf_parm_setvalue
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//根据当前的参数类型，设置参数数值
string ls_parm, ls_parm2

//获取参数
ls_parm = ddlb_parm.text
ls_parm2 = mle_parm.text
//设置参数值
choose case ls_parm
	case ""
		is_type = ls_parm
		is_Parm = ls_parm2
	Case else
		is_type = ls_parm
		is_Parm = ls_parm2
end choose
end subroutine

public function string wf_help ();//====================================================================
// Function: wf_help
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	pang		Date: 2018-04-13
//--------------------------------------------------------------------
//	Copyright (c) 2008-2011 appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//简化处理help
string ls_help=''

ls_help = mle_des.text

return ls_help
end function

on w_encode_manu.create
call super::create
end on

on w_encode_manu.destroy
call super::destroy
end on

type lb_parm from w_base_manu`lb_parm within w_encode_manu
boolean sorted = false
end type

type mle_scriptview from w_base_manu`mle_scriptview within w_encode_manu
end type

type mle_detail from w_base_manu`mle_detail within w_encode_manu
end type

type cb_close from w_base_manu`cb_close within w_encode_manu
end type

type cb_help from w_base_manu`cb_help within w_encode_manu
end type

type mle_des from w_base_manu`mle_des within w_encode_manu
end type

type cb_execute from w_base_manu`cb_execute within w_encode_manu
end type

type cb_clear from w_base_manu`cb_clear within w_encode_manu
end type

type cb_set from w_base_manu`cb_set within w_encode_manu
end type

type mle_parm from w_base_manu`mle_parm within w_encode_manu
end type

type ddlb_parm from w_base_manu`ddlb_parm within w_encode_manu
boolean sorted = false
boolean vscrollbar = true
end type

type cb_export from w_base_manu`cb_export within w_encode_manu
end type

type mle_output from w_base_manu`mle_output within w_encode_manu
end type

type lb_testcase from w_base_manu`lb_testcase within w_encode_manu
end type

type gb_testcase from w_base_manu`gb_testcase within w_encode_manu
end type

type gb_output from w_base_manu`gb_output within w_encode_manu
end type

type gb_parm from w_base_manu`gb_parm within w_encode_manu
end type

type gb_des from w_base_manu`gb_des within w_encode_manu
end type

type gb_detail from w_base_manu`gb_detail within w_encode_manu
end type

type gb_scriptview from w_base_manu`gb_scriptview within w_encode_manu
end type

