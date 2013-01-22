------------------------------------------------------------------------------
-- Project
------------------------------------------------------------------------------
project "mkpatt"
language "C"
--language "C++"
--kind "StaticLib"
--kind "DynamicLib"
kind "ConsoleApp"
--kind "WindowedApp"

flags {
}
files {
    "mk_patt.c",
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
    "AR",
}

