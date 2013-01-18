------------------------------------------------------------
-- project
------------------------------------------------------------
project "glutSample"
--kind "WindowedApp"
kind "ConsoleApp"
--kind "SharedLib"
--kind "StaticLib"
language "C++"

files { 
    "glutSample.cpp",
}

includedirs {
    "../dsvl",
    "../glut",
}

libdirs {
    "../glut",
}

links {
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

