#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2  ; 用于变量组管理

; 改变用来掩饰(屏蔽) Win 或 Alt 键松开事件的按键.
; 系统默认按下Win、Alt会自动发送一个Ctrl键以防止开始菜单或活动窗口的菜单栏在未预期的时间激活
; https://wyagd001.github.io/zh-cn/docs/commands/_MenuMaskKey.htm
#MenuMaskKey vkFF  ; vkFF 一个没有功能的虚拟按键代码

#Persistent
;高进程
Process Priority,,High

;管理员运行
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%" 
   MsgBox, 请使用管理员运行
   ExitApp
}


/**  导入其他包
*/
#Include, %A_ScriptDir%/editors.ahk
#Include, %A_ScriptDir%/snippets.ahk