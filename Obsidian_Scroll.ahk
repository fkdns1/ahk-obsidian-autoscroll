#Requires AutoHotkey v2.0
#SingleInstance Force
#Warn

; Needed because Obsidian does not provide this browser-style middle-click autoscroll behavior by default.
; ==========================================
; Obsidian Browser-like Very Slow AutoScroll
; 중클릭 → 마우스 위/아래 이동 → 자동 스크롤
; 다시 중클릭 / 좌클릭 / 우클릭 / Esc = 정지
; ==========================================

global isAutoScroll := false
global startY := 0
global tickCounter := 0

; =========================
; 세부 조절 변수
; =========================

global deadZone := 40
; 시작점에서 이 픽셀 거리 안에서는 스크롤하지 않음
; ↑ 높이면: 더 많이 움직여야 스크롤 시작
; ↓ 낮추면: 조금만 움직여도 스크롤 시작
; 추천 범위: 30 ~ 70

global interval := 70
; 스크롤 체크 주기(ms)
; ↑ 높이면: 더 느림
; ↓ 낮추면: 더 빠름
; 추천 범위: 50 ~ 120
; 기존 40보다 더 느리게 조정함

global divisor := 180
; 마우스를 얼마나 멀리 움직였을 때 스크롤 빈도가 빨라질지 결정
; ↑ 높이면: 전체적으로 더 느림
; ↓ 낮추면: 전체적으로 더 빠름
; 추천 범위: 140 ~ 260

global minDelayFactor := 3
; 최소 대기 배율
; ↑ 높이면: 가까운 거리에서 더 느림
; ↓ 낮추면: 가까운 거리에서 더 빠름
; 추천 범위: 2 ~ 6

#HotIf WinActive("ahk_exe Obsidian.exe")

MButton::
{
    global isAutoScroll, startY, interval, tickCounter

    if isAutoScroll {
        StopAutoScroll()
        return
    }

    MouseGetPos(, &startY)
    tickCounter := 0
    isAutoScroll := true

    SetTimer(AutoScrollTick, interval)
}

#HotIf WinActive("ahk_exe Obsidian.exe") && isAutoScroll

Esc::
LButton::
RButton::
{
    StopAutoScroll()
}

#HotIf

StopAutoScroll() {
    global isAutoScroll, tickCounter

    isAutoScroll := false
    tickCounter := 0
    SetTimer(AutoScrollTick, 0)
}

AutoScrollTick() {
    global isAutoScroll, startY
    global deadZone, divisor, minDelayFactor
    global tickCounter

    if !isAutoScroll {
        return
    }

    MouseGetPos(, &currentY)

    delta := currentY - startY
    distance := Abs(delta)

    ; 데드존 안에서는 스크롤하지 않음
    if distance < deadZone {
        return
    }

    ; 거리 기반 속도 계산
    delayFactor := Max(1, Floor(divisor / distance))

    ; 너무 빠르게 시작하지 않도록 최소 대기 배율 적용
    delayFactor := Max(delayFactor, minDelayFactor)

    tickCounter += 1

    ; delayFactor 횟수마다 한 번만 스크롤
    if Mod(tickCounter, delayFactor) != 0 {
        return
    }

    ; 한 번에 Wheel 1칸만 전송
    if delta > 0 {
        Send "{WheelDown}"
    } else {
        Send "{WheelUp}"
    }
}