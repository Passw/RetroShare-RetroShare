@echo off

setlocal

:: Initialize environment
call "%~dp0env.bat"
if errorlevel 1 goto error_env
call "%EnvPath%\env.bat"
if errorlevel 1 goto error_env

%cecho% info "Build %SourceName%"
:: call "%~dp0build\build.bat" 64 release autologin "CONFIG+=rs_use_native_dialogs"
:: call "%~dp0build\build.bat" mingw64 qt6 release "CONFIG+=rs_use_native_dialogs" "CONFIG+=no_rs_sam3" "CONFIG+=no_rs_sam3_libsam3"
:: call "%~dp0build\build.bat" ucrt64 qt6 release "CONFIG+=rs_use_native_dialogs" "CONFIG+=no_rs_sam3" "CONFIG+=no_rs_sam3_libsam3"
call "%~dp0build\build.bat" ucrt64 qt6 release "CONFIG+=rs_use_native_dialogs"
if errorlevel 1 %cecho% error "Failed to build %SourceName%." & exit /B %ERRORLEVEL%

%cecho% info "Pack %SourceName%"
:: call "%~dp0build\pack.bat" 64 release autologin "CONFIG+=rs_use_native_dialogs"
:: call "%~dp0build\pack.bat" mingw64 qt6 release "CONFIG+=rs_use_native_dialogs" "CONFIG+=no_rs_sam3" "CONFIG+=no_rs_sam3_libsam3"
:: call "%~dp0build\pack.bat" ucrt64 qt6 release "CONFIG+=rs_use_native_dialogs" "CONFIG+=no_rs_sam3" "CONFIG+=no_rs_sam3_libsam3"
call "%~dp0build\pack.bat" ucrt64 qt6 release "CONFIG+=rs_use_native_dialogs"
if errorlevel 1 %cecho% error "Failed to pack %SourceName%." & exit /B %ERRORLEVEL%

exit /B 0

:error_env
echo Failed to initialize environment.
exit /B 1
