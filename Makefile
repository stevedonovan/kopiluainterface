KOPILUA = KopiLua/src/ldebug.cs\
KopiLua/src/luaconf.cs\
KopiLua/src/ldo.cs\
KopiLua/src/lfunc.cs\
KopiLua/src/llex.cs\
KopiLua/src/print.cs\
KopiLua/src/lcode.cs\
KopiLua/src/lundump.cs\
KopiLua/src/lmathlib.cs\
KopiLua/src/ltablib.cs\
KopiLua/src/lstrlib.cs\
KopiLua/src/lzio.cs\
KopiLua/src/loadlib.cs\
KopiLua/src/lstate.cs\
KopiLua/src/lmem.cs\
KopiLua/src/lobject.cs\
KopiLua/src/lbaselib.cs\
KopiLua/src/lapi.cs\
KopiLua/src/llimits.cs\
KopiLua/src/lauxlib.cs\
KopiLua/src/lstring.cs\
KopiLua/src/ltm.cs\
KopiLua/src/lualib.cs\
KopiLua/src/lopcodes.cs\
KopiLua/src/liolib.cs\
KopiLua/src/linit.cs\
KopiLua/src/lua.cs\
KopiLua/src/ldump.cs\
KopiLua/src/lgc.cs\
KopiLua/src/printf/Tools.cs\
KopiLua/src/ltable.cs\
KopiLua/src/loslib.cs\
KopiLua/src/lvm.cs\
KopiLua/src/ldblib.cs\
KopiLua/src/lparser.cs

KLD=KopiLuaDll/LuaDLL.cs

KLI=KopiLuaInterface/src/MethodWrapper.cs\
KopiLuaInterface/src/ObjectTranslator.cs\
KopiLuaInterface/src/GenerateEventAssembly.cs\
KopiLuaInterface/src/Metatables.cs\
KopiLuaInterface/src/Lua.cs\
KopiLuaInterface/src/LuaException.cs\
KopiLuaInterface/src/ProxyType.cs\
KopiLuaInterface/src/CheckType.cs\
KopiLuaInterface/src/AssemblyInfo.cs \
KopiLuaInterface/src/LuaBase.cs \
KopiLuaInterface/src/LuaFunction.cs \
KopiLuaInterface/src/LuaGlobalAttribute.cs \
KopiLuaInterface/src/LuaHideAttribute.cs \
KopiLuaInterface/src/LuaRegistrationHelper.cs \
KopiLuaInterface/src/LuaScriptException.cs \
KopiLuaInterface/src/LuaTable.cs \
KopiLuaInterface/src/LuaUserData.cs

SRC=$(KOPILUA) $(KLD) $(KLI)

RUNNER=LuaRunner/LuaNetRunner.cs
EXE=kluai.exe

DEFINES=-d:TRACE -d:DEBUG -d:LUA_CORE -d:_WIN32 \
-d:LUA_COMPAT_VARARG -d:LUA_COMPAT_MOD -d:LUA_COMPAT_GFIND \
-d:CATCH_EXCEPTIONS

all: LuaInterface.dll $(EXE)

LuaInterface.dll: $(SRC)
	gmcs -debug -t:library -out:LuaInterface.dll $(DEFINES) $(SRC)

kluai.exe:	$(RUNNER)
	gmcs -debug -r:LuaInterface.dll -out:kluai.exe $(RUNNER)

