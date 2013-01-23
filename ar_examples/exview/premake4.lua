------------------------------------------------------------------------------
-- Project
------------------------------------------------------------------------------
project "exview"
language "C"
--language "C++"
--kind "StaticLib"
--kind "DynamicLib"
kind "ConsoleApp"
--kind "WindowedApp"

flags {
}
files {
    "draw_object.c",
    "draw_object.h",
    "exview.c",
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

