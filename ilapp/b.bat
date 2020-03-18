ECHO OFF

DEL .\Debug\modResources.dll
DEL .\Debug\modUtilities.dll
DEL .\Debug\ILApp.exe		
 
SET TARGET="C:\Program Files\Microsoft Platform SDK\Bin\rc.exe"
%TARGET% /r .\Resources\EmbeddedResources.rc

SET TARGET="C:\WINNT\Microsoft.NET\Framework\v1.0.3705\ilasm.exe"
SET ARGS= 

%TARGET% %ARGS% /NOLOGO /DEBUG /DLL modResources.il	/OUTPUT=.\Debug\modResources.dll	| WinTee
%TARGET% %ARGS% /NOLOGO /DEBUG /DLL modUtilities.il	/OUTPUT=.\Debug\modUtilities.dll	| WinTee
%TARGET% %ARGS% /NOLOGO /DEBUG /EXE modMain.il 		/OUTPUT=.\Debug\ILApp.exe			| WinTee


REM %TARGET% /LISTING /NOLOGO /DEBUG /DLL modResources.il	/OUTPUT=.\Debug\modResources.dll	| WinTee
REM %TARGET% /LISTING /NOLOGO /DEBUG /DLL modUtilities.il	/OUTPUT=.\Debug\modUtilities.dll	| WinTee
REM %TARGET% /LISTING /NOLOGO /DEBUG /EXE modMain.il 		/OUTPUT=.\Debug\ILApp.exe			| WinTee