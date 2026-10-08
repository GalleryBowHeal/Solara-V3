# TROUBLESHOOTING

| Симптом | Причина | Фикс |
|---|---|---|
| Окно не открывается, процесс висит 1 сек | Нет .NET Desktop Runtime x64 | Установи с dotnet.microsoft.com |
| `SolaraV3.exe` пропал | Defender съел | Карантин → Восстановить + исключение `C:\SolaraV3` |
| Attach красный / fail | Не от админа / игра не прогружена / Studio вместо Player | ПКМ → Run as admin, дождись движения, закрывай Studio |
| Smart App Control блокирует | Win11 SAC | Выкл SAC или исключение |
| Скрипт не работает | Устаревший хаб / низкий UNC | Пробуй другой хаб, проверь `examples/hello.lua` |
| Roblox обновился — все сломалось | Патч клиента | Жди обнову Bootstrapper, запускай `update.ps1` |

Проверка executor'а: выполни `examples/hello.lua` — должен напечатать в консоль и показать notification.
