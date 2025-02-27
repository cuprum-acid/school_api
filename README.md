# School API

Это REST API сервис для управления данными о школах, классах и учениках. API позволяет создавать и удалять учеников, просматривать списки классов и учеников в классах.

## Технологии

- Ruby on Rails 8
- PostgreSQL
- Docker & Docker Compose
- OpenAPI (Swagger) для документации API

## Требования

- Docker
- Docker Compose

## Установка и запуск

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/cuprum-acid/school_api.git
   cd school_api
   ```

2. Запустите приложение с помощью Docker Compose:
   ```bash
   docker compose up
   ```

3. Приложение будет доступно по адресу `http://localhost:3000`.

## API Документация

Swagger UI доступен по адресу: `http://localhost:3000/api-docs`

### Основные эндпоинты:

- `POST /students` - Регистрация нового студента
- `DELETE /students/{user_id}` - Удаление студента
- `GET /schools/{school_id}/classes/{class_id}/students` - Список студентов класса
- `GET /schools/{school_id}/classes` - Список классов школы

## Создание тестовых данных

Для создания тестовых данных выполните:

```bash
docker compose exec web rails c
```

В консоли Rails выполните:

```ruby
school = School.create!
SchoolClass.create!(number: 1, letter: 'А', school: school)
```
