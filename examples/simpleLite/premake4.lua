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
}
buildoptions {
}
libdirs {
}
links {
    "AR",
    "DSVL",
    "tinyxml",
    "strmbase",

    "strmiids",
    "winmm",
    "Quartz",
}

configuration "Debug"
do
    links {
        "comsuppwd",
    }
end

configuration "Release"
do
    links {
        "comsuppw",
    }
end

