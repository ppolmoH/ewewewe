$ErrorActionPreference = 'SilentlyContinue'
$host.UI.RawUI.WindowTitle = "ROBLOX ACCOUNT ACCESS v3.0"
$host.UI.RawUI.BackgroundColor = "Black"
Clear-Host

try {
    [Console]::SetWindowSize([Console]::LargestWindowWidth, [Console]::LargestWindowHeight)
} catch {}

$Green = "Green"
$DarkGreen = "DarkGreen"
$Yellow = "Yellow"
$Red = "Red"
$Cyan = "Cyan"

function Write-ColorLine {
    param([string]$Text, [string]$Color = "Green", [int]$Delay = 0)
    Write-Host $Text -ForegroundColor $Color
    if ($Delay -gt 0) { Start-Sleep -Milliseconds $Delay }
}

function Show-ProgressBar {
    param([int]$Percent, [int]$Width = 40)
    $filled = [math]::Round(($Percent / 100) * $Width)
    $empty = $Width - $filled
    $bar = "[" + ("█" * $filled) + ("░" * $empty) + "] $Percent%"
    Write-Host "`r$bar" -NoNewline -ForegroundColor $Green
}

function Show-LoadingSequence {
    param([string]$Operation)
    Write-Host "[>] $Operation" -NoNewline -ForegroundColor $Yellow
    for ($i = 0; $i -le 100; $i += 2) {
        Show-ProgressBar -Percent $i
        Start-Sleep -Milliseconds 20
    }
    Write-Host ""
    Write-Host "    СТАТУС: [УСПЕШНО]`n" -ForegroundColor $Green
}

function Show-Banner {
    $banner = @"

    ╔══════════════════════════════════════════════════════════════╗
    ║                                                              ║
    ║   ██████╗  ██████╗ ██████╗ ██╗      ██████╗ ██╗  ██╗       ║
    ║   ██╔══██╗██╔═══██╗██╔══██╗██║     ██╔═══██╗╚██╗██╔╝       ║
    ║   ██████╔╝██║   ██║██████╔╝██║     ██║   ██║ ╚███╔╝        ║
    ║   ██╔══██╗██║   ██║██╔══██╗██║     ██║   ██║ ██╔██╗        ║
    ║   ██║  ██║╚██████╔╝██████╔╝███████╗╚██████╔╝██╔╝ ██╗       ║
    ║   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝       ║
    ║                                                              ║
    ║   ┌──────────────────────────────────────────────────────┐   ║
    ║   │    ROBLOX ACCOUNT ACCESS TERMINAL v3.0              │   ║
    ║   │    ════════════════════════════════                 │   ║
    ║   │    AUTHORIZED PERSONNEL ONLY                        │   ║
    ║   │    ALL ACTIVITY IS MONITORED                        │   ║
    ║   │    SECURITY LEVEL: MAXIMUM                          │   ║
    ║   └──────────────────────────────────────────────────────┘   ║
    ║                                                              ║
    ╚══════════════════════════════════════════════════════════════╝

"@
    Write-Host $banner -ForegroundColor $Green
}

function Show-MainMenu {
    Write-Host ""
    Write-ColorLine "╔══════════════════════════════════════════════════════════════╗" $Cyan
    Write-ColorLine "║                    ГЛАВНОЕ МЕНЮ v3.0                        ║" $Cyan
    Write-ColorLine "╠══════════════════════════════════════════════════════════════╣" $Cyan
    Write-ColorLine "║                                                              ║" $Cyan
    Write-ColorLine "║  [1] ВЗЛОМ АККАУНТА                                         ║" $Green
    Write-ColorLine "║  [2] СНОС АККАУНТА                                          ║" $Red
    Write-ColorLine "║  [3] ДУДОС АККАУНТА                                         ║" $Yellow
    Write-ColorLine "║  [4] СЛИВ БАЗ ДАННЫХ                                        ║" $DarkGreen
    Write-ColorLine "║  [5] ВЫХОД                                                  ║" $Cyan
    Write-ColorLine "║                                                              ║" $Cyan
    Write-ColorLine "╚══════════════════════════════════════════════════════════════╝" $Cyan
    Write-Host ""
    Write-Host "ВЫБЕРИТЕ ПУНКТ: " -NoNewline -ForegroundColor $Yellow
}

function Get-FakeAccounts {
    $accounts = @(
        @{Name="r0bl0x_k1ng"; Pass="xX_Noob_Xx"; Robux=9999},
        @{Name="NoobMaster69"; Pass="password123"; Robux=5000},
        @{Name="ProGamer2024"; Pass="gamer_pro"; Robux=15000},
        @{Name="Builders_Club"; Pass="build123"; Robux=2500},
        @{Name="Robloxian_X"; Pass="roblox123"; Robux=7500},
        @{Name="TheMightyNoob"; Pass="mighty123"; Robux=1000},
        @{Name="PizzaDude99"; Pass="pizza_time"; Robux=3000},
        @{Name="Cool_Cat_2009"; Pass="cool_cat"; Robux=20000},
        @{Name="NinjaWarrior7"; Pass="ninja_pow"; Robux=8000},
        @{Name="DragonSlayer_X"; Pass="dragon_fire"; Robux=6000},
        @{Name="Pixel_Pro"; Pass="pixel_master"; Robux=12000},
        @{Name="Speedrunner42"; Pass="speed_run"; Robux=4000},
        @{Name="Blocky_Master"; Pass="block_world"; Robux=10000},
        @{Name="Epic_Fail_777"; Pass="fail_epic"; Robux=500},
        @{Name="Shadow_Blade"; Pass="shadow_ninja"; Robux=9000},
        @{Name="Ghost_Recon"; Pass="ghost_ops"; Robux=7000},
        @{Name="Cyber_Wolf"; Pass="cyber_pack"; Robux=11000},
        @{Name="Mega_Player"; Pass="mega_power"; Robux=30000},
        @{Name="Ultra_Noob"; Pass="ultra_lol"; Robux=100},
        @{Name="Turbo_Builder"; Pass="turbo_build"; Robux=8500}
    )
    return $accounts
}

function Show-HackAccount {
    Write-Host ""
    Write-ColorLine "╔══════════════════════════════════════════════════════════════╗" $Yellow
    Write-ColorLine "║              ВЗЛОМ АККАУНТА ROBLOX                          ║" $Yellow
    Write-ColorLine "╚══════════════════════════════════════════════════════════════╝" $Yellow
    Write-Host ""
    
    Show-LoadingSequence "ПОДКЛЮЧЕНИЕ К ROBLOX API"
    Show-LoadingSequence "ОБХОД АУТЕНТИФИКАЦИИ"
    Show-LoadingSequence "ДЕШИФРОВКА ТОКЕНОВ"
    Show-LoadingSequence "ИЗВЛЕЧЕНИЕ ДАННЫХ"
    
    Write-Host ""
    $accounts = Get-FakeAccounts
    
    for ($i = 0; $i -lt 10; $i++) {
        $acc = $accounts | Get-Random
        Write-ColorLine "  ┌─────────────────────────────────────┐" $DarkGreen 50
        Write-ColorLine ("  │ АККАУНТ #{0:D2}                         │" -f ($i + 1)) $Green 100
        Write-ColorLine "  ├─────────────────────────────────────┤" $DarkGreen 50
        Write-ColorLine ("  │ ПОЛЬЗОВАТЕЛЬ : {0,-20}│" -f $acc.Name) $Green 100
        Write-ColorLine ("  │ ПАРОЛЬ       : {0,-20}│" -f $acc.Pass) $Yellow 100
        Write-ColorLine ("  │ РОБУКСЫ      : {0,6} R$              │" -f $acc.Robux) $Green 100
        Write-ColorLine "  └─────────────────────────────────────┘" $DarkGreen 50
        Write-Host ""
        Start-Sleep -Milliseconds 300
    }
    
    Write-ColorLine "  ВЗЛОМ ЗАВЕРШЕН. ДАННЫЕ СОХРАНЕНЫ." $Green
}

function Show-DeleteAccount {
    Write-Host ""
    Write-ColorLine "╔══════════════════════════════════════════════════════════════╗" $Red
    Write-ColorLine "║              СНОС АККАУНТА ROBLOX                           ║" $Red
    Write-ColorLine "╚══════════════════════════════════════════════════════════════╝" $Red
    Write-Host ""
    
    Show-LoadingSequence "ПОИСК ЦЕЛЕВОГО АККАУНТА"
    Show-LoadingSequence "ОБХОД ЗАЩИТЫ АККАУНТА"
    Show-LoadingSequence "УДАЛЕНИЕ ДАННЫХ ПРОФИЛЯ"
    Show-LoadingSequence "СТИРАНИЕ ИНВЕНТАРЯ"
    Show-LoadingSequence "СБРОС ПАРОЛЯ"
    
    Write-Host ""
    Write-ColorLine "  АККАУНТ УНИЧТОЖЕН. ВОССТАНОВЛЕНИЕ НЕВОЗМОЖНО." $Red
}

function Show-DDOSAccount {
    Write-Host ""
    Write-ColorLine "╔══════════════════════════════════════════════════════════════╗" $Yellow
    Write-ColorLine "║              ДУДОС АККАУНТА ROBLOX                          ║" $Yellow
    Write-ColorLine "╚══════════════════════════════════════════════════════════════╝" $Yellow
    Write-Host ""
    
    $target = Read-Host "ВВЕДИТЕ НИК ЦЕЛИ"
    Write-Host ""
    Show-LoadingSequence "ЗАПУСК BOTNET СЕТИ"
    Show-LoadingSequence "НАПРАВЛЕНИЕ ТРАФИКА НА ЦЕЛЬ"
    Show-LoadingSequence "ПЕРЕГРУЗКА СЕРВЕРА АККАУНТА"
    
    Write-Host ""
    for ($i = 1; $i -le 100; $i += 10) {
        Show-ProgressBar -Percent $i -Width 50
        Start-Sleep -Milliseconds 100
    }
    Write-Host ""
    Write-ColorLine "  АККАУНТ $target ЗАДУДОШЕН. СЕРВЕР ПЕРЕГРУЖЕН." $Yellow
}

function Show-DatabaseLeak {
    Write-Host ""
    Write-ColorLine "╔══════════════════════════════════════════════════════════════╗" $DarkGreen
    Write-ColorLine "║              СЛИВ БАЗ ДАННЫХ ROBLOX                         ║" $DarkGreen
    Write-ColorLine "╚══════════════════════════════════════════════════════════════╝" $DarkGreen
    Write-Host ""
    
    Show-LoadingSequence "ПОДКЛЮЧЕНИЕ К ОСНОВНОЙ БД"
    Show-LoadingSequence "ОБХОД ФАЕРВОЛА"
    Show-LoadingSequence "SQL-ИНЪЕКЦИЯ"
    Show-LoadingSequence "ИЗВЛЕЧЕНИЕ ТАБЛИЦ"
    Show-LoadingSequence "СКАЧИВАНИЕ БАЗЫ"
    
    Write-Host ""
    $databases = @(
        "users_main.sql - 2.5 GB - СКАЧАНА",
        "passwords_hash.sql - 4.1 GB - СКАЧАНА",
        "inventory.sql - 1.8 GB - СКАЧАНА",
        "transactions.sql - 3.2 GB - СКАЧАНА",
        "premium_users.sql - 850 MB - СКАЧАНА"
    )
    
    foreach ($db in $databases) {
        Write-ColorLine "  [БАЗА] $db" $DarkGreen 300
    }
    
    Write-Host ""
    Write-ColorLine "  ВСЕ БАЗЫ ДАННЫХ СОХРАНЕНЫ НА РАБОЧЕМ СТОЛЕ" $Green
}

# Главный цикл
while ($true) {
    Clear-Host
    Show-Banner
    Show-MainMenu
    
    $choice = Read-Host
    
    switch ($choice) {
        "1" { Show-HackAccount; Write-Host ""; Read-Host "НАЖМИТЕ ENTER ДЛЯ ВОЗВРАТА" }
        "2" { Show-DeleteAccount; Write-Host ""; Read-Host "НАЖМИТЕ ENTER ДЛЯ ВОЗВРАТА" }
        "3" { Show-DDOSAccount; Write-Host ""; Read-Host "НАЖМИТЕ ENTER ДЛЯ ВОЗВРАТА" }
        "4" { Show-DatabaseLeak; Write-Host ""; Read-Host "НАЖМИТЕ ENTER ДЛЯ ВОЗВРАТА" }
        "5" { Clear-Host; Write-ColorLine "ВЫХОД..." $Red; Start-Sleep 1; exit }
        default { Write-ColorLine "НЕВЕРНЫЙ ВЫБОР. ПОВТОРИТЕ." $Red; Start-Sleep 1 }
    }
}