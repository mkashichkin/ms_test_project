Кашичкин Максим Олегович
Тестовое задание Python
Установить из requirements.txt
База данных по пути: my_app/db/ms_test_base.sql
Запуск: manage.py runserver

Описание проекта:
/city/ - GET получает json, список городов
/<int>X/street - GET получает json, список улиц для
города X.
POST /shop/ - получает json создает магазин,
возращает id этого магазина в бд
GET /shop/?street=&city=&open&0/1 - получает 
json список магазинов с отсечением по параметрам.
