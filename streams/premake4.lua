------------------------------------------------------------------------------
-- Project
------------------------------------------------------------------------------
project "strmbase"
--language "C"
language "C++"
kind "StaticLib"
--kind "DynamicLib"
--kind "ConsoleApp"
--kind "WindowedApp"

flags {
}
files {
    "*.cpp", "*.h",
}
defines {
    "_LIB",
    "_WIN32_DCOM",
    "_MBCS",
}
includedirs {
    ".",
}
buildoptions {
}
libdirs {
}
links {
}
prebuildcommands {
}

