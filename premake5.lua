---@diagnostic disable: undefined-global

project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "On"

	targetdir ("bin/" .. Outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. Outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_joystick.c",
		"src/null_window.c",
		"src/null_platform.h",
		"src/mappings.h",
		"src/mappings.h.in"
	}

	includedirs
	{
		"%{IncludeDirs.Vulkan}"
	}

	libdirs
	{
		"%{LibDirs.Vulkan}"
	}

	filter "system:windows"
		buildoptions { "/std:c11" }
		links { "gdi32.lib" }
		systemversion "latest"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/platform.c",
			"src/posix_module.c",
			"src/win32_module.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS",
			"_GLFW_VULKAN"
		}

		filter { "system:windows", "configurations:Release" }
		 buildoptions "/MT"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "On"

		filter "configurations:Release"
			runtime "Release"
			optimize "On"





