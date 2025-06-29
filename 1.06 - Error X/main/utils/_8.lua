local a = {}
function a:GetExploit()
	local exploit =
      (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
      (secure_load and "Sentinel") or
      (is_sirhurt_closure and "Sirhurt") or
      (pebc_execute and "ProtoSmasher") or
      (OXYGEN_LOADED and "Oxygen U") or
      (KRNL_LOADED and "Krnl") or
      (WrapGlobal and "WeAreDevs") or
      (isvm and "Proxo") or
      (shadow_env and "Shadow") or
      (jit and "EasyExploits") or
      (getscriptenvs and "Calamari") or
      (unit and not syn and "Unit") or
      (IsElectron and "Electron") or
      (getexecutorname() and not fluxus and "Scriptware") or
      (fluxus and "Fluxus") or
      (identifyexecutor() and "Arceus X") or
      ("None")
    return exploit
end
return a