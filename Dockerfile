# Stage 1: Build stage
FROM node:lts-alpine3.20 as build

WORKDIR /app

COPY ./flask-app .

RUN npm install && npm run build


FROM python:2.7.18-alpine3.11
WORKDIR /app/flask-app
COPY --from=build /app/static static
COPY --from=build /app/templates templates
COPY --from=build /app/requirements.txt .
RUN pip install -r requirements.txt
COPY --from=build /app/app.py .

EXPOSE 5000

# Set the entrypoint
ENTRYPOINT ["python", "app.py"]
