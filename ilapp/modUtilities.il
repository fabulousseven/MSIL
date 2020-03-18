/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//		Copyright © Microsoft Corp. 1988-2000 
//
// Project      :  SDC Research
//                
// Description  : 
//                              
// File Name    : $Workfile: $
//                
// Author       : $Author: $
//                   
// Revision     : $Revision: $
//                   
// Archive      : $Archive: $
//                   
// LastMod      : $Modtime: $ 
//                   
// LastCheckin  : $Date: $
//                   
// Log          : $History: $
//
//
// We are a module that is part of the FirstILProgram assembly
//
.subsystem 3
.module modUtilities.netmod 

.assembly extern Microsoft
{

}

////////////////////////////////////////////////////////////////////////////////////////////////

.data GlobalExportTable = int32[10]
.vtfixup [1] int32 fromunmanaged at GlobalExportTable

.method public static int32 __exportedFunction_1()
{
	.vtentry 1:1
	.export [1] as CILPrintFile
	.locals init ( [0] int32 var1 )
	.maxstack 8
	ldc.i4 36
	ret
}
 
.namespace MainNamespace
{
	.class public UtilFunctions
	{
		.method public rtspecialname specialname static void .cctor() cil managed
		{
			ret
		}

		.method public static int32 BroadCastMessage(string) cil managed
		{
			ldstr "1234ABCD4232DE42354"
			pop
			ldc.i4.s 34
			ret
		}

		.method public static void GetNumber() cil managed
		{
			.locals init ( [0] int32 numberReturned )
			.maxstack 1
			ldc.i4.s 2
			stloc numberReturned
			ret
		}
	}

}











