------------------------------------------------------------
-- project
------------------------------------------------------------
project "DSVL"
--kind "WindowedApp"
--kind "ConsoleApp"
--kind "SharedLib"
kind "StaticLib"
language "C++"

files { 
    "DSVL.cpp",
    "DSVL.h",
    "DSVL_GraphManager.cpp",
    "DSVL_GraphManager.h",
    "DSVL_Helpers.cpp",
    "DSVL_Helpers.h",
    "DSVL_PixelFormat.cpp",
    "DSVL_PixelFormat.h",
    "DSVL_PixelFormatTypes.h",
}

includedirs {
    "../streams",
    "../tinyxml",
    DDK_DIR.."/inc/atl71",
}

defines {
    --"DSVL_EXPORTS",
    "TIXML_USE_STL",
}

buildoptions {
}

libdirs {
    DDK_DIR.."/lib/ATL/i386",
}

