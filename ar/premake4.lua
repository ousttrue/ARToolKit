------------------------------------------------------------------------------
-- Project
------------------------------------------------------------------------------
project "AR"
--language "C"
language "C++"
kind "StaticLib"
--kind "SharedLib"
--kind "ConsoleApp"
--kind "WindowedApp"

flags {
}
files {
    "src/AR/*.c",
    "src/AR/*.h",
    "src/Gl/gsub.c",
    "src/Gl/gsub_lite.c",
    "src/Gl/gsubutil.c",
    "src/VideoWin32DirectShow/videoWin32DirectShow.cpp",
}
defines {
    "_WIN32_WINNT=0x0500",
    --"LIBARVIDEO_EXPORTS",
}
includedirs {
    "include",
    "../dsvl",
    "../streams",
}
buildoptions {
}
libdirs {
}
links {
}
prebuildcommands {
}

