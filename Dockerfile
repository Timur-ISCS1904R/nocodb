# Базовый образ
FROM node:18-alpine

# Рабочая директория
WORKDIR /app

# Устанавливаем pnpm
RUN npm install -g pnpm

# Копируем package.json и pnpm-lock.yaml (если есть)
COPY package*.json ./
COPY pnpm-lock.yaml* ./

# Устанавливаем зависимости
RUN pnpm install --frozen-lockfile

# Копируем весь проект
COPY . .

# Открываем порт
EXPOSE 8080

# Запуск NocoDB
CMD ["pnpm", "start"]
