------------------------------------------------------------------------------
-- Project
------------------------------------------------------------------------------
project "simpleLite"
language "C"
--language "C++"
--kind "StaticLib"
--kind "DynamicLib"
kind "ConsoleApp"
--kind "WindowedApp"

flags {
}
files {
    "simpleLite.c",
}
defines {
}
includedirs {
    "../../AR/include",
    "../../glut",
}
buildoptions {
}
libdirs {
    "../../glut",
    DDK_DIR.."/lib/ATL/i386",
}
links {
    "ARToolKit",
}

