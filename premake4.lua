DDK_DIR="C:/WinDDK/7600.16385.1"

------------------------------------------------------------------------------
-- solution
------------------------------------------------------------------------------
solution "ARToolKit"
configurations { "Release", "Debug" }
configuration "vs*"
do
	defines {
		"_CRT_SECURE_NO_WARNINGS",
		"_CRT_SECURE_NO_DEPRECATE",
	}
    buildoptions {
        "/wd4995",
        "/wd4996",
        "/wd4819",
    }
end

configuration "windows"
do
	defines {
		'WIN32',
		'_WIN32',
		'_WINDOWS',
	}
end

configuration "Debug"
do
	defines { "DEBUG" }
	flags { "Symbols", }
	targetdir "debug"
end

configuration "Release"
do
	defines { "NDEBUG" }
	flags { "Optimize", }
	targetdir "release"
end

configuration {}

dofile "examples/simpleLite/premake4.lua"
include "ar"

include "dsvlsample"
include "dsvl"
include "streams"
include "tinyxml"

