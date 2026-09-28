# ICT6001 — Лабораторная работа 2

Работа с файлами и каталогами, командная строка Linux и PowerShell.

## Скрипты

### scripts/backup.sh (bash)
Создаёт архив каталога docs в backup/ с датой и временем в имени,
пишет строку в logs/backup.log и удаляет архивы старше 7 дней.
Останавливается с сообщением об ошибке, если docs не существует.

Запуск:
chmod +x scripts/backup.sh
./scripts/backup.sh

Автозапуск каждый день в 22:00 (crontab -e):
0 22 * * * /home/atabek/ict_lab2/scripts/backup.sh

### scripts/backup.ps1 (PowerShell)
Делает то же самое через Compress-Archive (архив .zip).

Запуск:
.\scripts\backup.ps1
