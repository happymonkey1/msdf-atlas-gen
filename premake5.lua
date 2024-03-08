include "msdfgen"

project "msdf-atlas-gen"
kind "StaticLib"
language "C++"
cppdialect "C++20"
staticruntime "off"

targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files
{
    "msdf-atlas-gen/**.h",
    "msdf-atlas-gen/**.hpp",
    "msdf-atlas-gen/**.cpp",
    "msdfgen/msdfgen-config.h"
}

includedirs
{
    "msdf-atlas-gen",
    "msdfgen",
    "msdfgen/include",
    "artery-font-format",
}

defines
{
    "_CRT_SECURE_NO_WARNINGS",
    "MSDF_ATLAS_PUBLIC=__declspec(dllexport)",
    "MSDFGEN_PUBLIC=__declspec(dllexport)"
}

links
{
    "msdfgen"
}

filter "system:windows"
systemversion "latest"

filter "configurations:Debug"
runtime "Debug"
symbols "on"

filter "configurations:Release"
runtime "Release"
optimize "on"

filter "configurations:Dist"
runtime "Release"
optimize "on"
symbols "off"
