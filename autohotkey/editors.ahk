#SingleInstance, Force

; 定义组

GroupAdd, UnkeyPress, ahk_exe WindowsTerminal.exe
return ; 自动执行段结束

/* 键位优化
*/
RAlt & Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"  ; alt+Capslock 切换大小写
$CapsLock::Ctrl  ;CapsLock 映射 Ctrl

/* Windwos组合键功能 
*/
LAlt & Esc::!`  ; alt+esc 替换为 alt+`


/*  高效编辑
*/

;alt+h触发Left，alt+ctrl+h向左跳选，alt+shift+h向左单选
alt & h::
    if GetKeyState("Control"){
        Send ^{Left}
    }else if GetKeyState("Shift"){
        Send +{Left}
    }else{
        Send {Left}
    }
Return

;alt+j触发Down，alt+shift+j向下跳选
alt & j::
    if GetKeyState("Shift"){
        Send +{Down}
    }else{
        Send {Down}
    }
Return

;alt+k触发Up，alt+shift+k向上跳选
alt & k::
    if GetKeyState("Shift"){
        Send +{Up}
    }else{
        Send {Up}
    }
Return

;alt+l触发Right，alt+ctrl+l向左跳选，alt+shift+l向左单选
alt & l::
    if GetKeyState("Control"){
        Send ^{Right}
    }else if GetKeyState("Shift"){
        Send +{Right}
    }else{
        Send {Right}
    }
Return


; !^1::Send {Volume_Mute} ; alt+ctrl+1 声音开关
; !^2::Send {Volume_Down} ; alt+ctrl+2 音量减小
; !^3::Send {Volume_Up}; alt+ctrl+3 音量增加
^h::Send {Home}  ;ctrl+h 触发 Home
^l::Send {End}  ;ctrl+l 触发 End
!.::Send {MButton}  ;alt+. 触发 鼠标中键功能


#IfWinNotActive, ahk_group UnkeyPress

!c::Send ^{c}  ;alt+c 复制
!v::Send ^{v}  ;alt+v 粘贴
!s::Send ^{s}  ;alt+s 保存
!w::Send ^{w}  ;alt+w 关闭
#IfWinNotActive