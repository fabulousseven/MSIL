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
//	EXE Main Module
//	Contains entry point for assembly and references to other assembly modules
//
////////////////////////////////////////////////////////////////////////////////////////////
//
// We reference the main COR libraries and we name this three file assembly
//
//
.assembly modMain						
{
    .ver 1:0:0:0
}
 
.assembly extern System.Windows.Forms
{
    .publickeytoken = (B7 7A 5C 56 19 34 E0 89)
    .ver 1:0:3300:0
}

.assembly extern System
{
    .publickeytoken = (B7 7A 5C 56 19 34 E0 89)
    .ver 1:0:3300:0
}

.assembly extern mscorlib
{
    .publickeytoken = (B7 7A 5C 56 19 34 E0 89)
    .ver 1:0:3300:0
}

////////////////////////////////////////////////////////////////////////////////////////////
//
// The logical names of the modules that constite parts of this assembly
//
.module modMain.exe					// 
.module extern modResources.netmod	// Contains XML files, string tables and other resources
.module extern modUtilities.netmod	// Contains library utility code

//////////////////////////////////////////////////////////////////////////////////////////////
//
// The physical files to reference and include linkage to that constitues this assembly 
//
.file modResources.dll
.file modUtilities.dll

.subsystem 3

.namespace MainNamespace
{
	.class public MyEXE
	{
		.method public static void Main () cil managed
		{
			.entrypoint
			.locals init
			( 
				[0] int32	iNumber,
				[1] class 	MainNamespace.InternalConstants constValues,
				[2] string	strLine,
				[3] string  strExitString
			)
			.maxstack 20
						ldstr "exit"
						stloc.3
						call void [.module modUtilities.netmod]MainNamespace.UtilFunctions::GetNumber()
			THESTART:	ldstr "Enter a message to transmit (or type exit to end)"
						call void [mscorlib]System.Console::WriteLine(string)
						call string [mscorlib]System.Console::ReadLine()
						stloc.2
						ldloc.2
						newobj instance void [mscorlib]System.Text.StringBuilder::.ctor(string)
						call   instance class [mscorlib]System.String [mscorlib]System.Text.StringBuilder::ToString()
						ldloc.3
						call instance int32 [mscorlib]System.String::CompareTo(string)
						ldc.i4.0
						bne.un THESTART
			THEEND:		ret
		}

	}

	.class private HelloWorldMessage
	{
		.method public rtspecialname specialname instance void .ctor() cil managed
		{
			ldarg.0
			call instance void [mscorlib]System.Object::.ctor()
		}

		.method public instance void ShowMessage(string msg) cil managed
		{
			.locals ( [0] string Message )
			.maxstack 10
			//ldstr "in ShowMessage ..."
			//stloc.0
			//ldarg.0
			//ldarg.1
			//call void [mscorlib]System.Console::WriteLine(string)
			//pop
			ret
		}
	}

	.class auto sealed InternalConstants extends [mscorlib]System.Object
	{
		.field public int32 m_x

		.method public rtspecialname specialname instance void .ctor () cil managed
		{
			.maxstack 8
			ldarg.0
			call instance void [mscorlib]System.Object::.ctor()
			ldarg.0
			ldc.i4.s 21
			stfld int32 MainNamespace.InternalConstants::m_x
			ret
		}
		
		.method private rtspecialname specialname static void .cctor () cil managed
		{
			.maxstack 1
			ret
		}

		.method public instance int32 FetchConstant(string strConstantName) cil managed
		{
			.locals init ([0] int32 v1 )
			.maxstack 2
			ldstr "1234567890"
			pop
			ldc.i4.s 101
			ret
		}

	}

	.class public LocalUtilFunctions
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

	.data IntDataBlob = bytearray( 01 00 00 00 )
}
