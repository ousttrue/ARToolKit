------------------------------------------------------------
-- project
------------------------------------------------------------
project "tinyxml"
--kind "WindowedApp"
--kind "ConsoleApp"
--kind "SharedLib"
kind "StaticLib"
language "C++"

files { 
    "tinystr.h",
    "tinyxml.h",
    "tinystr.cpp",
    "tinyxml.cpp",
    "tinyxmlerror.cpp",
    "tinyxmlparser.cpp",
}

defines {
    "TIXML_USE_STL",
}

